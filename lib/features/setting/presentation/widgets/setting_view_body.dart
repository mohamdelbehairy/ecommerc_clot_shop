import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../user_data/presentation/manager/get_user_data/get_user_data_cubit.dart';
import 'setting_when_state_success.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataState>(
      builder: (context, state) {
        if (state is GetUserDataSuccess) {
          return SettingWhenStateSuccess(userData: state.user);
        }

        return const SizedBox();
      },
    );
  }
}
