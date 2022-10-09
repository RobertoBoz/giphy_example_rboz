import 'dart:async' show FutureOr;


import 'package:flutter/widgets.dart' show StatefulWidget, State, WidgetsBinding;

mixin AfterFirstLayoutMixin<T extends StatefulWidget> on State<T>{

  @override
  void initState() {
    
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      onAfterFirstLayout();
      
    });
  }

  FutureOr<void> onAfterFirstLayout();
}
