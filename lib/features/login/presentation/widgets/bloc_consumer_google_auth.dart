import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/function/show_alert_sign_in_successful.dart';
import '../../../auth/presentation/manager/social_auth/social_auth_cubit.dart';
import '../../data/models/auth_item_model.dart';
import 'provider_auth_item.dart';

class BlocConsumerGoogleAuth extends StatelessWidget {
  const BlocConsumerGoogleAuth({super.key});

  @override
  Widget build(BuildContext context) {
    var googleAuth = context.read<SocialAuthCubit>();
    return BlocConsumer<SocialAuthCubit, SocialAuthState>(
      listener: (context, state) {
        if (state is GoogleAuthLoading) {
          googleAuth.isLoadingGoogle = state.isLoading;
        }
        if (state is GoogleAuthSuccess) {
          googleAuth.isLoadingGoogle = false;
          showAlertSignInSuccessful(context);
        }
        if (state is SocialAuthFailure) {
          googleAuth.isLoadingGoogle = false;
          // customSnackbarWidget(context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        return ProviderAuthItem(
            authItemModel: AuthItemModel(
                isLoading: googleAuth.isLoadingGoogle,
                icon: Assets.imagesGoogle,
                text: 'Continue With Google',
                onTap: () async {
                  await googleAuth.signInWIthGoogle();
                }));
      },
    );
  }
}
