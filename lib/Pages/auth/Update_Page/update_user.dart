import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pages/Home/home_page.dart';
import 'package:flutter_application_2/Pages/Services/Cache/sheredPrafrences.dart';
import 'package:flutter_application_2/Pages/Services/api.dart';

class UpdateUserPage extends StatefulWidget {
  @override
  _UpdateUserPageState createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _passController,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Call the updateUser function with a specific user ID
                _updateUser('1');
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (_) =>
                        HomePage())); // Replace '1' with the actual user ID
              },
              child: Text('Update User'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _updateUser(String id) async {
    await CacheData.setData(key: 'UserName', value: _nameController.text);
    await CacheData.setData(key: 'Password', value: _passController.text);
    await CacheData.setData(key: 'Email', value: _emailController.text);

    await Api2.updateUser(id, {
      'UserName': _nameController.text,
      'Password': _passController.text,
      'Email': _emailController.text
    });
  }
}
