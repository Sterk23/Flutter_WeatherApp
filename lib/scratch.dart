
import 'dart:io';
void main() {
  performTasks();
}

void performTasks()  async{
  task1();
  String task2String = await task2();
  task3(task2String);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future task2()  async{
  Duration duration = Duration(seconds: 3);
  String result;
  await Future.delayed(duration,(){

     result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;

}

void task3(String task2String) {
  String result = 'task 3 data';
  print(task2String);
}