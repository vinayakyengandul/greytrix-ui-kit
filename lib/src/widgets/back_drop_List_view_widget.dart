import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
import 'package:greytrix_ui_kit/src/controllers/filter_controller.dart';

class GtBackDropListView extends StatelessWidget {
  final Widget backLayer;
  final Widget frontLayer;
  final bool isPrimary;
  final bool stickyFrontLayer;
  final String title;
  final double headerHeight;
  final List<Widget> actionwidgets;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool isBackDrop;
  final Function(bool) changeBackDrop;
  final BackdropAppBar backdropAppBar;
  final bool isFilterApplied;

  GtBackDropListView({
    this.title = '',
    @required this.backLayer,
    @required this.frontLayer,
    this.isPrimary = true,
    this.stickyFrontLayer = true,
    this.headerHeight = 100.0,
    @required this.actionwidgets,
    @required this.scaffoldKey,
    this.isBackDrop = false,
    this.changeBackDrop,
    this.backdropAppBar,
    this.isFilterApplied = false,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      scaffoldKey: scaffoldKey,
      backLayerBackgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: backdropAppBar ?? BackdropAppBar(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(5),
          ),
        ),
        bottom: PreferredSize(
            child: Container(
              color: Theme.of(context).primaryColor,
              height: 2.0,
            ),
            preferredSize: Size.fromHeight(4.0)),
        title: GtText(
          text: title,
          textStyle: Theme.of(context).textTheme.headline6,
        ),
        backgroundColor: Theme.of(context).cardColor,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          if (actionwidgets != null) ...actionwidgets,
          IconButton(
              onPressed: () {
                Backdrop.of(scaffoldKey.currentContext).fling();
                if(changeBackDrop != null)
                changeBackDrop(isBackDrop == true ? false : true);
              },
              icon: GtIcon(
                icondata: !isBackDrop ? Icons.filter_alt : Icons.close,
                color: isFilterApplied ? Theme.of(context).toggleableActiveColor : Theme.of(context).iconTheme.color,
              ))
        ],
      ),
      primary: isPrimary,
      stickyFrontLayer: stickyFrontLayer,
      backLayer: backLayer,
      frontLayer: frontLayer,
    );
  }
}
