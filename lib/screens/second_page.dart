import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../scr.dart';
// import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:convert';

class SecondPage extends StatefulWidget {
  String category;
  SecondPage({this.category});
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('PhotoSearch', style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: getPics(widget.category),
          builder: (context, snapshot) {
            Map data = snapshot.data;
            if (snapshot.hasError) {
              print(snapshot.error);
              return Center(
                child: Text(
                  'Failed to get response from the server',
                  style: TextStyle(color: Colors.red, fontSize: 22.0),
                ),
              );
            } else if (snapshot.hasData) {
              return Center(
                child: new ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return new Column(
                      children: [
                        const SizedBox(height: 5.0),
                        new Container(
                          child: InkWell(
                            onTap: () {},
                            child: new Image.network(
                                '${data['hits'][index]['largeImageURL']}'),
                          ),
                        ),
                        const SizedBox(height: 5.0),
                      ],
                    );
                  },
                ),
              );
            } else if (!snapshot.hasData) {
              return new Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      );
    } catch (e) {
      return Center(
        child: Text(
          e,
          style: TextStyle(color: Colors.red, fontSize: 18.0),
          textAlign: TextAlign.center,
        ),
      );
    }
  }
}

Future<Map> getPics(String category) async {
  String url =
      'https://pixabay.com/api/?key=$myAPIKey&q=$category&image_type=photo&pretty=true';

  http.Response response = await http.get(url);
  return json.decode(response.body);
}
