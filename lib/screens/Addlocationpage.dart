import 'package:flutter/material.dart';
import 'package:zeal/controller/admincontroller.dart';

class Locationadd extends StatefulWidget {
  const Locationadd({
    super.key,
    required this.location,
    required this.userindex,
  });

  final TextEditingController location;
  final int? userindex;

  @override
  State<Locationadd> createState() => _LocationaddState();
}

class _LocationaddState extends State<Locationadd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Add Location',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              hintText: 'List Of Locations',
              border: OutlineInputBorder(),
            ),
            items: <String>[
              'Alappuzha',
              'Ernakulam',
              'Idukki',
              'Kannur',
              'Kasaragod',
              'Kollam',
              'Kottayam',
              'Kozhikode',
              'Malappuram',
              'Palakkad',
              'Pathanamthitta',
              'Thiruvananthapuram',
              'Thrissur',
              'Wayanad',
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              widget.location.text = newValue!;
            },
          ),
          SizedBox(height: 35),
          Center(
            child: Container(
              height: 50,
              width: 175,
              decoration: BoxDecoration(
                color: const Color(0xff0B8FAC),
                borderRadius: BorderRadius.circular(6),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);

                  if (widget.userindex != null) {
                    addmoreLocation(
                        context: context,
                        userindex: widget.userindex!,
                        location: widget.location.text);
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
        ]),
      ),
    );
  }
}
