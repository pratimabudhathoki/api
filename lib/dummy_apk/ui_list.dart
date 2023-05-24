import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_dummy_apkcall/dummy_apk/modul_api.dart';
import 'package:http/http.dart';

import '../main.dart';

class dummyApi extends StatefulWidget {
  const dummyApi({super.key});

  @override
  State<dummyApi> createState() => _dummyApiState();
}

class _dummyApiState extends State<dummyApi> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("T A B B A R"),
          ),
          body: Column(
            children: [
              const TabBar(
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.list,
                      color: Colors.deepOrange,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.image,
                      color: Colors.deepOrange,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    SizedBox(
                      height: 500,
                      child: FutureBuilder(
                        future: getApi(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  child:
                                      Text(Myapilist[index].title.toString()),
                                );
                              },
                            );
                          } else {
                            return const Text("loading");
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 500,
                      child: FutureBuilder(
                        future: getsecondApi(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            // return Text(snapshot.data.toString());
                            return GridView.builder(
                              itemCount: snapshot.data?.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 4,
                                      crossAxisSpacing: 4),
                              itemBuilder: (context, index) {
                                return Container(
                                    child: Image.network(
                                        snapshot.data![index].url!));
                              },
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
