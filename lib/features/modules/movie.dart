
class Movie {
  late String _id;
  late String _name;
  late String _mainImage;
  late String _disc;
  late String _views;
  late String _rating;
  late String _duration;
  late List<dynamic> _genres;
  late String _releaseDate;
  late List<dynamic> _images;
  late List<dynamic> _category;

  Movie( this._id,
      this._name,
      this._disc,
      this._mainImage,
      this._images,
      this._genres,
      this._rating,
      this._views,
      this._duration,
      this._releaseDate,
      this._category,);



  String getId() {
    return _id;
  }


  String getMovieName() {
    return _name;
  }
  bool compareName(String name){
    return _name==name;
  }
  bool containsName(String searchString){
    return _name.contains(searchString);
  }

  String getMainImage() {
    return _mainImage;
  }


  String getDisc() {
    return _disc;
  }

  List<dynamic> getGenres() {
    return _genres;
  }

  String getViews() {
    return _views;
  }

  String getRating() {
    return _rating;
  }

  String getDuration() {
    return _duration;
  }

  String getReleaseDate() {
    return _releaseDate;
  }

  List<dynamic> getImages() {
    return _images;
  }

  List<dynamic> getCategory() {
    return _category;
  }
}
