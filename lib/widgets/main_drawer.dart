import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      onTap: tapHandler as void Function(),
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.amberAccent,
      child: Column(
        children: [
          Container(
              child: Text(
                "Cookbook",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              height: 120,
              width: double.infinity,
              color: Colors.amber,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10)),
          const SizedBox(
            height: 20,
          ),
          buildListTile("Meals", Icons.restaurant,
              () => Navigator.of(context).pushReplacementNamed("/") as Future),
          buildListTile(
              "Filters",
              Icons.settings,
              () => Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName)),
        ],
      ),
    );
  }
}
