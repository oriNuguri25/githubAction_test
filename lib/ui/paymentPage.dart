import 'package:flutter/material.dart';
import 'package:tosspayments_widget_sdk_flutter/model/payment_info.dart';
import 'package:tosspayments_widget_sdk_flutter/model/payment_widget_options.dart';
import 'package:tosspayments_widget_sdk_flutter/payment_widget.dart';
import 'package:tosspayments_widget_sdk_flutter/widgets/agreement.dart';
import 'package:tosspayments_widget_sdk_flutter/widgets/payment_method.dart';

class PaymentWidgetExample extends StatefulWidget {
  final totalPrice;
  final List<Map<String, String>> CartList;

  const PaymentWidgetExample(
      {super.key, required this.totalPrice, required this.CartList});

  @override
  State<PaymentWidgetExample> createState() => _PaymentWidgetExampleState();
}

class _PaymentWidgetExampleState extends State<PaymentWidgetExample> {
  late PaymentWidget _paymentWidget;
  PaymentMethodWidgetControl? _paymentMethodWidgetControl;
  AgreementWidgetControl? _agreementWidgetControl;

  void initState() {
    super.initState();

    _paymentWidget = PaymentWidget(
      clientKey: "test_gck_docs_Ovk5rk1EwkEbP0W43n07xlzm",
      customerKey: "FuNvmqS_Az-7gaAepSKxx",
    );

    _paymentWidget
        .renderPaymentMethods(
      selector: 'methods',
      amount: Amount(
          value: widget.totalPrice, currency: Currency.KRW, country: "KR"),
      options: RenderPaymentMethodsOptions(variantKey: "DEFAULT"),
    )
        .then((control) {
      _paymentMethodWidgetControl = control;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  PaymentMethodWidget(
                    paymentWidget: _paymentWidget,
                    selector: 'methods',
                  ),
                  AgreementWidget(
                    paymentWidget: _paymentWidget,
                    selector: 'agreement',
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      String orderName = '';
                      if (widget.CartList.length == 1) {
                        orderName = widget.CartList[0]['name'] ?? '상품명 없음';
                      } else if (widget.CartList.length > 1) {
                        final firstItemName = widget.CartList[0]['name'] ?? '상품명 없음';
                        final remainingItemCount = widget.CartList.length -1;
                        orderName = '$firstItemName 외 $remainingItemCount개';
                      }
                      final paymentResult = await _paymentWidget.requestPayment(
                        paymentInfo: PaymentInfo(
                            orderId: 'zUT5vjdcFTsE08IszW9P4',
                            orderName: orderName),
                      );
                      if (paymentResult.success != null) {
                      } else if (paymentResult.fail != null) {}
                    },
                    child: const Text('결제하기'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final selectedPaymentMethod =
                          await _paymentMethodWidgetControl
                              ?.getSelectedPaymentMethod();
                      print(
                          '${selectedPaymentMethod?.method} ${selectedPaymentMethod?.easyPay?.provider ?? ''}');
                    },
                    child: const Text('선택한 결제수단 출력'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final agreementStatus =
                          await _agreementWidgetControl?.getAgreementStatus();
                      print('${agreementStatus?.agreedRequiredTerms}');
                    },
                    child: const Text('약관 동의 상태 출력'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await _paymentMethodWidgetControl?.updateAmount(
                          amount: 300);
                      print('결제 금액이 300원으로 변경되었습니다.');
                    },
                    child: const Text('결제 금액 변경'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
