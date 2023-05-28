import 'package:flutter/material.dart';
import 'package:final_tpm/theme.dart';

class KesanPesanPage extends StatelessWidget {
  const KesanPesanPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: primaryTextColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Kesan & Pesan',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon_kesan_pesan.png',
                width: 74,
              ),
              SizedBox(
                height: 23,
              ),
              Text(
                'Kesan',
                style:
                    primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Matakuliah yang seru dan menantang, serta ditantang untuk melebihi batasan diri walau capek akhirnya',
                style: secondaryTextStyle.copyWith(fontSize: 12),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Pesan',
                style:
                    primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Jangan pernah menyerah untuk mengajar mahasiswa pak, tapi terkadang tetep harus melihat kemampuan mahasiswa, tidak semua mahasiswa mempunyai waktu yang cukup dalam mengikuti perkuliahan',
                style: secondaryTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(50), child: header()),
      body: Column(
        children: [
          content(),
        ],
      ),
    );
  }
}
