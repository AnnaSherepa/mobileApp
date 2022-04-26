import 'package:app/my_widgets/my_common_bottom_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdditionalPage extends StatefulWidget {
  const AdditionalPage({Key? key}) : super(key: key);

  @override
  State<AdditionalPage> createState() => _AdditionalPageState();
}

class _AdditionalPageState extends State<AdditionalPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as NamedArgument;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: args == null ? const Text("No value") : Text(args.title, style: TextStyle(color: Theme.of(context).splashColor)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: args == null
            ? Row(
                children: [
                  Text("No value",
                      style: TextStyle(color: Theme.of(context).splashColor))
                ],
              )
            : Column(
                children: [
                  Center(
                    child: Text(
                      args.text,
                      style: TextStyle(color: Theme.of(context).splashColor),
                    ),
                  ),
                ],
              ),
      ),
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }
}

class NamedArgument {
  String title;
  String text;
  List<String> items;

  NamedArgument(this.title, this.text, this.items);
}
