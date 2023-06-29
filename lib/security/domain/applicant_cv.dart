class Cv{
  String cv;
  Cv({
    required this.cv,
  });
  Map<String,dynamic> toJson(){
    return {
      'cv': cv,
    };
  }
}