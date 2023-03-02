import 'package:flutter/material.dart';

import '../../models/helpers/api_helper.dart';

class CheckWeather extends StatefulWidget {
  const CheckWeather({Key? key}) : super(key: key);

  @override
  State<CheckWeather> createState() => _CheckWeatherState();
}

class _CheckWeatherState extends State<CheckWeather> {
  String City = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather API App"),
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
                      City = val;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Enter City Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: FutureBuilder(
                  future: ApiHelper.apiHelper.getWeather(City: City),
                  builder: (context, snapShot) {
                    if (snapShot.hasError) {
                      return Text("${snapShot.error}");
                    } else if (snapShot.hasData) {
                      Map? P = snapShot.data;
                      return ListTile(
                        leading: Text(
                          "${P!['weather'][0]['main']}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        title: Text(
                          P['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        subtitle: Text(P['sys']['country']),
                        trailing: Text(
                            "${(P['main']['temp'] - 273.15).toString().split('.')[0]}.${(P['main']['temp'] - 273.15).toString().split('.')[1][0]}${(P['main']['temp'] - 273.15).toString().split('.')[1][1]}"),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.done),
      ),
    );
  }
}
