import '../../../../model/withdraw.dart';

class WithdrawRes {
  WithdrawRes({
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
  Withdraw? data;

  factory WithdrawRes.fromJson(Map<String, dynamic> json) => WithdrawRes(
    code: json["code"],
    success: json["success"],
    msgCode: json["msg_code"],
    msg: json["msg"],
    data: json["data"] == null ? null : Withdraw.fromJson(json["data"]),
  );
}
