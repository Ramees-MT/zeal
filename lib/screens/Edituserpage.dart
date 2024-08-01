import 'package:flutter/material.dart';
import 'package:zeal/controller/admincontroller.dart';
import 'package:zeal/screens/Addlocationpage.dart';
import 'package:zeal/widgets/Textfieldwidget.dart';

class Edit extends StatelessWidget {
  Edit({super.key, this.index, required this.isadd});
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController location = TextEditingController();
  int? index;
  final bool isadd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'Add/Edit User',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('   User name'),
              Textfieldwidget(
                controller: username,
                text: 'Add username',
              ),
              Text('   User Email'),
              Textfieldwidget(
                controller: email,
                text: 'Add user email',
              ),
              Text('   User Location'),
              Textfieldwidget(
                controller: location,
                text: 'Add user Location',
                iconButton: IconButton(
                  icon: Icon(Icons.open_in_new),
                  onPressed: () {
                    print(index);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Locationadd(
                            location: location,
                            userindex: index,
                          ),
                        ));
                  },
                ),
              ),
              SizedBox(height: 35),
              Center(
                child: Container(
                  height: 60,
                  width: 255,
                  decoration: BoxDecoration(
                    color: const Color(0xff0B8FAC),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (isadd) {
                        adddetails(details: {
                          'username': username.text,
                          'email': email.text,
                          'location': [location.text]
                        }, context: context);
                      } else {
                        editdetails(
                            context: context,
                            edituser: {
                              'username': username.text,
                              'email': email.text,
                            },
                            index: index ?? 0);
                      }
                      totalLOcation();
                    },
                    child: const Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
