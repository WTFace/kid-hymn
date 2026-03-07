import 'package:flutter/material.dart';
import 'package:hymn/bookmarks_screen.dart';
import 'package:hymn/history_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';

// hamburger menu
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.deepPurpleAccent),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('Starry Hymn',
                    style: TextStyle(color: Colors.white, fontSize: 24)),
                // Dynamic version
                FutureBuilder<PackageInfo>(
                  future: PackageInfo.fromPlatform(),
                  builder: (context, snapshot) {
                    return Text('v${snapshot.data?.version ?? "..."}',
                        style: const TextStyle(color: Colors.white70));
                  },
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.bookmark, color: Colors.orange),
            title: const Text('즐겨찾기'),
            onTap: () {
              Navigator.pop(context);
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
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.music_note,
                          size: 60, color: Colors.deepPurpleAccent),
                      const SizedBox(height: 16),
                      const Text(
                        'Starry Hymn',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      // Dynamic version
                      FutureBuilder<PackageInfo>(
                        future: PackageInfo.fromPlatform(),
                        builder: (context, snapshot) {
                          return Text('v${snapshot.data?.version ?? "..."}');
                        },
                      ),
                      const Divider(height: 30),
                      const Text(
                        '스타리키즈 캠프 리더들을 위한 오프라인 찬송집입니다.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        '개발자: ChrisPigglet@gmail.com',
                        style: TextStyle(fontSize: 15, color: Colors.black87),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Copyright ⓒ 2023 Starrykids.\nAll Rights Reserved.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15, color: Colors.deepPurpleAccent),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('닫기'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}