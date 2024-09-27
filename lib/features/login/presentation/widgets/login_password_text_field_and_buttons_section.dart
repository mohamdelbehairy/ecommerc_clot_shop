import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/forget_password_and_reset.dart';
import '../manager/build_login/build_login_cubit.dart';
import 'login_button.dart';

class LoginPasswordTextFieldAndButtonSetcion extends StatelessWidget {
  const LoginPasswordTextFieldAndButtonSetcion({super.key});

  @override
  Widget build(BuildContext context) {
    var buildLogin = context.watch<BuildLoginCubit>();
    return BlocBuilder<BuildLoginCubit, BuildLoginState>(
      builder: (context, state) {
        return Form(
          key: buildLogin.formKeyTwo,
          child: Column(
            children: [
              CustomTextField(textFieldModel: buildLogin.items[1]),
              const SizedBox(height: 20),
              const LoginButton(),
              const SizedBox(height: 20),
              const ForgetPasswordAndReset()
            ],
          ),
        );
      },
    );
  }
}

