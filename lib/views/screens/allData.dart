import 'package:api_calling/models/helpers/api_helper.dart';
import 'package:api_calling/views/screens/checkWeather.dart';
import 'package:flutter/material.dart';

import '../../models/posts_model.dart';

class AllData extends StatefulWidget {
  const AllData({Key? key}) : super(key: key);

  @override
  State<AllData> createState() => _AllDataState();
}

class _AllDataState extends State<AllData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API App"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Expanded(
            child: FutureBuilder(
              future: ApiHelper.apiHelper.getAllPost(),
              builder: (context, snapShot) {
                if (snapShot.hasError) {
                  return Text("${snapShot.error}");
                } else if (snapShot.hasData) {
                  List<Post>? P = snapShot.data;
                  return ListView.builder(
                      itemCount: P!.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          leading: Text(
                            "${P[i]!.Id}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          title: Text(
                            P[i].Title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          subtitle: Text(P[i].Body),
                        );
                      });
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CheckWeather(),
            ),
          );
        },
        child: const Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}
