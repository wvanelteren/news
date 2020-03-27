import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../models/item_model.dart';

final _root = 'https://hacker-news.firebaseio.com/v0';


class NewsApiProvider {
  Client client = Client();
  
  Future fetchTopIds() async {
    final response = await client.get('$_root/topstories.json');
    final ids = json.decode(response.body);

    return ids;
  }

  Future fetchItem(int id) async {
    final response = await client.get('$_root/item/8863.json');
    final parsedJson = json.decode(response.body);
    
    return ItemModel.fromJson(parsedJson);

  }
}