import 'dart:convert';
import 'package:http/http.dart' as http;

class CrudService {
  // static final String baseUrl = "http://127.0.0.1/api_flutter/api_flutter/users.php";
  static const String baseUrl = "http://localhost/api_flutter/users.php";

  static Future<List<Map<String, dynamic>>> fetchData() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<void> addData(String name, String email, String phone) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      body: {'name': name, 'email': email, 'phone': phone},
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to add data');
    }
  }

  static Future<void> updateData(
      String id, String nama, String email, String phone) async {
    print('ini data :' + id);
    try {
      final response = await http.put(
        Uri.parse(baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        },
        body: {'id': id, 'name': nama, 'email': email, 'phone': phone},
      );

      if (response.statusCode == 200) {
        // Pembaruan berhasil
        print('Update successful');
      } else {
        // Pembaruan gagal
        print('Failed to update data. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      // Tangkap dan kelola kesalahan
      print('Error updating data: $e');
      throw Exception('Failed to update data');
    }
  }

  static Future<void> deleteData(String id) async {
    final response = await http.delete(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },
      body: {'id': id},
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete data');
    }
  }
}
