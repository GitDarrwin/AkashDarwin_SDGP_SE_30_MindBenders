import 'dart:io';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:image_picker/image_picker.dart';

import '../../Utils/snakefind.dart';
import '../loading_page/loading_page_widget.dart';
import '../search_page/search_page_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_media.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'recent_page_model.dart';
export 'recent_page_model.dart';

class RecentPageWidget extends StatefulWidget {
  const RecentPageWidget({Key? key}) : super(key: key);

  @override
  _RecentPageWidgetState createState() => _RecentPageWidgetState();
}

class _RecentPageWidgetState extends State<RecentPageWidget> {
  late RecentPageModel _model;
  late var selectedMedia;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecentPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF3E642A),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xBACDCBE8BA),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding:
                    EdgeInsetsDirectional.fromSTEB(270.0, 30.0, 0.0, 0.0),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.home_outlined,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.pushNamed('Menue_Option_Page');
                  },
                ),
              ),
              Padding(
                padding:
                    EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 220.0, 0.0),
                child: Text(
                  'Recent',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        0.0, 50.0, 0.0, 0.0),
                    child: GestureDetector(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  SearchPageWidget(name: "king cobra")),
                        );
                      },
                      child: Image.asset(
                        'assets/images/snake_0.png',
                        width: 189.0,
                        height: 239.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        0.0, 50.0, 0.0, 0.0),
                    child: GestureDetector(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  SearchPageWidget(name: "green pit viper")),
                        );
                      },
                      child: Image.asset(
                        'assets/images/snake_2.png',
                        width: 202.2,
                        height: 240.2,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  SearchPageWidget(name: "indian python")),
                      );
                    },
                    child: Image.asset(
                      'assets/images/snake_3.png',
                      width: 188.8,
                      height: 248.8,
                      fit: BoxFit.cover,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  SearchPageWidget(name: "ptyas mucosa")),
                      );
                    },
                    child: Image.asset(
                      'assets/images/snake_4.png',
                      width: 201.2,
                      height: 250.5,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    try{
                      await pickImage();
                      if(selectedMedia!=null){
                        List result =  await snakeFind().sendImage(selectedMedia);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  LoadingPageWidget(name: result[0],confidence: result[1].round(),)),
                        );
                      }
                    }catch (error){
                      AnimatedSnackBar.material(
                        "Something went wrong !",
                        type: AnimatedSnackBarType.error,
                      ).show(context);
                    }
                  },
                  text: 'Choose From Gallery',
                  options: FFButtonOptions(
                    width: 230.0,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 0.0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF3E642A),
                    textStyle:
                        FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery,maxHeight: 224,maxWidth: 224);

      if (image==null){
        selectedMedia = null;
        return;
      };
      final imageTemp = File(image.path);

      // CroppedFile croppedFile = await ImageCropper().cropImage(
      //   sourcePath: imageFile.path,
      //   aspectRatioPresets: [
      //     CropAspectRatioPreset.square,
      //     CropAspectRatioPreset.ratio3x2,
      //     CropAspectRatioPreset.original,
      //     CropAspectRatioPreset.ratio4x3,
      //     CropAspectRatioPreset.ratio16x9
      //   ],
      //   uiSettings: [
      //     AndroidUiSettings(
      //         toolbarTitle: 'Cropper',
      //         toolbarColor: Colors.deepOrange,
      //         toolbarWidgetColor: Colors.white,
      //         initAspectRatio: CropAspectRatioPreset.original,
      //         lockAspectRatio: false),
      //     IOSUiSettings(
      //       title: 'Cropper',
      //     ),
      //     WebUiSettings(
      //       context: context,
      //     ),
      //   ],
      // );
      setState(() {
        selectedMedia = imageTemp;
      });
    }catch (error){
      print("fails to open");
    }
  }
}
