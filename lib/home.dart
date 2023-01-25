import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController animeCont;
  String status = '';

  @override
  void initState() {
    
    super.initState();
    animeCont = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
        lowerBound: 10,
        upperBound: 20);

    animeCont.addListener(() {
      setState(() {
        // debugPrint(animeCont.value.toString());
      });
    });

    animeCont.addStatusListener((status) {
      setState(() {
        this.status = status.toString();
      });
    });

    // animeCont.forward();
  }

  @override
  void dispose() {
    animeCont.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(status),
            Text(
              (animeCont.value.round()).toString(),
              style: TextStyle(fontSize: animeCont.value * 4),
            ),
            ElevatedButton(
                onPressed: () {
                  animeCont.forward();
                },
                child: const Text(
                  'Forward',
                )),
            ElevatedButton(
                onPressed: () {
                  animeCont.forward(from: 15);
                },
                child: const Text(
                  'Forward From 15',
                )),
            ElevatedButton(
                onPressed: () {
                  animeCont.reverse();
                },
                child: const Text('Reverse')),
            ElevatedButton(
                onPressed: () {
                  animeCont.repeat();
                },
                child: const Text('Repeat')),
            ElevatedButton(
                onPressed: () {
                  animeCont.repeat(reverse: true);
                },
                child: const Text('Reverse Repeat')),
            ElevatedButton(
                onPressed: () {
                  animeCont.stop();
                },
                child: const Text('Stop')),
          ],
        )));
  }
}
