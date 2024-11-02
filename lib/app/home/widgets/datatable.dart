import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;
  final String Business;
  final String Contact;

  User(this.name, this.Business, this.Contact, this.id);
}

class UserDataTableSource extends DataTableSource {
  final List<User> users;

  UserDataTableSource(this.users);

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= users.length) return null;
    final user = users[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(user.id)),
        DataCell(Text(user.name)),
        DataCell(Text(user.Business)),
        DataCell(Text(user.Contact.toString())),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;
}

class UserTable extends StatelessWidget {
  final List<User> users;

  UserTable({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final source = UserDataTableSource(users);

    return PaginatedDataTable(
      columnSpacing: 100,
      dataRowHeight: 50,
      horizontalMargin: 69,
      header: Text("User Data"),
      columns: [
        DataColumn(label: Text("Id")),
        DataColumn(label: Text("Name")),
        DataColumn(label: Text("Busines")),
        DataColumn(label: Text("Contact")),
      ],
      source: source,
      rowsPerPage: 10,
      showCheckboxColumn: false,
    );
  }
}
