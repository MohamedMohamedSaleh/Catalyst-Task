import 'package:catalyst_task/core/widgets/custom_app_bar_widget.dart';
import 'package:catalyst_task/features/properties/models/property_model.dart';
import 'package:flutter/material.dart';

class PropertyDetailsView extends StatelessWidget {
  const PropertyDetailsView({super.key, required this.propertyModel});
  final PropertyModel propertyModel;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarWidget(
        title: "Property Details",
      ),
    );
  }
}
