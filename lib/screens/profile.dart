import 'package:flutter/material.dart';
import 'package:ta/screens/home.dart';
import 'dart:convert';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<String> avatar = <String>['character/dimas.png'];
  final List<String> nama = <String>['Dimas Satria Permana'];
  final List<String> prodi = <String>['Teknik Komputer 2020'];
  final List<String> nomor = <String>['081234567890'];
  final List<String> fb = <String>['Dimas Coolz'];
  final List<String> email = <String>['dimas@gmail.com'];

  int _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: nama.length, // the length
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 220,
                      height: 250,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Image.asset(
                          avatar[index],
                          fit: BoxFit.cover,
                        ),
                        elevation: 55,
                        margin: EdgeInsets.only(
                            top: 60, bottom: 20, left: 20, right: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        nama[index],
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Text(
                      '21120120130066',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    SizedBox(
                      height: 20.0,
                      width: 200,
                      child: Divider(color: Colors.black),
                    ),
                    Card(
                      color: Colors.lightBlue[900],
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 75.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.school,
                          color: Colors.blueGrey[100],
                        ),
                        title: Text(prodi[index],
                            style: TextStyle(color: Colors.blueGrey[100])),
                      ),
                    ),
                    Card(
                      color: Colors.lightBlue[900],
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 75.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.phone,
                          color: Colors.blueGrey[100],
                        ),
                        title: Text(nomor[index],
                            style: TextStyle(color: Colors.blueGrey[100])),
                      ),
                    ),
                    Card(
                      color: Colors.lightBlue[900],
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 75.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.facebook,
                          color: Colors.blueGrey[100],
                        ),
                        title: Text(fb[index],
                            style: TextStyle(color: Colors.blueGrey[100])),
                      ),
                    ),
                    Card(
                        color: Colors.lightBlue[900],
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 75.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.email,
                            color: Colors.blueGrey[100],
                          ),
                          title: Text(email[index],
                              style: TextStyle(color: Colors.blueGrey[100])),
                        )),
                  ],
                );
              })),
    );
  }
}
