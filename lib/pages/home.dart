import 'package:flutter/material.dart';
import 'package:augmented_reality_plugin_wikitude/wikitude_plugin.dart';
import 'package:augmented_reality_plugin_wikitude/wikitude_response.dart';
import '../widgets/navigation.dart';
import '../pages/arorder.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> features = ["image_tracking"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      drawer: NavigationDrawer(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Welcome to FoodForm!", style: TextStyle(fontSize: 20)),
          Container(
            margin: const EdgeInsets.all(30.0),
            child: Text(
                "To use this app, scan a menu like in the example below:",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16)),
          ),
          Image.asset('assets/img/example.png'),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            width: 250,
            child: RaisedButton(
              color: Colors.white,
              padding: const EdgeInsets.all(15.0),
              onPressed: checkPermissions,
              child: Text('Scan a menu', style: TextStyle(fontSize: 16)),
            ),
          )
        ],
      )),
    );
  }

  //We check all permissions necessary to load our AR archicture, then we will navigate to the page where the AR widget will be called.
  checkPermissions() {
    this.checkDeviceCompatibility().then((value) => {
          if (value.success)
            {
              this.requestARPermissions().then((value) => {
                    if (value.success)
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ArOrderPage()))
                      }
                    else
                      {
                        debugPrint("AR permissions denied"),
                        debugPrint(value.message)
                      }
                  })
            }
          else
            {debugPrint("Device incompatible"), debugPrint(value.message)}
        });
  }

  Future<WikitudeResponse> checkDeviceCompatibility() async {
    return await WikitudePlugin.isDeviceSupporting(this.features);
  }

  Future<WikitudeResponse> requestARPermissions() async {
    return await WikitudePlugin.requestARPermissions(this.features);
  }
}
