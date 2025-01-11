
import 'package:catalyst_task/core/helpers/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';

import '../../../../core/widgets/shimar_loading_widget.dart';
import '../../logic/cubit/users_cubit.dart';
import '../widgets/custom_category_button_widget.dart';
import '../widgets/user_item_widget.dart';

class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  late final UsersCubit usersCubit;
  String type = "all";
  @override
  void initState() {
    usersCubit = KiwiContainer().resolve<UsersCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer(
        listener: (context, state) {
          if (state is ShowUsersError) {
            showMessage(message: state.message, type: MessageType.faild);
          }
        },
        buildWhen: (previous, current) {
          return current is ShowUsersSuccess ||
              current is ShowUsersError ||
              current is ShowUsersLoading;
        },
        bloc: usersCubit,
        builder: (context, state) {
          if (state is ShowUsersSuccess) {
            final allUsers = state.list;
            final ownerUsers = state.ownerList;
            final adminUsers = state.adminList;
            final clientUsers = state.clientList;
            return NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  title: Row(
                    children: [
                      CustomCategorButtonWidget(
                        key: const ValueKey("all"),
                        onTap: () => setState(() => type = "all"),
                        isSelected: type == "all",
                        title: "All",
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      CustomCategorButtonWidget(
                        key: const ValueKey("admin"),
                        onTap: () => setState(() => type = "admin"),
                        isSelected: type == "admin",
                        title: "Admin",
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      CustomCategorButtonWidget(
                        onTap: () => setState(() => type = "owner"),
                        isSelected: type == "owner",
                        title: "Owner",
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      CustomCategorButtonWidget(
                        onTap: () => setState(() => type = "client"),
                        isSelected: type == "client",
                        title: "Client",
                      ),
                    ],
                  ),
                  floating: true,
                  snap: true,
                  backgroundColor: Colors.white,
                  elevation: 0,
                ),
              ],
              floatHeaderSlivers: true,
              body: ListView.builder(
                padding: EdgeInsets.only(
                  bottom: 16.h,
                ),
                itemBuilder: (context, index) => UserItemWidget(
                  model: type == "all"
                      ? allUsers[index]
                      : type == "owner"
                          ? ownerUsers[index]
                          : type == "admin"
                              ? adminUsers[index]
                              : clientUsers[index],
                ),
                itemCount: type == "all"
                    ? allUsers.length
                    : type == "owner"
                        ? ownerUsers.length
                        : type == "admin"
                            ? adminUsers.length
                            : clientUsers.length,
              ),
            );
          } else {
            return usersLoadingWidget();
          }
        },
      ),
    );
  }
}
