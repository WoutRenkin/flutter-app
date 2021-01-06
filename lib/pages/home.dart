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
            margin: const EdgeInsets.only(top: 20.0),
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
