import 'package:flutter/material.dart';
import 'package:zeal/controller/admincontroller.dart';
import 'package:zeal/screens/Edituserpage.dart';
import 'package:zeal/screens/delete.dart';
import 'package:zeal/screens/userdetails.dart';

class Userlist extends StatefulWidget {
  const Userlist({super.key, this.userindex});
  final int? userindex;

  @override
  State<Userlist> createState() => _UserlistState();
}

class _UserlistState extends State<Userlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Hi Admin!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xffE8F5F3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No of users: ${Admin.length}', // Or any relevant text
                        style: TextStyle(color: Color(0xff0B8FAC), fontSize: 8),
                      ),
                      ValueListenableBuilder(
                        valueListenable: totalCount,
                        builder: (context, value, child) {
                      return    Text(
                            'Locations: $value ', // Or any relevant text
                            style: TextStyle(
                                color: Color(0xff0B8FAC), fontSize: 8),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Welcome back to your panel.',
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                'Users List',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: Admin.length,
                itemBuilder: (context, index) {
                  return _buildUserCard(context, Admin[index], index);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 80,
        width: 70,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: FloatingActionButton(
          backgroundColor: Color(0xff0B8FAC),
          shape: CircleBorder(),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Edit(
                    isadd: true,
                  ),
                ));
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 45,
          ),
        ),
      ),
    );
  }

  Widget _buildUserCard(BuildContext context, Map Admin, int index) {
    return Card(
      color: Color(0xffE8F5F3),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: IconButton(
          icon: Icon(
            Icons.account_circle_outlined,
            size: 40,
            color: Color(0xff0B8FAC),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailsPage(
                    userindex: index,
                  ),
                ));
          },
        ),
        title: Text(
          Admin['username'],
          style: TextStyle(
            color: Color(0xff0B8FAC),
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(Admin['email']),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.mode_edit_outlined, color: Color(0xff0B8FAC)),
              onPressed: () {
                print(index);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => Edit(
                //       isadd: false,
                //       index: index,
                //     ),
                //   ),
                // );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content:
                          Text("Are you sure you want to delete this user?"),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("NO",
                              style: TextStyle(color: Color(0xff0B8FAC))),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(80, 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              removeDetailsAt(index);
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "YES",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff0B8FAC),
                            minimumSize: Size(80, 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
