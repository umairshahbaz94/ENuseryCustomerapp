// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class UserList extends StatefulWidget {
//   @override
//   _UserListState createState() => _UserListState();
// }

// class _UserListState extends State<UserList> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
//   Widget _buildBody(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('baby').snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) return LinearProgressIndicator();

//         return DataTable(
//           columns: [
//             DataColumn(label: Text('Name')),
//             DataColumn(label: Text('Votes')),
//             DataColumn(label: Text('Rapper\nname')),
//           ],
//           rows: _buildList(context, snapshot.data!.docs)
//         );
//       },
//     );
//   }




//     List<DataRow> _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
//         return  snapshot.map((data) => _buildListItem(context, data)).toList();
//     }



//  DataRow _buildListItem(BuildContext context, DocumentSnapshot data) {
//     final record = Record.fromSnapshot(data);

//     return DataRow(cells: [
//               DataCell(Text(data.data()![""]])),
//               DataCell(Text(record.votes.toString())),
//               DataCell(Text(record.rName)),
//             ]);
//   }
// }