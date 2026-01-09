import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SongImage extends StatefulWidget {
  final int pageNumber;
  final String title;

  const SongImage({super.key, required this.pageNumber, required this.title});

  @override
  State<SongImage> createState() => _SongImageState();
}

class _SongImageState extends State<SongImage> {
  bool _isBookmarked = false;
  Set<int> _allBookmarkedPages = {};

  @override
  void initState() {
    super.initState();
    _loadBookmarkState();
  }

  Future<void> _loadBookmarkState() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> bookmarkedStringList = prefs.getStringList('bookmarkedPages') ?? [];

    _allBookmarkedPages = bookmarkedStringList.map((page) => int.parse(page)).toSet();

    if (mounted) {
      setState(() {
        _isBookmarked = _allBookmarkedPages.contains(widget.pageNumber);
      });
    }
  }

  Future<void> _toggleBookmark() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _isBookmarked = !_isBookmarked;
    });

    if (_isBookmarked) {
      _allBookmarkedPages.add(widget.pageNumber);
    } else {
      _allBookmarkedPages.remove(widget.pageNumber);
    }

    final List<String> bookmarkedStringList = _allBookmarkedPages.map((page) => page.toString()).toList();
    await prefs.setStringList('bookmarkedPages', bookmarkedStringList);
  }


  @override
  Widget build(BuildContext context) {
    final currentImagePath = 'assets/hymns/${widget.pageNumber}.jpg';

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              _isBookmarked ? Icons.favorite : Icons.favorite_border,
              color: _isBookmarked ? Colors.yellow : null,
            ),
            onPressed: () {
              // Call the toggle method when the button is pressed
              _toggleBookmark();
            },
            tooltip: 'Bookmark this hymn',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: InteractiveViewer(
            maxScale: 3.0,
            child: Image.asset(
              currentImagePath,
              fit: BoxFit.fitWidth,

              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Error: Image not found.'),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}