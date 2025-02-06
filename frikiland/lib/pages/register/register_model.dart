import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'register_widget.dart' show RegisterWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterModel extends FlutterFlowModel<RegisterWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for txtpass1 widget.
  FocusNode? txtpass1FocusNode;
  TextEditingController? txtpass1TextController;
  late bool txtpass1Visibility;
  String? Function(BuildContext, String?)? txtpass1TextControllerValidator;

  @override
  void initState(BuildContext context) {
    txtpass1Visibility = false;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    emailTextController?.dispose();

    txtpass1FocusNode?.dispose();
    txtpass1TextController?.dispose();
  }
}
