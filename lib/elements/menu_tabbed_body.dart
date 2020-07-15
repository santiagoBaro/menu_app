import 'package:flutter/material.dart';

import 'availability_tab.dart';
import 'menu_tab.dart';

class MenuTabbedBody extends StatefulWidget {
  MenuTabbedBody({Key key}) : super(key: key);

  @override
  _MenuTabbedBodyState createState() => _MenuTabbedBodyState();
}

class _MenuTabbedBodyState extends State<MenuTabbedBody>
    with TickerProviderStateMixin {
  TabController _nestedTabController;

  @override
  void initState() {
    super.initState();

    _nestedTabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            //* NESTED TAB BAR
            TabBar(
              controller: _nestedTabController,
              indicatorColor: Colors.redAccent,
              labelColor: Colors.redAccent,
              unselectedLabelColor: Colors.black,
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  text: "Menu",
                ),
                Tab(
                  text: "Availability",
                ),
              ],
            ),
            Container(
              //* THIS CONTAINER IS WHERE THE TAB DISPLAYS ITS PAGES
              color: Colors.yellow,
              //TODO check height for different devices
              height: MediaQuery.of(context).size.height - 40 - 210.4,
              width: MediaQuery.of(context).size.width - 50,
              //margin: EdgeInsets.only(left: 16.0, right: 16.0),
              child: TabBarView(
                controller: _nestedTabController,
                children: <Widget>[
                  Container(
                    // FIRST TAB PAGE
                    color: Colors.blue,
                    child: MenuTab(),
                  ),
                  Container(
                    // SECOND TAB PAGE
                    color: Colors.green,
                    child: AvailabilityTab(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
