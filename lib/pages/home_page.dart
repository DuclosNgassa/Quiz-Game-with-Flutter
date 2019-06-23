import 'package:flutter/material.dart';
import './other_page.dart';
import './quiz_page.dart';
import './quiz_page_question.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String mainProfilPicture = "images/profil.jpg";
  String secondProfilPicture = "images/background1.jpg";

  void switchUser() {
    String temp = mainProfilPicture;
    this.setState(() {
      mainProfilPicture = secondProfilPicture;
      secondProfilPicture = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("My Drawer App"),
        backgroundColor: Colors.redAccent,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Duclos"),
              accountEmail: new Text("ngassarmel@gamil.com"),
              currentAccountPicture: new GestureDetector(
                onTap: () => print("Current User Avatar!"),
                child: new CircleAvatar(
                  backgroundImage: new AssetImage(mainProfilPicture),
                ),
              ),
              otherAccountsPictures: <Widget>[
                new GestureDetector(
                  onTap: switchUser,
                  child: new CircleAvatar(
                    child: new Text("DUC"),
                    //backgroundImage: new AssetImage('images/profil.jpg'),
                  ),
                ),
              ],
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new AssetImage(secondProfilPicture),
                ),
              ),
            ),
            new ListTile(
              title: new Text("Quiz Page"),
              trailing: new Icon(Icons.question_answer),
              onTap: () {
                //Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return QuizPage();
                  }),
                );
              },
            ),
            Divider(),
            new ListTile(
              title: new Text("Second Page"),
              trailing: new Icon(Icons.arrow_downward),
              onTap: () => Navigator.of(context).push(
                    new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new OtherPage("Second Page"),
                    ),
                  ),
            ),
            Divider(),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.cancel),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: new Center(
        child: new Text("Home Page"),
      ),
    );
  }
}
