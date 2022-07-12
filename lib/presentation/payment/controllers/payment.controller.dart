import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/checkout_assessment_model.dart';
import 'package:sertidemi/app/data/models/checkout_event_model.dart';

class PaymentController extends GetxController {
  Map<String, dynamic> getArguments = Get.arguments;
  RxString urlBanner = ''.obs;
  RxString title = ''.obs;
  RxString idProduct = ''.obs;
  RxString time = ''.obs;
  RxString price = ''.obs;
  RxString discountVoucher = ''.obs;
  RxString totalPrice = ''.obs;
  RxInt groupValue = 0.obs;

  @override
  void onInit() {
    initialModel();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void initialModel() {
    switch (getArguments['nameOption']) {
      case 'Event':
        CheckoutEventDetailModel checkoutEventDetailModel =
            getArguments['modelProductCheckout'];
        idProduct.value = checkoutEventDetailModel.idEvent!;
        urlBanner.value = checkoutEventDetailModel.urlImagePanjang!;
        title.value = checkoutEventDetailModel.namaEvent!;
        time.value = checkoutEventDetailModel.eventMulai!;
        price.value = checkoutEventDetailModel.harga!;
        totalPrice.value = checkoutEventDetailModel.hargaAkhir!;
        discountVoucher.value = checkoutEventDetailModel.potonganVoucher!;
        break;
      case 'Assessment':
        CheckoutAssessmentDetailModel checkoutAssessmentDetailModel =
            getArguments['modelProductCheckout'];

        idProduct.value = checkoutAssessmentDetailModel.idAssessment!;
        urlBanner.value = checkoutAssessmentDetailModel.urlImagePanjang!;
        title.value = checkoutAssessmentDetailModel.namaAssessment!;
        time.value = checkoutAssessmentDetailModel.tanggalMulaiAssessment!;
        price.value = checkoutAssessmentDetailModel.harga!;
        totalPrice.value = checkoutAssessmentDetailModel.hargaAkhir!;
        discountVoucher.value = checkoutAssessmentDetailModel.potonganVoucher!;
        break;
      default:
    }
  }

  void onTapPaymentMethod(dynamic value) {
    groupValue.value = value;
  }
}
