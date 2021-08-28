import 'dart:async';
import 'package:api_dio_architecture_provider/model/post_model.dart';
import 'package:api_dio_architecture_provider/services/network_service.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  List<Post> items = [];
  bool isLoading = false;

  Future apiPostList() async {
    isLoading = true;
    notifyListeners();

    var response = await Network.GET(Network.BASE + Network.API_LIST);

    if (response != null) {
      items = Network.parsePostList(response);
    }

    isLoading = false;
    notifyListeners();
  }


  Future<bool> apiPostDelete(Post post) async {
    isLoading = true;
    notifyListeners();

    var response = await Network.DEL(Network.BASE + Network.API_DELETE + post.id.toString());

    isLoading = false;
    notifyListeners();

    return response != null;
  }
}