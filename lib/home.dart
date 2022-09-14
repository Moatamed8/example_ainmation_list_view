import 'package:example_animation_list/provider/book_data.dart';
import 'package:example_animation_list/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/animation_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loadedBookData = Provider.of<BookData>(context).bookItems;

    return Scaffold(
      appBar: AppBar(
        title: Text("Animation List"),
      ),
      body: Center(
        child: AnimationList(
            children: loadedBookData.map((item) {
          return ListCard(
            imageUrl: item.imageUrl,
            title: item.title,
            author: item.author,
            description: item.description,
          );
        }).toList()),
      ),
    );
  }
}
