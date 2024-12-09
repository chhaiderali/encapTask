import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../configs/components/round_button.dart';
import '../../../configs/routes/routes_name.dart';
import '../../../configs/utils.dart';
import '../../../configs/validator/app_validator.dart';
import '../../../view_model/login/login_view_model.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      title: 'Login',
      loading: false,
      onPress: () {
        Navigator.pushNamed(context, RoutesName.home);
      },
    );
  }
}
