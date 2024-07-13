import 'package:bloc_clean_architecture/src/comman/constant.dart';
import 'package:bloc_clean_architecture/src/utilities/debouncer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';

enum TextFieldType { alphabet, email, text, password, phoneNumber, number }

class CustomTextFormField extends StatelessWidget {
  final _debouncer = Debouncer(milliseconds: 500);

  CustomTextFormField({
    Key? key,
    this.controller,
    this.textFieldType = TextFieldType.text,
    this.hintText,
    this.helperText,
    this.onChanged,
    this.maxLength,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.maxLines = 1,
    this.helperMaxLines,
    this.textAlign = TextAlign.left,
    this.inputFormatters,
    this.enabled = true,
    this.textInputAction,
    this.textInputType,
    this.minLength = 1,
    this.minline = 1,
  }) : super(key: key);

  final TextEditingController? controller;
  final TextFieldType textFieldType;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final int? maxLines;
  final int? helperMaxLines;
  final int? maxLength;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int minLength;
  final int minline;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final alphabetValidator = MultiValidator([
      RequiredValidator(
        errorText: 'Please enter a value',
      ),
      PatternValidator(
        r'^[A-Za-z_ .,]+$',
        errorText: 'Invalid data format',
      ),
    ]);

    final emailValidator = MultiValidator([
      RequiredValidator(
        errorText: 'Please enter your email address',
      ),
      EmailValidator(
        errorText: 'Invalid email address format',
      )
    ]);

    final passwordValidator = MultiValidator([
      RequiredValidator(
        errorText: 'Please enter your password',
      ),
      MinLengthValidator(
        6,
        errorText: 'Password must be more than 6 characters',
      )
    ]);

    final phoneNumberValidator = MultiValidator([
      RequiredValidator(
        errorText: 'Please enter your phone number',
      ),
      MinLengthValidator(
        7,
        errorText: 'Invalid phone number format',
      ),
      PatternValidator(
        r'^[0-9]+$',
        errorText: 'Invalid phone number format',
      ),
    ]);

    final textValidator = MultiValidator([
      RequiredValidator(
        errorText: 'Please enter a value',
      ),
      MinLengthValidator(
        minLength,
        errorText: 'Data is too short',
      ),
    ]);

    final numberValidator = MultiValidator([
      RequiredValidator(
        errorText: 'Please enter a value',
      ),
      MinLengthValidator(
        1,
        errorText: 'Data is too short',
      ),
      PatternValidator(
        r'^[0-9]+$',
        errorText: 'Invalid number format',
      ),
    ]);

    TextInputType keyboardType(TextFieldType textFieldType) {
      switch (textFieldType) {
        case TextFieldType.alphabet:
          return TextInputType.text;
        case TextFieldType.email:
          return TextInputType.emailAddress;
        case TextFieldType.number:
          return TextInputType.number;
        case TextFieldType.password:
          return TextInputType.text;
        case TextFieldType.phoneNumber:
          return TextInputType.phone;
        case TextFieldType.text:
          return TextInputType.text;
      }
    }

    MultiValidator validator(TextFieldType textFieldType) {
      switch (textFieldType) {
        case TextFieldType.alphabet:
          return alphabetValidator;
        case TextFieldType.email:
          return emailValidator;
        case TextFieldType.number:
          return numberValidator;
        case TextFieldType.password:
          return passwordValidator;
        case TextFieldType.phoneNumber:
          return phoneNumberValidator;
        case TextFieldType.text:
          return textValidator;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        maxLength: maxLength,
        enabled: enabled,
        onChanged: (text) => _debouncer.run(() {
          onChanged!(text);
        }),
        textAlign: textAlign ?? TextAlign.left,
        obscureText: obscureText ?? false,
        style: theme.textTheme.bodyMedium,
        inputFormatters: inputFormatters ?? [],
        keyboardType: textInputType ?? keyboardType(textFieldType),
        validator: validator(textFieldType),
        textInputAction: textInputAction,
        minLines: minline,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: theme.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.w300, color: Colors.grey),
          labelText: labelText,
          labelStyle: theme.textTheme.displayMedium,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          helperMaxLines: helperMaxLines,
          helperText: helperText,
          helperStyle: theme.textTheme.bodyMedium?.copyWith(fontSize: 10),
          contentPadding: const EdgeInsets.symmetric(horizontal: SPACE12),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(RADIUS),
            borderSide: BorderSide(color: theme.disabledColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(RADIUS),
            borderSide: BorderSide(color: theme.primaryColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(RADIUS),
            borderSide: BorderSide(color: theme.colorScheme.error),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(RADIUS),
            borderSide: BorderSide(color: theme.colorScheme.error),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(RADIUS),
            borderSide: BorderSide(color: theme.disabledColor),
          ),
        ),
      ),
    );
  }
}
