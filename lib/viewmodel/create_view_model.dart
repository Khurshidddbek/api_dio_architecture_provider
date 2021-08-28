import 'dart:math';

import 'package:api_dio_architecture_provider/model/post_model.dart';
import 'package:api_dio_architecture_provider/pages/home_page.dart';
import 'package:api_dio_architecture_provider/services/network_service.dart';
import 'package:flutter/cupertino.dart';

class CreateViewModel extends ChangeNotifier {
  bool isLoading = false;
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController bodyTextEditingController = TextEditingController();

  Future apiPostCreate(BuildContext context, String title, String body) async {
    isLoading = true;
    notifyListeners();

    var response = await Network.POST(
        Network.BASE + Network.API_CREATE,
        Network.paramsCreate(
            Post(
              userId: Random().nextInt(pow(2, 30) - 1),
              id: Random().nextInt(pow(2, 30) - 1),
              title: title,
              body: body
            )
        )
    );

    if (response != null) {
      Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
      // return response;
    }

    isLoading = false;
    notifyListeners();
  }
}