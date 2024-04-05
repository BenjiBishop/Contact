import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var url = Uri.parse("http://192.168.1.29:3001/contact");
Future<List<dynamic>> getContact() async {
  var reponse = await http.get(url);
  if (reponse.statusCode == 200) {
    final List<dynamic> data = json.decode(reponse.body);
    return data;
  } else {
    return <dynamic>[];
  }
}

Future<bool> postContact(data) async {
  var reponse = await http.post(url,
      body: json.encode({
        "nom": data[0],
        "prenom": data[1],
        "email": data[2],
        "numero": data[3],
      }),
      headers: {'Content-type': 'application/json'});
  if (kDebugMode) {
    print("le status code de la reponse est : ${reponse.statusCode}");
  }

  if (reponse.statusCode == 201) {
    return true;
  } else {
    return false;
  }
}

Future deleleContact(String id) async {
  var url = Uri.parse("http://192.168.1.29:3001/contact/$id");
  var reponse = await http.delete(url);
  if (reponse.statusCode == 200) {
    print('contact supprimer');
  } else {
    throw Exception('Erreur dans la suppression');
  }
}
