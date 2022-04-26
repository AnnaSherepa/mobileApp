import 'package:app/generateData/history_list.dart';
import 'package:app/objects/profile.dart';

class PostModel{
  
  List<Post> liked = [];

  Post getById(int id) => Post(id: id, user: users[id % users.length], postImg: "assets/images/history-content/${id + 1}-c.png", 
                                      description: "Lorem ipsum", likes: 100);

  Post getByPosition(int position) {
    return getById(position);
  }  
}

class Post {
  final int id;
  final Profile user;
  final String postImg;
  int likes;
  final String description;
  bool isLiked = false;
  bool isSaved = false;
 
  Post({required this.id, required this.user, required this.postImg, required this.likes, required this.description});
  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Post && other.id == id;
}