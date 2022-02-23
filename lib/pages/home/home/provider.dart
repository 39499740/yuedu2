
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
    BuildContext context;
    HomeProvider(this.context);
      
    bool _initialized = false;
      
    void init() {
        if (!_initialized) {
            _initialized = true;
            Future.delayed(const Duration(milliseconds: 100), () {});
        }
    }
}
