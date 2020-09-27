import 'package:flutter/material.dart';

class NewsDetailsScene extends StatelessWidget {
  const NewsDetailsScene({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 360,
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/monkey.jpg"),
            fit: BoxFit.contain,
            alignment: Alignment.topCenter,
          ),
          color: Colors.green[900],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 300,
              height: 200,
              padding: EdgeInsets.only(bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Brazil",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Text(
                            "What is Lorem Ipsum?",
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.green[700],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   color: Colors.blueAccent,
                  //   height: 160,
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );

    // ],
    // );
    // Container(
    //   decoration: BoxDecoration(
    //     image: DecorationImage(
    //       image: AssetImage("assets/images/monkey.jpg"),
    //       fit: BoxFit.contain,
    //       alignment: Alignment.topCenter,
    //     ),
    //     color: Colors.green[800],
    //   ),
    //   child: Column(
    //     children: [
    //       Container(
    //         child: Column(
    //           children: [
    //             Text("teste"),
    //             Text("teste"),
    //             Text("teste"),
    //           ],
    //         ),
    //       ),
    //       // Container(),
    //     ],
    //   ),
    // );
  }
}

// Expanded(
//   child: Stack(
//     children: [
//       Container(
//         decoration: BoxDecoration(
//           color: Colors.green,
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(40),
//               topRight: Radius.circular(40)),
//         ),
//       ),
//       // Container(
//       //   color: Colors.blueAccent,
//       //   height: 160,
//       // )
//     ],
//   ),
// )
