import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../utils/constants/assets.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';
import 'custom_cupertino_bottom_sheet.dart';

Future<dynamic> showPremiumBottomSheet(BuildContext context, {bool isAgain = false}) {
  return showModalBottomSheet(
    context: context,
    enableDrag: true,
    backgroundColor: Colors.transparent,
    builder: (context) => PremiumBottomSheet(isAgain: isAgain),
  );
}

class PremiumBottomSheet extends StatefulWidget {
  const PremiumBottomSheet({
    Key? key,
    required this.isAgain,
  }) : super(key: key);

  final bool isAgain;

  @override
  State<PremiumBottomSheet> createState() => _PremiumBottomSheetState();
}

class _PremiumBottomSheetState extends State<PremiumBottomSheet> {
  List<String> productIds = [
    'premium',
  ];

  final InAppPurchase inAppPurchase = InAppPurchase.instance;
  StreamSubscription<List<PurchaseDetails>>? subscription;
  List<ProductDetails> productDetails = [];
  @override
  void initState() {
    super.initState();
    initStream();
    initIAP();
  }

  void initStream() {
    final Stream<List<PurchaseDetails>> purchaseUpdated = inAppPurchase.purchaseStream;
    subscription = purchaseUpdated.listen(
      (List<PurchaseDetails> purchaseDetailsList) {
        listenToPurchaseUpdated(purchaseDetailsList);
      },
      onDone: () {
        if (subscription != null) {
          subscription!.cancel();
        }
      },
      onError: (Object error) {
        debugPrint('error: $error');
      },
    );
  }

  Future<void> listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) async {
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        debugPrint('pending');
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          debugPrint('error');
        }

        if (purchaseDetails.pendingCompletePurchase) {
          debugPrint('pendingCompletePurchase');
          await inAppPurchase.completePurchase(purchaseDetails);

          subscription!.cancel();
          if (mounted) {
            if (purchaseDetails.status == PurchaseStatus.canceled) {
              return;
            }
            // await DatabaseService().promoteStory(widget.story);
            // Navigator.pop(context);
            // showDialog(
            //   context: context,
            //   builder: (context) => AlertDialog(
            //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            //     backgroundColor: MyColors.darkBlue,
            //     title: Text("Başarıyla hikaye öne çıkarıldı", style: TextStyle(color: Colors.white)),
            //     actions: [
            //       TextButton(
            //         onPressed: () {
            //           Navigator.pop(context);
            //         },
            //         child: Text('Tamam'),
            //       ),
            //     ],
            //   ),
            // );
          }
        }
      }
    }
  }

  Future<void> initIAP() async {
    final bool isAvailable = await inAppPurchase.isAvailable();
    if (!isAvailable) {
      return;
    }

    pastPurchasesFuncs();

    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition = inAppPurchase.getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iosPlatformAddition.setDelegate(ExamplePaymentQueueDelegate());
    }

    final ProductDetailsResponse productDetailResponse = await inAppPurchase.queryProductDetails(productIds.toSet());
    productDetails = productDetailResponse.productDetails;
    setState(() {});
  }

  Future<void> pastPurchasesFuncs() async {
    var paymentWrapper = SKPaymentQueueWrapper();
    var transactions = await paymentWrapper.transactions();
    for (var transaction in transactions) {
      await paymentWrapper.finishTransaction(transaction);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomCupertinoBottomSheet(
      leading: const SizedBox(width: 40),
      title: 'Premium Satın Al',
      trailing: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.close,
          color: Colors.grey,
        ),
      ),
      child: Expanded(
        child: Column(
          children: [
            Image.asset(Assets.premium, height: 80),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Tüm içeriklere erişebilmek ve reklamları kaldırmak için Premium satın almanız gerekmektedir.',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            if (widget.isAgain)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Çözülen testi tekrar çözebilmek ve öğrenilen konuyu tekrar okumak için Premium olmalısınız.',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              )
            else
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  '+60.000 soru, +1.200 test ve +35 konu anlatımına erişin.',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            const SizedBox(height: 20),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Premium Satın Al',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomLeading: const SizedBox(width: 40),
      bottomTrailing: const SizedBox(width: 40),
    );
  }
}

class ExamplePaymentQueueDelegate implements SKPaymentQueueDelegateWrapper {
  @override
  bool shouldContinueTransaction(SKPaymentTransactionWrapper transaction, SKStorefrontWrapper storefront) {
    return true;
  }

  @override
  bool shouldShowPriceConsent() {
    return false;
  }
}
