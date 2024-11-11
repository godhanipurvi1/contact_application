import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:app_contect/porivider/homeprovider.dart';

import '../../model/modelcontect.dart';

class StepperExample_i extends StatefulWidget {
  @override
  _StepperExample_iState createState() => _StepperExample_iState();
}

class _StepperExample_iState extends State<StepperExample_i> {
  // TextControllers for the form inputs
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final contactController = TextEditingController();

  void _showCompletionDialog() {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text("Completed!"),
        actions: [
          CupertinoDialogAction(
            child: Text("OK"),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    Contact newContact = Contact(
      name: nameController.text,
      email: emailController.text,
      contact: contactController.text,
    );
    context.read<ContactsProvider>().addcontect(newContact);
    _showCompletionDialog();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Single-Page Form'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoTextField(
                controller: nameController,
                placeholder: 'Enter your name',
              ),
              SizedBox(height: 16),
              CupertinoTextField(
                controller: emailController,
                placeholder: 'Enter your email',
              ),
              SizedBox(height: 16),
              CupertinoTextField(
                controller: contactController,
                placeholder: 'Enter your contact',
              ),
              SizedBox(height: 20),
              CupertinoButton.filled(
                onPressed: _submitForm,
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
