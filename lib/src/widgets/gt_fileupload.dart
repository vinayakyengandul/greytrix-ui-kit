import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../../greytrix_ui_kit.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import "package:universal_html/html.dart" as html;
import '../packages/drop_zone/drop_zone.dart';
import 'dart:io';

class GtFileUpload extends StatelessWidget {
  GtFileUpload({
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.black,
    this.onPressed,
    this.selectedFiles,
    this.iconUpload = Icons.cloud_upload,
    this.iconColor = Colors.grey,
    this.iconSize = 100.0,
    this.fileNameShow = true,
    this.buttonColor = Colors.blue,
    this.iconShow = true,
    this.fontSize = 20,
    this.extensions = "pdf",
    this.allowMultiple = true,
  });
  final Color backgroundColor;
  final Color borderColor;
  final Function(dynamic) onPressed;
  final String selectedFiles;
  final IconData iconUpload;
  final Color iconColor;
  final double iconSize;
  final bool fileNameShow;
  final Color buttonColor;
  final bool iconShow;
  final double fontSize;
  final String extensions;
  final bool allowMultiple;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          fileNameShow && selectedFiles != null ? GtText(text: selectedFiles) : Container(),
          iconShow ? Icon(iconUpload,color: iconColor,size: iconSize,) : Container(),
          kIsWeb ?
          DropZone(
            onDragEnter: () {
               
            },
            onDragExit: () {
               
            },
            onDrop: (List<html.File> files) {
              if(onPressed != null)
                onPressed(files);
            },
            child: GtText(text: "Drag and Drop here",textStyle: TextStyle(color: buttonColor,fontSize: fontSize),)
          ): Container(),
          kIsWeb ? GtText(text: "Or",textStyle: TextStyle(color: Colors.black,fontSize: fontSize),): Container(),
           GtButton(
            text: "Browse",
            buttonStyle: ButtonStyle(backgroundColor: MaterialStateProperty.all(buttonColor),textStyle: MaterialStateProperty.all(TextStyle(fontSize: 12))),
            onPressed: () async {
              // ignore: unnecessary_statements
            FilePickerResult result  = (await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowMultiple: allowMultiple,
                allowedExtensions: (extensions?.isNotEmpty ?? false)
                    ? extensions?.replaceAll(' ', '').split(',')
                    : null,
              ));
              if(result != null){
                  //  files = result.map((path) => File(path.bytes,path.name)).toList(); 
                  //  if(onPressed != null)   
                  //  onPressed(files);   
                  dynamic filesList;
                  if(kIsWeb){
                    filesList = result.files.map((path) =>  html.File(path.bytes ,path.name)).toList();    
                  }else{
                    filesList = result.paths.map((path) => File(path)).toList();
                  }
                  if(onPressed != null)
                  onPressed(filesList);      
              }
            },
          ),
        ],
      ),
    );
  }
}