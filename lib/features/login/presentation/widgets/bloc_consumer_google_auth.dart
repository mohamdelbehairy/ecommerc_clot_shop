import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/function/custom_snack_bar_widget.dart';
import '../../../../core/widgets/function/show_alert_sign_in_successful.dart';
import '../../../auth/presentation/manager/google_auth/google_auth_cubit.dart';
import '../../data/auth_item_model.dart';
import 'provider_auth_item.dart';

class BlocConsumerGoogleAuth extends StatelessWidget {
  const BlocConsumerGoogleAuth({super.key});

  @override
  Widget build(BuildContext context) {
    var googleAuth = context.read<GoogleAuthCubit>();
    return BlocConsumer<GoogleAuthCubit, GoogleAuthState>(
      listener: (context, state) {
        if (state is GoogleAuthLoading) {
          googleAuth.isLoading = state.isLoading;
        }
        if (state is GoogleAuthSuccess) {
          googleAuth.isLoading = false;
          showAlertSignInSuccessful(context);
        }
        if (state is GoogleAuthFailure) {
          googleAuth.isLoading = false;
          customSnackbarWidget(context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        return ProviderAuthItem(
            authItemModel: AuthItemModel(
                isLoading: googleAuth.isLoading,
                icon: Assets.imagesGoogle,
                text: 'Continue With Google',
                onTap: () async {
                  await googleAuth.signInWIthGoogle();
                }));
      },
    );
  }
}
