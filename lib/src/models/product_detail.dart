import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail.freezed.dart';
part 'product_detail.g.dart';

@freezed
class ProductDetail with _$ProductDetail {
  const factory ProductDetail({
    required String code,
    required String kataban,
    required String name,
    required String bunrui,
    required String kankyokbn,
    required int zaikos,
    required int zaikoz,
    required double zaikotens,
    required double zaikotenz,
    required int kajozaikos,
    required int kajozaikoz,
    required int jzans,
    required int jzanz,
    required int hzans,
    required int hzanz,
    required int usuryo1s,
    required int usuryo1z,
    required int usuryo2s,
    required int usuryo2z,
    required int usuryo3s,
    required int usuryo3z,
    required int usuryosums,
    required int usuryosumz,
    required int usuryoavgs,
    required int usuryoavgz,
    required int ssuryo1s,
    required int ssuryo1z,
    required int ssuryo2s,
    required int ssuryo2z,
    required int ssuryo3s,
    required int ssuryo3z,
    required int ssuryosums,
    required int ssuryosumz,
    required int ssuryoavgs,
    required int ssuryoavgz,
    required int nendo1,
    required int nendo2,
    required int nendo3,
  }) = _ProductDetail;

  factory ProductDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailFromJson(json);
}
