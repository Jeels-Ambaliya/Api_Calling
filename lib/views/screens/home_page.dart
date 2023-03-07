import 'package:api_calling/models/helpers/api_helper.dart';
import 'package:api_calling/views/screens/allData.dart';
import 'package:flutter/material.dart';

import '../../models/posts_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int Num = 0;

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: TextField(
                  onChanged: (val) {
                    setState(() {
                      Num = int.parse(val);
                    });
                  },
                  maxLength: 2,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: FutureBuilder(
                  future: ApiHelper.apiHelper.getPost(PostNum: Num),
                  builder: (context, snapShot) {
                    if (snapShot.hasError) {
                      return Text("${snapShot.error}");
                    } else if (snapShot.hasData) {
                      Post? P = snapShot.data;
                      return ListTile(
                        leading: Text(
                          "${P!.Id}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        title: Text(
                          P.Title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        subtitle: Text(P.Body),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              //
              const SizedBox(
                child: Text("Hello"),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AllData(),
            ),
          );
        },
        child: const Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}
