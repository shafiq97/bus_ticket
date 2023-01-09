class Bus {
  final String id;
  final String title;
  final String asal;
  final String tujuan;
  final String date;
  final String time;
  final String arrival;
  final double price;
  final int set;
  final String imageUrl;

  Bus(
      {required this.id,
      required this.title,
      required this.asal,
      required this.tujuan,
      required this.price,
      required this.set,
      required this.date,
      required this.time,
      required this.arrival,
      required this.imageUrl});
}
