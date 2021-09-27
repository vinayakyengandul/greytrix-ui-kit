import 'package:get/get.dart';
import '../controllers/faq_page_controller.dart';

class FAQPageBinding extends Bindings {
  FAQPageBinding({
    this.entityGQL,
    this.itemData,
    this.tag,
  }) : assert(entityGQL != null);

  final String entityGQL;
  final Map<String, dynamic> itemData;
  final String tag;

  @override
  void dependencies() {
    print('tag inside FAQ binding');
    Get.lazyPut<FAQPageController>(() => FAQPageController(
          entityGQL: entityGQL,
          itemData: itemData,
        ));
  }
}
