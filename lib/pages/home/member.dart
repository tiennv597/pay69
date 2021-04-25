import 'package:get/get.dart';

class Member {
  String nameCode;
  String fullName;

  Member({
    this.nameCode,
    this.fullName,
  });
}

final List<Member> memberList = [
  Member(
    nameCode: '0',
    fullName: 'Chọn người đã thanh toán',
  ),
  Member(
    nameCode: 'tien',
    fullName: 'Tiến',
  ),
  Member(
    nameCode: 'hung',
    fullName: 'Hùng',
  ),
  Member(
    nameCode: 'linh',
    fullName: 'Linh',
  ),
  Member(
    nameCode: 'viet',
    fullName: 'Việt',
  ),
  Member(
    nameCode: 'trong',
    fullName: 'Trong',
  ),
  Member(
    nameCode: 'tuan',
    fullName: 'Tuân',
  ),
];
