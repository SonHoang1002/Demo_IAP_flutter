import 'dart:async';

import 'package:in_app_purchase/in_app_purchase.dart';

class BillingService {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  StreamSubscription<List<PurchaseDetails>>? _subscription;

  Future<void> init() async {
    // Khởi tạo kết nối và lắng nghe purchase stream
    _subscription = _inAppPurchase.purchaseStream.listen(_handlePurchaseUpdate);

    // Kiểm tra kết nối billing
    final bool isAvailable = await _inAppPurchase.isAvailable();
    if (!isAvailable) throw Exception('Billing not available');
  }

  void _handlePurchaseUpdate(List<PurchaseDetails> purchases) {
    // Xử lý logic mua hàng
  }

  Future<void> dispose() async {
    await _subscription?.cancel();
  }
}
