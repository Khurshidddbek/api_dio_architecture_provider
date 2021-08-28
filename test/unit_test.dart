import 'package:api_dio_architecture_provider/model/post_model.dart';
import 'package:api_dio_architecture_provider/services/network_service.dart';
import 'package:api_dio_architecture_provider/viewmodel/create_view_model.dart';
import 'package:api_dio_architecture_provider/viewmodel/home_view_model.dart';
import 'package:api_dio_architecture_provider/viewmodel/update_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  // Test Network Service
  // ===========================================================================
  test('Test GET API', () async {
    var response = await Network.GET(Network.BASE + Network.API_LIST);
    //print(response);

    expect(response, isNotNull);
  });

  test('Test POST API', () async {
    Post post = Post(userId: 2, id: 3, title: 'Demo title', body: 'Demo body');
    String response = await Network.POST(Network.BASE + Network.API_CREATE, Network.paramsCreate(post));

    expect(response, isNotNull);
  });

  test('Test PUT API', () async {
    Post post = Post(userId: 2, id: 2, title: 'Second title', body: 'Second body');
    String response = await Network.PUT(Network.BASE + Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post));

    expect(response, isNotNull);
  });

  test('Test DEL API', () async {
    Post post = Post(userId: 3, id: 2, title: 'Second title', body: 'Second body');
    String response = await Network.DEL(Network.BASE + Network.API_DELETE + post.id.toString());

    expect(response, isNotNull);
  });
  // ===========================================================================


  // Check the responses of the APIs.
  // ===========================================================================
  test('Test apiPostList', () async {
    var response = await HomeViewModel().apiPostList();
  });

  test('Test apiPostDelete', () async {
    Post post = Post(userId: 2, id: 2, title: 'asdfa', body: 'adfa');
    var response = await HomeViewModel().apiPostDelete(post);

    expect(response, isNotNull);
  });

  test('Test apiPostUpdate', () async {
    Post post = Post(userId: 2, id: 2, title: 'asdfa', body: 'adfa');
    BuildContext context;
    var response = await UpdateViewModel().apiPostUpdate(context, post);

    expect(response, isNotNull);
  });

  test('Test apiPostCreate', () async {
    BuildContext context;
    var response = await CreateViewModel().apiPostCreate(context, 'demo title', 'demo body');

    expect(response, isNotNull);
  });
}