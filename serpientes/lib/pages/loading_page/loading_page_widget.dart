import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/scheduler.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../m_l_page/m_l_page_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loading_page_model.dart';
export 'loading_page_model.dart';
import 'package:tb_custom_dialog_box/tb_custom_dialog_box.dart';

class LoadingPageWidget extends StatefulWidget {
  final String name;
  final int confidence;
  const LoadingPageWidget( {Key? key, required this.name, required this.confidence}) : super(key: key);

  @override
  _LoadingPageWidgetState createState() => _LoadingPageWidgetState(name,confidence);
}

class _LoadingPageWidgetState extends State<LoadingPageWidget> {
  late LoadingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  _LoadingPageWidgetState(this.name, int this.confidence);
  final int confidence;
  final String name;
  late List snakeDetails;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingPageModel());
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 2000));
      if (confidence > 40 ){
        await gettingSnakeDetails();
        AnimatedSnackBar.material(
          "Result Found!",
          type: AnimatedSnackBarType.info,
        ).show(context);
        dialogboxpopup(name,confidence);
      }else{
        AnimatedSnackBar.material(
          "Result not Found!",
          type: AnimatedSnackBarType.error,
        ).show(context);
        await Dialogs.materialDialog(

            msg: "Can't find type of Snake !!",
            title: "Cant' Find",
            color: Colors.white,
            context: context,
            titleStyle: FlutterFlowTheme.of(context).bodyText1.override(
              fontFamily: 'Poppins',
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
            msgStyle: FlutterFlowTheme.of(context).bodyText1.override(
              fontFamily: 'Poppins',
              fontSize: 16.0,
            ),
            msgAlign: TextAlign.center,
            actions: [
              IconsButton(
                onPressed: () {
                  context.pushNamed('Menue_Option_Page');
                },
                text: 'Ok',
                iconData: Icons.tag_faces_rounded,
                color: Colors.red,
                textStyle: TextStyle(color: Colors.white),
                iconColor: Colors.white,
              ),
            ]);
      }

      // context.goNamed('Menue_Option_Page');
    });
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
      backgroundColor: Color.fromARGB(255, 26, 153, 68),
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
                    EdgeInsetsDirectional.fromSTEB(270.0, 20.0, 0.0, 0.0),
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
                    EdgeInsetsDirectional.fromSTEB(0.0, 190.0, 0.0, 0.0),
                child: LoadingAnimationWidget.inkDrop(
                  color: Color.fromARGB(255, 26, 153, 68),
                  size: 90,
                ),
              ),
              Padding(
                padding:
                    EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                child: Text(
                  'Processing',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 180, 0.0, 0.0),
                child: Image.asset(
                  'assets/images/snake_1.png',
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void dialogboxpopup(String snakeName, int confidence) async {
        await Dialogs.materialDialog(
          useSafeArea: false,
          msg: "Prediction Level : "+confidence.toString()+'%\n\nDo you want more Details ?',
          title: widget.name,
          color: Colors.white,
          context: context,
          msgAlign: TextAlign.center,
          titleStyle: FlutterFlowTheme.of(context).bodyText1.override(
          fontFamily: 'Poppins',
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
          msgStyle: FlutterFlowTheme.of(context).bodyText1.override(
          fontFamily: 'Poppins',
          fontSize: 17.0,
        ),
          actions: [
            IconsOutlineButton(
              onPressed: () {
                context.pushNamed('Menue_Option_Page');
              },
              text: 'No',
              color: Colors.red,
              iconData: Icons.cancel_outlined,
              textStyle: TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
            IconsButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  MLPageWidget(snakeDetails)),
                );
              },
              text: 'ok',
              iconData: Icons.tag_faces_rounded,
              color: Colors.green,
              textStyle: TextStyle(
                  color: Colors.white
              ),
              iconColor: Colors.white,
            ),
          ]);
  }

  Future<void> gettingSnakeDetails() async {
    QuerySnapshot<Map<String, dynamic>> snap =
        await FirebaseFirestore.instance
        .collection("Sankes")
        .where('Name', isEqualTo: name.toLowerCase())
        .get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>>
    snakes = snap.docs;
    if (snakes.isNotEmpty) {
      setState(() {
        var searchedSnake = snakes[0].data();
        snakeDetails = [name,searchedSnake['image'],searchedSnake['Description'] ?? '',searchedSnake['Scientific Name'] ?? ''];
      });
    }

  }
}
