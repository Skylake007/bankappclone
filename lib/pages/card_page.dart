import 'package:bankappclone/data_json/card_json.dart';
import 'package:bankappclone/data_json/cart_operations_json.dart';
import 'package:bankappclone/theme/color.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: getAppBar(),
      ),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: white,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: black, size: 22)),
      title: const Text("Card", style: TextStyle(fontSize: 18, color: black)),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert, color: black, size: 25),
        ),
      ],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    final PageController controller = PageController();
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 240,
            child: PageView(
              controller: controller,
              children: List.generate(cardList.length, (index) {
                return getCards(
                  cardList[index]['amount'],
                  cardList[index]['currency'],
                  cardList[index]['card_number'],
                  cardList[index]['valid_date'],
                  cardList[index]['bg_color'],
                );
              }),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.1),
                    spreadRadius: 10,
                    blurRadius: 10,
                  )
                ]),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Container(
                          width: size.width / 2,
                          height: 55,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: primary,
                                width: 3.5,
                              ),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Operations",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          width: size.width / 2,
                          height: 55,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: primary.withOpacity(0.05),
                                width: 3.5,
                              ),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "History",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: List.generate(cardOperations.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 20.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                  color: grey.withOpacity(0.1),
                                  spreadRadius: 10,
                                  blurRadius: 10)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: secondary.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Icon(cardOperations[index]['icon'],
                                      size: 20, color: primary),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                cardOperations[index]['title'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 30)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getCards(amount, currency, cardNumber, validDate, bgColor) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currency,
              style: const TextStyle(
                  fontSize: 17, fontWeight: FontWeight.bold, color: black),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              amount,
              style: const TextStyle(
                  fontSize: 35, fontWeight: FontWeight.bold, color: black),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: size.width * 0.85,
          height: 170,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(FeatherIcons.creditCard,
                        size: 30, color: white.withOpacity(0.3)),
                    const SizedBox(height: 10),
                    Text(
                      cardNumber,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: white.withOpacity(0.8),
                          wordSpacing: 15),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "VALID DATE",
                          style: TextStyle(
                              color: white.withOpacity(0.3), fontSize: 15),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          validDate,
                          style: const TextStyle(color: white, fontSize: 13),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/images/master_card_logo.png",
                      width: 50,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
