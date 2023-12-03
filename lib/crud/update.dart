import 'package:flutter/material.dart';
import 'package:praktikum_pertemuan_9/crud/crud.dart';

class UpdateView extends StatefulWidget {
  final Map<String, dynamic>? data;

  UpdateView(this.data);

  @override
  _UpdateViewState createState() => _UpdateViewState();
}

class _UpdateViewState extends State<UpdateView> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.data?['name']);
    emailController = TextEditingController(text: widget.data?['email']);
    phoneController = TextEditingController(text: widget.data?['phone']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Data'),
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
                print('Updating data...');
                print('id: ${widget.data?['id']}');
                print('Name: ${nameController.text}');
                print('Email: ${emailController.text}');
                print('Phone: ${phoneController.text}');
                // Update data and go back to the main screen
                await CrudService.updateData(
                    widget.data?['id'],
                    nameController.text,
                    emailController.text,
                    phoneController.text);
                Navigator.pop(context);
                ;
              },
              child: Text('Update Data'),
            ),
          ],
        ),
      ),
    );
  }
}
