# CoreListView Widget

The corelistview widget is used represent the List View on the Screen with responsive sizing handle by the greytrix_ui_kit package.

- Benefits of CoreListView Widget
  - Handles the font size of the text field in dynamic way based on the screen resolution.
  - CoreListView theme handles the ThemeData we don`t have to provide theme in CoreListView.
  - CoreListView Handle with Controller we also want to pass CoreBinding in CreatePage binding.
- Constructors:

```
   - [CoreListView](components.md#/corelistview-widget)({
      this.title,
      this.toMapjson,
      this.rowsCount = 2,
      this.cardAspectRatio = 1,
      this.viewType = ViewType.list,
      this.leadingIcon,
      this.trailingIcon,
      this.tag,
      this.enablefilter = false,
      this.backNavigation = false,
      this.pathNavigation = "",
      this.isSpaceInRecords = false,
      this.postfixtitleText,
      this.prefixtitleText,
      this.titletextValuePath,
      this.selectAllcheckboxOption = true,});
```

- Input Parameters of CoreListView Widget

  - **title** - String - The contains ListView Title name.
  - **rowsCount** - int - Called to obtain the number of rows to tell the ListView or GridView. Default value is 2.
  - **cardAspectRatio** - double - The ratio of the cross-axis to the main-axis extent of each child. Default value is 1.
  - **viewType** - ViewType (Enum) - This is for how View is showing (both, list, card). If both is selected than we get both view. Default is ViewType.list.
  - **leadingIcon** - IconData - There is only we have to pass IconData that showing in ListView.
  - **trailingIcon** - IconData - There is only we have to pass IconData that showing in ListView.
  - **tag** - String - This String value taken unique Key as defines which View is showing.
  - **enablefilter** - bool - It is used for the filter option, If true we get Filter option in ListView. Default value is false.
  - **backNavigation** - bool - This containes back navigation arrow button for listview, Default value is false.
  - **pathNavigation** - String - It used for navigate form listview record to given navigation path. if children path is "navigation/:id" this have to pass only "navigation/" this.
  - **isSpaceInRecords** - bool - Listview record between space indicate, Default is spacing value is false.
  - **titletextValuePath** - String - When we have to take Listview title from Response, have to pass this value path.
  - **selectAllcheckboxOption** - bool - This show Listview All Select checkBox, Default is true.
  - **prefixtitleText** - String - It`s containe Listview title prefix text.
  - **postfixtitleText** - String - It`s containe Listview title postfix text.
  - **toMapjson** - Map<String, dynamic> - This contains which fields we have to show in ListView of each row. And we used GtTileField widget check below.

    - Constructor of GtTileField

    ```
       - GtTileField({this.row,
          this.mobileRow,
          this.value,
          this.iconData,
          this.flex = 1,
          this.mobileFlex = 1,
          this.textOverFlow,
          this.displayKey = false,
          this.type = GtFieldType.STRING,
          this.webTextFormatType = TextformatType.caption,
          this.mobileTextFormatType = TextformatType.caption,
          this.keyTextFormatType = TextformatType.caption,
          this.isCardTitle = false,
          this.isCardSubTitle = false,
          this.isBannerField = false,
          this.cardRow,
          this.filterType,
          this.filterItems,
          this.valuePath,
          this.filterValue,
          this.filterLabel,
          this.rangeStart,
          this.rangeEnd,
          this.bannerItems});
    ```

    - Input Parameters of GtTileField Widget

      - **row** - int - This is contains which row have to display this field in web.
      - **mobileRow** - int - This is contains which row have to display this field in mobile.
      - **value** - dynamic - This contains value of the field.
      - **iconData** - IconData - Showing Icon start of the field.
      - **flex** - int - The flex factor to use for this child. This is for Web.
      - **mobileFlex** - int - The mobileFlex factor to use for this child. This is for mobile.
      - **textOverFlow** - TextOverflow - Defaults to retrieving the value from the nearest DefaultTextStyle ancestor.
      - **displayKey** - bool - This is for Display field label name, If displaykey is true than field name is showing with value. Default is false.
      - **type** - GtFieldType - Type of field is defines like Enum(STRING,EMAIL,PHONE,CHIP,BANNER,FILTER).
      - **webTextFormatType** - TextformatType - This defines the which text format is taken. Default is TextformatType.caption for web.
      - **mobileTextFormatType** - TextformatType - This defines the which text format is taken. Default is TextformatType.caption for mobile.
      - **keyTextFormatType** - TextformatType - This defines the which text format is taken. Default is TextformatType.caption for label.
      - **isCardTitle** - bool - This contains field is showing in title or not in Card. Default false.
      - **isCardSubTitle** - bool - This contains field is showing in SubTitle or not in Card. Default false.
      - **isBannerField** - bool - This used for A banner displays a prominent message and related field. Default value is false.
      - **cardRow** - int - This is contains which row have to display this field in card.
      - **filterType** - GtFilterType - This field is used for which type is filter like ( RADIO_BUTTON_FILTER, CHECKBOX_BUTTON_FILTER, RANGE_FILTER, SORT_FILTER,)
      - **filterItems** - Map<String, dynamic> - This is Sort the List as per given sort fields. And also Display the fields in UI.
      - **valuePath** - String - This defines the which is Field map with valuePath.
      - **filterValue** - String - This value is send to the API for this field.
      - **filterLabel** - String - It will show in UI in this filter field.
      - **rangeStart**- String - This is Range Start field name.
      - **rangeEnd** - String - This is Range End field name.
      - **bannerItems** - Map<String, dynamic> - It will show banner Items.

- Constructor of CoreBinding:

```
      - [CoreBinding](components.md#/corelistview-widget)({
         this.entityGQL,
         this.nodeName,
         this.isList = false,
         this.headers,
         this.setHeaders,
         this.enableDefaultHeader = false,
         this.tag,this.filterRangePath,
         this.lookupGQL,
         this.addLookupDataGQL,
         this.controllerType = ControllerType.LIST,
         this.addFormGQL,
         this.toMapfilterjson,
         this.valuePath,
         this.inputType = GtListInputType.GRAPHQL,
         this.inputData});
