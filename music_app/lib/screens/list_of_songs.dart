import 'package:flutter/material.dart';
import 'package:music_app/utils/api_client.dart';

class ListOfSongs extends StatefulWidget {
  const ListOfSongs({Key? key}) : super(key: key);

  @override
  State<ListOfSongs> createState() => _ListOfSongsState();
}

class _ListOfSongsState extends State<ListOfSongs> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiClient apiClient = ApiClient();
    apiClient.getSongs();
    // since this method is an asyn function,
    //the data will be late and the build will be called early therefore it won't display anything
    //2 methods to resolve this is
    // 1)we get a Future here by returning future in the getsongs() method
    // 2) We hand our this class's function to getSongs() function in APi client -we create a call back function
    // 3) We wait here - apiClient.getSongs(); by using await key word
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Msuic app")),
      body: Container(
          // child:ListView.builder(itemBuilder: itemBuilder)
          ),
    );
  }
}
