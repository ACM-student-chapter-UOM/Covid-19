import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/splash_screen_bloc.dart';
import 'home.dart';
import 'splash_screen_widget.dart';

// This the widget where the BLoC states and events are handled.
class SplashScreen extends StatelessWidget {
  final blocsplash= SplashScreenBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  BlocProvider<SplashScreenBloc> _buildBody(BuildContext context) {
    return BlocProvider(
        bloc: blocsplash,
        child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue,
        child: Center(
          // Here I have used BlocBuilder, but instead you can also use BlocListner as well.
          child: BlocBuilder(
            bloc: blocsplash,
            builder: (context, state) {
              if ((state is Initial) || (state is Loading)) {
                return SplashScreenWidget();
              } else if (state is Loaded) {
                return Home();
              }
            },
          ),
        ),
      ),
    );
  }
}