import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen(
      {Key? key, required this.saveFilters, required this.currentFilters})
      : super(key: key);
  static const routeName = "/filters";
  final Function? saveFilters;
  final Map<String, bool> currentFilters;
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters["gluten"]!;
    _lactoseFree = widget.currentFilters["lactose"]!;
    _vegan = widget.currentFilters["vegan"]!;
    _vegeterian = widget.currentFilters["vegetarian"]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Filters"),
          actions: [
            const Center(child: Text("Save your choices")),
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    "gluten": _glutenFree,
                    "lactose": _lactoseFree,
                    "vegan": _vegan,
                    "vegetarian": _vegeterian,
                  };
                  widget.saveFilters!(selectedFilters);
                },
                icon: const Icon(Icons.save)),
          ],
        ),
        drawer: const MainDrawer(),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 70,
                image: NetworkImage(
                    "https://images.pexels.com/photos/262896/pexels-photo-262896.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: const Text("Adjust your meal selection"),
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
                    title: const Text("Gluten Free"),
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
          ),
        ));
  }
}
