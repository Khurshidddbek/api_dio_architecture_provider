import 'package:api_dio_architecture_provider/model/post_model.dart';
import 'package:api_dio_architecture_provider/pages/home_page.dart';
import 'package:api_dio_architecture_provider/services/network_service.dart';
import 'package:flutter/cupertino.dart';

class UpdateViewModel extends ChangeNotifier {
  bool isLoading = false;
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController bodyTextEditingController = TextEditingController();

  Future apiPostUpdate(BuildContext context, Post post) async {
    isLoading = true;
    notifyListeners();

    var response = await Network.PUT(
        Network.BASE + Network.API_UPDATE + post.id.toString(),
        Network.paramsUpdate(
            Post(
                userId: post.userId,
                id: post.id,
                title: titleTextEditingController.text,
                body: bodyTextEditingController.text
            )
        )
    );

    if (response != null) {
      Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
    }

    isLoading = false;
    notifyListeners();
  }
}