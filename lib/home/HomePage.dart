import 'package:blog_app_web/BLoC/PostCubit.dart';
import 'package:blog_app_web/post/PostDetailPage.dart';
import 'package:blog_app_web/post/PostModel.dart';
import 'package:blog_app_web/states/PostStates.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  passData(Post post) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PostDetails(post: post)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Web/App Blog"),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => debugPrint("Procurar"),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => debugPrint("Adicionar"),
          ),
          SizedBox(width: 10),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Nome do Usuário"),
              accountEmail: Text("Email do usuario"),
              currentAccountPicture: CircleAvatar(),
              decoration: BoxDecoration(color: Colors.red.shade600),
            ),
            ListTile(
              title: Text("Primeira Pagina"),
              leading: Icon(Icons.cake),
            ),
            ListTile(
              title: Text("Segunda Pagina"),
              leading: Icon(Icons.account_balance_wallet_outlined),
            ),
            ListTile(
              title: Text("Terceira Pagina"),
              leading: Icon(Icons.access_time),
            ),
            ListTile(
              title: Text("Quarta Pagina"),
              leading: Icon(Icons.account_balance),
            ),
            Divider(
              height: 10,
              color: Colors.black,
            ),
            ListTile(
              title: Text("Fechar"),
              leading: Icon(Icons.close),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 1080),
          child: BlocBuilder<PostCubit, PostsState>(
              builder: (BuildContext context, PostsState state) {
            if (state is LoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ErrorState) {
              return Center(child: Icon(Icons.close));
            } else if (state is LoadedState) {
              List<Post> posts = state.posts;
              return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 10,
                      margin: EdgeInsets.all(10),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            CircleAvatar(
                              child: Text(posts.elementAt(index).title[0]),
                              backgroundColor: Colors.amber,
                              foregroundColor: Colors.white,
                            ),
                            SizedBox(width: 10),
                            InkWell(
                              hoverColor: Colors.transparent,
                              child: Container(
                                width: 210,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      posts.elementAt(index).title,
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.blueAccent),
                                      maxLines: 1,
                                    ),
                                    SizedBox(height: 5),
                                    Text(posts.elementAt(index).content,
                                        maxLines: 2),
                                  ],
                                ),
                              ),
                              onTap: () {
                                passData(posts.elementAt(index));
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              print("container");
              return Container();
            }
          }),
        ),
      ),
    );
  }
}
