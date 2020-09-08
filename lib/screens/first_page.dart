import 'package:flutter/material.dart';
import 'package:photo_search/screens/screens.dart';

class FirstPage extends StatelessWidget {
  var _categoryNameController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Material(
        color: Colors.white,
        child: Center(
          child: ListView(
            children: [
              const SizedBox(height: 60.0),
              new Image.asset(
                'assets/images/logo.png',
                width: 200.0,
                height: 200.0,
              ),
              new ListTile(
                title: new TextFormField(
                  controller: _categoryNameController,
                  decoration: new InputDecoration(
                    labelText: 'Enter a category!',
                    hintText: 'e.g. : dogs, cats, bikes ....',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              new ListTile(
                title: new Material(
                  color: Colors.lightBlue,
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(25.0),
                  child: new MaterialButton(
                    height: 45.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context) {
                          return new SecondPage(
                            category: _categoryNameController.text,
                          );
                        }),
                      );
                    },
                    child: Text(
                      'Search',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
