import 'package:flutter/material.dart';
import 'package:new_fluttter/Pages/HomePage.dart';
import 'package:new_fluttter/componets/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_fluttter/componets/fieled.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_fluttter/Pages/activity.dart';

class InfoTake extends StatefulWidget {
  const InfoTake({super.key});

  @override
  State<InfoTake> createState() => _InfoTakeState();
}

class _InfoTakeState extends State<InfoTake> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  String? _gender;
  String? Tremor;
  String? Bradykinesia;
  String? Dyskinesia;
  String? _name;
  int? _age;
  double? _weight;
  double? _height;
  String? PD_duration;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Information'),
      ),
      backgroundColor: const Color.fromARGB(255, 223, 221, 218),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextfield(
                labelText: 'Name',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your name';
                  }
                },
                onSaved: (value) {
                  _name = value;
                },
              ),
              const SizedBox(height: 30.0),
              MyTextfield(
                labelText: 'Age',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your age';
                  }
                },
                onSaved: (value) {
                  _age = int.parse(value);
                },
              ),
              const SizedBox(height: 30.0),
              MyTextfield(
                labelText: 'Weight (kg)',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your weight';
                  }
                },
                onSaved: (value) {
                  _weight = double.parse(value);
                },
              ),
              const SizedBox(height: 30.0),
              MyTextfield(
                labelText: 'Height (cm)',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your height';
                  }
                },
                onSaved: (value) {
                  _height = double.parse(value);
                },
              ),
              const SizedBox(height: 30.0),
              MyTextfield(
                labelText: 'PD duration',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your PD duration';
                  }
                },
                onSaved: (value) {
                  PD_duration = (value);
                },
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
              Row(
                children: [
                  const Text('Tremor check'),
                  Expanded(
                    child: SizedBox(
                      height: 60.0,
                      child: ListTile(
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
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: ListTile(
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
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(height: 15.0),
              Row(
                children: [
                  const Text('Bradykinesia check'),
                  const SizedBox(height: 16.0),
                  Expanded(
                    child: SizedBox(
                      height: 60.0,
                      child: ListTile(
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
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 60.0,
                      child: ListTile(
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
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(height: 15.0),
              Row(
                children: [
                  const Text('Dyskinesia check'),
                  const SizedBox(height: 16.0),
                  Expanded(
                    child: SizedBox(
                      height: 60.0,
                      child: ListTile(
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
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 60.0,
                      child: ListTile(
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
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      await _db.collection('users').add({
                        'name': _name,
                        'age': _age,
                        'height': _height,
                        'weight': _weight,
                        'PD duration': PD_duration,
                        'gender': _gender,
                        'Tremor': Tremor,
                        'Bradykinesia': Bradykinesia,
                        'Dyskinesia': Dyskinesia
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('User information saved'),
                        ),
                      );
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ActivityRecognitionApp()),
                    );
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
