import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:locker/src/bloc/tracking_bloc/tracking_bloc.dart';
import 'package:locker/src/models/tracking_model.dart';
import 'package:locker/src/style/theme.dart' as Style;

class ListTracking extends StatefulWidget {
  ListTracking({Key? key}) : super(key: key);

  @override
  _ListTrackingState createState() => _ListTrackingState();
}

class _ListTrackingState extends State<ListTracking> {
  final TrackingBloc _trackingBloc = TrackingBloc();

  @override
  void initState() {
    _trackingBloc.add(GetAllTracking());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildListTracking();
  }

  Widget _buildListTracking() {
    return BlocProvider(
      create: (_) => _trackingBloc,
      child: BlocListener<TrackingBloc, TrackingState>(
        listener: (BuildContext context, TrackingState state) {
          if (state is TrackingError) {
            ScaffoldMessenger(
              child: SnackBar(
                content: Text('Falló la carga'),
                // content: Text(state.message),
              ),
            );
          }
        },
        child: BlocBuilder<TrackingBloc, TrackingState>(
          builder: (BuildContext context, TrackingState state) {
            if (state is TrackingInitial) {
              return _buildLoading();
            } else if (state is TrackingLoading) {
              return _buildLoading();
            } else if (state is TrackingLoaded) {
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
                      'No hay prealertas para mostrar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(63, 61, 86, 1), fontSize: 20),
                    ),
                  ],
                );
              } else {
                return RefreshIndicator(
                  onRefresh: () async {
                    BlocProvider.of<TrackingBloc>(context)
                        .add(GetAllTracking());
                  },
                  child: _buildList(context, state.data),
                );
              }
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoading() => Center(
          child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Style.Colors.mainColor),
      ));

  Widget _buildList(BuildContext context, TrackingModel list) {
    return ListView.builder(
      itemCount: list.data!.length,
      itemBuilder: (BuildContext context, index) {
        return _item(list.data![index]);
      },
    );
  }

  Widget _item(Trackings tracking) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: ListTile(
        contentPadding: EdgeInsets.all(8.0),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            FontAwesomeIcons.box,
            size: 35.0,
            color: Style.Colors.mainColor,
          ),
        ),
        title: Text(
          tracking.numTracking!,
          style: TextStyle(
            fontSize: 20.0,
            color: Style.Colors.titleColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: _subTitle(tracking),
      ),
    );
  }

  Widget _subTitle(tracking) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contenido',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                VerticalDivider(),
                Text(
                  tracking.content,
                  style: TextStyle(fontFamily: 'Arial'),
                ),
              ],
            ),
          ),
          VerticalDivider(),
          Expanded(
            child: Column(
              children: [
                Text(
                  'Instrucción',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  tracking.instruction ?? '',
                  style: TextStyle(fontFamily: 'Arial'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
