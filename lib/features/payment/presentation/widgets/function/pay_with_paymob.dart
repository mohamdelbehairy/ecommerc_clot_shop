import 'dart:developer';

import 'package:e_clot_shop/core/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/utils/secret_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paymob_egypt/flutter_paymob_egypt.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../home/data/models/product_model.dart';
import '../../manager/currency/currency_cubit.dart';

void payWithPaymob(BuildContext context,
    {required num totalPrice, required ProductModel productData}) async {
  var getCurrency = await context.read<CurrencyCubit>().getCurrency();

  num currency = num.parse(getCurrency);
  num paymobPrice = totalPrice * currency;
  paymobPrice = double.parse(paymobPrice.toStringAsFixed(2));

  // ignore: use_build_context_synchronously
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => FlutterPaymobPayment(
          cardInfo: CardInfo(
              apiKey: SecretKey.paymobApiKey,
              iframesID: SecretKey.paymobIframesID,
              integrationID: SecretKey.paymobIntegrationID),
          totalPrice: paymobPrice,
          successResult: (data) {
            context.read<BuildAppCubit>().productData = productData;
            GoRouter.of(context).go(AppRouter.orderPlacedSuccess);
            log('successResult: $data');
          },
          errorResult: (error) {
            log('errorResult: $error');
          }),
    ),
  );
}
