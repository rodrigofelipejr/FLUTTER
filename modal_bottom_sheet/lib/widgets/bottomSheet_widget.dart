import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const BottomSheetWidget({
    @required this.onPressed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: Text(
              "Mensagem exibida com sucesso!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
              child: Text(
                "Sair",
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}
