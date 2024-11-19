import 'package:flutter/material.dart';
import 'package:qlkhohangapp/api_handler.dart';
import 'package:qlkhohangapp/model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ApiHandler apiHandler = ApiHandler();
  late List<Blog> data = [];

  void getData() async {
    data = await apiHandler.getBlogData();
    print('Fetched data: $data'); // Log kiểm tra dữ liệu
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FlutterApi"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: data.isEmpty
          ? const Center(child: CircularProgressIndicator()) // Hiển thị khi đang tải dữ liệu
          : ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text("${data[index].blogId}"),
            title: Text(data[index].mota),
          );
        },
      ),
    );
  }
}
