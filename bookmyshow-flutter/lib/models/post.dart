class Post{
  late String movieTitle;
  late String language;
  late String ageRestriction;
  late int percentage;
  late int votes;
  late String imageURL;
  late List<String> tags;
  
 Post({required this.movieTitle,required this.tags ,required this.language, required this.ageRestriction , required this.imageURL , required this.percentage , required this.votes});
}