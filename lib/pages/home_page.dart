import 'package:app/generateData/direct_list.dart';
import 'package:app/generateData/history_list.dart';
import 'package:app/generateData/post_list_2.dart';
import 'package:app/main.dart';
import 'package:app/models/theme_model.dart';
import 'package:app/my_widgets/my_common_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    mainScrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (mainScrollController.offset >= 400) {
            showBackToTopButton = true; // show the back-to-top button
          } else {
            showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });
  }

  @override
  void dispose() {
    mainScrollController.dispose(); // dispose the controller
    super.dispose();
  }

  void _scrollToTop() {
    mainScrollController.animateTo(0,
        duration: const Duration(seconds: 2), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: mainScrollController,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Theme.of(context).backgroundColor,
            pinned: true,
            snap: true,
            floating: true,
            flexibleSpace: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Instagram',
                      style: TextStyle(
                          color: Theme.of(context).splashColor, fontSize: 18)),
                  const Change(),
                  const Spacer(),
                  Icon(
                    Icons.message_rounded,
                    color: Theme.of(context).splashColor,
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: UserList(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => MyListItem(index),
                childCount: users.length),
          ),
        ],
      ),
      endDrawerEnableOpenDragGesture: true,
      endDrawer: Container(
        width: 700,
        color: Theme.of(context).backgroundColor,
        child: Drawer(
          child: Container(
            color: Theme.of(context).backgroundColor,
            child: const DirectList(),
          ),
        ),
      ),
      floatingActionButton: showBackToTopButton == false
          ? null
          : FloatingActionButton(
              onPressed: _scrollToTop,
              child: const Icon(Icons.arrow_upward, color: Colors.white),
            ),
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }
}

class Change extends StatefulWidget {
  const Change({Key? key}) : super(key: key);

  @override
  State<Change> createState() => _ChangeState();
}

class _ChangeState extends State<Change> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Switch(
        value: themeNotifier.isDark,
        onChanged: (value) {
          setState(() {
            themeNotifier.isDark = value;
          });
        },
        activeTrackColor: Theme.of(context).splashColor,
        activeColor: Theme.of(context).backgroundColor,
        inactiveTrackColor: Theme.of(context).splashColor,
      );
    });
  }
}
