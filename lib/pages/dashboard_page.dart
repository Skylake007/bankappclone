import 'package:ant_icons/ant_icons.dart';
import 'package:bankappclone/data_json/balance_json.dart';
import 'package:bankappclone/data_json/card_json.dart';
import 'package:bankappclone/pages/card_page.dart';
import 'package:bankappclone/theme/color.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: getAppBar(),
      ),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: primary,
      leading: IconButton(
        onPressed: () {},
        icon: const CircleAvatar(
          backgroundImage: NetworkImage(
              "https://scontent.fsgn5-3.fna.fbcdn.net/v/t39.30808-6/328101836_694351692336335_3485145814383382753_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=a2f6c7&_nc_ohc=rwCu24d6654AX9ALS3n&_nc_ht=scontent.fsgn5-3.fna&oh=00_AfAjyBbJI-Y9XZH_E8j8Gga7W_TiWpLDwxcTysVkTcJNOg&oe=65225C9A"),
        ),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(AntIcons.search_outline))
      ],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width,
          height: size.height * 0.25,
          decoration: const BoxDecoration(color: primary),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 110,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(balanceLists.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: SizedBox(
                          width: size.width * 0.7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    balanceLists[index]['currency'],
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: index == 0
                                          ? white
                                          : white.withOpacity(0.5),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    balanceLists[index]['amount'],
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: index == 0
                                          ? white
                                          : white.withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                balanceLists[index]['description'],
                                style: TextStyle(
                                  fontSize: 15,
                                  color: white.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: size.width,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: secondary.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                              "Add money",
                              style: TextStyle(
                                  color: white, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: secondary.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                              "Exchange",
                              style: TextStyle(
                                  color: white, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 25, bottom: 40, left: 20, right: 20),
                child: getAccountSection(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getAccountSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Account",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: grey.withOpacity(0.1),
                    spreadRadius: 10,
                    blurRadius: 10),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: secondary.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Icon(
                              AntIcons.wallet,
                              color: primary,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          cardList[0]['card_number'],
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    const Icon(Icons.keyboard_arrow_down,
                        color: primary, size: 20)
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Divider(
                    thickness: 0.2,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: secondary.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.euro_symbol,
                          color: primary,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "${cardList[0]['amount']} Euro",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Divider(
                    thickness: 0.2,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: secondary.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Icon(
                          CommunityMaterialIcons.currency_gbp,
                          color: primary,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "${cardList[2]['amount']} GBP",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Card",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Container(
              width: 90,
              height: 20,
              decoration: BoxDecoration(
                color: secondary.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 16,
                    color: primary,
                  ),
                  Text(
                    "ADD CARD",
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: primary),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () => {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const CardPage()))
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: grey.withOpacity(0.5),
                    spreadRadius: 10,
                    blurRadius: 10)
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: secondary.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(12)),
                            child: const Center(
                              child: Icon(AntIcons.credit_card,
                                  color: primary, size: 20),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text("36.54 GBP",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              )),
                        ],
                      ),
                      const Text("8 199.24 EUR",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
