import 'package:fitrack/components/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FiTrackScaffold(
        screenTitle: "Privacy Policy",
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: FutureBuilder<String>(
                future: rootBundle.loadString('assets/privacypolicy.txt'),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text("An Error occured");
                  }
                  if (snapshot.hasData) {
                    return Text(snapshot.data);
                  }
                  return const CircularProgressIndicator();
                }),
          ),
        ));
  }
}
