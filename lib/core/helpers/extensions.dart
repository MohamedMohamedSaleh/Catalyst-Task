import 'package:flutter/material.dart';

extension NavigationTo on BuildContext {
  Future<dynamic> push(Widget widget) {
    return Navigator.of(this)
        .push(MaterialPageRoute(builder: (context) => widget));
  }

  Future<dynamic> pushReplacement(Widget widget) {
    return Navigator.of(this)
        .pushReplacement(MaterialPageRoute(builder: (context) => widget));
  }

  Future<dynamic> pushAndRemove(Widget widget) {
    return Navigator.of(this)
        .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => widget),
            (route) => false);
  }
}


extension ContextEX on BuildContext {
    double get screenHight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;


  ColorScheme get color => Theme.of(this).colorScheme;

  Map<dynamic, dynamic> get arg => (ModalRoute.of(this)?.settings.arguments ?? {}) as Map<dynamic, dynamic>;

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;
}



extension WidgetEx on Widget {
  Widget paddingAll({double all = 0.0, double vertical = 0.0, double horizontal = 0.0, double top = 0.0, double bottom = 0.0, double start = 0.0, double end = 0.0}) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: all + vertical + top,
        bottom: all + vertical + bottom,
        start: all + horizontal + start,
        end: all + horizontal + end,
      ),
      child: this,
    );
  }

  Widget get topStart => Align(alignment: AlignmentDirectional.topStart, child: this);

  Widget get topCenter => Align(alignment: Alignment.topCenter, child: this);

  Widget get topLeft => Align(alignment: Alignment.topLeft, child: this);

  Widget get topEnd => Align(alignment: AlignmentDirectional.topEnd, child: this);

  Widget get bottomStart => Align(alignment: AlignmentDirectional.bottomStart, child: this);

  Widget get centerStart => Align(alignment: AlignmentDirectional.centerStart, child: this);

  Widget get centerEnd => Align(alignment: AlignmentDirectional.centerEnd, child: this);

  Widget get bottomEnd => Align(alignment: AlignmentDirectional.bottomEnd, child: this);

  Widget get bottomCenter => Align(alignment: AlignmentDirectional.bottomCenter, child: this);

  Widget get onCenter => Center(child: this);
}
