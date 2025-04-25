// // ignore_for_file: lines_longer_than_80_chars

// import 'package:flame_jam_2025/play_widget.dart';
// import 'package:flutter/material.dart';

// class SplitScreenWidget extends StatefulWidget {
//   const SplitScreenWidget({
//     required this.player1Controller,
//     required this.player2Controller,
//     super.key,
//   });

//   final PlayController player1Controller;
//   final PlayController player2Controller;

//   @override
//   State<SplitScreenWidget> createState() => _SplitScreenWidgetState();
// }

// class _SplitScreenWidgetState extends State<SplitScreenWidget> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: PlayWidget(
//             name: 'player1',
//             playController: widget.player1Controller,
//           ),
//         ),
//         Expanded(
//           child: PlayWidget(
//             name: 'player2',
//             playController: widget.player2Controller,
//           ),
//         ),
//       ],
//     );
//   }
// }
