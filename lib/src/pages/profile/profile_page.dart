import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:locker/src/style/theme.dart' as Style;

import '../../models/city/data_city_model.dart';
import '../../models/profile_user_model.dart';
import '../../repositories/users.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  bool isCompania = false;

  TextEditingController _editingControllerPrimerNombre =
      new TextEditingController();
  TextEditingController _editingControllerSegundoNombre =
      new TextEditingController();
  TextEditingController _editingControllerCiudad = new TextEditingController();
  TextEditingController _editingControllerDireccion =
      new TextEditingController();
  TextEditingController _editingControllerCodePostal =
      new TextEditingController();
  TextEditingController _editingControllerCelular = new TextEditingController();
  TextEditingController _editingControllerEmail = new TextEditingController();
  TextEditingController _editingControllerConfirEmail =
      new TextEditingController();
  TextEditingController _editingControllerTelefono =
      new TextEditingController();

  TextEditingController _editingControllerDniMit = new TextEditingController();

  final _formKeyRegister = GlobalKey<FormState>();

  ProfileUser? oP;
  DataCity? oD;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _readProfileUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        elevation: 1,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10, right: 15, left: 15),
        child: Column(
          children: [
            Form(
                key: widget._formKeyRegister,
                child: Flexible(
                  child: _getBodyUpdateProfile(),
                )),
            _buttonUpdateProfile()
          ],
        ),
      ),
    );
  }

  _getBodyUpdateProfile() {
    return ListView(
      children: [
        Visibility(
            visible: widget.isCompania,
            child: Column(
              children: [
                TextField(
                  controller: widget._editingControllerPrimerNombre,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'Primer nombre',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellowAccent))),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            )),
        Visibility(
          visible: widget.isCompania,
          child: Column(
            children: [
              TextField(
                controller: widget._editingControllerSegundoNombre,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'Primer Apellido',
                    prefixIcon: Icon(Icons.person),
                    suffixIconColor: Colors.red,
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
        Visibility(
          visible: !widget.isCompania,
          child: Column(
            children: [
              TextField(
                controller: widget._editingControllerPrimerNombre,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'Razón Social',
                    prefixIcon: Icon(Icons.text_format),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellowAccent))),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
        TextField(
          controller: widget._editingControllerDniMit,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              hintText: 'DNI o NIT',
              prefixIcon: Icon(Icons.badge),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellowAccent))),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: widget._editingControllerCiudad,
          keyboardType: TextInputType.text,
          onTap: () async {
            var response = await Navigator.pushNamed(context, 'city');

            if (response != null) {
              widget.oD = DataCity.fromJson(response!.toString());
              widget._editingControllerCiudad.text = widget.oD!.name!;
            }
          },
          decoration: InputDecoration(
              hintText: 'Buscar Ciudad',
              prefixIcon: Icon(Icons.location_city),
              suffixIconColor: Colors.red,
              border: OutlineInputBorder()),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: widget._editingControllerDireccion,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: 'Dirección',
              prefixIcon: Icon(Icons.directions),
              suffixIconColor: Colors.red,
              border: OutlineInputBorder()),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: widget._editingControllerCodePostal,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              hintText: 'Código Postal',
              prefixIcon: Icon(Icons.numbers),
              suffixIconColor: Colors.red,
              border: OutlineInputBorder()),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: widget._editingControllerTelefono,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
              hintText: 'Celular',
              prefixIcon: Icon(Icons.phone),
              suffixIconColor: Colors.red,
              border: OutlineInputBorder()),
        ),
        /*SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: widget._editingControllerEmail,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Campo obligatorio';
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
              hintText: 'Email',
              prefixIcon: Icon(Icons.email),
              suffixIconColor: Colors.red,
              border: OutlineInputBorder()),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: widget._editingControllerConfirEmail,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Campo obligatorio';
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
              hintText: 'Confirmar E-mail',
              prefixIcon: Icon(Icons.email),
              suffixIconColor: Colors.red,
              border: OutlineInputBorder()),
        ),
        */
      ],
    );
  }

  Future<void> _readProfileUser() async {
    UserRepository userRepository = new UserRepository();
    ProfileUser oP_ = await userRepository.readProfileUser();

    setState(() {
      widget.oP = oP_;

      if (widget.oP != null && widget.oP!.code == 200) {
        widget.isCompania = widget.oP!.data![0].isCompany == 1 ? true : false;

        widget._editingControllerPrimerNombre.text =
            widget.oP!.data![0].firstName!;

        widget._editingControllerSegundoNombre.text =
            widget.oP!.data![0].lastName == null
                ? ''
                : widget.oP!.data![0].lastName!;

        widget._editingControllerCiudad.text =
            widget.oP!.data![0].locationName == null
                ? ''
                : widget.oP!.data![0].locationName!;

        widget._editingControllerDireccion.text =
            widget.oP!.data![0].address == null
                ? ''
                : widget.oP!.data![0].address!;

        widget._editingControllerDniMit.text =
            widget.oP!.data![0].documentNumber == null
                ? ''
                : widget.oP!.data![0].documentNumber!;

        widget._editingControllerCodePostal.text =
            widget.oP!.data![0].postalCode == null
                ? ''
                : widget.oP!.data![0].postalCode!;

        widget._editingControllerTelefono.text =
            widget.oP!.data![0].phone == null ? '' : widget.oP!.data![0].phone!;
      }
    });
  }

  _buttonUpdateProfile() {
    return Padding(
      padding: EdgeInsets.only(top: 15.0, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            onPressed: () {
              if (widget._formKeyRegister.currentState!.validate()) {
                setState(() {
                  updateProfileUser();
                });
              }
            },
            child: Text(
              "GUARDAR CAMBIOS",
              style: new TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  void updateProfileUser() async {
    UserRepository oUR = new UserRepository();
    var result = await oUR.updateProfileUser(
        widget._editingControllerPrimerNombre.value.text,
        widget._editingControllerSegundoNombre.value.text,
        widget._editingControllerDniMit.value.text,
        (widget.oD == null ? 0 : widget.oD!.id!),
        widget._editingControllerDireccion.value.text,
        (widget._editingControllerCodePostal.value.text.isEmpty
            ? 0
            : int.parse(widget._editingControllerCodePostal.value.text)),
        widget._editingControllerTelefono.value.text);

    if (result.code == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Datos actualizados con éxito"),
          backgroundColor: Style.Colors.mainColor));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(result.message!),
        backgroundColor: Colors.redAccent,
      ));
    }

    /*setState(() {
      widget.oP = result;
    });*/
  }
}
