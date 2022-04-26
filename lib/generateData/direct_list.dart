import 'package:app/generateData/filter_direct_page.dart';
import 'package:app/generateData/history_list.dart';
import 'package:app/objects/profile.dart';
import 'package:flutter/material.dart';
List<Profile> userList = users;

class DirectList extends StatefulWidget{
  const DirectList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DirectListState();
  
}


class _DirectListState extends State<DirectList>{

  List<Widget> _directList() {
    List<Widget> list = <Widget>[];
    list.add(DirectHeader());
    list.add(const MySearchWidget());

    for (Profile profile in userList) {
      list.add(DialogItem(profile: profile,));
    }
    
    return list;
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
              controller: ScrollController(),
              padding: EdgeInsets.zero,
              children: _directList(),
            );
  }

}


class DialogItem extends StatelessWidget {
  final Profile profile;
  const DialogItem({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            height: 70.0,
            decoration:
                const BoxDecoration(shape: BoxShape.circle),
            child: Center(
              child: Image.asset(
                "assets/images/history/${profile.avatarImg}",
                fit: BoxFit.contain,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                profile.nickname,
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).splashColor,
                ),
              ),
              Text(
                "new message",
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).splashColor,
                ),
              )
            ],
          ),
          const Spacer(),
          Icon(
            Icons.camera_enhance,
            size: 30.0,
            color: Theme.of(context).splashColor,
          ),
        ],
      ),
    );
  }
}

class MySearchWidget extends StatelessWidget {
  const MySearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.fromLTRB(8, 10, 8, 10),
      decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(Icons.search),
          Text("Search"),
          Spacer(),
          Icon(Icons.list),
        ],
      ),
    );
  }
}

class DirectHeader extends StatelessWidget {
  List<Profile> users = [];
  DirectHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
              onPressed: () {
                Navigator.pop(context, 15);
              },
              icon: Icon(Icons.arrow_back, color: Theme.of(context).splashColor),
              label: const Text("")),
          Text("my_nickname", style: TextStyle(color: Theme.of(context).splashColor)),
          Icon(Icons.expand_more, color: Theme.of(context).splashColor),
          const Spacer(),
          IconButton(
            onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder: (context) => FilterPage(checkedUsers: [],)));
            },
            icon: Icon(Icons.mode_edit_outline, color: Theme.of(context).splashColor)
            
            ),
        ],
      ),
    );
  }
}
