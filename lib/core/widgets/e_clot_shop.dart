import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:e_clot_shop/core/utils/setup_service_locator.dart';
import 'package:e_clot_shop/features/shared_pref/data/repo/shared_pref_repo_impl.dart';
import 'package:e_clot_shop/features/shared_pref/presentation/manager/shared_pref/shared_pref_cubit.dart';
import 'package:e_clot_shop/features/user_data/data/repo/user_data_repo_impl.dart';
import 'package:e_clot_shop/features/user_data/presentation/manager/get_user_data/get_user_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/bottom_navigation_bar/presentation/manager/bottom_navigation_bar/bottom_navigation_bar_cubit.dart';
import '../../features/home/data/repo/product_repo_impl.dart';
import '../../features/home/presentation/manager/build_home/build_home_cubit.dart';
import '../../features/home/presentation/manager/product/product_cubit.dart';
import '../../features/login/presentation/manager/build_login/build_login_cubit.dart';

class EClotShop extends StatelessWidget {
  const EClotShop({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BuildLoginCubit()),
        BlocProvider(
            create: (context) => SharedPrefCubit(SharedPrefRepoImpl())),
        BlocProvider(create: (context) => BottomNavigationBarCubit()),
        BlocProvider(
            create: (context) =>
                GetUserDataCubit(getIt.get<UserDataRepoImpl>())..getUserData()),
        BlocProvider(create: (context) => BuildHomeCubit()),
        BlocProvider(create: (context) => ProductCubit(ProductRepoImpl()))
      ],
      child: MaterialApp.router(
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
