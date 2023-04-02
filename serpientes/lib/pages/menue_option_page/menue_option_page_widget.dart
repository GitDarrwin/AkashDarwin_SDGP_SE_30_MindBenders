import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../Utils/snakefind.dart';
import '../loading_page/loading_page_widget.dart';
import '../m_l_page/m_l_page_widget.dart';
import '../sign_in_page/sign_in_page_widget.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_media.dart';
import 'package:flutter/material.dart';
import 'menue_option_page_model.dart';
export 'menue_option_page_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';



class MenueOptionPageWidget extends StatefulWidget {
  const MenueOptionPageWidget({Key? key}) : super(key: key);

  @override
  _MenueOptionPageWidgetState createState() => _MenueOptionPageWidgetState();
}

class _MenueOptionPageWidgetState extends State<MenueOptionPageWidget> {
  late MenueOptionPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  late var  selectedMedia;

  String? name_email= FirebaseAuth.instance.currentUser?.email;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenueOptionPageModel());
  }

  // loadModel() async {
  //   Tflite.close();
  //   try{
  //      await Tflite.loadModel(
  //         model: "assets/modelmobile.tflite",
  //         labels: "assets/labels.txt",
  //         numThreads: 1, // defaults to 1
  //         isAsset: true, // defaults to true, set to false to load resources outside assets
  //         useGpuDelegate: false // defaults to false, set to true to use GPU delegate
  //     );
  //      print("load model");
  //   } catch(error){
  //     print(error);
  //   }
  // }

  // runPathImage(String filepath) async {
  //   print(filepath);
  //   // int startTime = new DateTime.now().millisecondsSinceEpoch;
  //   var recognitions = await Tflite.runModelOnImage(
  //       path: filepath,   // required
  //       imageMean: 117.0,   // defaults to 117.0
  //       imageStd: 1.0,  // defaults to 1.0
  //       numResults: 5,    // defaults to 5
  //       threshold: 0.1,   // defaults to 0.1
  //       asynch: true      // defaults to true
  //   );
  //
  //   // int endTime = new DateTime.now().millisecondsSinceEpoch;
  //   // print("Inference took ${endTime - startTime}ms");
  //    setState(() {
  //     _classifiedResult = recognitions!;
  //     print(recognitions);
  //     // recognitions?.map((result){
  //     //   print(result["label"]);
  //     // });
  //   });
  // }

  // Future<void> sendImage(File imageFile) async {
  //   // Define endpoint URL
  //   var request = http.MultipartRequest('POST', Uri.parse('http://localhost:4000/predict'));
  //   request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));
  //
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     result= await response.stream.bytesToString();
  //   }
  //   else {
  //     print(response.reasonPhrase);
  //   }
  //
  //   // try {
  //   //   // Create multipart request
  //   //   final request = http.MultipartRequest('POST', Uri.parse(endpoint));
  //   //
  //   //   // Add image file to request
  //   //   final bytes = await imageFile.readAsBytes();
  //   //   final image = http.MultipartFile.fromBytes('image', bytes);
  //   //   request.files.add(image);
  //   //
  //   //   // Send request to Flask app
  //   //   final response = await request.send();
  //   //
  //   //   // Read response from Flask app
  //   //   final String responseString = await response.stream.bytesToString();
  //   //
  //   //   // Parse JSON response
  //   //   final jsonResponse = json.decode(responseString);
  //   //
  //   //   // Get predicted class and confidence level
  //   //   final predictedClass = jsonResponse['predicted_class'];
  //   //   final confidenceLevel = jsonResponse['confidence_level'];
  //   //
  //   //   // Do something with prediction results
  //   //   print('Predicted class: $predictedClass');
  //   //   print('Confidence level: $confidenceLevel');
  //   // } catch (error) {
  //   //   print('Error sending image: $error');
  //   // }
  // }


  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

 //google sing out service
  Future<void> logout() async {
    final GoogleSignIn googleSign = GoogleSignIn();
    await googleSign.signOut();
  }

  Future<void> pickImage() async {
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.camera,maxHeight: 224,maxWidth: 224);

      if (image==null){
        selectedMedia = null;
        return;
      };
      final imageTemp = File(image.path);
      setState(() {
        selectedMedia = imageTemp;
      });
    }catch (error){
      print("fails to open");
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async { return false; },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color.fromARGB(255, 26, 153, 68),
        drawer: Container(
          width: 220.0,
          child: Drawer(
            elevation: 10.0,
            child: Container(
              height: height,
              decoration: BoxDecoration(
                color: Color(0xCDCBE8BA),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                    child: Container(
                      width: 120.0,
                      height: 120.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/'+random_avatar()+'.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Text(
                      name_email!,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 13.0,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                  Divider(
                    thickness: 3.0,
                  ),
                  InkWell(
                    onTap: () async {
                      context.pushNamed('Medical_Help_Page');
                    },
                    child: ListTile(
                      title: Text(
                        'Medical Help',
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Poppins',
                              fontSize: 18.0,
                            ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20.0,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      context.pushNamed('Emergency_Page');
                    },
                    child: ListTile(
                      title: Text(
                        'Emergency',
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Poppins',
                              fontSize: 18.0,
                            ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20.0,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      context.pushNamed('About_Us_Page');
                    },
                    child: ListTile(
                      title: Text(
                        'About us',
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Poppins',
                              fontSize: 18.0,
                            ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20.0,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      //Use this log out user
                      await logout();
                      FirebaseAuth.instance.signOut();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  SignInPageWidget()),
                      );
                      AnimatedSnackBar.material(
                        'Successfully SignOut',
                        type: AnimatedSnackBarType.info,
                      ).show(context);
                    },
                    title: Text(
                      'Sign out',
                      style: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: 'Poppins',
                            fontSize: 18.0,
                          ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF303030),
                      size: 20.0,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                  Divider(
                    thickness: 3.0,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 280, 0.0, 0.0),
                    child: ListTile(
                      onTap: () {
                        if (Platform.isAndroid) {
                          SystemNavigator.pop();
                        } else if (Platform.isIOS) {
                          exit(0);
                        }
                      },
                      title: Text(
                        'Exit',
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFFFF0000),
                              fontSize: 17.0,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20.0,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Color(0xCDCBE8BA),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0, 0.0, 340.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.drag_handle,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      scaffoldKey.currentState!.openDrawer();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0, 125.0, 0.0, 0.0),
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
                    text: 'Take an Image',
                    options: FFButtonOptions(
                      width: 230.0,
                      height: 50.0,
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 0.0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF3E642A),
                      textStyle: FlutterFlowTheme.of(context)
                          .subtitle2
                          .override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0, 50.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('Recent_Page');
                    },
                    text: 'Upload an image',
                    options: FFButtonOptions(
                      width: 230.0,
                      height: 50.0,
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 0.0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF3E642A),
                      textStyle: FlutterFlowTheme.of(context)
                          .subtitle2
                          .override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0, 50.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('Search_Page');
                    },
                    text: 'Snake Details',
                    options: FFButtonOptions(
                      width: 230.0,
                      height: 50.0,
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 0.0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF3E642A),
                      textStyle: FlutterFlowTheme.of(context)
                          .subtitle2
                          .override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0, 50.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('Emergency_Page');
                    },
                    text: 'Emergency',
                    options: FFButtonOptions(
                      width: 230.0,
                      height: 50.0,
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 0.0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFFFF0000),
                      textStyle: FlutterFlowTheme.of(context)
                          .subtitle2
                          .override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0, 60.0, 0.0, 0.0),
                  child: Image.asset(
                    'assets/images/snake_1.png',
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0, 20.0, 0.0, 0.0),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed('About_Us_Page');
                    },
                    child: Text(
                      'About Us',
                      style: FlutterFlowTheme.of(context)
                          .bodyText1
                          .override(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //getting random avatar image
  String random_avatar() {
    final random = new Random();
    var list=["avatar1","avatar2","avatar3","avatar4"];
    var i = random.nextInt(list.length);
    return list[i];
  }
}
