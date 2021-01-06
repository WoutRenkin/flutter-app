import 'package:flutter/material.dart';
import 'package:augmented_reality_plugin_wikitude/wikitude_plugin.dart';
import 'package:augmented_reality_plugin_wikitude/wikitude_response.dart';
import '../pages/order_item.dart';
import '../pages/arorder.dart';
import '../widgets/navigation.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPage createState() => _ScanPage();
}

class _ScanPage extends State {
  List<String> features = ["image_tracking"];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    checkPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Scan menu")),
        drawer: NavigationDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.white,
                padding: const EdgeInsets.all(15.0),
                onPressed: checkPermissions,
                child: Text('Scan a menu', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ));
  }

  checkPermissions() {
    this.checkDeviceCompatibility().then((value) => {
          if (value.success)
            {
              this.requestARPermissions().then((value) => {
                    if (value.success)
                      {
                        this.setState(() {
                          loading = false;
                        }),
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
