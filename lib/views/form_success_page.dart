import 'package:flutter/material.dart';
import 'package:register_form/model/form_model.dart';

class FormSuccessPage extends StatelessWidget {
  final FormModel formModel;
  const FormSuccessPage({super.key, required this.formModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Success'),
      ),
      body: Container(
        color: const Color(0xffF3F0FA),
        child: ListView(
          children: [
            Card(
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.tag_faces, color: Colors.green),
                        Text(
                          'Hello!',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ],
                    ),
                    labelText('Name: ${formModel.name}'),
                    labelText('Address: ${formModel.address}'),
                    labelText('Phone: ${formModel.phone}'),
                    labelText('Email: ${formModel.email}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text labelText(String label) {
    return Text(
      label,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
