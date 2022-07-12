import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/detail_transaction_model.dart';
import 'package:sertidemi/app/data/models/status_transaction_model.dart';
import 'package:sertidemi/infrastructure/navigation/routes.dart';

class DetailTransactionController extends GetxController {
  Rxn<DetailTransactionModel> detailTransactionModel =
      Rxn<DetailTransactionModel>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onTapBottomSheet() {
    switch (detailTransactionModel.value!.statusTransaksi!) {
      case 'Transaksi Selesai':
        transactionDone();
        break;
      default:
    }
  }

  void transactionDone() {
    StatusTransactionModel statusTransactionModel = StatusTransactionModel(
        idTransaksi: detailTransactionModel.value!.idTransaksi,
        noInvoice: detailTransactionModel.value!.invoice,
        namaProduct: detailTransactionModel.value!.nama,
        metodePembayaranal: detailTransactionModel.value!.paymentType,
        total: detailTransactionModel.value!.totalPembayaran,
        createdAt: detailTransactionModel.value!.tanggalInput);
    Map<String, dynamic> sendArguments = {
      'nameOption': 'Sertifikasi',
      'nameUser': detailTransactionModel.value!.namaSertifikat,
      'statusTransactionModel': statusTransactionModel,
    };
    Get.offNamed(Routes.STATUS_TRANSACTION, arguments: sendArguments);
  }
}
