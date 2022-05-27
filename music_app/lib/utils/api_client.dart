import 'package:http/http.dart' as http;
import 'dart:convert' as jsonconvert;

import '../models/song.dart';

class ApiClient {
  getSongs() {
    const URL = "https://itunes.apple.com/search?term=sonu+nigam&limit=25";
    Future<http.Response> future = http.get(Uri.parse(URL));

    future.then((response) {
      String json = response.body;

      //conversion
      // Map<String, dynamic> map1 = jsonDecode(json).cast<Map<String, dynamic>>();
      Map<String, dynamic> map1 =
          jsonconvert.jsonDecode(json); //json is converted into map
      List<Map<String, dynamic>> list =
          map1['results']; // List of maps is returned from results in json file
      List<Song> songs = list.map((songMap) => Song.fromJSON(songMap)).toList();
      print("Songs are $songs");
      // each map is then given to Song.fromJson contructor method in Song.dart for inintialization

      // List<Song> songs = list
      //     .map((element) => Song(element['trackName'], element['artworkUrl30'],
      //         element['previewUrl']))
      //     .toList();s
    }).catchError((err) => print(err));
  }
}
// Convert object to json = serialization
// convert json to object = deserialization
