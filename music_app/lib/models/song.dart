class Song {
  late String trackName;
  //late - one of the constructor will definitely initialize the Song objects/variables
  late String image;
  late String audio;

  Song(this.trackName, this.image, this.audio);

  Song.fromJSON(Map<String, dynamic> map) {
    trackName = map['trackName'];
    image = map['artworkUrl30'];
    audio = map['previewUrl'];
  }

  Map<String, dynamic> toJSON() {
    return {"trackName": trackName, "artworkUrl30": image, "previewUrl": audio};
  }

  @override
  String toString() {
    // TODO: implement toString
    return "trackName:$trackName";
  }
}
