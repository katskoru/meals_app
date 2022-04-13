import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon) {
    return ListTile(
      onTap: () {},
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
              child: Text(
                "cook",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              height: 120,
              width: double.infinity,
              color: Theme.of(context).colorScheme.onBackground,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(10)),
          const SizedBox(
            height: 20,
          ),
          buildListTile("Meals", Icons.restaurant),
          buildListTile("Filters", Icons.settings),
        ],
      ),
    );
  }
}
