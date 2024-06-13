import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const TabBarApp());

class TabBarApp extends StatelessWidget {
  const TabBarApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const TabBarExample(),
    );
  }
}

class TabBarExample extends StatefulWidget {
  const TabBarExample({Key? key});

  @override
  _TabBarExampleState createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<TabBarExample> {
  final Random _random = Random();
  late List<Image> images;

  @override
  void initState() {
    super.initState();
    images = List.generate(3, (index) => _randomImage());
  }

  Image _randomImage() {
    final id = _random.nextInt(1000);
    return Image.network('https://picsum.photos/id/$id/200/200');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('API for imágenes'),
          ),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: images.map((image) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  images[images.indexOf(image)] = _randomImage();
                });
              },
              child: Center(child: image),
            );
          }).toList(),
        ),
      ),
    );
  }
}
