import 'package:api_dio_architecture_provider/model/post_model.dart';
import 'package:api_dio_architecture_provider/viewmodel/update_view_model.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  static final String id = 'update_page';

  Post post = Post();
  UpdatePage({this.post, Key key}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  UpdateViewModel viewModel = UpdateViewModel();

  @override
  void initState() {
    super.initState();

    viewModel.titleTextEditingController.text = widget.post.title.toUpperCase();
    viewModel.bodyTextEditingController.text = widget.post.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Post'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Title TextField
            TextField(
              controller: viewModel.titleTextEditingController,
              inputFormatters: [ UpperCaseTextFormatter() ],
              maxLines: 2,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),

            // Title TextField
            TextField(
              controller: viewModel.bodyTextEditingController,
              maxLines: 8,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: Icon(Icons.upload_outlined),
        onPressed: () {
          viewModel.apiPostUpdate(context, Post(userId: widget.post.userId, id: widget.post.id, title: viewModel.titleTextEditingController.text, body: viewModel.bodyTextEditingController.text));
        },
      ),
    );
  }
}
