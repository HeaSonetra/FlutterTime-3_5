class Moviemodel {
  final int id;
  final String title;
  final String img;
  bool isfavorite;

  Moviemodel({required this.id, required this.title, required this.img,this.isfavorite=false});
}