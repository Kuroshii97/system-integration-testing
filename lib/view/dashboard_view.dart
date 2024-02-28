import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:system_integration_practice/view/google_map_view.dart';
import 'package:system_integration_practice/view/user_contact_view.dart';
import 'package:system_integration_practice/view/user_data_session_view.dart';
import 'package:system_integration_practice/view/user_google_login_view.dart';
import 'package:system_integration_practice/view/user_media_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

enum DashboardList {
  user(Icons.login, UserGoogleLoginView()),
  map(Icons.map_outlined, GoogleMapView()),
  contact(Icons.contacts, UserContactView()),
  media(Icons.photo, UserMediaView()),
  data(Icons.data_array_outlined, UserDataSessionView());

  const DashboardList(this.iconData, this.widget);

  final IconData iconData;
  final Widget widget;
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('System Integration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                shrinkWrap: false,
                children: dashboardWidgets(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> dashboardWidgets(context) {
  List<Widget> widgetLists = [];
  for (var element in DashboardList.values) {
    var widget = InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => element.widget));
      },
      child: Card(
        elevation: 5,
        child: Container(
          margin: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.height / 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                element.iconData,
                size: 20,
              ),
              Text(element.name)
            ],
          ),
        ),
      ),
    );
    widgetLists.add(widget);
  }
  return widgetLists;
}
