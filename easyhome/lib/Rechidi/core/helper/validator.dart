import 'package:freezed_annotation/freezed_annotation.dart';

part 'validator.freezed.dart';

@freezed
abstract class ValidationResult with _$ValidationResult {
  const factory ValidationResult.valid() = ValidResult;
  const factory ValidationResult.invalid(String message) = InvalidResult;
}

extension Validator on String {
  ValidationResult isEmail() {
    if (isEmpty) {
      return const ValidationResult.invalid('Email is required');
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this)) {
      return const ValidationResult.invalid('Invalid email');
    }
    return const ValidationResult.valid();
  }

  ValidationResult isPassword() {
    if (isEmpty) {
      return const ValidationResult.invalid('Password is required');
    }
    if (length < 6) {
      return const ValidationResult.invalid(
          'Password must be at least 6 characters');
    }
    return const ValidationResult.valid();
  }

  ValidationResult isName() {
    if (isEmpty) {
      return const ValidationResult.invalid('Name is required');
    }
    if (length < 3) {
      return const ValidationResult.invalid(
          'Name must be at least 3 characters');
    }
    return const ValidationResult.valid();
  }

  ValidationResult isPhoneNumber() {
    if (isEmpty) {
      return const ValidationResult.invalid('Phone number is required');
    }
    if (!RegExp(r'^\+?[0-9]{10,}$').hasMatch(this)) {
      return const ValidationResult.invalid('Invalid phone number');
    }
    return const ValidationResult.valid();
  }

  ValidationResult isTitle() {
    if (isEmpty) {
      return const ValidationResult.invalid('Title is required');
    }
    if (length < 8) {
      return const ValidationResult.invalid(
          'Title must be at least 8 characters');
    }
    return const ValidationResult.valid();
  }

  ValidationResult isExist() {
    if (isEmpty) {
      return const ValidationResult.invalid('Missing field');
    }
    return const ValidationResult.valid();
  }
}
