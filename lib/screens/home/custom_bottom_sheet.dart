import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CustomBottomSheet {


  Widget buildForm ({required context, required GlobalKey<FormState> formKey});
  save({required cubit, required GlobalKey<FormState> formKey, required context});
}