import 'package:app/my_widgets/show_post.dart';
import 'package:app/objects/post.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyListItem extends StatelessWidget {
  final int index;

  const MyListItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var post = context.select<PostModel, Post>(
      (catalog) => catalog.getByPosition(index),
    );

    return ShowPost(post: post);
    
  }
}
