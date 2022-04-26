import 'package:app/models/savings_model.dart';
import 'package:app/my_widgets/my_common_bottom_navbar.dart';
import 'package:app/my_widgets/show_post.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySavings extends StatelessWidget {
  const MySavings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('My savings',
                    style: TextStyle(
                        color: Theme.of(context).splashColor, fontSize: 18)),
                Icon(
                  Icons.message_rounded,
                  color: Theme.of(context).splashColor,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<SavingsModel>(
                  builder: (context, savedList, child) {
                    return Text(
                      'Num of saving: ${savedList.items.length}',
                      style: TextStyle(color: Theme.of(context).splashColor),
                    );
                  },
                ),
                TextButton(
                    onPressed: () {
                      Provider.of<SavingsModel>(context, listen: false)
                          .removeAll();
                    },
                    child: Text(
                      "Clean all",
                      style: TextStyle(color: Theme.of(context).splashColor),
                    ))
              ],
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: _MySavedPost(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }
}

class _MySavedPost extends StatelessWidget {
  const _MySavedPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var savings = context.watch<SavingsModel>();

    return ListView.builder(
        itemCount: savings.items.length,
        itemBuilder: (context, index) => ShowPost(
              post: savings.items[index],
            ));
  }
}
