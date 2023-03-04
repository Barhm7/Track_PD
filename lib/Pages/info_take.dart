import 'package:flutter/material.dart';
import 'package:new_fluttter/Pages/HomePage.dart';
import 'package:new_fluttter/componets/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_fluttter/componets/fieled.dart';

class InfoTake extends StatefulWidget {
  const InfoTake({super.key});

  @override
  State<InfoTake> createState() => _InfoTakeState();
}

class _InfoTakeState extends State<InfoTake> {
  final _formKey = GlobalKey<FormState>();
  final _formData = <String, dynamic>{};
  late String _gender = "";
  late String Tremor = "";
  late String Bradykinesia = "";
  late String Dyskinesia = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Information'),
      ),
      backgroundColor: const Color.fromARGB(255, 223, 221, 218),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyTextfield(
              labelText: 'Name',
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 30.0),
            const MyTextfield(
              labelText: 'Age',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30.0),
            const MyTextfield(
              labelText: 'Weight (kg)',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30.0),
            const MyTextfield(
              labelText: 'Height (cm)',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30.0),
            const MyTextfield(
              labelText: 'PD duration',
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 30.0),
            Row(
              children: [
                const Text('Gender'),
                Expanded(
                  child: SizedBox(
                    height: 60.0,
                    child: ListTile(
                      title: const Text('Male'),
                      leading: Radio(
                        value: 'male',
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 60.0,
                    child: ListTile(
                      title: const Text('Female'),
                      leading: Radio(
                        value: 'female',
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            const Divider(
              color: Colors.black,
            ),
            const SizedBox(height: 15.0),
            const Text('Tremor check'),
            ListTile(
              title: const Text("yes"),
              leading: Radio(
                value: "yes",
                groupValue: Tremor,
                onChanged: (value) {
                  setState(() {
                    Tremor = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text("no"),
              leading: Radio(
                value: "no",
                groupValue: Tremor,
                onChanged: (value) {
                  setState(() {
                    Tremor = value!;
                  });
                },
              ),
            ),
            const SizedBox(height: 10.0),
            const Divider(
              color: Colors.black,
            ),
            const SizedBox(height: 15.0),
            const Text('Bradykinesia check'),
            const SizedBox(height: 16.0),
            ListTile(
              title: const Text("yes"),
              leading: Radio(
                value: "yes",
                groupValue: Bradykinesia,
                onChanged: (value) {
                  setState(() {
                    Bradykinesia = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text("no"),
              leading: Radio(
                value: "no",
                groupValue: Bradykinesia,
                onChanged: (value) {
                  setState(() {
                    Bradykinesia = value!;
                  });
                },
              ),
            ),
            const SizedBox(height: 15.0),
            const Divider(
              color: Colors.black,
            ),
            const SizedBox(height: 15.0),
            const Text('Dyskinesia check'),
            const SizedBox(height: 16.0),
            ListTile(
              title: const Text("yes"),
              leading: Radio(
                value: "yes",
                groupValue: Dyskinesia,
                onChanged: (value) {
                  setState(() {
                    Dyskinesia = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text("no"),
              leading: Radio(
                value: "no",
                groupValue: Dyskinesia,
                onChanged: (value) {
                  setState(() {
                    Dyskinesia = value!;
                  });
                },
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
