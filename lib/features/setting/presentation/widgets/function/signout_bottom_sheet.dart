import 'package:e_clot_shop/features/app/presentation/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<dynamic> signOutBottomSheet(
    {required BuildContext context, required Widget child}) {
  return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24)),
              color: context.read<BuildAppCubit>().isDarkMode
                  ? AppColors.darkModePrimaryColor
                  : Colors.white),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          width: double.infinity,
          child: child));
}
