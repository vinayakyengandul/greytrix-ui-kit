import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
import 'package:greytrix_ui_kit/src/controllers/filter_controller.dart';

class GtBackDropListView extends StatelessWidget {
  /// Content that should be displayed on the back layer.
  final Widget backLayer;
  ///The widget that is shown on the front layer.
  final Widget frontLayer;
  /// See [Scaffold.primary]. Defaults to true.
  final bool isPrimary;
  /// Indicates the front layer should minimize to the back layer's bottom edge. Otherwise, see [headerHeight] to specify this value. Defaults to false
  final bool stickyFrontLayer;
  /// Title of BackBrop Widget
  final String title;
  /// See [AppBar.actions].
  final List<Widget> actionwidgets;
  /// A key to use when building the [Scaffold].
  final GlobalKey<ScaffoldState> scaffoldKey;
  /// is Back Layer is open or not 
  final bool isBackDrop;
  /// Change the Back Layer and Front Layer Function 
  final Function(bool) changeBackDrop;
  /// See [Scaffold.appBar].
  final BackdropAppBar backdropAppBar;
  /// This Flag is indicate the filter applied or not.
  final bool isFilterApplied;

  GtBackDropListView({
    this.title = '',
    @required this.backLayer,
    @required this.frontLayer,
    this.isPrimary = true,
    this.stickyFrontLayer = true,
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
