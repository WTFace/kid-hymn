import 'package:flutter/material.dart';
import 'song_data.dart';
import 'song_image.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recent')),
      body: FutureBuilder<List<Song>>(
        future: AllSongs.getHistory(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final history = snapshot.data!;
          if (history.isEmpty) return const Center(child: Text('no recent songs'));

          return ListView.builder(
            itemCount: history.length,
            itemBuilder: (context, index) {
              final song = history[index];
              return ListTile(
                leading: CircleAvatar(child: Text('${song.id}')),
                title: Text(song.title),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SongImage(pageNumber: song.id, title: song.title))
                ),
              );
            },
          );
        },
      ),
    );
  }
}