import 'package:app/objects/post.dart';
import 'package:flutter/foundation.dart';

class SavingsModel extends ChangeNotifier {
  late PostModel _postList;

  final List<int> _itemIds = [];

  PostModel get post => _postList;

  set post(PostModel newPost) {
    _postList = newPost;
    notifyListeners();
  }

  List<Post> get items => _itemIds.map((id) => _postList.getById(id)).toList();

  void add(Post item) {
    _itemIds.add(item.id);
    notifyListeners();
  }

  void remove(Post item) {
    _itemIds.remove(item.id);
    notifyListeners();
  }
  void removeAll() {
    _itemIds.clear();
    notifyListeners();
  }
}
