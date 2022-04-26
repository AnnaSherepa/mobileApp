
import 'package:app/models/liked_model.dart';
import 'package:app/models/savings_model.dart';
import 'package:app/objects/post.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class ShowPost extends StatelessWidget {
  const ShowPost({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400.0,
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(0.5),
                    height: 30.0,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                    child: Center(
                      child: Image.asset(
                        "assets/images/history/${post.user.avatarImg}",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsetsDirectional.only(start: 5.0),
                      child: Text(
                        post.user.nickname,
                        style: Theme.of(context).textTheme.bodyText1,
                        
                        /*TextStyle(
                          color: mainTextAndItemColor,
                        ),*/
                      )),
                  const Spacer(),
                  Icon(Icons.more_vert, color: Theme.of(context).splashColor),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Image.asset(
                post.postImg,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _LikeButton(item: post),
                      IconButton(
                        icon:
                            Icon(Icons.comment, color: Theme.of(context).splashColor),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.send, color: Theme.of(context).splashColor),
                        onPressed: () {},
                      ),
                      const Spacer(),
                      _SavedButton(item: post),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "${post.user.nickname}: ",
                        style: TextStyle(
                            color: Theme.of(context).splashColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        post.description,
                        style: TextStyle(color: Theme.of(context).splashColor),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      );
  }
}

class _SavedButton extends StatelessWidget {
  final Post item;

  const _SavedButton({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isSaved = context.select<SavingsModel, bool>(
      (saved) => saved.items.contains(item),
    );

    return IconButton(
      icon: isSaved
          ? Icon(Icons.turned_in, color: Theme.of(context).splashColor)
          : Icon(Icons.turned_in_not, color: Theme.of(context).splashColor),
      onPressed: isSaved
          ? () {
              var savedList = context.read<SavingsModel>();
              savedList.remove(item);
            }
          : () {
              var savedList = context.read<SavingsModel>();
              item.isSaved = true;
              savedList.add(item);
            },
    );
  }
}

class _LikeButton extends StatelessWidget {
  final Post item;

  const _LikeButton({required this.item, Key? key}) : super(key: key);

@override
  Widget build(BuildContext context) {
    var isLiked = context.select<LikedModel, bool>(
      (liked) => liked.items.contains(item),
    );

    return IconButton(
      icon: isLiked
            ? const Icon(Icons.favorite, color: Colors.red)
            : Icon(Icons.favorite_border, color: Theme.of(context).splashColor),
      onPressed: isLiked
          ? () {
              var likedList = context.read<LikedModel>();
              likedList.remove(item);
            }
          : () {
              var likedList = context.read<LikedModel>();
              likedList.add(item);
            },
    );
  }
  
}
