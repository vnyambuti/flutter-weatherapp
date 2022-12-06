import 'package:flutter/material.dart';
import 'package:weatherapp/dataservice.dart';
import 'package:weatherapp/model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final dataservice = DataService();
  final _controller = TextEditingController();
  var _response;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      title: "Weather",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 161, 168, 171),
          elevation: 0,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_response != null)
                  Column(
                    children: [
                      Image.network(_response.getIconurl),
                      Text(
                        '${_response.temperature.temp}',
                        style: TextStyle(fontSize: 40),
                      ),
                      Text(_response.weatherinfo.description)
                    ],
                  ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: SizedBox(
                    width: 150,
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(labelText: "City"),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ElevatedButton(onPressed: getWeather, child: Text("Search"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  getWeather() async {
    final res = await dataservice.getWeather(_controller.text);
    setState(() => _response = res);
  }
}
