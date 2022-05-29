import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/modules/repository/product_repo.dart';

import '../models/product.dart';

class ViewProduct extends StatelessWidget {
  ProductRepository repo = ProductRepository();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: repo.readRealTime(),
        builder: (BuildContext bt, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error '),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: Text('Loading...'),
            );
          } else {
            return ListView.builder(
              //scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext ctx, int index) {
                // Single Row
                Object? object = snapshot.data?.docs[index].data();
                print("Object is $object");
                print("Type ${object.runtimeType}");
                String imageURL = "";
                String name = "";
                String desc = "";
                if (object != null) {
                  Map map = object as Map;
                  imageURL = map["url"]!;
                  name = map["name"]!;
                  desc = map["desc"]!;
                }

                //return Center(child: Text('Data Comes'));
                return ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                      IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                    ],
                  ),
                  leading: Container(
                    child: Image.network(imageURL),
                  ),
                  title: Text(name),
                  subtitle: Text(desc),
                );
              },
            );
          }
        },
      ),
    );
  }
}
