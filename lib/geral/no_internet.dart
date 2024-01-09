import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'theme.dart';

mixin ConnectivityMixin<T extends StatefulWidget> on State<T> {
  late Connectivity _connectivity;

  @override
  void initState() {
    super.initState();
    _connectivity = Connectivity();
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        _showNoInternetSnackbar();
      } else {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      }
    });
  }

  void _showNoInternetSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Verifique a sua conneção à Internet.",
          style: TextStyle(
            color: AppTheme.of(context).primaryText,
          ),
        ),
        duration: const Duration(milliseconds: 20000),
        backgroundColor: AppTheme.of(context).error,
      ),
    );
  }
}
