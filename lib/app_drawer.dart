import 'package:flutter/material.dart';
import 'package:hymn/bookmarks_screen.dart';
import 'package:hymn/history_screen.dart';

// hamburger menu
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.deepPurpleAccent),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('별빛 캠프 찬양집',
                    style: TextStyle(color: Colors.white, fontSize: 24)),
                Text('v1.0.0', style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.bookmark, color: Colors.orange),
            title: const Text('즐겨찾기'),
            onTap: () {
              Navigator.pop(context); // Close drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BookmarksScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.history, color: Colors.blue),
            title: const Text('히스토리'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HistoryScreen()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('앱 정보 (About)'),
            onTap: () {
              Navigator.pop(context);
              showAboutDialog(
                context: context,
                applicationName: 'starry hymn',
                applicationVersion: '1.0.0',
                applicationIcon: const Icon(Icons.music_note,
                    size: 50, color: Colors.deepPurpleAccent),
                children: [
                  const Text('starry kid 캠프 리더들을 위한 오프라인 찬양집.'),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
