import 'package:flutter/material.dart';
import 'package:lukerieff/widgets/main/development_screen/development_screen_app_bar.dart';
import 'package:lukerieff/widgets/main/development_screen/development_screen_header.dart';

class DevelopmentScreen extends StatefulWidget {
  const DevelopmentScreen({Key? key}) : super(key: key);

  @override
  State<DevelopmentScreen> createState() => _DevelopmentScreenState();
}

class _DevelopmentScreenState extends State<DevelopmentScreen> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const DevelopmentScreenAppBar(),
          DevelopmentScreenHeader(
            loading: _loading,
          ),
        ],
      ),
    );
  }
}
