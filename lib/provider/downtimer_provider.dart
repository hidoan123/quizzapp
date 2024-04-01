import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class DownTimerProvider extends ChangeNotifier
{
  int _remainingTime = 10; // Thời gian còn lại trong giây
  late Timer _timer; // Timer để đếm ngược
  bool _isTimeUp = false; // Thêm biến để kiểm tra hết giờ

  DownTimerProvider() {
   // Gán giá trị của context cho parentContext
    // Khởi tạo timer
    _timer = Timer.periodic(const Duration(seconds: 1), _updateTimer);
  }

  int get remainingTime => _remainingTime;
  bool get isTimeUp => _isTimeUp;
  // Hàm này sẽ được gọi mỗi giây để cập nhật đồng hồ đếm ngược
  void _updateTimer(Timer timer) {
    if (_remainingTime > 0) {
      _remainingTime--;
      notifyListeners(); // Thông báo cho người nghe (listener) biết rằng trạng thái đã thay đổi
    } else {
      timer.cancel(); // Hủy timer khi thời gian còn lại bằng 0
      _handleTimeUp();
      print('Hết giờ');
    }
  }
  void resetTime()
  {
    print('da reset thoi gian');
    _remainingTime = 10; // Đặt lại thời gian về giá trị ban đầu
    _timer.cancel(); // Hủy timer hiện tại
    _timer = Timer.periodic(const Duration(seconds: 1), _updateTimer); // Khởi tạo timer mới
    notifyListeners();
  }
  // Hàm này sẽ được gọi khi hết giờ
  void _handleTimeUp() {
    _isTimeUp = true;
    notifyListeners(); // Thông báo cho người nghe (listener) biết rằng trạng thái đã thay đổi
  }
  @override
  void dispose() {
    _timer.cancel(); // Hủy timer khi Widget bị hủy
    super.dispose();
  }
  void resetGame()
  {
    resetTime();
    _isTimeUp = false;
    notifyListeners();
  }
  // huy thoi gian khi thoat game hoac ng thoi gian
  void exitGame()
  {
    _timer.cancel();
  }
}

