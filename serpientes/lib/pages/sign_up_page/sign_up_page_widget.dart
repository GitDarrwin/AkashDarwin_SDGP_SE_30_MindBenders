import '../../Utils/auth.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sign_up_page_model.dart';
export 'sign_up_page_model.dart';

class SignUpPageWidget extends StatefulWidget {
  const SignUpPageWidget({Key? key}) : super(key: key);

  @override
  _SignUpPageWidgetState createState() => _SignUpPageWidgetState();
}

class _SignUpPageWidgetState extends State<SignUpPageWidget> {
  late SignUpPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final bool _isLogin = true;
  bool _loading = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _comfirmpasswordController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUpPageModel());

    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
    _model.textController3 ??= TextEditingController();
    _model.textController4 ??= TextEditingController();
    _model.textController5 ??= TextEditingController();
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
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 407.7,
                  height: 852.2,
                  decoration: BoxDecoration(
                    color: Color(0xBACDCBE8BA),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                        child: Image.asset(
                          'assets/images/snake_1.png',
                          width: 144.4,
                          height: 137.8,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Text(
                          'Serpientes',
                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Irish Grover',
                                fontSize: 19.0,
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 190.0, 0.0),
                        child: Text(
                          'Sign Up',
                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                fontSize: 36.0,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 240.0, 0.0),
                        child: Text(
                          'First Name',
                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFFFF0000),
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 25.0, 0.0),
                        child: Container(
                          width: 300.0,
                          child: TextFormField(
                            controller: _model.textController1,
                            autofocus: false,
                            autofillHints: [AutofillHints.email],
                            textCapitalization: TextCapitalization.words,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintStyle: FlutterFlowTheme.of(context).bodyText2,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 14.0,
                                    ),
                            textAlign: TextAlign.center,
                            validator: _model.textController1Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 240.0, 0.0),
                        child: Text(
                          'Last Name',
                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFFFF0000),
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 25.0, 0.0),
                        child: Container(
                          width: 300.0,
                          child: TextFormField(
                            controller: _model.textController2,
                            autofocus: false,
                            textCapitalization: TextCapitalization.words,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintStyle: FlutterFlowTheme.of(context).bodyText2,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 14.0,
                                    ),
                            textAlign: TextAlign.center,
                            validator: _model.textController2Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 270.0, 0.0),
                        child: Text(
                          'E- mail',
                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFFFF0000),
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 25.0, 0.0),
                        child: Container(
                          width: 300.0,
                          child: Autocomplete<String>(
                            initialValue: TextEditingValue(),
                            optionsBuilder: (textEditingValue) {
                              if (textEditingValue.text == '') {
                                return const Iterable<String>.empty();
                              }
                              return ['Option 1'].where((option) {
                                final lowercaseOption = option.toLowerCase();
                                return lowercaseOption.contains(
                                    textEditingValue.text.toLowerCase());
                              });
                            },
                            optionsViewBuilder: (context, onSelected, options) {
                              return AutocompleteOptionsList(
                                textFieldKey: _model.textFieldKey3,
                                textController: _model.textController3!,
                                options: options.toList(),
                                onSelected: onSelected,
                                textStyle: FlutterFlowTheme.of(context).bodyText1,
                                textHighlightStyle: TextStyle(),
                                elevation: 4.0,
                                optionBackgroundColor:
                                    FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                optionHighlightColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                maxHeight: 200.0,
                              );
                            },
                            onSelected: (String selection) {
                              setState(() =>
                                  _model.textFieldSelectedOption3 = selection);
                              FocusScope.of(context).unfocus();
                            },
                            fieldViewBuilder: (
                              context,
                              textEditingController,
                              focusNode,
                              onEditingComplete,
                            ) {
                              _model.textController3 = textEditingController;
                              return TextFormField(

                                key: _model.textFieldKey3,
                                controller: _emailController,
                                focusNode: focusNode,
                                onEditingComplete: onEditingComplete,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: "Enter Valid Email",
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 14.0,
                                    ),
                                textAlign: TextAlign.center,
                                validator: _model.textController3Validator
                                    .asValidator(context),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 250.0, 0.0),
                        child: Text(
                          'Password',
                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFFFF0000),
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 25.0, 0.0),
                        child: Container(
                          width: 300.0,
                          child: TextFormField(
                            controller: _passwordController,
                            autofocus: false,
                            obscureText: !_model.passwordVisibility1,
                            decoration: InputDecoration(
                              hintText: "Enter Valid Password up to 6 characters",
                              hintStyle: FlutterFlowTheme.of(context).bodyText2,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                  () => _model.passwordVisibility1 =
                                      !_model.passwordVisibility1,
                                ),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  _model.passwordVisibility1
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Color(0xFF757575),
                                  size: 22.0,
                                ),
                              ),
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 14.0,
                                    ),
                            textAlign: TextAlign.center,
                            validator: _model.textController4Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 190.0, 0.0),
                        child: Text(
                          'Confirm Password',
                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFFFF0000),
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 25.0, 0.0),
                        child: Container(
                          width: 300.0,
                          child: TextFormField(
                            controller: _comfirmpasswordController,
                            autofocus: false,
                            obscureText: !_model.passwordVisibility2,
                            decoration: InputDecoration(
                              hintText: "Enter Valid Password up to 6 characters",
                              hintStyle: FlutterFlowTheme.of(context).bodyText2,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                  () => _model.passwordVisibility2 =
                                      !_model.passwordVisibility2,
                                ),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  _model.passwordVisibility2
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Color(0xFF757575),
                                  size: 22.0,
                                ),
                              ),
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 14.0,
                                    ),
                            textAlign: TextAlign.center,
                            validator: _model.textController5Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () => handleSubmit(),
                          text: 'Sign Up',
                          options: FFButtonOptions(
                            width: 130.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xCD3E642A),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  handleSubmit() async{
    final email = _emailController.value.text;
    final password = _passwordController.value.text;
    final compassword = _comfirmpasswordController.value.text;

    if((password.length>6) & (password==compassword)){
      setState(() {
        _loading = true;
      });

      //Checking if is login or register
      await Auth().registerWithEmailAndPassword(email, password);

      setState(() {
        _loading = false;
      });

      context.pushNamed('Menue_Option_Page');
    }
  }
}


