import 'package:obogoto/model/form.dart';
import 'package:obogoto/view/quesiton_card.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuestionScreenState();
  }
}

class QuestionScreenState extends State<QuestionScreen> {
  FeedbackForm form = new FeedbackForm();

  PageController controller = PageController(keepPage: true);
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  List<String> pageNames = [
    "age",
    "sex",
    "hd",
    "ld",
    "db",
    "fever",
    "cough",
    "sob",
    "pic",
    "cc",
    "tc",
    "submit"
  ];

  @override
  Widget build(BuildContext context) {
    final bool language = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        key: scaffoldKey,
        backgroundColor: Colors.blue.withOpacity(0.25),
        body: Container(
            child: Center(
                child: PageView.builder(
          controller: controller,
          physics: new NeverScrollableScrollPhysics(),
          itemCount: pageNames.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  QuestionCard(
                    feedbackForm: form,
                    type: pageNames[index],
                    controller: controller,
                    scaffoldKey: scaffoldKey,
                    language: language,
                  )
                ],
              ),
            );
          },
        ))));
  }
}
