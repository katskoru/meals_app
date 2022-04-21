import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key, required this.saveFilters}) : super(key: key);
  static const routeName = "/filters";
  final VoidCallback saveFilters;
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Filters"),
          actions: [
            IconButton(onPressed: widget.saveFilters, icon: Icon(Icons.save)),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text("Adjust your meal selection"),
            ),
            Expanded(
                child: ListView(
              children: [
                SwitchListTile(
                  value: _glutenFree,
                  onChanged: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                  title: Text("Gluten Free"),
                ),
                SwitchListTile(
                  value: _vegeterian,
                  onChanged: (newValue) {
                    setState(() {
                      _vegeterian = newValue;
                    });
                  },
                  title: const Text("Vegetarian"),
                ),
                SwitchListTile(
                  value: _vegan,
                  onChanged: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                  title: const Text("Vegan"),
                ),
                SwitchListTile(
                  value: _lactoseFree,
                  onChanged: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                  title: const Text("Lactose Free"),
                ),
              ],
            ))
          ],
        ));
  }
}
