import 'dart:io';

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String konum = 'Yeşilyurt, 03030 Afyonkarahisar Merkez/Afyonkarahisar';

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Sms Email"),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            launchButton(
              title: "Launch Phone Number",
              icon: Icons.phone,
              onPressed: () async {
                final Uri url = Uri(scheme: 'tel', path: '+5469302444');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  print('hata');
                }
              },
            ),
            launchButton(
                title: "Launch Website / URL ",
                icon: Icons.language,
                onPressed: () {
                  launchUrl(Uri.parse('https://www.instagram.com/erenelci94/'),
                      mode: LaunchMode.externalApplication);
                }),
            launchButton(
              title: "Launch Sms / Message",
              icon: Icons.message,
              onPressed: () => launchUrl(
                Uri.parse(
                  'sms:43243243242${Platform.isAndroid ? '?' : '&'}body=Anlık Konumunuz${konum}',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget launchButton({
    required String title,
    required IconData icon,
    required Function() onPressed,
  }) {
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(height: 20),
            Text(title),
          ],
        ),
      ),
    );
  }
}
