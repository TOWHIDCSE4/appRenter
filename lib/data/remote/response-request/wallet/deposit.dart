import '../../../../model/deposit.dart';

class DepositRes {
  DepositRes({
    this.code,
    this.success,
    this.msgCode,
    this.msg,
    this.data,
  });

  int? code;
  bool? success;
  String? msgCode;
  String? msg;
  Deposit? data;

  factory DepositRes.fromJson(Map<String, dynamic> json) => DepositRes(
    code: json["code"],
    success: json["success"],
    msgCode: json["msg_code"],
    msg: json["msg"],
    data: json["data"] == null ? null : Deposit.fromJson(json["data"]),
  );
}
