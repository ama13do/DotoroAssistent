import '/flutter_flow/flutter_flow_util.dart';
import 'assistant_widget.dart' show AssistantWidget;
import 'package:flutter/material.dart';

class AssistantModel extends FlutterFlowModel<AssistantWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();
  }
}
