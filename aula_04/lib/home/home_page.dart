import 'package:aula_04/home/repositories/home_repository_impl.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final repository = HomeRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Firebase"),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Future",
              ),
              Tab(
                text: "Stream",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FutureBuilder<List<Map>>(
              future: repository.getTarefas(),
              builder: (context, snapshot) {
                if (snapshot.hasError)
                  return Center(
                    child: Text("Oops!"),
                  );

                if (snapshot.hasData) {
                  final list = snapshot.data;
                  return ListView.builder(
                    itemCount: list!.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(list[index]['name']),
                    ),
                  );
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            FutureBuilder<List<Map>>(
              future: repository.getTarefas(),
              builder: (context, snapshot) {
                if (snapshot.hasError)
                  return Center(
                    child: Text("Oops!"),
                  );

                if (snapshot.hasData) {
                  final list = snapshot.data;
                  return ListView.builder(
                    itemCount: list!.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(list[index]['name']),
                    ),
                  );
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            // StreamBuilder<List<Map>>(
            //   stream: repository.streamTarefas2(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasError)
            //       return Center(
            //         child: Text("Oops!"),
            //       );

            //     if (snapshot.hasData) {
            //       final list = snapshot.data as List;
            //       return ListView.builder(
            //         itemCount: list.length,
            //         itemBuilder: (context, index) => ListTile(
            //           title: Text(list[index]['name']),
            //         ),
            //       );
            //     }

            //     return Center(
            //       child: CircularProgressIndicator(),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
