import 'package:flutter/material.dart';

class ListCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String author;
  final String description;

  ListCard(
      {required this.imageUrl,
      required this.title,
      required this.author,
      required this.description});

  @override
  _ListCardState createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              height:
                  MediaQuery.of(context).size.height < 550 ? 145 : 250, // 230
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    offset: const Offset(4, 4),
                    blurRadius: 6),
                BoxShadow(
                    color: Colors.grey.shade400,
                    offset: const Offset(-4, -4),
                    blurRadius: 6),
              ]),
            ),
          ),
          Row(
            children: [
              Container(
                height:
                    MediaQuery.of(context).size.height < 550 ? 165 : 250, //250
                width:
                    MediaQuery.of(context).size.width < 340 ? 100 : 140, //170
                //margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade400,
                        offset: const Offset(4, 4),
                        blurRadius: 6),
                    BoxShadow(
                        color: Colors.grey.shade400,
                        offset: const Offset(-4, -4),
                        blurRadius: 5),
                  ],
                  image: DecorationImage(
                    image: NetworkImage(widget.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      height:
                          MediaQuery.of(context).size.height < 550 ? 30 : 70,
                      width:
                          MediaQuery.of(context).size.height < 340 ? 120 : 165,
                      child: MediaQuery.of(context).size.height < 550
                          ? FittedBox(
                              child: Text(
                                widget.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                          : Text(
                              widget.title,
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                    ),
                    Container(
                      height:
                          MediaQuery.of(context).size.height < 550 ? 20 : 70,
                      width:
                          MediaQuery.of(context).size.height < 340 ? 120 : 165,
                      child: MediaQuery.of(context).size.height < 550
                          ? FittedBox(
                              child: Text(
                                'author: ${widget.author}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue,
                                ),
                              ),
                            )
                          : Text(
                              'author: ${widget.author}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue,
                              ),
                            ),
                    ),
                    Container(
                      height: 2,
                      width:
                          MediaQuery.of(context).size.width < 330 ? 145 : 175,
                      margin: const EdgeInsets.only(top: 5, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    SizedBox(
                      height:
                          MediaQuery.of(context).size.height < 550 ? 55 : 75,
                      width:
                          MediaQuery.of(context).size.height < 340 ? 120 : 165,
                      child: MediaQuery.of(context).size.height < 550
                          ? Text(
                              widget.description,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            )
                          : Text(
                              widget.description,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
