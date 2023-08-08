import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weekly_challenge/models/email_model.dart';
import 'package:weekly_challenge/services/email_service.dart';

// StateNotifierProvider를 emailProvider에 저장.
final emailProvider = StateNotifierProvider<EmailNotifier, List<Email>>(
    (ref) => EmailNotifier(EmailService()));

// StateNotifier를 extends하는 EmailNotifier class 생성
class EmailNotifier extends StateNotifier<List<Email>> {
  final EmailService _emailService;

  EmailNotifier(this._emailService) : super([]);

  Future getEmails() async {
    try {
      // EmailSevice()의 getData()를 불러온 뒤에 emails에 담아주고
      List<Email> emails = await _emailService.getData();
      // 상태를 변경해준다.
      state = emails;
    } catch (e) {
      throw Exception('이메일들을 불러오는데 실패했습니다.');
    }
  }
}
