
import 'package:quizz_app/data/answer_data.dart';
import 'package:quizz_app/data/question_category.dart';
import 'package:quizz_app/data/questions_data.dart';
import 'list_imagequestion.dart';

final FAKE_QUESTIONS = [
  Question(index: 0, question: ' Ai là người đặt tên nước ta là Vạn Xuân?', indexCorrect: 2, mlistAnswer: FAKE_ANSWERS[0], imageQuestion: listImageQuestions[0]),
  Question(index: 1, question: ' Tên thật của nữ vương đầu tiên và cuối cùng của nước ta?', indexCorrect: 2, mlistAnswer: FAKE_ANSWERS[1], imageQuestion: listImageQuestions[1]),
  // Question(index: 2, question: ' Có bao nhiêu đời vua vào thời Lý?', indexCorrect: 2, mlistAnswer: FAKE_ANSWERS[2], imageQuestion: listImageQuestions[2]),
  // Question(index: 3, question: ' Ai là tác giả của Quốc Âm Thi Tập?', indexCorrect: 1, mlistAnswer: FAKE_ANSWERS[3], imageQuestion: listImageQuestions[3]),
  // Question(index: 4, question: ' "Bản nguyệt thập bát nhật Liễu Thăng vị ngã quân sở công, kế trụy ư Chi Lăng chi dã " là 1 câu của bài cáo nào?', indexCorrect: 1, mlistAnswer: FAKE_ANSWERS[4], imageQuestion: listImageQuestions[4]),
  // Question(index: 5, question: ' Đâu là 1 tên khác của Trần Quốc Tuấn?', indexCorrect: 2, mlistAnswer: FAKE_ANSWERS[5], imageQuestion: listImageQuestions[5]),
  // Question(index: 6, question: ' Ai là người đánh đuổi quân Thanh?', indexCorrect: 2, mlistAnswer: FAKE_ANSWERS[6], imageQuestion: listImageQuestions[6]),
  // Question(index: 7, question: ' Bố Cái Đại Vương là ai?', indexCorrect: 1, mlistAnswer: FAKE_ANSWERS[7], imageQuestion: listImageQuestions[7]),
  // Question(index: 8, question: ' Vua Đen là ai?', indexCorrect: 3, mlistAnswer: FAKE_ANSWERS[8], imageQuestion: listImageQuestions[8]),
  // Question(index: 9, question: ' Vị vua nào là con rối của người Pháp?', indexCorrect: 0, mlistAnswer: FAKE_ANSWERS[9], imageQuestion: listImageQuestions[9]),


];

    final List<List<AnswerData>> FAKE_ANSWERS = [
      [AnswerData(answer: 'Lý Bạch'), AnswerData(answer: 'Ngô Quyền'), AnswerData(answer: 'Lý Bôn'), AnswerData(answer: 'Lý Công Uẩn')],
      [AnswerData(answer: 'Lý Phật Thiên'), AnswerData(answer: 'Lý Phật Kim'), AnswerData(answer: 'Trưng Trắc'), AnswerData(answer: 'Trưng Nhị')],
      // [AnswerData(answer: '11'), AnswerData(answer: '12'), AnswerData(answer: '9'), AnswerData(answer: '8')],
      // [AnswerData(answer: 'Nguyễn Khuyến'), AnswerData(answer: 'Nguyễn Trãi'), AnswerData(answer: 'Quang Trung'), AnswerData(answer: 'Lý Thái Tổ')],
      // [AnswerData(answer: 'Quốc Âm Thi Tập'), AnswerData(answer: 'Bình Ngô Đại Cáo'), AnswerData(answer: 'Binh Thư Yếu Lược'), AnswerData(answer: 'Vạn Kiếp tông bí truyền thư')],
      // [AnswerData(answer: 'Trần Hưng Đạo'), AnswerData(answer: 'Trần Quốc Toản'), AnswerData(answer: 'Trần Khánh Dư'), AnswerData(answer: 'Trần Nhật Duật')],
      // [AnswerData(answer: 'Nguyễn Nhạc'), AnswerData(answer: 'Nguyễn Lữ'), AnswerData(answer: 'Nguyễn Huệ'), AnswerData(answer: 'Nguyễn Trãi')],
      // [AnswerData(answer: 'Phùng Hải'), AnswerData(answer: 'Phùng Hưng'), AnswerData(answer: 'Ngô Quyền'), AnswerData(answer: 'Lê Lợi')],
      // [AnswerData(answer: 'Phùng Hưng'), AnswerData(answer: 'Lê Uy Mục'), AnswerData(answer: 'Lê Long Việt'), AnswerData(answer: 'Mai Thúc Loan'),],
      // [AnswerData(answer: 'Đồng Khánh'), AnswerData(answer: 'Hàm Nghi'), AnswerData(answer: 'Thành Thái'), AnswerData(answer: 'Nghị Thiệu')],

    ];

    final FAKE_QUESTIONCATEGORY = [
      QuestionCategory(name: 'Một số câu hỏi lịch sử Việt Nam', urlQuestionCategory: 'https://img.vietnamfinance.vn/webp-jpg/700x0/upload/news/quynhtrang/2020/1/20/anh-1-15789339707761162008354-crop-1578933978308642745760.webp' ),
      QuestionCategory(name: 'Tính toán cho bé', urlQuestionCategory: 'https://pomath.vn/wp-content/uploads/2022/10/toan-tu-duy-cho-tre-4-6-tuoi-3.jpg'),
      QuestionCategory(name: 'Bảng chữ cái tiếng Anh', urlQuestionCategory: 'https://static.anhnguathena.vn/anhngu//img.media/2020/05/1589189123573.jpg'),
      QuestionCategory(name: 'Bảng chứx cái tiếng Việt', urlQuestionCategory: 'https://websakuramontessorieduvnprod.s3.ap-southeast-1.amazonaws.com/wp-content/uploads/2022/09/21071030/B%E1%BA%A3ng-ch%E1%BB%AF-c%C3%A1i-ti%E1%BA%BFng-Vi%E1%BB%87t-vi%E1%BA%BFt-hoa-1.jpg'),
    ];