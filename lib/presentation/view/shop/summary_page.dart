import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ringkasan')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return const ListTile(
                      tileColor: Colors.white,
                      title: Text('Kerapian Cafe'),
                      trailing: Text('100'),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const Divider(height: 0),
                  itemCount: 5)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Selamat anda mendapatkan point total :',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
              tileColor: Colors.white,
              title:
                  Text('Total', style: Theme.of(context).textTheme.headline6),
              trailing:
                  Text('500', style: Theme.of(context).textTheme.headline6)),
          const Divider(height: 1.5, thickness: 2),
          ListTile(
              tileColor: Colors.white,
              title: Text('Total point saat ini',
                  style: Theme.of(context).textTheme.headline6),
              trailing:
                  Text('5000', style: Theme.of(context).textTheme.headline6)),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextButton(
                onPressed: () async {
                  await launchUrlString(
                      'https://wa.me/6281393791414/?text=hello world');
                },
                child: const Text('Kirim Laporan')),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
