import 'package:flutter/material.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

class GtCartItem extends StatelessWidget {
  double screenWidth, screenHeight;

  final dynamic item;
  final Map<String, dynamic> itemJsonMap;
  final Function incrementHandler;
  final Function decrementHandler;
  final int initialValue;

  GtCartItem({
    this.item,
    this.itemJsonMap,
    this.incrementHandler,
    this.decrementHandler,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    List<Widget> listWidgets = List<Widget>.empty(growable: true);

    String imagePath;
    String titleText;
    // String statusText;
    String priceValuetext;
    // String text;

    Widget imageWidget;
    Widget titleWidget;
    Widget statusText;
    Widget priceWidget;
    Widget text;

    // ADD IMAGE TO THE CARD
    itemJsonMap.forEach((key, value) {
      if (value.valuePath != null) {
        switch (value.type) {
          case GtCartFieldType.IMAGE:
            imagePath = Common.getValue(item, value.valuePath);
            imageWidget = screenWidth < 450
                ? Container(
                    padding: EdgeInsets.all(5.0),
                    width: (MediaQuery.of(context).size.width) / 3,
                    child: Column(
                      children: <Widget>[
                        GtImageCard(
                          imageURL:
                              Common.getValue(item, value.valuePath).toString(),
                        ),
                        // Container(
                        //   margin: EdgeInsets.only(
                        //       right: 8, left: 0, top: 8, bottom: 2),
                        //   width: 70,
                        //   height: 80,
                        //   decoration: BoxDecoration(
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(14)),
                        //       color: Colors.blue.shade200,
                        //       image: DecorationImage(
                        //         fit: BoxFit.fill,
                        //         image: imagePath != null
                        //             ? NetworkImage(
                        //                 Common.getValue(item, value.valuePath)
                        //                     .toString())
                        //             : AssetImage(
                        //                 "assets/images/product.png",
                        //                 package: 'greytrix_ui_kit',
                        //               ),
                        //       )),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.all(5.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     children: <Widget>[
                        //       IconButton(
                        //         icon: Icon(Icons.remove_circle_outline),
                        //         onPressed: () {},
                        //       ),
                        //       Text(
                        //         '1',
                        //         style: TextStyle(
                        //             fontSize: 18,
                        //             fontWeight: FontWeight.normal),
                        //       ),
                        //       IconButton(
                        //         icon: Icon(Icons.add_circle_outline),
                        //         onPressed: () {},
                        //       ),
                        //     ],
                        //   ),
                        // )
                        GtCartQuantity(
                          decrementHandler: decrementHandler,
                          incrementHandler: incrementHandler,
                        )
                      ],
                    ))
                : Container(
                    padding: EdgeInsets.all(2.0),
                    width: (MediaQuery.of(context).size.width) / 3,
                    child: Column(children: <Widget>[
                      GtImageCard(
                        imageURL:
                            Common.getValue(item, value.valuePath).toString(),
                      )
                    ]));
            // Container(
            //   padding: EdgeInsets.all(10.0),
            //   margin: EdgeInsets.only(right: 8, left: 0, top: 8, bottom: 2),
            //   width: 100,
            //   height: 80,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.all(Radius.circular(14)),
            //       color: Colors.blue.shade200,
            //       image: DecorationImage(
            //         fit: BoxFit.fill,
            //         image: imagePath != null
            //             ? NetworkImage(
            //                 Common.getValue(item, value.valuePath).toString())
            //             : AssetImage(
            //                 "assets/images/product.png",
            //                 package: 'greytrix_ui_kit',
            //               ),
            //       )),
            // );
            break;

          case GtCartFieldType.TITLE:
            titleText = Common.getValue(item, value.valuePath).toString();
            titleWidget = Expanded(
              flex: screenWidth < 450 ? 1 : 4,
              child: Container(
                padding: EdgeInsets.all(5.0),
                width: 150,
                child: Text(
                  titleText,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            );
            break;

          case GtCartFieldType.AMOUNT:
            priceValuetext = Common.getValue(item, value.valuePath).toString();
            priceWidget = Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "\$$priceValuetext",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ));
            // ]));
            break;

          default:
            priceValuetext = Common.getValue(item, value.valuePath).toString();
            text = Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "$priceValuetext",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ));
            listWidgets.add(text);
            break;
        }
      }
    });

    return Container(
      width: screenWidth,
      height: screenWidth < 450 ? 150 : 100,
      margin: EdgeInsets.symmetric(vertical: 8),
      //padding: EdgeInsets.symmetric(horizontal: 10),
      // padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(14)),
        color: Colors.white,
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imageWidget,
            if (size.width < 450)
              Container(
                  padding: EdgeInsets.all(2.0),
                  width: (MediaQuery.of(context).size.width) / 3,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[titleWidget, text, priceWidget])),
            if (size.width > 450) titleWidget,
            if (size.width > 450) priceWidget,
            if (size.width > 450)
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.remove_circle_outline),
                          onPressed: () {},
                        ),
                        Text(
                          '1',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                        IconButton(
                          icon: Icon(Icons.add_circle_outline),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )),
            if (size.width > 450) text,
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        size: 26,
                      ),
                      onPressed: () {},
                    ),
                  ],
                )),
          ]),
    );
  }
}
