import 'package:flutter/material.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
import 'gt_cart_item.dart';
import 'gt_text.dart';
import 'listview/index.dart';

class GtCartDetails extends StatelessWidget {
  double screenWidth, screenHeight;

  final String cartTitle;
  final List<dynamic> items;
  final Map<String, dynamic> itemJsonMap;
  final Function onDeletehandler;
  final Function(int index) incrementHandler;
  final Function(int index) decrementHandler;
  final int quantityInitialValue;
  final String footertitle;
  final String footerAmount;
  final Function checkallitem;

  GtCartDetails({
    this.cartTitle,
    @required this.items,
    @required this.itemJsonMap,
    this.onDeletehandler,
    this.incrementHandler,
    this.decrementHandler,
    this.quantityInitialValue,
    this.footerAmount,
    this.footertitle,
    this.checkallitem,
  });

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
          items != null && items.length > 0
              ? Expanded(
                  child: Container(
                  child: GtListPage(
                      rowsCount: 1,
                      toMapjson: itemJsonMap,
                      backNavigation: false,
                      listItems: items,
                      title: GtText(text: 'Cart'),
                      viewtype: ViewType.list,
                      isListView: true,
                      quantityInitialValue: quantityInitialValue,
                      incrementHandler: incrementHandler,
                      decrementHandler: decrementHandler,
                      trailingIcon: Icon(Icons.close),
                      onDeleteHandler: onDeletehandler,
                      size: size),
                ))
              : Expanded(child: GtNoListFound()),
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
