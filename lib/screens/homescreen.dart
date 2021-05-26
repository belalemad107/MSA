import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:msa/screens/output.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> items = ['DNA', 'RNA'];
  bool cc = true;
  String selected = 'DNA';
  TextEditingController Input_Controller = new TextEditingController();
  TextEditingController match_controller = new TextEditingController();
  TextEditingController mismatch_controller = new TextEditingController();
  TextEditingController gap_controller = new TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(height * 0.03),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: height * 0.055,
                ),
                Center(
                  child: Row(
                    children: <Widget>[
                      Text(
                        " The Type of Your Input :",
                        style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: DropdownButton(
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          value: selected,
                          onChanged: (value) {
                            setState(() {
                              selected = value;
                            });
                          },
                          items: items.map((item) {
                            return DropdownMenuItem(
                                child: new Text(item), value: item);
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Enter Your Input :",
                      style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Text(" ")
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, right: 5, left: 10),
                  child: Container(
                    height: 150,  
                    child: Form(
                      key: _formkey,
                      child: TextFormField(
                        validator: (vall) {
                          String val = vall.toUpperCase();
                          for (int i = 0; i < val.length; i++) {
                            if (val[i] == 'A' ||
                                val[i] == 'C' ||
                                val[i] == 'G' ||
                                val[i] == '\n') {
                              cc = true;
                              continue;
                            } else if (selected == 'DNA' && val[i] == "T") {
                              cc = true;
                              continue;
                            } else if (selected == 'RNA' && val[i] == "U") {
                              cc = true;
                              continue;
                            } else {
                              cc = false;
                              break;
                            }
                          }
                          if (val.isEmpty) {
                            return "Please Enter your input";
                          } else if (cc == false) {
                            return 'Enter a valid input';
                          } else {
                            return null;
                          }
                        },
                        controller: Input_Controller,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        minLines: 3,
                        decoration: InputDecoration(
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            contentPadding: EdgeInsets.all(15),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Match :",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    SizedBox(
                      width: width * 0.015,
                    ),
                    Container(
                      width: 70,
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            contentPadding: EdgeInsets.all(15),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                        controller: match_controller,
                        keyboardType: TextInputType.number,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Mismatch :",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Container(
                      width: 70,
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            contentPadding: EdgeInsets.all(15),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                        controller: mismatch_controller,
                        keyboardType: TextInputType.number,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Gap :",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Container(
                      width: 70,
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            contentPadding: EdgeInsets.all(15),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                        controller: gap_controller,
                        keyboardType: TextInputType.number,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.07,
                ),
                InkWell(
                  onTap: () {
                    if (_formkey.currentState.validate()) {
                      int a;
                      if (match_controller.text.isEmpty) {
                        a = 5;
                      } else {
                        a = int.parse(match_controller.text);
                      }
                      int b;
                      if (mismatch_controller.text.isEmpty) {
                        b = -5;
                      } else {
                        b = int.parse(mismatch_controller.text);
                      }
                      int c;
                      if (gap_controller.text.isEmpty) {
                        c = 6;
                      }
                      else if(int.parse(gap_controller.text)> 0){
                        b = a + 1;
                      }
                      else {
                        c = int.parse(gap_controller.text) + (a - int.parse(gap_controller.text)) + 1;
                      }
                      _formkey.currentState.save();
                      List<dynamic> result = new List();
                      List<String> list = Input_Controller.text.split("\n");
                      result = Align(list, a, b, c);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OutPut(
                              Output: result,
                            ),
                          ));
                    }
                  },
                  child: Container(
                    child: Center(
                        child: Text(
                      'Get Output',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
                    width: width * 0.5,
                    height: height * 0.1 - 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List Align(List<String> list, int Match_controller, int Mis, int Gap) {
  String A = list[0].toUpperCase().trim();
  String B = list[1].toUpperCase().trim();
  String C =
      list[2].toUpperCase().trim(); // sequence to be aligned A and B and C
  String A_al1 = "",
      B_al1 = "",
      C_al1 = "",
      A_al2 = "",
      B_al2 = "",
      C_al2 = "",
      A_al3 = "",
      B_al3 = "",
      C_al3 = ""; // aligned sequence A and B
  int AB = 0, AC = 0, BC = 0; // scores for initial pairwise alignments
  int PW_top = 0;
  double score_MSA = 0; // highest score of pairwise alignments and MSA
  int a = Match_controller; // match
  int b = 2; // purine-purine / pyrimidine-pyrimidine
  int c = Mis; // mismatch
  int gap =
      Gap;
  int gap_ext = -2;
  int A_n = A.length;
  int B_n = B.length;
  int C_n = C.length;
  List<dynamic> mix = new List();
  List<dynamic> result = new List();

  // First pairwise alignment
  mix = NW(A, B, A_al1, B_al1, A_n, B_n, a, b, c, gap, gap_ext, AB, mix, 0);
  mix = NW(A, C, A_al2, C_al1, A_n, C_n, a, b, c, gap, gap_ext, AC, mix, 1);
  mix = NW(B, C, B_al2, C_al2, B_n, C_n, a, b, c, gap, gap_ext, BC, mix, 2);

  AB = mix[0];
  A_al1 = mix[1];
  B_al1 = mix[2];

  AC = mix[3];
  A_al2 = mix[4];
  C_al1 = mix[5];

  BC = mix[6];
  B_al2 = mix[7];
  C_al2 = mix[8];

  if (AB >= AC && AB >= BC) {
    PW_top = AB;
  } else if (AC >= BC) {
    PW_top = AC;
  } else {
    PW_top = BC;
  }


  if (PW_top == AB) {
    NW_MSA(A_al1, B_al1, C, A_al3, B_al3, C_al3, A_al1.length, B_al1.length,
        C_n, a, b, c, gap, gap_ext, score_MSA, result);
  } else if (PW_top == AC) {
    NW_MSA(A_al2, C_al1, B, A_al3, C_al3, B_al3, A_al2.length, C_al1.length,
        B_n, a, b, c, gap, gap_ext, score_MSA, result);
  } else {
    NW_MSA(B_al2, C_al2, A, B_al3, C_al3, A_al3, B_al2.length, C_al2.length,
        A_n, a, b, c, gap, gap_ext, score_MSA, result);
  }

  return result;
}

List<int> NW_MSA(
    String A,
    String B,
    String C,
    String A_al,
    String B_al,
    String C_al,
    int A_n,
    int B_n,
    int C_n,
    int a,
    int b,
    int c,
    int gap,
    int gap_ext,
    double msa_score,
    List result) {
  List M = List.generate(C_n + 1, (i) => List(A_n + 1), growable: false);

  // ignore: non_constant_identifier_names
  List M_tb = List.generate(C_n + 1, (i) => List(A_n + 1), growable: false);

  init(M, M_tb, A_n, C_n, gap, gap_ext);

  // Create alignment
  alignment_MSA(M, M_tb, A, B, C, A_al, B_al, C_al, A_n, B_n, C_n, a, b, c, gap,
      gap_ext, result);

  msa_score = M[C_n][A_n];
  result.add(msa_score);
}

int alignment_MSA(
    List M,
    List M_tb,
    String A,
    String B,
    String C,
    String A_al,
    String B_al,
    String C_al,
    int A_n,
    int B_n,
    int C_n,
    int a,
    int b,
    int c,
    int gap,
    int gap_ext,
    List result) {
  int x1 = 0, x2 = 0, y = 0;
  double scU, scD, scL;
  String ptr, nuc;
  String Al = "", Bl = "", Cl = "";
  int i = 0, j = 0;
  int length = 0;
  double inner_gap;
  List<List<int>> s = [
    [a, b, c, c],
    [b, a, c, c],
    [c, c, a, b],
    [c, c, b, a]
  ];

  for (i = 1; i <= C_n; i++) {
    for (j = 1; j <= A_n; j++) {

      inner_gap = 0;
      scD = 0;


      nuc = A[j - 1];

      switch (nuc) {
        case 'C':
          x1 = 0;
          break;
        case 'T':
          x1 = 1;
          break;
        case 'A':
          x1 = 2;
          break;
        case 'G':
          x1 = 3;
          break;
        case 'U':
          x1 = 1;
          break;
        case '-':
          inner_gap += 1;
          break;
      }


      nuc = B[j - 1];

      switch (nuc) {
        case 'C':
          x2 = 0;
          break;
        case 'T':
          x2 = 1;
          break;
        case 'A':
          x2 = 2;
          break;
        case 'G':
          x2 = 3;
          break;
        case 'U':
          x1 = 1;
          break;
        case '-':
          inner_gap += 1;
          break;
      }

      nuc = C[i - 1];

      switch (nuc) {
        case 'C':
          y = 0;
          break;
        case 'T':
          y = 1;
          break;
        case 'A':
          y = 2;
          break;
        case 'U':
          x1 = 1;
          break;
        case 'G':
          y = 3;
      }

      scD = (M[i - 1][j - 1] +
          ((s[x1][y] + s[x2][y]) / 2)
              .toDouble());
      scU = M[i - 1][j] -
          gap_affinity(gap, gap_ext, length)
              .toDouble();
      scL = M[i][j - 1] -
          gap_affinity(gap, gap_ext, length)
              .toDouble();
      scU += (((inner_gap * gap) * 0.5)
          .toDouble());
      M[i][j] = max_score(scU, scD, scL, ptr,
          length);
      M_tb[i][j] = mmax_score(scU, scD, scL, ptr, length);
    }
  }
  i--;
  j--;
  while (i > 0 || j > 0) {
    switch (M_tb[i][j]) {
      case '|':
        Al += '–';
        Bl += '–';
        Cl += C[i - 1];
        i--;
        break;

      case '\\':
        Al += A[j - 1];
        Bl += B[j - 1];
        Cl += C[i - 1];
        i--;
        j--;
        break;

      case '-':
        Al += A[j - 1];
        Bl += B[j - 1];
        Cl += '–';
        j--;
    }
    //k++ ;
  }
  A_al = reverse(Al);
  B_al = reverse(Bl);
  C_al = reverse(Cl);
  result.add(A_al);
  result.add(B_al);
  result.add(C_al);
  return 0;
}

List NW(String A, String B, String A_al, String B_al, int A_n, int B_n, int a,
    int b, int c, int gap, int gap_ext, int paired_score, List mix, int m) {
  List M = List.generate(B_n + 1, (i) => List(A_n + 1), growable: false);

  List MTb = List.generate(B_n + 1, (i) => List(A_n + 1), growable: false);

  init(M, MTb, A_n, B_n, gap, gap_ext);

  alignment(M, MTb, A, B, A_al, B_al, A_n, B_n, a, b, c, gap, gap_ext,
      paired_score, mix);

  paired_score = M[B_n][A_n];
  return mix;
}

Function init(List M, List M_tb, int A_n, int B_n, int gap, int gap_ext) {
  M[0][0] = 0;
  M_tb[0][0] = 'n';

  int i = 0, j = 0;

  for (j = 1; j <= A_n; j++) {
    M[0][j] = -(gap + (gap_ext * (j - 1)));
    M_tb[0][j] = '-';
  }
  for (i = 1; i <= B_n; i++) {
    M[i][0] = -(gap + (gap_ext * (i - 1)));
    M_tb[i][0] = '|';
  }
}

int alignment(
    List M,
    List M_tb,
    String A,
    String B,
    String A_al,
    String B_al,
    int A_n,
    int B_n,
    int a,
    int b,
    int c,
    int gap,
    int gap_ext,
    int paired_score,
    List mix) {
  int x = 0, y = 0;
  int scU = 0,
      scD = 0,
      scL = 0;
  String ptr = '', nuc = '';
  int i = 0, j = 0;
  String Al = "";
  String Bl = '';
  int length = 0;


  List<List<int>> s = [
    [a, b, c, c],
    [b, a, c, c],
    [c, c, a, b],
    [c, c, b, a]
  ];
  for (i = 1; i <= B_n; i++) {
    for (j = 1; j <= A_n; j++) {
      nuc = A[j - 1];

      switch (nuc) {
        case 'C':
          x = 0;
          break;
        case 'T':
          x = 1;
          break;
        case 'A':
          x = 2;
          break;
        case 'U':
          x = 1;
          break;
        case 'G':
          x = 3;
      }

      nuc = B[i - 1];

      switch (nuc) {
        case 'C':
          y = 0;
          break;
        case 'T':
          y = 1;
          break;
        case 'A':
          y = 2;
          break;
        case 'U':
          y = 1;
          break;
        case 'G':
          y = 3;
      }
      scU = M[i - 1][j] -
          gap_affinity(gap, gap_ext, length);
      scD = M[i - 1][j - 1] + s[x][y];
      scL = M[i][j - 1] -
          gap_affinity(
              gap, gap_ext, length);
      M[i][j] = max_score(scU, scD, scL, ptr,
          length);
      M_tb[i][j] = mmax_score(scU, scD, scL, ptr, length);
    }
  }
  paired_score = M[B_n][A_n];
  mix.add(paired_score);
  i--;
  j--;
  while (i > 0 || j > 0) {
    switch (M_tb[i][j]) {
      case '|':
        Al += '–';
        Bl += B[i - 1];
        i--;
        break;

      case '\\':
        Al += A[j - 1];
        Bl += B[i - 1];
        i--;
        j--;
        break;

      case '-':
        Al += A[j - 1];
        Bl += '–';
        j--;
    }
  }
  A_al = reverse(Al);
  mix.add(A_al);
  B_al = reverse(Bl);
  mix.add(B_al);
  return 0;
}

String reverse(String s) {
  var sb = new StringBuffer();
  for (var i = s.length - 1; i >= 0; --i) {
    sb.write(s[i]);
  }
  return sb.toString();
}

int gap_affinity(int gap, int gap_ext, int length) {
  int gap_aff = gap + (gap_ext * length);

  return gap_aff;
}

num max_score(num up, num diag, num left, String ptr, int length) {
  num max = 0;
  if (diag >= up && diag >= left) {
    max = diag;
    ptr = '\\';
    length = 0;
  } else if (up > left) {
    max = up;
    ptr = '|';
    length++;
  } else {
    max = left;
    ptr = '-';
    length++;
  }
  return max;
}

String mmax_score(num up, num diag, num left, String ptr, int length) {
  if (diag >= up && diag >= left) {
    ptr = '\\';
    length = 0;
  } else if (up > left) {
    ptr = '|';
    length++;
  } else {
    ptr = '-';
    length++;
  }
  return ptr;
}
