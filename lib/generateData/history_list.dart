import 'package:app/objects/details.dart';
import 'package:app/objects/profile.dart';
import 'package:flutter/material.dart';

List<Profile> users = [
  Profile(nickname: 'ivan', avatarImg: '1.png', historyImg: '1-c.png'),
  Profile(nickname: 'olena', avatarImg: '2.png', historyImg: '2-c.png'),
  Profile(nickname: 'maria', avatarImg: '3.png', historyImg: '3-c.png'),
  Profile(nickname: 'oleh', avatarImg: '4.png', historyImg: '4-c.png'),
  Profile(nickname: 'vasyl', avatarImg: '5.png', historyImg: '5-c.png'),
  Profile(nickname: 'anna', avatarImg: '6.png', historyImg: '6-c.png'),
  Profile(nickname: 'max', avatarImg: '7.png', historyImg: '7-c.png'),
  Profile(nickname: 'andriy', avatarImg: '8.png', historyImg: '8-c.png'),
  Profile(nickname: 'ori', avatarImg: '9.png', historyImg: '9-c.png'),
  Profile(nickname: 'ulya', avatarImg: '10.png', historyImg: '10-c.png'),
];

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();

  List<Profile> getUserList() {
    return users;
  }
}

class _UserListState extends State<UserList> {
  final List<Widget> _userTiles = [];
  final GlobalKey _listKey = GlobalKey();

  void _addusers() {
    for (var user in users) {
      _userTiles.add(_buildTile(user));
    }
  }

  Widget _buildTile(Profile user) {
    return GestureDetector(
      onTap: () {
        _navigateAndDisplaySelection(context, user);
      },
      
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(2.0),
        height: 70.0,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
        child: Center(
          child: Hero(
              tag: 'location-img-${user.avatarImg}',
              child: Image.asset(
                "assets/images/history/${user.avatarImg}",
                fit: BoxFit.contain,
              )),
        ),
      ),
    );
  }

  void _navigateAndDisplaySelection(BuildContext context, Profile user) async {
    final result = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Details(
                      uId: user.avatarImg,
                      history: user.historyImg,
                    )));

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result')));
  }

  @override
  Widget build(BuildContext context) {
    _addusers();

    final _controllerTwo = ScrollController();
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scrollbar(
          controller: _controllerTwo,
          child: SingleChildScrollView(
            controller: _controllerTwo,
            scrollDirection: Axis.horizontal,
            child: ListView.builder(
                shrinkWrap: true, //just set this property
                padding: const EdgeInsets.all(8.0),
                scrollDirection: Axis.horizontal,
                key: _listKey,
                itemCount: _userTiles.length,
                itemBuilder: (context, index) {
                  return _userTiles[index];
                }),
          ),
        );
      },
    );
  }
}
