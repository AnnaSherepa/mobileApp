/*import 'package:app/generateData/history_list.dart';
import 'package:app/objects/post.dart';
import 'package:app/objects/profile.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../main.dart';

List<Profile> userList = Users;
int i = 0;

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  final _random = new Random();
  int next(int min, int max) => min + _random.nextInt(max - min);

  Widget getMainNewsWidget(Post post) {
   
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
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    )),
                const Spacer(),
                const Icon(Icons.more_vert, color: Colors.white),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              // padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                post.postImg,
                fit: BoxFit.fitWidth,
              ),
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
                    IconButton(
                      icon: post.isLiked
                          ? const Icon(Icons.favorite, color: Colors.red)
                          : const Icon(Icons.favorite_border,
                              color: Colors.white),
                      onPressed: () {
                        post.isLiked = !post.isLiked;
                        if (post.isLiked) {
                          post.likes++;
                        } else {
                          post.likes--;
                        }
                        print(
                            "Post is liked? :${post.isLiked} with userId = ${post.user.nickname}");
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.comment, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: () {},
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          post.isSaved = !post.isSaved;
                          if (post.isSaved) {
                            print("post ${post.user.nickname} is added to the list");
                            savedPost.add(post);
                          } else {
                            print("post ${post.user.nickname} is removed to the list");
                            savedPost.remove(post);
                          }
                          print(
                              "Post is saved? :${post.isSaved} with userId = ${post.user.nickname}");
                        },
                        icon: post.isSaved
                            ? const Icon(Icons.turned_in, color: Colors.white)
                            : const Icon(Icons.turned_in_not,
                                color: Colors.white)),
                  ],
                ),
                Text("${post.likes} liked",
                    style: const TextStyle(color: Colors.white)),
                Row(
                  children: [
                    Text(
                      "${post.user.nickname}: ",
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      post.description,
                      style: const TextStyle(color: Colors.white),
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

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          Post post = posts[index];
          print(
              "Post is liked before: ${post.isLiked} with userId = ${post.user.nickname} index = ${index}");
          return getMainNewsWidget(posts[index]);
        },
        childCount: 10,
      ),
    );
  }
}
*/