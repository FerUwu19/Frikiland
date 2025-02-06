import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? whatsappString(String? uri) {
  if (uri != null) {
    var encoded = Uri.encodeFull(uri);
    return encoded;
  } else {
    return null;
  }
}

double restarSubtotal(
  double valorsubtotal,
  double precio,
) {
  if (valorsubtotal > 0) {
    valorsubtotal = valorsubtotal - precio;
  }
  return valorsubtotal;
}

double sumarSubtotal(
  double valorsubtotal,
  double precio,
) {
  valorsubtotal = valorsubtotal + precio;
  return valorsubtotal;
}

double totalList(List<double> subTotal) {
  double total = 0;
  for (double add in subTotal) {
    total += add;
  }
  return total;
}

double totalFinal(List<double> subTotal) {
  double total = 0;
  for (double add in subTotal) {
    total += add;
  }
  return total + 1500;
}

double calcularSubtotal(
  double precio,
  int cantidad,
) {
  return precio * cantidad;
}
