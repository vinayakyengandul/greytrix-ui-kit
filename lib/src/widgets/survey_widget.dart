import 'package:flutter/material.dart';
import 'package:easy_web_view/easy_web_view.dart';

class GtSurveyKit extends StatelessWidget {

  GtSurveyKit({
    @required this.apiData,
    @required this.submitData,
  }) : assert(apiData != "" && apiData != null && submitData != null);
  
  /// Survey question data in String format
  final String apiData;
  /// Survey return data function
  final Function(dynamic) submitData;

  @override
  Widget build(BuildContext context) {
    return EasyWebView(
        src: '''<!DOCTYPE html>
              <html lang="en">
              <head>
                  <title>The Survey Page </title>
                  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                  <link href="https://unpkg.com/survey-jquery@1.8.56/modern.css" type="text/css" rel="stylesheet" />
                  <script src="https://unpkg.com/survey-jquery@1.8.56/survey.jquery.min.js"></script>
              </head>
              <body>
                  <div id="surveyContainer"></div>
                  <script>
                      Survey.StylesManager.applyTheme("modern");
                      var surveyJSON = $apiData
                      window.survey = new Survey.Model(surveyJSON);

                      survey.onComplete.add(function (survey, options) {
                        window.parent.postMessage(JSON.stringify(survey.data), '*');  
                        if (window.Test != null) {
                          window.Test.postMessage(JSON.stringify(survey.data));
                        }
                      });
                                            

                      \$("#surveyContainer").Survey({model: survey,});
                  </script>
              </body>
          </html>''',
        key: UniqueKey(),
        isHtml: true, // Use Html syntax
        isMarkdown: false, // Use markdown syntax
        convertToWidgets: false, // Try to convert to flutter widgets
        webAllowFullScreen: false,
        widgetsTextSelectable: false,
        crossWindowEvents: [
          CrossWindowEvent(
              name: 'Test',
              eventAction: (eventMessage) {
                if(submitData != null){
                  submitData(eventMessage);
                }
              }),
        ] ,
        onLoaded: (){
          print("Loaded");
        }
    );
  }
}
