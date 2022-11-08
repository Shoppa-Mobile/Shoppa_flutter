// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../../../components/defaultButton.dart';
import '../../../constants/colors.dart';
import '../../../constants/constants.dart';
import '../../../constants/size_configurations.dart';

class VotersCardUploadContent extends StatefulWidget {
  const VotersCardUploadContent({super.key});

  @override
  State<VotersCardUploadContent> createState() =>
      _VotersCardUploadContentState();
}

class _VotersCardUploadContentState extends State<VotersCardUploadContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getPropWidth(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getPropHeight(10),
              ),
              Text("Voters Card", style: headerStyle2),
              const SizedBox(height: 16),
              Text('Upload a picture of your Voters Card',
                  style: subHeaderStyle),
              SizedBox(
                height: getPropHeight(45),
              ),
              InkWell(
                  onTap: (() {}),
                  child: Container(
                    height: getPropHeight(226),
                    width: getPropWidth(379),
                    decoration: BoxDecoration(
                        color: subTextColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image,
                          color: subHeaderTextColor,
                          size: getPropHeight(80),
                        ),
                        SizedBox(
                          height: getPropHeight(13),
                        ),
                        Text(
                          "Click to Upload a picture from your phone ",
                          style: subHeaderStyle,
                        )
                      ],
                    )),
                  )),
              SizedBox(
                height: getPropHeight(38),
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt,
                      size: getPropHeight(24),
                      color: secondaryButtonTextColor,
                    ),
                    const Text(
                      "Use Camera Instead",
                      style: TextStyle(color: secondaryButtonTextColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getPropHeight(52),
              ),
              DefaultButton(
                text: "Submit",
                press: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
