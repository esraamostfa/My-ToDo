import 'package:flutter/src/widgets/form.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import '../../home/custom_bottom_sheet.dart';

class AddGoalBottomSheet extends CustomBottomSheet {
  @override
  Widget buildForm({required context, required GlobalKey<FormState> formKey}) {
    return Text('new goal');
  }

  @override
  save({required cubit, required GlobalKey<FormState> formKey, required context}) {
   print('save new goal');
  }


}