// purchase_handler.dart
import 'package:demo_iap_flutter/providers/states/billing_state.dart';
import 'package:flutter/material.dart';

class BillingHandler {
  static void handle(BuildContext context, BillingState state) {
    if (state is PurchaseSuccess) {
      _showSuccessDialog(context, state.productId);
    }
  }

  static void _showSuccessDialog(BuildContext context, String productId) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Purchase Successful'),
        content: Text('You bought: $productId'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK')),
        ],
      ),
    );
  }
}