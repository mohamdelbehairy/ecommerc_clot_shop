part of 'build_app_cubit.dart';

sealed class BuildAppState {}

final class BuildAppInitial extends BuildAppState {}

final class BottomNavigationBarChanged extends BuildAppState {}

final class IndexChanged extends BuildAppState {}

// final class QuantityChanged extends BuildAppState {}

// final class BottomSheetChanged extends BuildAppState {}

final class ProductButtonTrue extends BuildAppState {}

final class ProductButtonFalse extends BuildAppState {}

// final class ShippingAddressChanged extends BuildAppState {}

// final class PaymentBottomSheetChanged extends BuildAppState {}

// final class PaymentMethodChanged extends BuildAppState {}

final class ResetOrder extends BuildAppState {}

final class CouponSussess extends BuildAppState {}

// final class ChangePriceIndex extends BuildAppState {}

final class ClearFilterBottomSheet extends BuildAppState {}

final class ClearUserTextField extends BuildAppState {}

final class NotificationLoading extends BuildAppState {}

final class StoreNotifiySuccess extends BuildAppState {}

final class NotificationFailure extends BuildAppState {
  final String errorMessage;

  NotificationFailure({required this.errorMessage});
}
