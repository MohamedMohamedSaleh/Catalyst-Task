import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

import '../../../../core/constants/my_colors.dart';
import '../../../../core/widgets/shimar_loading_widget.dart';
import '../../logic/cubit/property_cubit.dart';
import '../widgets/custom_property_widget.dart';

class PropertiesView extends StatefulWidget {
  const PropertiesView({super.key});

  @override
  State<PropertiesView> createState() => _PropertiesViewState();
}

class _PropertiesViewState extends State<PropertiesView> {
  final propertiesCubit = KiwiContainer().resolve<PropertyCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder(
            bloc: propertiesCubit,
            builder: (context, state) {
              if (state is PropertyLoaded) {
                return RefreshIndicator(
                  onRefresh: () => propertiesCubit.showProperties(),
                  color: MyColors.whiteColor,
                  backgroundColor: MyColors.buttonColor,
                  displacement: 20,
                  child: GridView.builder(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemBuilder: (context, index) {
                      return CustomPropertyItemWidget(
                        property: state.list[index],
                      );
                    },
                    itemCount: state.list.length,
                  ),
                );
              }
              return propertiesLoadingWidget();
            }));
  }
}
