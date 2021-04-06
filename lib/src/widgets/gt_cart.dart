import 'package:flutter/material.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
import 'gt_cart_item.dart';
import 'gt_text.dart';

class GtCartDetails extends StatelessWidget {
  double screenWidth, screenHeight;

  final String cartTitle;
  final List<dynamic> items;
  final Map<String, dynamic> itemJsonMap;
  final Function onDeletehandler;
  final Function incrementHandler;
  final Function decrementHandler;
  final int quantityInitialValue;
  final String footertitle;
  final String footerAmount;

  GtCartDetails(
      {this.cartTitle,
      @required this.items,
      @required this.itemJsonMap,
      this.onDeletehandler,
      this.incrementHandler,
      this.decrementHandler,
      this.quantityInitialValue,
      this.footerAmount,
      this.footertitle});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    return Container(
      //padding: EdgeInsets.all(20),
      //width: screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              cartTitle ?? 'Cart',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          Expanded(
              child: Container(
            child: GtListPageGeneric(
              toMapjson: itemJsonMap,
              backNavigation: false,
              listItems: items,
              title: GtText(text: 'Cart'),
              viewtype: ViewType.list,
              isListView: true,
              trailingIcon: GtIcon(
                icondata: Icons.close,
              ),
            ),

            // ListView.builder(
            //     scrollDirection: Axis.vertical,
            //     shrinkWrap: true,
            //     itemCount: items.length,
            //     itemBuilder: (context, index) {
            //       return

            //       GtCartItem(
            //         item: items[index],
            //         itemJsonMap: itemJsonMap,
            //         decrementHandler: decrementHandler,
            //         incrementHandler: incrementHandler,
            //         initialValue: quantityInitialValue,
            //       );
            //     }),
          )),
          Padding(
            padding: EdgeInsets.all(5.00),
            child: Card(
              color: Color(0xff5a5278),
              elevation: 8.0,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GtText(
                                text: footertitle ?? 'Cart Total',
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 2,
                              ),
                              GtText(
                                text: footerAmount != null
                                    ? '\$$footerAmount'
                                    : '\$0',
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ],
                          )),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
