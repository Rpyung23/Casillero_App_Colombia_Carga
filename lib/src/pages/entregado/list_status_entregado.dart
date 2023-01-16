import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locker/src/bloc/document_bloc/document_bloc.dart';
import 'package:locker/src/style/theme.dart' as Style;

class ListStatusEntregado extends StatefulWidget {
  ListStatusEntregado({Key? key}) : super(key: key);

  @override
  _ListStatusEntregadoState createState() => _ListStatusEntregadoState();
}

class _ListStatusEntregadoState extends State<ListStatusEntregado> {
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect rect) {
        return LinearGradient(
          end: Alignment.centerLeft,
          begin: Alignment.centerRight,
          colors: [
            Style.Colors.mainColor,
            Colors.transparent,
            Colors.transparent,
            Style.Colors.mainColor,
          ],
          stops: [
            0.0,
            0.2,
            1.0,
            0.9,
          ],
        ).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: ListView.builder(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, item) {
          return _itemStatus(
              context, Style.Colors.mainColor, 'Autorizada', Icons.check);
        },
      ),
    );
  }

  Widget _itemStatus(
      BuildContext context, Color color, String label, IconData icon) {
    return InkWell(
      onTap: () {
        BlocProvider.of<DocumentBloc>(context).add(GetAllDocument('Entregado'));
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        color: Style.Colors.background,
        elevation: 0.0,
        child: Column(
          children: [
            Icon(
              icon,
              color: color,
              size: 40.0,
            ),
            Text(
              label,
              style: TextStyle(
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
