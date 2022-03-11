import 'package:BookMyShow/models/post.dart';
import 'package:BookMyShow/repo/post_operations.dart';
import 'package:BookMyShow/screens/bottomnav.dart';
import 'package:BookMyShow/screens/toggle.dart';
import 'package:flutter/material.dart';

class BookMyShow extends StatelessWidget {
  List<Post> posts = [];
  BookMyShow() {
    PostOperations opr = PostOperations.getInstance();
    posts = opr.getPosts();
  }
  _getAppBar() {
    return AppBar(
        backgroundColor: const Color.fromRGBO(51, 53, 68, 1),
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 17),
            child: Icon(
              Icons.location_on,
              color: Colors.white,
            ),
          )
        ],
        title: ToggleButton());
  }

  _all_languages() {}
  _cinemas() {}

  _getMenuButtons(Size deviceSize) {
    return Container(
      width: deviceSize.width,
      height: 50,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(children: [
            TextButton.icon(
                onPressed: _all_languages,
                icon: const Icon(
                  Icons.language,
                  color: Colors.blueAccent,
                ),
                label: const Text(
                  'All Languages',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(98, 98, 98, 1)),
                )),

            // SizedBox(width: 5),
          ]),
          const VerticalDivider(
              indent: 12,
              endIndent: 12,
              width: 4,
              color: Color.fromARGB(255, 0, 0, 0)),
          Row(children: [
            TextButton.icon(
                onPressed: _cinemas,
                icon: const Icon(
                  Icons.chair,
                  color: Colors.red,
                ),
                label: const Text(
                  'Cinemas',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(98, 98, 98, 1)),
                )),
          ])
        ],
      ),
    );
  }

  TextStyle _getStyle(Color color, {double fontSize = 14}) {
    return TextStyle(color: color, fontSize: fontSize);
  }

  List<Widget> _prepareTedPost(Size deviceSize) {
    List<Widget> list = posts.map((post) {
      return Stack(children: [
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Image(
                image: NetworkImage(post.imageURL),
                width: double.infinity,
                height: 265,
                fit: BoxFit.cover,
              ),
              ListTile(
                title: Text(
                  post.movieTitle,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Row(children: [
                  Text(
                    post.language + "  ",
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                  for (var item in post.tags)
                    Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0) //
                                  ),
                        ),
                        //             <--- BoxDecoration here
                        child: Text(
                          item,
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ))
                ]),
                trailing: ElevatedButton(
                  onPressed: () {
                    // Perform some action
                  },
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(253, 47, 83, 1)),
                  child: const Text(
                    'BOOK',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 3.5,
          left: 3,
          child: Container(
            padding: const EdgeInsets.fromLTRB(5, 5, 6, 4),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(155, 191, 145, 1),
                  blurRadius: 2.0,
                  spreadRadius: 0.5,
                  offset: Offset(2.0, 2.0),
                )
              ],
              color: const Color.fromRGBO(78, 217, 101, 1),
              border: Border.all(
                color: const Color.fromARGB(225, 255, 255, 255),
              ),
              // borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Text('New',
                style: _getStyle(const Color.fromARGB(255, 255, 255, 255))),
          ),
        ),
        Positioned(
            width: deviceSize.width - 45,
            bottom: 90,
            left: 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(153, 12, 12, 12),
                        border: Border.all(
                            color: const Color.fromARGB(225, 255, 255, 255),
                            width: 2),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        post.ageRestriction,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(153, 12, 12, 12),
                    border: Border.all(),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      Row(children: [
                        const Icon(
                          Icons.favorite_rounded,
                          size: 20,
                          color: Color.fromRGBO(253, 47, 83, 1),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          post.percentage.toString() + '%',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                      ]),
                      Text(post.votes.toString() + " votes ",
                          style: _getStyle(
                              const Color.fromARGB(255, 255, 255, 255)))
                    ],
                  ),
                )
              ],
            ))
      ]);
    }).toList();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _getAppBar(),
      backgroundColor: const Color.fromRGBO(231, 231, 231, 1),
      body: Stack(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                margin: const EdgeInsets.only(top: 40),
                child: SingleChildScrollView(
                    child: Column(children: _prepareTedPost(deviceSize))),
              )),
          Align(
              alignment: Alignment.topCenter,
              child: _getMenuButtons(deviceSize)),
        ],
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
