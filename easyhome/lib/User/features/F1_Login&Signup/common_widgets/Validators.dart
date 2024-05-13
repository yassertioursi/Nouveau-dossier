import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class Validators {
  final RegExp regex = RegExp(r'^[a-zA-Z]+$');
  final RegExp regex2 = RegExp(r'^[0-9]+$');
  String Validate_email_signup(String email) {
    if (EmailValidator.validate(email)) {
      return "Valid Email";
    } else
      return "Email not valid";
  }

  String Validate_password_signup(String password) {
    if (password.length < 6) {
      return "At least 6 characters";
    } else {
      return "Valid Password";
    }
  }

  String Validate_phone_number(String nbr) {
    if (nbr.isEmpty ||
        nbr.length != 10 ||
        !nbr.startsWith('0') ||
        !regex2.hasMatch(nbr)) {
      return "Enter a Valid number";
    } else {
      return "Valid Phone-nbr";
    }
  }

  String Validate_name(String name) {
    if (name.isEmpty || !regex.hasMatch(name)) {
      return "Enter a valid name";
    } else {
      return "Vlaid name";
    }
  }
}
