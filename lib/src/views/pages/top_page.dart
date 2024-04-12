import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tkgapp/src/views/pages/list_page.dart';
import 'package:tkgapp/src/views/pages/setting_page.dart';
import 'package:tkgapp/src/view_models/provider.dart';

const _pageWidgets = [
  ListPage(),
  SettingPage(),
];

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);

    return Scaffold(
      body: _pageWidgets.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '検索'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '設定'),
        ],
        currentIndex: currentIndex,
        onTap: (value) => ref.read(currentIndexProvider.notifier).state = value,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
