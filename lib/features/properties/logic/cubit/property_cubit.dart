import 'package:catalyst_task/core/api/dio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/end_ponits.dart';
import '../../models/property_model.dart';

part 'property_state.dart';

class PropertyCubit extends Cubit<PropertyState> {
  final DioService dioService;
  PropertyCubit(this.dioService) : super(PropertyInitial());

  Future<void> showProperties() async {
    emit(PropertyLoading());
    final response = await dioService.get(EndPoints.properties);
    if (response.isSuccess) {
      final List<PropertyModel> propertiesList =
          (response.response!.data as List<dynamic>)
              .map((item) => PropertyModel.fromMap(item))
              .toList();
     
      emit(PropertyLoaded(list: propertiesList));
    }
  }
}
