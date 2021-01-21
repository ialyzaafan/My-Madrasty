class InstallmentClass {
  final String imgURL;
  final String title;
  final double total;
  final double paid;
  final DateTime time;
  InstallmentClass({this.imgURL, this.title, this.total, this.paid, this.time});
}

final activity = new InstallmentClass(
    imgURL: 'assets/icons/money.png',
    title: 'Activity',
    total: 15000,
    paid: 10000,
    time: DateTime.utc(2021, 12, 10));

List<InstallmentClass> installments = [activity];
