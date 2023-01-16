import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:locker/src/models/checkResponse_model.dart';
import 'package:locker/src/models/city/data_city_model.dart';
import 'package:locker/src/repositories/users.dart';
import 'package:locker/src/style/theme.dart' as Style;
import 'package:sweetalertv2/sweetalertv2.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  bool isCheckTerminos = false;

  DataCity oD = new DataCity();

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

  bool isCompania = false;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        elevation: 1,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10, right: 15, left: 15),
        child: Form(
          key: widget._formKeyRegister,
          child: ListView(
            children: [
              Row(
                children: [
                  Icon(Icons.person),
                  Switch(
                      value: widget.isCompania,
                      activeColor: Style.Colors.mainColor,
                      onChanged: (valor) {
                        setState(() {
                          widget.isCompania = valor;
                        });
                      }),
                  Icon(Icons.apartment_outlined),
                ],
              ),
              Visibility(
                  visible: !widget.isCompania,
                  child: TextFormField(
                    controller: widget._editingControllerPrimerNombre,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obligatorio';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        hintText: 'Primer nombre',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.yellowAccent))),
                  )),
              Visibility(
                  visible: !widget.isCompania,
                  child: SizedBox(
                    height: 10,
                  )),
              Visibility(
                visible: !widget.isCompania,
                child: TextFormField(
                  controller: widget._editingControllerSegundoNombre,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo obligatorio';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      hintText: 'Primer Apellido',
                      prefixIcon: Icon(Icons.person),
                      suffixIconColor: Colors.red,
                      border: OutlineInputBorder()),
                ),
              ),
              Visibility(
                  visible: !widget.isCompania,
                  child: SizedBox(
                    height: 10,
                  )),
              TextFormField(
                controller: widget._editingControllerDniMit,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo obligatorio';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: 'DNI o NIT',
                    prefixIcon: Icon(Icons.badge),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellowAccent))),
              ),
              SizedBox(
                height: 10,
              ),
              Visibility(
                visible: widget.isCompania,
                child: TextFormField(
                  controller: widget._editingControllerPrimerNombre,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo obligatorio';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      hintText: 'Razón Social',
                      prefixIcon: Icon(Icons.text_format),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellowAccent))),
                ),
              ),
              Visibility(
                visible: widget.isCompania,
                child: SizedBox(
                  height: 10,
                ),
              ),
              TextFormField(
                controller: widget._editingControllerCiudad,
                keyboardType: TextInputType.none,
                onTap: () async {
                  var response = await Navigator.pushNamed(context, 'city');

                  if (response != null) {
                    widget.oD = DataCity.fromJson(response!.toString());
                    widget._editingControllerCiudad.text = widget.oD.name!;
                  }
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo obligatorio';
                  } else {
                    return null;
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
              TextFormField(
                controller: widget._editingControllerDireccion,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo obligatorio';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: 'Dirección',
                    prefixIcon: Icon(Icons.directions),
                    suffixIconColor: Colors.red,
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: widget._editingControllerCodePostal,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo obligatorio';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: 'Código Postal',
                    prefixIcon: Icon(Icons.numbers),
                    suffixIconColor: Colors.red,
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: widget._editingControllerTelefono,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo obligatorio';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: 'Celular',
                    prefixIcon: Icon(Icons.phone),
                    suffixIconColor: Colors.red,
                    border: OutlineInputBorder()),
              ),
              SizedBox(
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
                    if (widget._editingControllerEmail.value.text != value) {
                      return 'Su email no coincide.';
                    } else {
                      return 'Campo obligatorio';
                    }
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
              SizedBox(
                height: 10,
              ),
              CheckboxListTile(
                value: widget.isCheckTerminos,
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (value) {
                  setState(() {
                    widget.isCheckTerminos = value!;
                  });
                },
                title: Text("He leído los Términos y condiciones generales."),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
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
                          registroUsuarioFormulario();
                        }
                      },
                      child: Text(
                        "CREAR CASILLERO",
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void registroUsuarioFormulario() async {
    try {
      UserRepository oU = new UserRepository();
      var response =
          await oU.checkEmail(widget._editingControllerEmail.value.text);

      if (response == 200) {
        SweetAlertV2.show(context,
            title: "Registro de Usuario",
            subtitle: 'Lo sentimos este correo ya se encuentra registrado.',
            confirmButtonText: 'Aceptar',
            style: SweetAlertV2Style.error);
      } else {
        CheckResponse oC = await UserRepository.registerUsuarioEmail(
            widget._editingControllerEmail.value.text,
            widget._editingControllerPrimerNombre.value.text,
            widget._editingControllerSegundoNombre.value.text,
            widget._editingControllerDniMit.value.text,
            widget.oD!.id!,
            widget._editingControllerDireccion.value.text,
            int.parse(widget._editingControllerCodePostal.value.text),
            widget._editingControllerTelefono.value.text,
            widget.isCheckTerminos,
            widget.isCompania);

        SweetAlertV2.show(context,
            title: "Registro de Usuario",
            subtitle:
                oC.code == 200 ? 'Usuario registrado con éxito' : oC.message,
            confirmButtonText: 'Aceptar',
            confirmButtonColor: Style.Colors.mainColor,
            style: oC.code != 200
                ? SweetAlertV2Style.error
                : SweetAlertV2Style.success, onPress: ((isConfirm) {
          if (oC.code == 200) {
            widget.isCheckTerminos = false;
            widget._editingControllerPrimerNombre.clear();
            widget._editingControllerSegundoNombre.clear();
            widget._editingControllerCiudad.clear();
            widget._editingControllerDireccion.clear();
            widget._editingControllerCodePostal.clear();
            widget._editingControllerCelular.clear();
            widget._editingControllerEmail.clear();
            widget._editingControllerConfirEmail.clear();
            widget._editingControllerTelefono.clear();
            widget._editingControllerDniMit.clear();
            Navigator.of(context).pop();
          }
          return isConfirm;
        }));
      }
    } catch (e) {
      SweetAlertV2.show(context,
          title: "Registro de Usuario",
          confirmButtonText: 'Reintentar',
          subtitle: e.toString(),
          style: SweetAlertV2Style.error);
    }
  }
}
