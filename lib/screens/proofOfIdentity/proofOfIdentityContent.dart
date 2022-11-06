// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/components/defaultButton.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import '../../constants/constants.dart';
import 'enum.dart';

class ProofOfIdentityContent extends StatefulWidget {
  const ProofOfIdentityContent({super.key});

  @override
  State<ProofOfIdentityContent> createState() => _ProofOfIdentityContentState();
}

class _ProofOfIdentityContentState extends State<ProofOfIdentityContent> {
  ProofOfItems? proofOfItems = ProofOfItems.ninSlip;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getPropWidth(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getPropHeight(15),
            ),
            Text("Proof Of Identity", style: headerStyle2),
            const SizedBox(height: 8),
            Text('Choose Document type to upload for proof of identity',
                style: subHeaderStyle),
            SizedBox(
              height: getPropHeight(30),
            ),
            ListTile(
              title: Text(
                'Proof of Address (Utility Bill)',
                style: regTextStyle,
              ),
              leading: Radio<ProofOfItems>(
                  activeColor: primaryColor,
                  value: ProofOfItems.utilityBill,
                  groupValue: proofOfItems,
                  onChanged: (value) {
                    setState(() {
                      proofOfItems = value;
                    });
                  }),
              shape: const Border(
                  bottom: BorderSide(
                      style: BorderStyle.solid, color: subHeaderTextColor)),
            ),
            ListTile(
              title: Text(
                'National Identification Number Slip',
                style: regTextStyle,
              ),
              leading: Radio<ProofOfItems>(
                  activeColor: primaryColor,
                  value: ProofOfItems.ninSlip,
                  groupValue: proofOfItems,
                  onChanged: (value) {
                    setState(() {
                      proofOfItems = value;
                    });
                  }),
              shape: const Border(
                  bottom: BorderSide(
                      style: BorderStyle.solid, color: subHeaderTextColor)),
            ),
            ListTile(
              title: Text(
                "Driver's License",
                style: regTextStyle,
              ),
              leading: Radio<ProofOfItems>(
                  activeColor: primaryColor,
                  value: ProofOfItems.driversLicenses,
                  groupValue: proofOfItems,
                  onChanged: (value) {
                    setState(() {
                      proofOfItems = value;
                    });
                  }),
              shape: const Border(
                  bottom: BorderSide(
                      style: BorderStyle.solid, color: subHeaderTextColor)),
            ),
            ListTile(
              title: Text(
                "Voter's Card",
                style: regTextStyle,
              ),
              leading: Radio<ProofOfItems>(
                  activeColor: primaryColor,
                  value: ProofOfItems.votersCard,
                  groupValue: proofOfItems,
                  onChanged: (value) {
                    setState(() {
                      proofOfItems = value;
                    });
                  }),
              shape: const Border(
                  bottom: BorderSide(
                      style: BorderStyle.solid, color: subHeaderTextColor)),
            ),
            SizedBox(
              height: getPropHeight(130),
            ),
            DefaultButton(
              text: "Next",
              press: () {},
            )
          ],
        ),
      ),
    );
  }
}
