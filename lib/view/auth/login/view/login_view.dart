import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/image/image_constants.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension.dart';
import '../viewModel/login_view_model.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (LoginViewModel model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginViewModel viewModel) => buildScaffold(context, viewModel),
    );
  }

  Scaffold buildScaffold(BuildContext context, LoginViewModel viewModel) => Scaffold(
      backgroundColor: context.colors.background,
      key: viewModel.scaffoldState,
      body: SafeArea(
        child: Column(
          children: [
            buildAnimatedContainer(context),
            Expanded(
                flex: 6,
                child: Padding(
                  padding: context.paddingNormal,
                  child: buildForm(context, viewModel),
                )),
          ],
        ),
      ));

  buildAnimatedContainer(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Center(
        child: Image.asset(
          ImageConstants.instance.logo,
          width: context.mediaQuery.size.width * .5,
        ),
      ),
    );
  }

  Form buildForm(BuildContext context, LoginViewModel viewModel) {
    return Form(
      key: viewModel.formState,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Spacer(),
          Text(
            "Giriş",
            style: context.textTheme.headline5!.copyWith(
              fontWeight: FontWeight.w600,
              color: context.colors.primary,
            ),
          ),
          Spacer(flex: 6),
          buildTextFormFieldEmail(context, viewModel),
          buildTextFormFieldPassword(context, viewModel),
          Spacer(flex: 6),
          buildLoginButton(context, viewModel),
          Spacer()
        ],
      ),
    );
  }

  Widget buildTextFormFieldEmail(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return TextFormField(
        validator: (value) {
          if (!(value!.isValidEmail)) {
            return viewModel.emailValidateText;
          }
        },
        controller: viewModel.emailController,
        decoration: InputDecoration(
          labelStyle: context.textTheme.subtitle2,
          labelText: "E-Posta",
          icon: buildIconField(Icons.email, context),
        ),
      );
    });
  }

  Widget buildTextFormFieldPassword(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return TextFormField(
        validator: (value) => viewModel.passwordValidateText,
        obscureText: viewModel.obscureText,
        keyboardType: TextInputType.number,
        controller: viewModel.passwordController,
        decoration: InputDecoration(
            labelStyle: context.textTheme.subtitle2,
            labelText: "Şifre",
            suffixIcon: TextButton(
              onPressed: () {
                viewModel.obscureChange();
              },
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Icon(
                viewModel.obscureText ? Icons.visibility_off : Icons.visibility,
                color: context.colors.onSecondary.withOpacity(.2),
              ),
            ),
            icon: buildIconField(Icons.lock, context)),
      );
    });
  }

  Container buildIconField(IconData icon, BuildContext context) {
    return Container(
      padding: context.paddingNormal,
      decoration: BoxDecoration(color: context.colors.primary, borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Icon(
        icon,
        color: context.colors.primaryVariant,
      ),
    );
  }

  Widget buildLoginButton(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return ElevatedButton(
        onPressed: viewModel.isLoading
            ? null
            : () {
                viewModel.fetchLoginUser();
              },
        style: ElevatedButton.styleFrom(shape: StadiumBorder(), padding: context.paddingNormal),
        child: Center(
          child: Text(
            "Giriş Yap",
            style: TextStyle(color: context.colors.primaryVariant),
          ),
        ),
      );
    });
  }
}
