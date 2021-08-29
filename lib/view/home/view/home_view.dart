import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../widget/background_widget.dart';
import '../model/home_model.dart';
import '../viewModel/home_view_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (HomeViewModel model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, HomeViewModel viewModel) => buildScaffold(context, viewModel),
    );
  }

  Scaffold buildScaffold(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
        backgroundColor: context.colors.background,
        appBar: AppBar(
          title: Text("Kullanıcılar"),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                NavigationService.instance.navigateToPage(path: "/profile");
              },
            ),
          ],
        ),
        body: Background(
          child: buildUserList(
            context,
            viewModel,
          ),
        ));
  }

  Widget buildUserList(BuildContext context, HomeViewModel viewModel) {
    return Observer(builder: (_) {
      return viewModel.isLoading ? buildCircularProgress(context) : getUsers(viewModel);
    });
  }

  Widget getUsers(HomeViewModel viewModel) {
    return ListView.builder(
      itemCount: viewModel.listData!.length,
      itemBuilder: (context, index) {
        final user = viewModel.listData![index];
        return buildUser(user, context, viewModel, index);
      },
    );
  }

  Widget buildUser(Data user, BuildContext context, HomeViewModel viewModel, int index) {
    return GestureDetector(
      onTap: () {
        viewModel.userIdChange(user.id!);
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(user.profilePhoto!),
        ),
        title: Text(user.fullName!),
        trailing: buildAddButton(context, viewModel, user.id!, index),
        subtitle: Text(user.email!),
      ),
    );
  }

  Widget buildAddButton(BuildContext context, HomeViewModel viewModel, String id, int index) {
    return Observer(builder: (_) {
      return TextButton.icon(
        onPressed: () {
          viewModel.addToFriend(id);
        },
        icon: Icon(Icons.add),
        label: Text("Ekle"),
        style: TextButton.styleFrom(
          primary: context.colors.primaryVariant,
          backgroundColor: context.colors.primary,
        ),
      );
    });
  }

  Center buildCircularProgress(BuildContext context) =>
      Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(context.colors.primary)));
}
