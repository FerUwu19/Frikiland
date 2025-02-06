import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'index_widget.dart' show IndexWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class IndexModel extends FlutterFlowModel<IndexWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for txtMessage widget.
  FocusNode? txtMessageFocusNode;
  TextEditingController? txtMessageTextController;
  String? Function(BuildContext, String?)? txtMessageTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtMessageFocusNode?.dispose();
    txtMessageTextController?.dispose();
  }
}
