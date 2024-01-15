class DnsResponse {
  int status;
  bool tc;
  bool rd;
  bool ra;
  bool ad;
  bool cd;
  List<Question> question;
  List<Answer> answer;

  DnsResponse({
    required this.status,
    required this.tc,
    required this.rd,
    required this.ra,
    required this.ad,
    required this.cd,
    required this.question,
    required this.answer,
  });

  factory DnsResponse.fromJson(Map<String, dynamic> json) {
    return DnsResponse(
      status: json['Status'],
      tc: json['TC'],
      rd: json['RD'],
      ra: json['RA'],
      ad: json['AD'],
      cd: json['CD'],
      question: List<Question>.from(
          json['Question'].map((x) => Question.fromJson(x))),
      answer: List<Answer>.from(json['Answer'].map((x) => Answer.fromJson(x))),
    );
  }
}

class Question {
  String name;
  int type;

  Question({
    required this.name,
    required this.type,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      name: json['name'],
      type: json['type'],
    );
  }
}

class Answer {
  String name;
  int type;
  int ttl;
  String data;

  Answer({
    required this.name,
    required this.type,
    required this.ttl,
    required this.data,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      name: json['name'],
      type: json['type'],
      ttl: json['TTL'],
      data: json['data'],
    );
  }
}
