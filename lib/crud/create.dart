import 'package:flutter/material.dart';
import 'package:praktikum_pertemuan_9/crud/crud.dart';

class Create extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'phone'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                // Add data and go back to the main screen
                await CrudService.addData(nameController.text,
                    emailController.text, phoneController.text);
                Navigator.pop(context);
              },
              child: Text('Add Data'),
            ),
          ],
        ),
      ),
    );
  }
}
