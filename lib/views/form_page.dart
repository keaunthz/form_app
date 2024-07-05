import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:register_form/controller/form_controller.dart';
import 'package:register_form/model/form_model.dart';
import 'package:register_form/views/form_success_page.dart';
import 'package:register_form/widgets/card_text_field.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key, required this.title});

  final String title;

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final FormController formController = FormController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        color: const Color(0xffF3F0FA),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  CardTextField(
                    controller: formController.nameController,
                    labelText: 'Full name',
                    hintText: 'Name',
                    validator: formController.validateName,
                    textInputAction: TextInputAction.next,
                  ),
                  CardTextField(
                    controller: formController.addressController,
                    labelText: 'Address',
                    hintText: 'Address',
                    validator: formController.validateAddress,
                    textInputAction: TextInputAction.next,
                    isMultiLine: true,
                  ),
                  CardTextField(
                    controller: formController.phoneController,
                    labelText: 'Phone number',
                    hintText: 'Phone number',
                    validator: formController.validatePhone,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                  ),
                  CardTextField(
                    controller: formController.emailController,
                    labelText: 'Email address',
                    hintText: 'Your email',
                    validator: formController.validateEmail,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF8052C6)),
                      onPressed: () {
                        FocusManager.instance.primaryFocus!.unfocus();
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Row(
                              children: [
                                Icon(Icons.check_circle, color: Colors.green),
                                Text('Success!'),
                              ],
                            )),
                          );

                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => FormSuccessPage(
                                formModel: FormModel(
                                  name:
                                      formController.nameController.text.trim(),
                                  address: formController.addressController.text
                                      .trim(),
                                  phone: formController.phoneController.text
                                      .trim(),
                                  email: formController.emailController.text
                                      .trim(),
                                ),
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
