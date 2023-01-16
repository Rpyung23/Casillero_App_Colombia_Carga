import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:locker/src/models/city/data_city_model.dart';
import 'package:locker/src/repositories/citys_repositories.dart';

class CityPage extends StatefulWidget {
  List<DataCity>? oListCity;

  CityPage({Key? key}) : super(key: key);
  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.streetAddress,
              cursorColor: Colors.black87,
              onChanged: (value) {
                print("VALOR CITY : $value");
                if (value.isNotEmpty) {
                  _readCitysRepositorios(value);
                }
              },
              decoration: InputDecoration(
                  hintText: 'Buscar Ciudad',
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Colors.black87,
                  focusedBorder: OutlineInputBorder(),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
                child: ListView.builder(
                    itemCount:
                        widget.oListCity == null ? 0 : widget.oListCity!.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, int index) {
                      if (widget.oListCity == null ||
                          widget.oListCity!.length == 0) {
                        return ListTile(
                          title: Text("No existen datos."),
                          leading: Icon(FontAwesomeIcons.lightLocation),
                          subtitle: Text("No se han encontrado coincidencias."),
                          onTap: () {
                            Navigator.pop<DataCity>(context, null);
                          },
                        );
                      }
                      return ListTile(
                        title: Text(widget.oListCity![index].name!),
                        leading: Icon(FontAwesomeIcons.lightLocation),
                        subtitle: Text(widget.oListCity![index].deptos! +
                            " / " +
                            widget.oListCity![index].pais!),
                        onTap: () {
                          Navigator.pop(
                              context, widget.oListCity![index].toJson());
                        },
                      );
                    }))
          ],
        ),
      ),
    );
  }

  _readCitysRepositorios(String value) async {
    var datos = await CityRepository.readCitys(value);
    setState(() {
      widget.oListCity = datos;
    });
  }
}
