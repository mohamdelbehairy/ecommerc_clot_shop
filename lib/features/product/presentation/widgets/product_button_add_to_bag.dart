import 'package:e_clot_shop/core/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/features/product/presentation/views/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/custom_button_model.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/function/loading_animation_widget.dart';
import '../../../home/data/models/product_model.dart';

class ProductButtonAddToBag extends StatelessWidget {
  const ProductButtonAddToBag({super.key, required this.productData});
  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    var price = num.parse(productData.price);
    var buildApp = context.watch<BuildAppCubit>();

    return BlocConsumer<BuildAppCubit, BuildAppState>(
      listener: (context, state) async {
        await Future.delayed(const Duration(seconds: 1));
        if (state is ProductButtonTrue) {
          // ignore: use_build_context_synchronously
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CartView(productData: productData)));
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomButton(
              customButtonModel: CustomButtonModel(
                  onTap: () {
                    buildApp.productButtonChange();
                  },
                  widget: buildApp.productButton
                      ? Center(
                          child: loadingAnimationWidget(color: Colors.white))
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('\$${price * buildApp.quantity}',
                                  style: Styles.styleBold16
                                      .copyWith(color: Colors.white)),
                              Text('Add to Bag',
                                  style: Styles.styleMedium16
                                      .copyWith(color: Colors.white))
                            ],
                          ),
                        ),
                  buttonName: '')),
        );
      },
    );
  }
}
