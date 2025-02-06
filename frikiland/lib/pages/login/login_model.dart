import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for txtUser widget.
  FocusNode? txtUserFocusNode;
  TextEditingController? txtUserTextController;
  String? Function(BuildContext, String?)? txtUserTextControllerValidator;
  // State field(s) for txtPass widget.
  FocusNode? txtPassFocusNode;
  TextEditingController? txtPassTextController;
  late bool txtPassVisibility;
  String? Function(BuildContext, String?)? txtPassTextControllerValidator;

  @override
  void initState(BuildContext context) {
    txtPassVisibility = false;
  }

  @override
  void dispose() {
    txtUserFocusNode?.dispose();
    txtUserTextController?.dispose();

    txtPassFocusNode?.dispose();
    txtPassTextController?.dispose();
  }
}
