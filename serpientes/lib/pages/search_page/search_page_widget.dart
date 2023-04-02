import 'package:cloud_firestore/cloud_firestore.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_page_model.dart';
export 'search_page_model.dart';

class SearchPageWidget extends StatefulWidget {
  final String? name;
  const SearchPageWidget({Key? key, this.name}) : super(key: key);

  @override
  _SearchPageWidgetState createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  late SearchPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  Map<String, dynamic>? searchedSnake;
  TextEditingController search = TextEditingController();

  getSnake(String name) async {
    QuerySnapshot<Map<String, dynamic>> snap =
    await FirebaseFirestore.instance
        .collection("Sankes")
        .where('Name', isEqualTo: name.toLowerCase())
        .get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>>
    snakes = snap.docs;
    if (snakes.isNotEmpty) {
      setState(() {
        searchedSnake = snakes[0].data();
      });
    } else {
      setState(() {
        searchedSnake = null;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchPageModel());

    _model.textController ??= TextEditingController();
    _model.textController.text = widget.name ?? '';
    if(widget.name != null){
      getSnake(widget.name!);
    }
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      270.0, 20.0, 0.0, 0.0),
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
                  EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Text(
                    'Search Snake',
                    style:
                    FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Container(
                    width: 300.0,
                    child: TextFormField(
                      controller: _model.textController,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textController',
                        Duration(milliseconds: 2000),
                            () => setState(() {}),
                      ),
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Search Here...',
                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        filled: true,
                        suffixIcon: Icon(
                          Icons.search,
                          color: Color(0xFF757575),
                          size: 22.0,
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                      validator: _model.textControllerValidator
                          .asValidator(context),
                      onFieldSubmitted: (val) async {
                        await getSnake(val);
                      },
                    ),
                  ),
                ),
                if(searchedSnake != null)
                  Padding(
                    padding:
                    EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Text(
                      searchedSnake?['Name'] ?? '',
                      style:
                      FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,

                      ),
                    ),
                  ),
                if(searchedSnake != null)
                  Padding(
                    padding:
                    EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: searchedSnake == null
                          ? Image.asset(
                        'assets/images/cobra.png',
                        width: 226.5,
                        height: 174.4,
                        fit: BoxFit.cover,
                      )
                          : Image.network(
                        searchedSnake!['image'],
                        width: 296.5,
                        height: 204.4,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                if(searchedSnake != null)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        0.0, 25.0, 235.0, 0.0),
                    child: Text(
                      'Description',
                      style:
                      FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily: 'Poppins',
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                if(searchedSnake != null)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        25.0, 12.0, 15.0, 0.0),
                    child: Text(
                      searchedSnake?['Description'] ?? '',
                      textAlign: TextAlign.start,
                      style:
                      FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Divider(
                    thickness: 3.0,
                  ),
                ),
                if(searchedSnake != null)
                  Padding(
                    padding:
                    EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: Text(
                      'Scientific Name: ${searchedSnake?['Scientific Name'] ?? ''}',
                      style:
                      FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                if(searchedSnake != null)
                  Text(
                    'Venom : Highly Venomous',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      fontSize: 16.0,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}