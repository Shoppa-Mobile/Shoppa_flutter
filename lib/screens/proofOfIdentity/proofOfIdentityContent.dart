// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/components/defaultButton.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/screens/proofOfIdentity/driLicenseUpload/driLicenseUploadScreen.dart';
import 'package:shoppa_app/screens/proofOfIdentity/nINUpload/nINUploadScreen.dart';
import 'package:shoppa_app/screens/proofOfIdentity/utiiBillUpload/utilBillUploadScreen.dart';
import 'package:shoppa_app/screens/proofOfIdentity/votersCardUpload/votersCardUploadScreen.dart';
import '../../constants/constants.dart';
import 'enum.dart';

class ProofOfIdentityContent extends StatefulWidget {
  const ProofOfIdentityContent({super.key});

  @override
  State<ProofOfIdentityContent> createState() => _ProofOfIdentityContentState();
}

class _ProofOfIdentityContentState extends State<ProofOfIdentityContent> {
  bool radio1 = false;
  bool radio2 = false;
  bool radio3 = false;
  bool radio4 = false;
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
                      radio1 = true;
                      radio4 = false;
                      radio2 = false;
                      radio3 = false;
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
                      radio2 = true;
                      radio1 = false;
                      radio4 = false;
                      radio3 = false;
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
                      radio3 = true;
                      radio1 = false;
                      radio2 = false;
                      radio4 = false;
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
                      radio4 = true;
                      radio1 = false;
                      radio2 = false;
                      radio3 = false;
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
              press: () {
                if (radio1 == true) {
                  Navigator.of(context)
                      .pushNamed(UtilBillUploadScreen.routeName);
                }
                if (radio2 == true) {
                  Navigator.of(context).pushNamed(NINUploadScreen.routeName);
                }

                if (radio3 == true) {
                  Navigator.of(context)
                      .pushNamed(DriLicenseUploadScreen.routeName);
                }
                if (radio4 == true) {
                  Navigator.of(context)
                      .pushNamed(VotersCardUploadScreen.routeName);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
