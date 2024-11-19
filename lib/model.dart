class Blog {
  final int blogId;
  final String anh;
  final String mota;
  final String link;
  final bool hide;
  final int maNguoiDung;
  final String tenNguoiDung;

  Blog({
    required this.blogId,
    required this.anh,
    required this.mota,
    required this.link,
    required this.hide,
    required this.maNguoiDung,
    required this.tenNguoiDung,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      blogId: json['BlogId'], // Nếu null thì gán giá trị mặc định là 0
      anh: json['Anh'] ?? '',      // Nếu null thì gán chuỗi rỗng
      mota: json['Mota'] ?? '',
      link: json['Link'] ?? '',
      hide: json['Hide'] ?? false,
      maNguoiDung: json['MaNguoiDung'] ?? 0,
      tenNguoiDung: json['TenNguoiDung'] ?? 'Unknown', // Nếu null thì gán 'Unknown'
    );
  }

}
