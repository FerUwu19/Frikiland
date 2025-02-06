import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'products_widget.dart' show ProductsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductsModel extends FlutterFlowModel<ProductsWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> categoriaDrop = [];
  void addToCategoriaDrop(DocumentReference item) => categoriaDrop.add(item);
  void removeFromCategoriaDrop(DocumentReference item) =>
      categoriaDrop.remove(item);
  void removeAtIndexFromCategoriaDrop(int index) =>
      categoriaDrop.removeAt(index);
  void insertAtIndexInCategoriaDrop(int index, DocumentReference item) =>
      categoriaDrop.insert(index, item);
  void updateCategoriaDropAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      categoriaDrop[index] = updateFn(categoriaDrop[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for ddCategoria widget.
  String? ddCategoriaValue;
  FormFieldController<String>? ddCategoriaValueController;
  // Stores action output result for [Custom Action - getDocRefFromID] action in ddCategoria widget.
  DocumentReference? filterBy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
