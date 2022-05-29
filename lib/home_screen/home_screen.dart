import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'components/input_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Santhe'),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 24.0,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32.0),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    InputField(
                      labelText: 'Enter Phone',
                      inputType: TextInputType.phone,
                    ),
                    SizedBox(height: 16.0),
                    InputField(
                      labelText: 'Enter Address',
                      inputType: TextInputType.text,
                    ),
                    SizedBox(height: 24.0),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text('Get Agency'),
                      ),
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
