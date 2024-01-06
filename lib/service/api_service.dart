import 'dart:convert';

import 'package:catfact/model/cats.dart';
import 'package:http/http.dart' as http;


class ApiService{

  List<CatFacts> catList = [];


  Future getCatFacts() async{
    String url = "https://cat-fact.herokuapp.com/facts";
    Uri uri = Uri.parse(url);

    try{
      var response = await http.get(uri);
      List<dynamic> data = jsonDecode(response.body);

     // _catList.clear();
      data.forEach((element) {
        catList.add(CatFacts.fromJson(element));
      });


    }catch(e) {
      print("error:$e");
    }
    print("0 indeksi:${catList[0].text}");

    return catList;

  }

}