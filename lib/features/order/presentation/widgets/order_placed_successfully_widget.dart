import 'package:e_clot_shop/features/app/presentation/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/background_model.dart';
import '../../../../core/widgets/custom_background_container.dart';
import 'order_placed_texts_and_button_section.dart';

class OrderPlacedSuccessfullyWidget extends StatelessWidget {
  const OrderPlacedSuccessfullyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBakgroundContainer(
        backgroundModel: BackgroundModel(
            padding: 32,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            color: context.read<BuildAppCubit>().isDarkMode
                ? AppColors.darkModeSecondryColor
                : null,
            child: const OrderPlacedTextsAndButtonSection()));
  }
}
