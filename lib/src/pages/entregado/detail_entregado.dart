import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:locker/src/bloc/document_detail_bloc/document_detail_bloc.dart';
import 'package:locker/src/models/document_detail_model.dart';
import 'package:locker/src/models/tracking_model.dart';
import 'package:locker/src/utils/icon_from_string_util.dart';
import 'package:timelines/timelines.dart';
import 'package:locker/src/style/theme.dart' as Style;

class DetailEntregado extends StatefulWidget {
  final String? numDocument;

  const DetailEntregado({Key? key, required this.numDocument})
      : super(key: key);
  @override
  _DetailEntregadoState createState() => _DetailEntregadoState();
}

class _DetailEntregadoState extends State<DetailEntregado> {
  final _documentDetailBloc = DocumentDetailBloc();

  @override
  void initState() {
    _documentDetailBloc.add(GetDocumentDetail(widget.numDocument));
    super.initState();
  }

  @override
  void dispose() {
    _documentDetailBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _documentDetailBloc,
      child: Container(
        padding: EdgeInsets.all(15.0),
        height: 600,
        child: BlocBuilder<DocumentDetailBloc, DocumentDetailState>(
          builder: (context, state) {
            if (state is DocumentDetailInitial) {
              return CircularProgressIndicator();
            } else if (state is DocumentDetailInitial) {
              return CircularProgressIndicator();
            } else if (state is DocumentDetailLoaded) {
              return Column(
                children: [
                  // Text(state.data ?? 'NO hay warehouse'),
                  _title(state.data.data![state.data.data!.length - 1]),
                  Divider(height: 05.0),
                  DefaultTabController(
                    length: 2,
                    child: _tabs(state.data),
                  ),
                ],
              );
            } else if (state is DocumentDetailError) {
              return Center(
                child: Text('Error socito'),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _title(DocumentDetail documentDetail) {
    return ListTile(
      minLeadingWidth: 50.0,
      leading: getIconsString(
        documentDetail.icon,
        HexColor(documentDetail.color!),
        40.0,
      ),
      title: Text(
        documentDetail.numWarehouse ?? '',
        style: TextStyle(
          fontSize: 25.0,
        ),
      ),
      subtitle: Text('${documentDetail.weight} Lb'),
    );
  }

  Widget _tabs(DocumentDetailModel listDocumentDetail) {
    return Column(
      children: [
        TabBar(
          tabs: [
            Tab(
              iconMargin: EdgeInsets.symmetric(vertical: 0.0),
              icon: Icon(
                FontAwesomeIcons.history,
                color: Style.Colors.mainColor,
              ),
              child: Text(
                'Historial',
                style: TextStyle(color: Style.Colors.mainColor),
              ),
            ),
            Tab(
              iconMargin: EdgeInsets.symmetric(vertical: 0.0),
              icon: Icon(
                FontAwesomeIcons.barcode,
                color: Style.Colors.mainColor,
              ),
              child: Text(
                'Trackings',
                style: TextStyle(color: Style.Colors.mainColor),
              ),
            ),
          ],
        ),
        Container(
          height: 400,
          child: TabBarView(
            children: [
              _timeLine(listDocumentDetail.data!),
              _trackings(listDocumentDetail.trackings),
            ],
          ),
        ),
      ],
    );
  }

  Widget _timeLine(List<DocumentDetail> listDocumentDetail) {
    return Timeline.tileBuilder(
      padding: EdgeInsets.all(24.0),
      theme: TimelineThemeData(
        nodePosition: 0,
        nodeItemOverlap: true,
        indicatorTheme: IndicatorThemeData(
          color: Style.Colors.mainColor,
          size: 20.0,
        ),
        connectorTheme: ConnectorThemeData(
          color: Color(0xffe6e7e9),
          thickness: 5.0,
        ),
      ),
      builder: TimelineTileBuilder.fromStyle(
        contentsAlign: ContentsAlign.basic,
        itemCount: listDocumentDetail.length,
        contentsBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListTile(
            title: Row(
              children: [
                getIconsString(
                  listDocumentDetail[index].icon,
                  HexColor(listDocumentDetail[index].color!),
                  22.5,
                ),
                SizedBox(width: 15.0),
                Text(listDocumentDetail[index].status!),
              ],
            ),
            subtitle: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5.0),
                  Text(
                    listDocumentDetail[index].dateStatus ?? '',
                    style: TextStyle(fontFamily: 'Arial'),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    listDocumentDetail[index].descriptionGeneral!,
                    style: TextStyle(fontFamily: 'Arial'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _trackings(List<Trackings> trackings) {
    return ListView.builder(
      itemCount: trackings.length,
      itemBuilder: (_, index) {
        return Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 4.0),
              minLeadingWidth: 30,
              leading: Icon(
                FontAwesomeIcons.box,
                color: Style.Colors.mainColor,
                size: 22.5,
              ),
              title: Text(trackings[index].numTracking ?? ' '),
              subtitle: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5.0),
                    Text(
                      trackings[index].createdAt ?? '',
                      style: TextStyle(fontFamily: 'Arial'),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      trackings[index].content!,
                      style: TextStyle(fontFamily: 'Arial'),
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
          ],
        );
      },
    );
  }
}
