import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pages/Services/dbOrder.dart';

class RecordsPage extends StatefulWidget {
  @override
  _RecordsPageState createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  List<Map<String, dynamic>> records = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Table Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('User')),
                  DataColumn(label: Text('Total Price')),
                  DataColumn(label: Text('Count')),
                  DataColumn(label: Text('Actions')), // عمود الإجراءات
                ],
                rows: records.map((record) {
                  return DataRow(cells: [
                    DataCell(Text(record['id'].toString())),
                    DataCell(Text(record['User'])),
                    DataCell(Text(record['total_price'])),
                    DataCell(Text(record['count'])),
                    DataCell(IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteRecord(record['id']),
                    )), // زر الحذف الفردي
                  ]);
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
                onPressed: _deleteAllRecords,
                child: Text('حذف جميع الطلبات'),
                style: Theme.of(context).elevatedButtonTheme.style),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteRecord(int id) async {
    // حذف سجل واحد باستخدام SqlDb
    await SqlDb.deleteData("DELETE FROM orders WHERE id = $id");
    _fetchData();
    // تحديث البيانات بعد الحذف
  }

  Future<void> _deleteAllRecords() async {
    // حذف جميع السجلات باستخدام SqlDb
    await SqlDb.deleteData("DELETE FROM orders");
    _fetchData();
  }

  Future<void> _fetchData() async {
    // قراءة البيانات من قاعدة البيانات باستخدام SqlDb
    List<Map<String, dynamic>> response =
        await SqlDb.readData("SELECT * FROM orders");
    setState(() {
      records = response;
    });
  }
}
