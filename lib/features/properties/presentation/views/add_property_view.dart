import 'package:catalyst_task/core/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';

class AddPropertyView extends StatelessWidget {
  const AddPropertyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarWidget(
        title: "Add Property",
      ),
    );
  }
}
