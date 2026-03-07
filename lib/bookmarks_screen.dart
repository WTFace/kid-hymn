import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'song_image.dart';
import 'song_data.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  List<Song> _bookmarkedSongs = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadBookmarkedSongs();
  }

  Future<void> _loadBookmarkedSongs() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> bookmarkedStringList = prefs.getStringList('bookmarkedPages') ?? [];
    final Set<int> bookmarkedIds = bookmarkedStringList.map((id) => int.parse(id)).toSet();
    final allSongs = AllSongs.get();
    final foundSongs = allSongs.where((song) => bookmarkedIds.contains(song.id)).toList();

    foundSongs.sort((a, b) => a.id.compareTo(b.id));

    if (mounted) {
      setState(() {
        _bookmarkedSongs = foundSongs;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _bookmarkedSongs.isEmpty
          ? const Center(
        child: Text(
          'No hymns bookmarked yet.\nTap the bookmark icon on a hymn page to save it here.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      )
          : ListView.builder(
        itemCount: _bookmarkedSongs.length,
        itemBuilder: (context, index) {
          final song = _bookmarkedSongs[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(song.id.toString()),
            ),
            title: Text(song.title),
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SongImage(
                    pageNumber: song.id, // Using ID as the pageNumber
                    title: song.title,
                  ),
                ),
              );
              // Refresh the list when returning, in case they un-bookmarked it
              _loadBookmarkedSongs();
            },
          );
        },
      ),
    );
  }
}
