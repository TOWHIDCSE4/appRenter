import 'package:flutter/material.dart';
import 'package:gohomy/screen/profile/deposit_withdraw/data/deposit_withdraw_repository.dart';
import 'package:gohomy/screen/profile/deposit_withdraw/domain/withdraw_history_model.dart';
import 'package:gohomy/screen/profile/wallet_admin_review/wallet_admin_review.dart';
import 'package:gohomy/utils/date_utils.dart';
import 'package:gohomy/utils/string_utils.dart';

class WalletWithdrawHistory extends StatefulWidget {
  WalletWithdrawHistory({super.key});

  @override
  State<WalletWithdrawHistory> createState() => _WalletWithdrawHistoryState();
}

class _WalletWithdrawHistoryState extends State<WalletWithdrawHistory> {
  bool isLoading = true;
  List<Withdraw> withdrawInfo = [];

  @override
  void initState() {
    getDepositInfo();
    super.initState();
  }

  Future<void> getDepositInfo() async {
    var data = await DepositWithDrawRepository.instance.getWithdrawHistory();
    setState(() {
      withdrawInfo = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: ListView.separated(
            clipBehavior: Clip.none,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(15),
            itemCount: withdrawInfo.length,
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemBuilder: (context, index) {
              return WalletHistoryCard(
                amountStr: SahaStringUtils().convertToMoney(withdrawInfo[index].withdrawMoney ?? 0),
                bankAccountNumber: withdrawInfo[index]?.accountNumber,
                bankName: withdrawInfo[index]?.bankName,
                fromOrTo: withdrawInfo[index]?.bankAccountHolderName ?? "",
                content: withdrawInfo[index]?.withdrawContent ?? "",
                dateTimeStr: SahaDateUtils().getDateTimeFormString(withdrawInfo[index]?.withdrawDateTime ?? "").toString(),
                isDeposit: false,
                completed: false,
              );
            },
          ),
        ),
      ],
    );
  }
}
