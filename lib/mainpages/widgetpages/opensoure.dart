// import 'package:flutter/material.dart';
// import 'package:hanriver_now/mainpages/mylikescreen.dart';
// import 'package:flutter/foundation.dart';

// import 'package:hanriver_now/oss_licenses.dart';
// import 'package:url_launcher/url_launcher.dart';

// class OpenSource extends StatefulWidget {
//   @override
//   _OpenSource createState() => _OpenSource();
// }

// class _OpenSource extends State<OpenSource> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Licenses',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: OssLicensesPage(),
//     );
//   }
// }

// class OssLicensesPage extends StatelessWidget {
//   static Future<List<Package>> loadLicenses() async {
//     // merging non-dart dependency list using LicenseRegistry.
//     final lm = <String, List<String>>{};
//     await for (var l in LicenseRegistry.licenses) {
//       for (var p in l.packages) {
//         final lp = lm.putIfAbsent(p, () => []);
//         lp.addAll(l.paragraphs.map((p) => p.text));
//       }
//     }
//     final licenses = ossLicenses.toList();
//     for (var key in lm.keys) {
//       licenses.add(Package(
//         name: key,
//         description: '',
//         authors: [],
//         version: '',
//         license: lm[key]!.join('\n\n'),
//         isMarkdown: false,
//         isSdk: false,
//         isDirectDependency: false,
//       ));
//     }
//     return licenses..sort((a, b) => a.name.compareTo(b.name));
//   }

//   static final _licenses = loadLicenses();
//   @override
//   Widget build(BuildContext context) {
//     final appheight = MediaQuery.of(context).size.height;
//     final appwidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//         appBar: AppBar(
//           // leading: IconButton(
//           //   icon: Icon(Icons.arrow_back_ios_new),
//           //   onPressed: () {
//           //     Navigator.pop(context);
//           //   },
//           //   color: Colors.black,
//           // ),
//           toolbarHeight: 70,
//           title: Stack(
//             alignment: Alignment.center,
//             children: <Widget>[
//               Image.asset(
//                 'assets/images/title_icon.png',
//                 fit: BoxFit.cover,
//                 height: 50,
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 10),
//                 child: Text(
//                   '오픈소스 라이선스',
//                   style: TextStyle(
//                       fontFamily: 'EastSeaDokdo',
//                       fontSize: 40,
//                       color: Colors.black),
//                 ),
//               ),
//             ],
//           ),
//           centerTitle: true,
//           backgroundColor: Color.fromARGB(255, 249, 248, 253),
//           elevation: 0.0,
//         ),
//         body: FutureBuilder<List<Package>>(
//             future: _licenses,
//             initialData: const [],
//             builder: (context, snapshot) {
//               return ListView.separated(
//                   padding: const EdgeInsets.all(0),
//                   itemCount: snapshot.data?.length ?? 0,
//                   itemBuilder: (context, index) {
//                     final package = snapshot.data![index];
//                     return ListTile(
//                       title: Text('${package.name} ${package.version}'),
//                       subtitle: package.description.isNotEmpty
//                           ? Text(package.description)
//                           : null,
//                       trailing: const Icon(Icons.chevron_right),
//                       onTap: () => Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               MiscOssLicenseSingle(package: package),
//                         ),
//                       ),
//                     );
//                   },
//                   separatorBuilder: (context, index) => const Divider());
//             }));
//   }
// }

// class MiscOssLicenseSingle extends StatelessWidget {
//   final Package package;

//   MiscOssLicenseSingle({required this.package});

//   String _bodyText() {
//     return package.license!.split('\n').map((line) {
//       if (line.startsWith('//')) line = line.substring(2);
//       line = line.trim();
//       return line;
//     }).join('\n');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // leading: IconButton(
//         //   icon: Icon(Icons.arrow_back_ios_new),
//         //   onPressed: () {
//         //     Navigator.pop(context);

//         //   },
//         //   color: Colors.black,
//         // ),
//         toolbarHeight: 70,
//         title: Stack(
//           alignment: Alignment.center,
//           children: <Widget>[
//             Image.asset(
//               'assets/images/title_icon.png',
//               fit: BoxFit.cover,
//               height: 50,
//             ),
//             Container(
//               padding: EdgeInsets.only(top: 10),
//               child: Text(
//                 '${package.name} ${package.version}',
//                 style: TextStyle(
//                     fontFamily: 'EastSeaDokdo',
//                     fontSize: 40,
//                     color: Colors.black),
//               ),
//             ),
//           ],
//         ),
//         centerTitle: true,
//         backgroundColor: Color.fromARGB(255, 249, 248, 253),
//         elevation: 0.0,
//       ),

//       // AppBar(title: Text('${package.name} ${package.version}')),
//       body: Container(
//           color: Theme.of(context).canvasColor,
//           child: ListView(children: <Widget>[
//             if (package.description.isNotEmpty)
//               Padding(
//                   padding:
//                       const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
//                   child: Text(package.description,
//                       style: Theme.of(context)
//                           .textTheme
//                           .bodyText2!
//                           .copyWith(fontWeight: FontWeight.bold))),
//             if (package.homepage != null)
//               Padding(
//                   padding:
//                       const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
//                   child: InkWell(
//                     child: Text(package.homepage!,
//                         style: const TextStyle(
//                             color: Colors.blue,
//                             decoration: TextDecoration.underline)),
//                     // ignore: deprecated_member_use
//                     onTap: () => launch(package.homepage!),
//                   )),
//             if (package.description.isNotEmpty || package.homepage != null)
//               const Divider(),
//             Padding(
//               padding:
//                   const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
//               child: Text(_bodyText(),
//                   style: Theme.of(context).textTheme.bodyText2),
//             ),
//           ])),
//     );
//   }
// }
