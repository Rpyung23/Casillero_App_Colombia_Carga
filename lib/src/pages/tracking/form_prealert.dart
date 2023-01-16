import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:locker/src/bloc/prealert_bloc/prealert_bloc.dart';
import 'package:locker/src/bloc/tracking_bloc/tracking_bloc.dart';
import 'package:locker/src/style/custom.dart';
import 'package:locker/src/style/theme.dart' as Style;

class FormPrealert extends StatefulWidget {
  FormPrealert({Key? key}) : super(key: key);

  @override
  _FormPrealertState createState() => _FormPrealertState();
}

class _FormPrealertState extends State<FormPrealert> {
  final _prealertBloc = PrealertBloc();
  final trackingBloc = TrackingBloc();
  final _formKey = GlobalKey<FormState>();
  final _trackingController = TextEditingController();
  final _contentController = TextEditingController();
  final _instructionController = TextEditingController();
  bool _valueCheck = false;

  @override
  void dispose() {
    _prealertBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildForm();
  }

  Widget _buildForm() {
    return BlocProvider(
      create: (_) => _prealertBloc,
      child: Container(
        padding: EdgeInsets.only(
          top: 30.0,
          left: 30.0,
          right: 30.0,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: BlocListener<PrealertBloc, PrealertState>(
          listener: (context, state) {
            if (state is PrealertSuccess) {
              _trackingController.text = '';
              _contentController.text = '';
              _instructionController.text = '';
              _valueCheck = false;
              trackingBloc.add(GetAllTracking());
              // BlocProvider.of<TrackingBloc>(context).add(GetAllTracking());
            }
          },
          child: BlocBuilder<PrealertBloc, PrealertState>(
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _formprealert(),
                  state is PrealertError
                      ? ListTile(
                          title: Text(state.error!),
                          leading: Icon(
                            FontAwesomeIcons.exclamationCircle,
                            color: Colors.red.shade600,
                          ),
                        )
                      : Container(),
                  state is PrealertSuccess
                      ? ListTile(
                          title: Text('Prealerta realizada con éxito'),
                          leading: Icon(
                            FontAwesomeIcons.checkCircle,
                            color: Style.Colors.successGreen,
                          ),
                        )
                      : Container(),
                  _buttonSave(state),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _formprealert() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _inputTracking(),
          SizedBox(height: 15.0),
          _inputContent(),
          SizedBox(height: 15.0),
          _inputInstruction(),
          _checkDispatch(),
        ],
      ),
    );
  }

  Widget _inputTracking() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'El tracking es obigatorio';
        }
        return null;
      },
      controller: _trackingController,
      style: TextStyle(
        fontSize: 15.0,
        color: Style.Colors.titleColor,
      ),
      keyboardType: TextInputType.text,
      decoration: styleInput("Número de tracking", FontAwesomeIcons.mapMarked),
      autocorrect: false,
    );
  }

  Widget _inputContent() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'El contenido es obigatorio';
        }
        return null;
      },
      controller: _contentController,
      style: TextStyle(
        fontSize: 15.0,
        color: Style.Colors.titleColor,
      ),
      keyboardType: TextInputType.text,
      decoration: styleInput('Contenido', FontAwesomeIcons.box),
      autocorrect: false,
    );
  }

  Widget _inputInstruction() {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      maxLines: 5,
      controller: _instructionController,
      style: TextStyle(
        fontSize: 15.0,
        color: Style.Colors.titleColor,
      ),
      keyboardType: TextInputType.text,
      decoration: styleInput('Instrucción', FontAwesomeIcons.listAlt),
      autocorrect: false,
    );
  }

  Widget _checkDispatch() {
    return SwitchListTile(
      title: Text('Despachar'),
      value: _valueCheck,
      activeColor: Style.Colors.mainColor,
      inactiveThumbColor: Style.Colors.strongGrey,
      inactiveTrackColor: Style.Colors.grey,
      onChanged: (value) {
        setState(() {
          _valueCheck = value;
        });
      },
    );
  }

  Widget _buttonSave(PrealertState state) {
    return Padding(
      padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          state is PrealertLoading
              ? _showLoading()
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15.0),
                    primary: Style.Colors.mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    "Prealertar",
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    _prealertBloc.add(
                      SavePrealert(
                        _trackingController.text,
                        _contentController.text,
                        _instructionController.text,
                        _valueCheck,
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }

  Widget _showLoading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 25.0,
              width: 25.0,
              child: CupertinoActivityIndicator(),
            )
          ],
        ))
      ],
    );
  }
}
