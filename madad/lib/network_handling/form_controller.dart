import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../model/form_model.dart';


class FormController {
  // Callback function to give response of status of current request.
  //final void Function(String) callback;

  // Google App Script Web URL
  static const String URL = "https://script.google.com/macros/s/AKfycbyqMVeC1aVDma_wAKS6l-67o8dPgUsQ30IIs8rBMMWtXF2QUe_Gz3o7LjATJlEnhD5z/exec";

  static const STATUS_SUCCESS = "SUCCESS";

 // FormController(this.callback);

  void submitForm(
      FormModel formModel, void Function(String) callback) async {
    try {
      await http.post(URL, body: formModel.toJson()).then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          await http.get(url).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      print(e);
    }}

  Future<List<FormModel>> getFormList() async {
    return await http.get(URL).then((response) {
      print(convert.jsonDecode(response.body));
      var jsonForm = convert.jsonDecode(response.body) as List;
      return jsonForm.map((json) => FormModel.fromJson(json)).toList();
    });
  }
}