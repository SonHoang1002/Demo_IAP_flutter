import 'dart:async';
import 'package:demo_iap_flutter/common/constant.dart';
import 'package:demo_iap_flutter/common/log_custom.dart';
import 'package:demo_iap_flutter/providers/events/billing_event.dart';
import 'package:demo_iap_flutter/providers/states/billing_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class BillingBloc extends Bloc<BillingEvent, BillingState> {
  final InAppPurchase _inAppPurchase;
  StreamSubscription<List<PurchaseDetails>>? _purchaseSubscription;

  BillingBloc()
      : _inAppPurchase = InAppPurchase.instance,
        super(BillingInitial()) {
    on<BillingLoadProductsEvent>(_onLoadProducts);
    on<BillingPurchaseProductEvent>(_onPurchaseProduct);
    on<BillingHandlePurchaseEvent>(_onHandlePurchase);
    on<BillingRestorePurchasesEvent>(_onRestorePurchases);
    _init();
  }

  Future<void> _init() async {
    final isAvailable = await _inAppPurchase.isAvailable();
    if (!isAvailable) add(BillingErrorEvent("Billing not available"));

    _purchaseSubscription = _inAppPurchase.purchaseStream.listen(
      (purchases) => add(BillingHandlePurchaseEvent(purchases)),
      onError: (error) => add(BillingErrorEvent(error.toString())),
    );
  }

  Future<void> _onLoadProducts(
    BillingLoadProductsEvent event,
    Emitter<BillingState> emit,
  ) async {
    emit(BillingLoading());
    try {
      final response =
          await _inAppPurchase.queryProductDetails(C_PRODUCT_IDS.toSet());
      consolelog("responseresponse: $response");
      emit(ProductsLoaded(response.productDetails));
    } catch (e) {
      emit(BillingError(e.toString()));
    }
  }

  Future<void> _onPurchaseProduct(
      BillingPurchaseProductEvent event, Emitter<BillingState> emit) async {
    try {
      await _inAppPurchase.buyConsumable(
        purchaseParam: PurchaseParam(productDetails: event.product),
      );
    } catch (e) {
      emit(BillingError(e.toString()));
    }
  }

  Future<void> _onHandlePurchase(
    BillingHandlePurchaseEvent event,
    Emitter<BillingState> emit,
  ) async {
    for (final purchase in event.purchases) {
      if (purchase.status == PurchaseStatus.purchased) {
        if (purchase.pendingCompletePurchase) {
          await _inAppPurchase.completePurchase(purchase);
        }
        emit(PurchaseSuccess(purchase.productID));
      }
    }
  }

  Future<void> _onRestorePurchases(
    BillingRestorePurchasesEvent event,
    Emitter<BillingState> emit,
  ) async {
    try {
      await _inAppPurchase.restorePurchases();
      emit(RestoreComplete());
    } catch (e) {
      emit(BillingError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _purchaseSubscription?.cancel();
    return super.close();
  }
}
