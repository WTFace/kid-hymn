import 'package:flutter/material.dart';
import 'package:hymn/song_image.dart';
import 'package:hymn/song_data.dart';
import 'package:hymn/bookmarks_screen.dart';
import 'history_screen.dart';
import 'package:hymn/app_drawer.dart';

class SongList extends StatefulWidget {
  const SongList({super.key});

  @override
  State<SongList> createState() => _HymnAppScreenState();
}

class _HymnAppScreenState extends State<SongList> {
  final List<Song> _allSongs = AllSongs.get();
  List<Song> _filteredSongs = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredSongs = _allSongs;
    _searchController.addListener(_filterSongs);
  }

  void _filterSongs() {
    final query = _searchController.text.toLowerCase();
    if (mounted) {
      setState(() {
        _filteredSongs = query.isEmpty
            ? _allSongs
            : _allSongs.where((song) {
          final titleMatches = song.title.toLowerCase().contains(query);
          final idMatches = song.id.toString().contains(query);
          return titleMatches || idMatches;
        }).toList();
      });
    }
  }

  void _handleSongSelection(Song song) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SongImage(
          pageNumber: song.id,
          title: '${song.id} ${song.title}',
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterSongs);
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: '번호, 제목 검색',
        hintStyle: TextStyle(color: Colors.white70),
        border: InputBorder.none,
      ),
      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
      cursorColor: Colors.white,
    );
  }

  List<Widget> _buildListViewActions() {
    return [
      IconButton(
        icon: const Icon(Icons.favorite),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BookmarksScreen()),
          );
        },
        tooltip: '북마크 보기',
      ),
      // Clear Search Button
      if (_searchController.text.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (mounted) {
              setState(() {
                _searchController.clear();
              });
              FocusScope.of(context).unfocus();
            }
          },
        ),
    ];
  }

  Widget _buildSongListWidget() {
    if (_searchController.text.isNotEmpty && _filteredSongs.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "No songs found for '${_searchController.text}'",
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: _filteredSongs.length,
      itemBuilder: (context, index) {
        final song = _filteredSongs[index];
        return ListTile(
          title: Text(
              '${song.id}.  ${song.title}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)
          ),
          onTap: () => _handleSongSelection(song),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildSearchField(),
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openEndDrawer(), // right side
            ),
          ),
        ]
      ),
      endDrawer: const AppDrawer(),
      body: _buildSongListWidget(),
    );
  }
}
