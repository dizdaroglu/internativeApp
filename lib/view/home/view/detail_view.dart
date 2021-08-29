import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/extension/context_extension.dart';
import '../model/detail_model.dart';

class DetailView extends StatelessWidget {
  final Data? model;

  DetailView(this.model);

  @override
  Widget build(BuildContext context) {
    return buildScaffold(context);
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        title: Text("Detay"),
      ),
      body: Center(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(model!.profilePhoto!),
              maxRadius: 50,
            ),
            buildContainer(context, "İsim:", model!.fullName!),
            buildContainer(context, "E-Posta", model!.email!),
            buildContainer(context, "Doğum Günü", DateFormat('yyyy-MM-dd').format(model!.birthDate!)),
          ],
        )),
      ),
    );
  }

  Container buildContainer(BuildContext context, String leftTitle, String rightTitle) {
    return Container(
      margin: context.marginLow,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            blurRadius: 15.0,
            offset: Offset(0.0, 0.75),
          )
        ],
      ),
      child: ListTile(
        title: Wrap(
          alignment: WrapAlignment.spaceBetween,
          children: [
            Text(leftTitle, style: context.textTheme.caption),
            Text(rightTitle, style: context.textTheme.subtitle2),
          ],
        ),
      ),
    );
  }
}
