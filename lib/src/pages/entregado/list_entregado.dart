import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:locker/src/bloc/document_bloc/document_bloc.dart';
import 'package:locker/src/models/document_model.dart';
import 'package:locker/src/pages/document/detail_document.dart';
import 'package:locker/src/style/theme.dart' as Style;
import 'package:locker/src/utils/icon_from_string_util.dart';

class ListEntregado extends StatefulWidget {
  final String? type;
  ListEntregado({Key? key, required this.type}) : super(key: key);

  @override
  _ListEntregadoState createState() => _ListEntregadoState();
}

class _ListEntregadoState extends State<ListEntregado> {
  final _documentBloc = DocumentBloc();

  @override
  void initState() {
    super.initState();
    print("widget.type : " + widget.type.toString());
    BlocProvider.of<DocumentBloc>(context, listen: false)
        .add(GetAllDocument(widget.type));
  }

  @override
  void dispose() {
    //_documentBloc.close();
    //BlocProvider.of<DocumentBloc>(context, listen: false).close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DocumentBloc, DocumentState>(builder: (_, state) {
      if (state is DocumentInitial) {
        return _buildLoading();
      } else if (state is DocumentLoading) {
        return _buildLoading();
      } else if (state is DocumentLoaded) {
        if (state.data.data == null || state.data.data.length == 0) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg/undraw_empty.svg',
                width: 250.0,
              ),
              SizedBox(height: 15.0),
              Text(
                'No hay documentos para mostrar',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(63, 61, 86, 1), fontSize: 20),
              ),
            ],
          );
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<DocumentBloc>(context)
                  .add(GetAllDocument(widget.type));
            },
            child: _buildList(context, state.data),
          );
        }
      } else if (state is DocumentError) {
        return Center(
          child: Text(state.message!),
        );
      } else {
        return Container();
      }
    });
  }

  Widget _buildLoading() => Center(
          child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Style.Colors.mainColor),
      ));

  Widget _buildList(BuildContext context, DocumentModel list) {
    return ListView.builder(
      itemCount: list.data!.length,
      itemBuilder: (BuildContext context, index) {
        return _item(context, list.data![index]);
      },
    );
  }

  Widget _item(BuildContext context, dynamic document) {
    return InkWell(
      onTap: () {
        _showDetail(context, document.numWarehouse);
      },
      child: Card(
        elevation: 4.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: ListTile(
          contentPadding: EdgeInsets.all(8.0),
          leading: Container(
            alignment: Alignment.center,
            width: 50.0,
            child: getIconsString(
              document.icon,
              HexColor(document.color),
              30.0,
            ),
          ),
          title: Text(
            document.numWarehouse,
            style: TextStyle(
              fontSize: 20.0,
              color: Style.Colors.titleColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Container(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  document.description ?? '',
                  style: TextStyle(fontFamily: 'Arial'),
                ),
                Text(
                  document.dateStatus,
                  style: TextStyle(fontFamily: 'Arial'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDetail(BuildContext context, String? numDocument) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return DetailDocument(numDocument: numDocument);
      },
    );
  }
}
