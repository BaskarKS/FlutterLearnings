class Question {
  String question;
  bool answer;
/*  Question(String Q, bool A) {
    this.question = Q;
    this._answer = A;
  }*/
  Question({this.question, this.answer});

  String get getQuestionText => this.question;
  bool get getAnswer => this.answer;
  //Another way of constructor
  //Question(this.question, this.answer);
}