```

- Input Parameters of CoreBinding Widget

  - **entityGQL** - String - This used for query for Listview data fetch from server, this field is mandatory.
  - **nodeName** - String - It indicates unique key for Listview entityname.
  - **headers** - Map<String, dynamic> - When we have to pass headers to API this will be used.
  - **setHeaders** - Function - This will be function to set headers to API.
  - **enableDefaultHeader** - bool - This is indicated for Headers taken or not, If value is true than DefaultHeader will taken. Default value is false.
  - **tag** - String - It is used for when you want multiple different instance of a same Listview must be unique.
  - **filterRangePath** - Map<String, Map<String, String>> - This is Filter used for RangeValues Filter have to pass Response Key will get data.
  - **lookupGQL** - Map<String, String> - It is used for lookUp data have to pass Query in this lookupGQL.
  - **addLookupDataGQL** - Map<String, String> - It is used for add lookUp data have to pass Query in this addLookupDataGQL.
  - **controllerType** - enum {LIST,FORM} - This is indicate to show Listview or Form, Default is LIST.
  - **addFormGQL** - String - This have to add form view pass GQL Query in this.
  - **toMapfilterjson** - Map<String, GtTileField> - It will show Filter Fields In Filter.
  - **valuePath** - String - This used for particular response data have to taken than pass Path of that response.

- Example

  - Step 1 : Import greytrix_ui_kit in files that it will be used:

  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used CoreListView widget in the Create Page, In CreatePage we have to pass CoreBinding. copy only createPage function.

  ```dart
         createPage("/demo",
             CoreListView(
                  tag: "Demo",
                  title: "Demo",
                  rowsCount: 3,
                  leadingIcon: Icons.account_circle_rounded,
                  trailingIcon: Icons.arrow_forward_ios_rounded,
                  toMapjson: {
                    'DocNo': GtTileField(
                      valuePath: 'DocumentNo',
                      row: 1,
                      mobileRow: 1,
                      cardRow: 1,
                      mobileFlex: 2,
                      isCardTitle: true,
                      type: GtFieldType.STRING,
                      webTextFormatType: TextformatType.headline6,
                    ),
                    'Name': GtTileField(
                      valuePath: 'Customer/Name', // If return single object Customer take value of the object like this Customer/Name
                      row: 2,
                      mobileRow: 2,
                      mobileFlex: 2,
                      cardRow: 1,
                      isCardSubTitle: true,
                      type: GtFieldType.STRING,
                      webTextFormatType: TextformatType.bodyText1,
                    ),
                    "Status": GtTileField(
                                valuePath: "DeliveryStatus",
                                bannerItems: {'Delivered': 'Delivered', 'NotDelivered': 'NotDelivered', 'PartiallyDelivered' : 'PartiallyDelivered'},
                                isBannerField: true,
                              ),
                    "StatusFilter": GtTileField(
                                valuePath: "Status",
                                type: GtFieldType.FILTER,
                                filterType: GtFilterType.RADIO_BUTTON_FILTER,
                                filterItems: {'All': null, 'Delivered': "Delivered", 'NotDelivered': "NotDelivered","PartiallyDelivered":"PartiallyDelivered"},
                                filterValue: 'deliveryStatus',
                                filterLabel: 'Status',
                              ),
                    "SortFilter": GtTileField(
                        filterLabel: "Sort By Field",
                        type: GtFieldType.FILTER,
                        filterType: GtFilterType.SORT_FILTER,
                        filterItems: {
                          'DocumentNo': 'DocumentNo',
                        },
                        filterValue: 'sortField'
                    ),
                  },
                  viewType: ViewType.both,
                  enablefilter: true,
                ),
             binding: [
                     CoreBinding(
                         entityGQL: CustomerOrdersGQL.ORDER_GQL_QUERY, // Pass your GQL
                         isList: true,
                         nodeName: "demo",
                         tag: "demo",
                         enableDefaultHeader: true,),
                   ]
             )

         class CustomerOrdersGQL {
           static const ORDER_GQL_QUERY = '''
                 query(
                   \$limit: Int
                   \$offset: Int
                   \$sort: sortEnumType
                   \$sortField: String
                   \$deliveryStatus: OrderDeliveryStatusEnumType
                 ) {
                   orders: orders(
                     limit: \$limit
                     offset: \$offset
                     sort: \$sort
                     sortField: \$sortField
                     deliveryStatus: \$deliveryStatus
                   ) {
                     DocumentNo
                     DeliveryStatus
                     Customer {
                       Name
                     }
                   }
                 }
               ''';
  }
  ```

  - Step 3 : Result :
    - List View
      ![image](https://user-images.githubusercontent.com/64594463/104177057-33d8b100-542e-11eb-9fd7-e2859a752da3.png)
    - List View With Filter
      ![image](https://user-images.githubusercontent.com/64594463/104183583-2e806400-5438-11eb-9b1e-16c703747d05.png)
    - Card View With Filter
      ![image](https://user-images.githubusercontent.com/64594463/104187331-a1400e00-543d-11eb-8a3b-049495a43509.png)
