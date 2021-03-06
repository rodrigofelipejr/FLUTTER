import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/widgets/bottomSheet_widget.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:modal_bottom_sheet/widgets/custom_button_widget.dart';
import 'package:modal_bottom_sheet/widgets/custom_options_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showBottomSheet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modal Bottom Sheet"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButtonWidget(
              label: "BottomSheet default",
              onPressed: () => handleOptionA(context),
            ),
            CustomButtonWidget(
              label: "BottomSheet persistent",
              onPressed: () => setState(() => _showBottomSheet = true),
            ),
            CustomButtonWidget(
              label: "BottomSheet modal",
              onPressed: () => handleOptionB(),
            ),
            CustomButtonWidget(
              label: "BottomSheet asuka",
              onPressed: () => handleOptionC(),
            ),
          ],
        ),
      ),
      bottomSheet: _showBottomSheet
          ? BottomSheetWidget(
              onPressed: () {
                setState(() {
                  _showBottomSheet = false;
                });
              },
            )
          : Container(height: 0),
    );
  }

  void handleOptionA(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CustomOptionsWidget();
      },
    );
  }

  void handleOptionB() => showModalBottomSheet(
        context: context,
        // backgroundColor: Colors.transparent,
        builder: (context) => ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          child: CustomOptionsWidget(),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        enableDrag: false,
        isDismissible: false,
      );

  void handleOptionC() => asuka.showBottomSheet(
        (context) => CustomOptionsWidget(),
        backgroundColor: Colors.white,
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        clipBehavior: Clip.antiAlias,
        // clipBehavior:
      );
}
