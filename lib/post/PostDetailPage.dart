import 'package:flutter/material.dart';
import 'PostModel.dart';

class PostDetails extends StatefulWidget {
  Post post;

  PostDetails({Key? key, required this.post}) : super(key: key);

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Post"),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 1080),
          child: Card(
            elevation: 10,
            margin: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        child: Text(widget.post.title[0]),
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        widget.post.title,
                        style:
                            TextStyle(fontSize: 22, color: Colors.blueAccent),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    widget.post.content,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
