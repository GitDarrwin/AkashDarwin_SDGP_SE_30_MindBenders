import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'about_us_page_model.dart';
export 'about_us_page_model.dart';


class AboutUsPageWidget extends StatefulWidget {
  const AboutUsPageWidget({Key? key}) : super(key: key);

  @override
  _AboutUsPageWidgetState createState() => _AboutUsPageWidgetState();
}

class _AboutUsPageWidgetState extends State<AboutUsPageWidget> {
  late AboutUsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AboutUsPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF3E642A),
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
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
                  buttonSize: 50.0,
                  icon: Icon(
                    Icons.home_outlined,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 40.0,
                  ),
                  onPressed: () async {
                    context.pushNamed('Menue_Option_Page');
                  },
                ),
              ),
              Padding(
                padding:
                    EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 0.0),
                child: Text(
                  'Who we are?',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: Text(
                  'Mind Benders',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        fontSize: 25.0,
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.underline,
                      ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsetsDirectional.fromSTEB(40.0, 40.0, 30.0, 0.0),
                child: Text(
                  'Mind Benders a  bunch of second-year university students\nfollowing the B Eng (Hons) Software Engineering degree at the Informatics Institute of Technology affiliated with the University of Westminster, UK.  ',
                  textAlign: TextAlign.justify,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        fontSize: 15.5,
                      ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        25.0, 40.0, 0.0, 0.0),
                    child: Image.asset(
                      'assets/images/akash.png',
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        20.0, 35.0, 0.0, 0.0),
                    child: Image.asset(
                      'assets/images/tharusha.png',
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        20.0, 30.0, 0.0, 0.0),
                    child: Image.asset(
                      'assets/images/dumidu.png',
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        35.0, 10.0, 0.0, 0.0),
                    child: Text(
                      'Akash Dawrin',
                      style:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                fontSize: 13.0,
                              ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        40.0, 10.0, 0.0, 0.0),
                    child: Text(
                      'Tharusha \nGunawardana',
                      textAlign: TextAlign.center,
                      style:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                fontSize: 13.0,
                              ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        55.0, 10.0, 0.0, 0.0),
                    child: Text(
                      'Dumidu \nFernando',
                      textAlign: TextAlign.center,
                      style:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                fontSize: 13.0,
                              ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          60.0, 0.0, 0.0, 0.0),
                      child: Image.asset(
                        'assets/images/dinil.png',
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          65.0, 0.0, 0.0, 0.0),
                      child: Image.asset(
                        'assets/images/tharkana.png',
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        80.0, 10.0, 0.0, 0.0),
                    child: Text(
                      'Dinil Perera',
                      style:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                fontSize: 13.0,
                              ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        80.0, 10.0, 0.0, 0.0),
                    child: Text(
                      'Tharkana Prabhath',
                      style:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                fontSize: 13.0,
                              ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
