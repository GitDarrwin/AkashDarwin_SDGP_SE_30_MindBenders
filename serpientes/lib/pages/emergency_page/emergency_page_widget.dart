import 'package:animated_snack_bar/animated_snack_bar.dart';
import '../../flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'emergency_page_model.dart';
export 'emergency_page_model.dart';

class EmergencyPageWidget extends StatefulWidget {
  const EmergencyPageWidget({Key? key}) : super(key: key);

  @override
  _EmergencyPageWidgetState createState() => _EmergencyPageWidgetState();
}

class _EmergencyPageWidgetState extends State<EmergencyPageWidget> {
  late EmergencyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmergencyPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      AnimatedSnackBar.material(
        "Direct Emergency Medical Services",
        type: AnimatedSnackBarType.error,
      ).show(context);
      await Future.delayed(const Duration(milliseconds: 2000));
      await launchUrl(Uri(
        scheme: 'tel',
        path: '1990',
      ));
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromARGB(255, 26, 153, 68),
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
                padding: EdgeInsetsDirectional.fromSTEB(270.0, 30.0, 0.0, 0.0),
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 150.0, 0.0, 0.0),
                child: Text(
                  'Calling 1990......',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image.asset(
                    'assets/images/ambulance.png',
                    width: 321.5,
                    height: 161.1,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
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
}
