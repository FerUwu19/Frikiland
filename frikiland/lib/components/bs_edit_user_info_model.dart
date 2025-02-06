import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'bs_edit_user_info_widget.dart' show BsEditUserInfoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BsEditUserInfoModel extends FlutterFlowModel<BsEditUserInfoWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtFieldname widget.
  FocusNode? txtFieldnameFocusNode;
  TextEditingController? txtFieldnameTextController;
  String? Function(BuildContext, String?)? txtFieldnameTextControllerValidator;
  // State field(s) for txtFieldphone widget.
  FocusNode? txtFieldphoneFocusNode;
  TextEditingController? txtFieldphoneTextController;
  String? Function(BuildContext, String?)? txtFieldphoneTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtFieldnameFocusNode?.dispose();
    txtFieldnameTextController?.dispose();

    txtFieldphoneFocusNode?.dispose();
    txtFieldphoneTextController?.dispose();
  }
}
