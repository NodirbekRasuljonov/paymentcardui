import 'package:flutter/material.dart';
import 'package:paymentcardui/colors/color_const.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController numberController = TextEditingController();

  TextEditingController expirationController = TextEditingController();
  final cardnumberFormat =
      MaskTextInputFormatter(mask: "XXXX XXXX XXXX XXXX");
  final expirationFormat = MaskTextInputFormatter(mask: "XX/XX");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.kBackgroundColor,
      appBar: appBar(context),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              top: 510.0,
              left: 200.0,
              child: Image.asset("assets/images/vector.png"),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Checkout details",
                      style: TextStyle(
                          color: ColorConst.kTextColor,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 20.0),
                      height: 200.0,
                      width: 361,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: ColorConst.kCardColor,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 30.0,
                            width: 286.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset("assets/images/chip.png"),
                                Text(
                                  "Expired ${expirationController.text}",
                                  style: TextStyle(
                                    color: ColorConst.kTextColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Text(numberController.text),
                          Text(nameController.text),
                        ],
                      ),
                    ),
                    space(),
                    cardHolder(),
                    space(),
                    cardNumber(),
                    space(),
                    space(),
                    GestureDetector(
                      onTap: () {
                        debugPrint("kechagina oqshomlar");
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70.0),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          width: 286.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: ColorConst.kButtonColor,
                          ),
                          child: Text(
                            "Save",
                            style: TextStyle(
                              color: ColorConst.kTextColor,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox cardNumber() {
    return SizedBox(
      height: 80.0,
      width: 360.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Card Number"),
          SizedBox(
            height: 50.0,
            child: TextField(
              style: TextStyle(
                color: ColorConst.kTextColor,
              ),
              inputFormatters: [cardnumberFormat],
              onChanged: (v) {
                v = numberController.text;
                print(numberController.text);
                setState(() {});
              },
              controller: numberController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: ColorConst.kButtonColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  SizedBox cardHolder() {
    return SizedBox(
      height: 80.0,
      width: 360.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Card Holder"),
          SizedBox(
            height: 50.0,
            child: TextFormField(
              onChanged: (v) {
                v = nameController.text;
                setState(() {});
              },
              controller: nameController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: ColorConst.kButtonColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  SizedBox space() {
    return const SizedBox(
      height: 30.0,
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      primary: true,
      elevation: 0.0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_outlined,
          color: Colors.black,
          size: 30.0,
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
