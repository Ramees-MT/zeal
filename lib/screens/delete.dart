import 'package:flutter/material.dart';
import 'package:zeal/screens/userslist.dart';

class Delete extends StatelessWidget {
  const Delete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Center(child: Image.asset('asset/images/failed.png')),
            ),SizedBox(height: 40,),
            Text(
              'User Deleted',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffA61A22),
                  fontSize: 25),
            ),
            SizedBox(height: 85),
            Container(
              height: 60,
              width: 265,
              decoration: BoxDecoration(
                color: const Color(0xffA61A22),
                borderRadius: BorderRadius.circular(0.4),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Userlist(),
                    ),
                  );
                },
                child: Text("Back", style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xffA61A22),
                  minimumSize: Size(80, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
