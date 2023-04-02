import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'medical_help_page_model.dart';
export 'medical_help_page_model.dart';

class MedicalHelpPageWidget extends StatefulWidget {
  const MedicalHelpPageWidget({Key? key}) : super(key: key);

  @override
  _MedicalHelpPageWidgetState createState() => _MedicalHelpPageWidgetState();
}

class _MedicalHelpPageWidgetState extends State<MedicalHelpPageWidget> {
  late MedicalHelpPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MedicalHelpPageModel());
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
              Text(
                'Medical Help',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
              ),
              Padding(
                padding:
                    EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  child: FlutterFlowWebView(
                    url:
                        'https://www.cdc.gov/niosh/topics/snakes/symptoms.html#:~:text=Seek%20medical%20attention%20as%20soon,from%20venom%20can%20be%20stopped.',
                    bypass: false,
                    height: double.infinity-167,
                    verticalScroll: true,
                    horizontalScroll: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
