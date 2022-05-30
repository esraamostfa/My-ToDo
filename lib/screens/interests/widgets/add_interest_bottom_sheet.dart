import 'package:flutter/src/widgets/form.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:my_todo/screens/home/custom_bottom_sheet.dart';

class AddInterestBottomSheet extends CustomBottomSheet {
  @override
  Widget buildForm({required context, required GlobalKey<FormState> formKey}) {
    return Text('new interest');
  }

  @override
  save({required cubit, required GlobalKey<FormState> formKey, required context}) {
    print('save new interest');
  }

}