import 'package:app/generateData/history_list.dart';
import 'package:app/objects/profile.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  late List<Profile> checkedUsers;
  FilterPage({Key? key, required this.checkedUsers}) : super(key: key);

  @override
  FilterPageState createState() => FilterPageState();
}

class FilterPageState extends State<FilterPage> {
  late List<CheckBoxListTileModel> checkBoxListTileModel;

  @override
  Widget build(BuildContext context) {
    List<CheckBoxListTileModel> checkBoxListTileModel =
        CheckBoxListTileModel.getConvertedUsers(users, widget.checkedUsers);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'CheckBox ListTile Demo',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
          itemCount: checkBoxListTileModel.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    CheckboxListTile(
                        activeColor: Colors.pink[300],
                        dense: true,
                        title: Text(
                          checkBoxListTileModel[index].title,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5),
                        ),
                        value: checkBoxListTileModel[index].isCheck,
                        secondary: SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset(
                            checkBoxListTileModel[index].img,
                            fit: BoxFit.cover,
                          ),
                        ),
                        onChanged: (bool? val) {
                          setState(() {
                            checkBoxListTileModel[index].isCheck = val!;
                          });
                        })
                  ],
                ),
              ),
            );
          }),
    );
  }

  void itemChange(bool? val, int index) {
    setState(() {
      checkBoxListTileModel[index].isCheck = val!;
    });
  }
}

class CheckBoxListTileModel {
  int userId;
  String img;
  String title;
  bool isCheck;

  CheckBoxListTileModel(
      {required this.userId,
      required this.img,
      required this.title,
      required this.isCheck});

  static List<CheckBoxListTileModel> getConvertedUsers(
      List<Profile> userList, List<Profile> filteredUsers) {
    List<CheckBoxListTileModel> convertedList = [];
    for (int i = 0; i < userList.length; i++) {
      bool checkSt =
          filteredUsers.isNotEmpty && filteredUsers.contains(userList[i]);
      convertedList.add(
        CheckBoxListTileModel(
            userId: i + 1,
            img: "assets/images/history/${userList[i].avatarImg}",
            title: userList[i].nickname,
            isCheck: checkSt),
      );
    }

    return convertedList;
  }
}
