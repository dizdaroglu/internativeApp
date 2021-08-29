import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/cache/locale_manager.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../viewModel/profile_view_model.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
      viewModel: ProfileViewModel(),
      onModelReady: (ProfileViewModel model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, ProfileViewModel viewModel) => buildScaffold(context, viewModel),
    );
  }

  Scaffold buildScaffold(BuildContext context, ProfileViewModel viewModel) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: buildAppBar(context),
      body: buildContainer(context, viewModel),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return buildAlert(context);
              },
            );
          },
        )
      ],
    );
  }

  Widget buildAlert(BuildContext context) {
    return AlertDialog(
      content: Text("Uygulamak çıkmak istediğine emin misin?"),
      actions: [
        TextButton(
          child: Text("Evet"),
          onPressed: () {
            LocaleManager.instance.clearAll();
            NavigationService.instance.navigateToPageClear(path: "/login");
          },
        ),
        TextButton(
            child: Text("Hayır"),
            onPressed: () {
              Navigator.pop(context);
            })
      ],
    );
  }

  Widget buildContainer(BuildContext context, ProfileViewModel viewModel) {
    return Observer(builder: (_) {
      return viewModel.isLoading ? buildCircularProgress(context) : buildProfile(context, viewModel);
    });
  }

  Widget buildProfile(BuildContext context, ProfileViewModel viewModel) {
    return Column(
      children: [
        Padding(
          padding: context.paddingLow,
          child: CircleAvatar(
            backgroundImage: NetworkImage(viewModel.profileModel.data!.profilePhoto!),
            maxRadius: 50,
          ),
        ),
        buildListTile(context, "İsim:", viewModel.profileModel.data!.fullName!),
        buildListTile(context, "E-Posta:", viewModel.profileModel.data!.email!),
        buildListTile(context, "Doğum Günü:", DateFormat('yyyy-MM-dd').format(viewModel.profileModel.data!.birthDate!)),
        Text(
          "Arkadaşlarım",
          style: context.textTheme.headline6!,
        ),
        buildFriendList(viewModel, context)
      ],
    );
  }

  buildFriendList(ProfileViewModel viewModel, BuildContext context) {
    return Expanded(
      child: viewModel.isLoadingFriend
          ? buildFriendCircularProgress()
          : viewModel.data!.length == 0
              ? buildText(context)
              : ListView.builder(
                  itemCount: viewModel.data!.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    final user = viewModel.data![index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.profilePhoto!),
                      ),
                      title: Text(user.fullName!),
                      subtitle: Text(user.email!),
                      trailing: buildRemoveButton(context, viewModel, user.id!),
                    );
                  },
                ),
    );
  }

  Center buildText(BuildContext context) => Center(
          child: Text(
        "Hiç Arkadaşın Yok :(",
        style: context.textTheme.subtitle1,
      ));

  Center buildFriendCircularProgress() => Center(
        child: CircularProgressIndicator(),
      );

  ListTile buildListTile(BuildContext context, String leftField, String rightField) {
    return ListTile(
      title: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          Text(
            leftField,
            style: context.textTheme.subtitle2,
          ),
          Text(
            rightField,
            style: context.textTheme.caption,
          ),
        ],
      ),
    );
  }

  Center buildCircularProgress(BuildContext context) =>
      Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(context.colors.primary)));

  Widget buildRemoveButton(BuildContext context, ProfileViewModel viewModel, String id) {
    return Observer(builder: (_) {
      return TextButton.icon(
        onPressed: () {
          viewModel.userIdChange(id);
        },
        icon: Icon(Icons.remove_circle),
        label: Text("Çıkar"),
        style: TextButton.styleFrom(
          primary: context.colors.primaryVariant,
          backgroundColor: context.colors.secondary,
        ),
      );
    });
  }
}
