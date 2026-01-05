
import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  late String _uid;
  late String _userName;
  late String _email;
  late String _phoneNum;
  late String _image;

  late String _sub;
  late List<dynamic> _subDuration;
  late String _numOfDown;
  late String _watchHours;

   List<dynamic> _favoriteMovies=[];
   List<dynamic> _savedMovies=[];
   List<dynamic> _downloadedMovies=[];

  MyUser.full(
      this._uid,
      this._userName,
      this._email,
      this._phoneNum,
      this._image,
      this._sub,
      this._subDuration,
      this._numOfDown,
      this._watchHours,
      this._downloadedMovies,
      this._favoriteMovies,
      this._savedMovies,
  );

  MyUser(String uid,String image, String username, String email, String phoneNum) {
    _uid=uid;
    _userName = username;
    _email = email;
    _phoneNum = phoneNum;
    _image = image;
    _sub = "free";
    _subDuration = [];
    _numOfDown = "0";
    _favoriteMovies = [];
    _savedMovies = [];
    _watchHours = "0";
    _downloadedMovies = [];
  }

  String getUserName() {
    return _userName;
  }
  void addFavoriteMovie(String movieName){
    if(_favoriteMovies.contains(movieName)){
      print("movie is already in favorite");
    }else{
      _favoriteMovies.add(movieName);

    }
    
  }
  void addSavedMovie(String movieName){
    if(_savedMovies.contains(movieName)){
      print("movie is already in Saved");
    }else{
      _savedMovies.add(movieName);

    }
  }
  void removeFavoriteMovie(String movieName){
    if(_favoriteMovies.contains(movieName)){
      _favoriteMovies.removeWhere((element) => element==movieName);
    }else{
      print("movie is already in favorite");
    }
  }

  void removeSavedMovie(String movieName){
    if(_savedMovies.contains(movieName)){
      _savedMovies.removeWhere((element) => element==movieName);
    }else{
      print("$movieName is not saved");
    }
  }
  void addDownloadedMovie(String movieName){
    if(_downloadedMovies.contains(movieName)){
      print("movie is already in Saved");
    }else{
      _downloadedMovies.add(movieName);
    }
  }
  void removeDownloadedMovie(String movieName){
    if(_downloadedMovies.contains(movieName)){
      _downloadedMovies.removeWhere((element) => element==movieName);
    }else{
      print("$movieName is not in Downloaded");
    }
  }
  
  String getEmail() {
    return _email;
  }

  String getPhoneNum() {
    return _phoneNum;
  }

  String getImage() {
    return _image;
  }

  String getSub() {
    return _sub;
  }

  List<dynamic> getSubDuration() {
    return _subDuration;
  }

  String getNumOfDown() {
    return _numOfDown;
  }

  String getWatchHours() {
    return _watchHours;
  }

  List<dynamic> getDownloadedMovies() {
    return _downloadedMovies;
  }

  List<dynamic> getFavoriteMovies() {
    return _favoriteMovies;
  }

  List<dynamic> getSavedMovies() {
    return _savedMovies;
  }

  Future<void> setUserName(String userName) async{
    _userName = userName;
  }

  Future<void> setEmail(String email) async{
    _email = email;
  }

  Future<void> setPhoneNum(String phoneNum) async{
    _phoneNum = phoneNum;
  }

  Future<void> setImage(String image) async{
    _image = image;
  }

  Future<void> setSub(String sub)async {
    _sub = sub;
  }

  Future<void> setSubDuration(List<String> subDuration)async {
    _subDuration = subDuration;
  }

  Future<void> setNumOfDown(String numOfDown)async {
    _numOfDown = numOfDown;
    // try {
    //   await _db.collection('user').doc(_uid+"1").update({
    //     "username": this._userName,
    //     "email": this._email,
    //     "phoneNum": this._phoneNum,
    //     "image": this._image
    //   });
    // } catch (e) {
    //   print("error found:${e.toString()}");
    // }
  }

  Future<void> setWatchHours(String watchHours)async {
    _watchHours = watchHours;
    // try {
    //   await _db.collection('user').doc(_uid+"1").update({
    //     "username": this._userName,
    //     "email": this._email,
    //     "phoneNum": this._phoneNum,
    //     "image": this._image
    //   });
    // } catch (e) {
    //   print("error found:${e.toString()}");
    // }
  }

  Future<void> setDownloadedMovies() async{
    try {
      await _db.collection('user').doc(_uid).update({
        "downloadedMovies": _downloadedMovies,

      });
    } catch (e) {
      print("error found:${e.toString()}");
    }
  }

  Future<void> setFavoriteMovies() async{

    try {
      await _db.collection('user').doc(_uid).update({
        "favoriteMovies": _favoriteMovies,

      });
    } catch (e) {
      print("error found:${e.toString()}");
    }
  }

  Future<void> setSavedMovies() async{
    print(_uid+"1");
    try {
      await _db.collection('user').doc(_uid).update({
        "savedMovies": _savedMovies,
      });
    } catch (e) {
      print("error found:${e.toString()}");
    }
  }


  Future<void> signUpUser() async {
    try {
      await _db.collection('user').doc(_uid).set({
        "username": _userName,
        "email": _email,
        "phoneNum": _phoneNum,
        "image": _image,
        "sub": _sub,
        "subDuration": _subDuration,
        "numOfDown": _numOfDown,
        "favoriteMovies": _favoriteMovies,
        "savedMovies": _savedMovies,
        "watchHours": _watchHours,
        "downloadedMovies": _downloadedMovies,

      });
    } catch (e) {
      print("error found:${e.toString()}");
    }
  }

  Future<void> manageUserDetails(String username,String email,String number,String img)async{
    try {
      await _db.collection('user').doc(_uid).update({
        "username": _userName,
        "email": _email,
        "phoneNum": _phoneNum,
        "image": _image
      });
    } catch (e) {
      print("error found:${e.toString()}");
    }

  }
}
