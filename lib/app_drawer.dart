import 'package:flutter/material.dart';
import 'package:hymn/bookmarks_screen.dart';
import 'package:hymn/history_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:wakelock_plus/wakelock_plus.dart'; // Add this import

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String _version = "...";
  bool _isWakelockEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final isEnabled = await WakelockPlus.enabled;

    if (mounted) {
      setState(() {
        _version = packageInfo.version;
        _isWakelockEnabled = isEnabled;
      });
    }
  }

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
                Text('v$_version',
                    style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),

          // WAKELOCK TOGGLE
          SwitchListTile(
            title: const Text('화면켜짐 유지'),
            subtitle: const Text('찬송 화면이 꺼지지 않게 합니다.'),
            secondary: Icon(
                Icons.lightbulb,
                color: _isWakelockEnabled ? Colors.orange : Colors.grey
            ),
            value: _isWakelockEnabled,
            onChanged: (bool value) async {
              await WakelockPlus.toggle(enable: value);
              setState(() {
                _isWakelockEnabled = value;
              });
            },
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.favorite, color: Colors.orange),
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
              _showAboutDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.music_note, size: 60, color: Colors.deepPurpleAccent),
            const SizedBox(height: 16),
            const Text('Starry Hymn',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('v$_version'),
            const Divider(height: 30),
            const Text(
              '스타리키즈 캠프 리더들을 위한 오프라인 찬송집입니다.\n\n개발자: ChrisPigglet@gmail.com',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
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
  }
}