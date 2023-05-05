// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String SearchFormInputValueKey = 'searchFormInput';

final Map<String, TextEditingController>
    _FoodCatalogViewTextEditingControllers = {};

final Map<String, FocusNode> _FoodCatalogViewFocusNodes = {};

final Map<String, String? Function(String?)?> _FoodCatalogViewTextValidations =
    {
  SearchFormInputValueKey: null,
};

mixin $FoodCatalogView {
  TextEditingController get searchFormInputController =>
      _getFormTextEditingController(SearchFormInputValueKey);
  FocusNode get searchFormInputFocusNode =>
      _getFormFocusNode(SearchFormInputValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_FoodCatalogViewTextEditingControllers.containsKey(key)) {
      return _FoodCatalogViewTextEditingControllers[key]!;
    }

    _FoodCatalogViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _FoodCatalogViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_FoodCatalogViewFocusNodes.containsKey(key)) {
      return _FoodCatalogViewFocusNodes[key]!;
    }
    _FoodCatalogViewFocusNodes[key] = FocusNode();
    return _FoodCatalogViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    searchFormInputController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    searchFormInputController.addListener(() => _updateFormData(model));
  }

  static const bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          SearchFormInputValueKey: searchFormInputController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _FoodCatalogViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _FoodCatalogViewFocusNodes.values) {
      focusNode.dispose();
    }

    _FoodCatalogViewTextEditingControllers.clear();
    _FoodCatalogViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get searchFormInputValue =>
      this.formValueMap[SearchFormInputValueKey] as String?;

  set searchFormInputValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          SearchFormInputValueKey: value,
        }),
    );

    if (_FoodCatalogViewTextEditingControllers.containsKey(
        SearchFormInputValueKey)) {
      _FoodCatalogViewTextEditingControllers[SearchFormInputValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasSearchFormInput =>
      this.formValueMap.containsKey(SearchFormInputValueKey) &&
      (searchFormInputValue?.isNotEmpty ?? false);

  bool get hasSearchFormInputValidationMessage =>
      this.fieldsValidationMessages[SearchFormInputValueKey]?.isNotEmpty ??
      false;

  String? get searchFormInputValidationMessage =>
      this.fieldsValidationMessages[SearchFormInputValueKey];
}

extension Methods on FormViewModel {
  setSearchFormInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[SearchFormInputValueKey] =
          validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    searchFormInputValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      SearchFormInputValueKey: getValidationMessage(SearchFormInputValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _FoodCatalogViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _FoodCatalogViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormViewModel model) => model.setValidationMessages({
      SearchFormInputValueKey: getValidationMessage(SearchFormInputValueKey),
    });
