// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/constants.dart';

class EditProductForm extends StatefulWidget {
  const EditProductForm({super.key});

  @override
  State<EditProductForm> createState() => _EditProductFormState();
}

class _EditProductFormState extends State<EditProductForm> {
  // ignore: unused_field
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(
          'Item Details can be edited and updated here',
          style: headerStyle.copyWith(fontSize: 32),
        ),
      ),
    );
    // return Form(
    //   key: _formkey,
    //   child: const Column(),
    // );
  }
}
