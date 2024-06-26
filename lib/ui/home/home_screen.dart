import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/ui/utils/colors.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            height: Adaptive.sh(2),
          ),
          Container(
              width: context.width(),
              margin: const Pad(all: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: ColorsConstant.secondColorSuperDark, width: 2),
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: const [
                        0,
                        0,
                        1,
                        2,
                        3
                      ],
                      colors: [
                        Colors.transparent.withOpacity(0.8),
                        ColorsConstant.primaryColor.withOpacity(0.8),
                        ColorsConstant.secondColorDark,
                        ColorsConstant.secondColorSuperDark,
                        ColorsConstant.primaryColor.withOpacity(0.8),
                      ])),
              padding: const Pad(all: 25),
              child: ColumnSuper(alignment: Alignment.topLeft, children: [
                Text(
                  "Outstanding Amount".toUpperCase(),
                  style: TextStyle(
                      shadows: const [
                        Shadow(color: Colors.black, blurRadius: 2.0),
                        Shadow(color: Colors.black, blurRadius: 2.0)
                      ],
                      fontWeight: FontWeight.bold,
                      fontSize: Adaptive.sp(18),
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "$currencyRupee 2100000000.00".formatNumberWithComma(),
                  style: TextStyle(
                      shadows: const [
                        Shadow(color: Colors.black, blurRadius: 2.0),
                        Shadow(color: Colors.black, blurRadius: 2.0)
                      ],
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.manrope().fontFamily,
                      fontSize: Adaptive.sp(22),
                      color: Colors.white),
                ),
              ])),
          SizedBox(
            height: 10,
          ),
          homeLayoutWidget(Iconsax.framer_outline, 'Commodity Wise \nLoan', '6',
              callback: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                backgroundColor: Colors.white,
                showDragHandle: true,
                useSafeArea: true,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                builder: (context) => ListView(
                      padding: const Pad(all: 10),
                      children: [
                        RowSuper(fill: true, children: [
                          Text(
                            'Commodity',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Adaptive.sp(16)),
                          ),
                          Text('Amount'.formatNumberWithComma(),
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Adaptive.sp(16)))
                        ]),
                        ListView.builder(
                            itemCount: 50,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) =>
                                RowSuper(fill: true, children: [
                                  Text(
                                    'Barley',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: Adaptive.sp(16)),
                                  ),
                                  Text('2000000'.formatNumberWithComma(),
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: Adaptive.sp(16)))
                                ]))
                      ],
                    ));
          }),
          SizedBox(
            height: 10,
          ),
          homeLayoutWidget(Iconsax.money_remove_outline, 'Unfunded WR', '32'),
          SizedBox(
            height: 10,
          ),
          homeLayoutWidget(LineAwesome.business_time_solid, 'Due Loans', '0'),
          SizedBox(
            height: 10,
          ),
          homeLayoutWidget(
              LineAwesome.business_time_solid, 'M2M Shortfalls', '0')
        ],
      )),
    );
  }

  homeLayoutWidget(IconData iconData, String text, String number,
          {VoidCallback? callback}) =>
      InkWell(
        onTap: callback,
        child: Card(
          color: Colors.white,
          margin: Pad(all: 10),
          elevation: 10,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: ColorsConstant.secondColorSuperDark),
              borderRadius: BorderRadius.circular(10)),
          surfaceTintColor: Colors.white,
          child: Row(children: [
            Container(
              height: Adaptive.sw(15),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.transparent.withOpacity(0.6),
                        ColorsConstant.primaryColor
                      ]),
                  color: ColorsConstant.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: Pad(all: 25),
                child: Icon(
                  iconData,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 1,
                child: Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: Adaptive.sp(19)),
                )),
            Container(
              height: Adaptive.sw(15),
              width: 80,
              decoration: BoxDecoration(
                  color: ColorsConstant.primaryColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              alignment: Alignment.center,
              child: Text(
                number,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Adaptive.sp(20),
                    color: Colors.white),
              ),
            )
          ]),
        ),
      );
}
