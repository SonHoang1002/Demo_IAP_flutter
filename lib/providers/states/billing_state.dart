// billing_states.dart
import 'package:in_app_purchase/in_app_purchase.dart';

abstract class BillingState {}

class BillingInitial extends BillingState {}

class BillingLoading extends BillingState {}

class ProductsLoaded extends BillingState {
  final List<ProductDetails> products;
  ProductsLoaded(this.products);
}

class PurchaseSuccess extends BillingState {
  final String productId;
  PurchaseSuccess(this.productId);
}

class RestoreComplete extends BillingState {}

class BillingError extends BillingState {
  final String message;
  BillingError(this.message);
}