// billing_events.dart
import 'package:in_app_purchase/in_app_purchase.dart';

abstract class BillingEvent {}

class BillingLoadProductsEvent extends BillingEvent {
  BillingLoadProductsEvent();
}

class BillingPurchaseProductEvent extends BillingEvent {
  final ProductDetails product;
  BillingPurchaseProductEvent(this.product);
}

class BillingHandlePurchaseEvent extends BillingEvent {
  final List<PurchaseDetails> purchases;
  BillingHandlePurchaseEvent(this.purchases);
}

class BillingRestorePurchasesEvent extends BillingEvent {}

class BillingErrorEvent extends BillingEvent {
  final String message;
 BillingErrorEvent(this.message);
}
