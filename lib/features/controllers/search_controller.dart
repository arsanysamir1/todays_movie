
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../modules/movies.dart';

class Searchcontroller extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxString search = "".obs;
  List searchMovies = [].obs;
  void clear(){
    searchMovies.clear();
    search.value="";
    searchController.text="";
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    search.value = searchController.text;
    searchController.addListener(() {
      search.value = searchController.text;
    });
    ever(
      search,
      (_) => updateSearchText(),

    );
  }

  void updateSearchText() {
    searchMovies.assignAll(
      Movies.movies
          .where((element) => element.containsName(search.value))
          .toList(),
    );
  }

  @override
  void onClose() {
    searchController
        .dispose(); // Always dispose controllers to prevent memory leaks
    super.onClose();
  }
}
