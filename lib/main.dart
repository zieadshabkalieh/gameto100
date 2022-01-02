import 'dart:async';

import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:gameto100/randomnum.dart';

import 'mybutton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '100 Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '100 Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> buttons = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];
  static int n = 0;
  bool isityours = true;
  bool tapped = false;
  bool finish = false;
  bool start = false;
  bool timervis = true;
  int random = MyRandom(1, 3);
  int wrandom = 3;

  @override
  void incerement() {
    setState(() {
      start = true;
      if(finish==true)
        {
          timervis=false;
        }
      else
        {
          timervis=true;
        }
      _controller.restart(duration: _duration);
      if (wrandom == 1) {
        if (_result<=100 && isityours == true && finish==false) {
          _result = _result + userinput;
          isityours = false;
          tapped = false;
        } else if (_result > 89 && isityours == false && finish == false) {
          _controller.pause();
          computerinput = 100 - _result;
          _result = _result + computerinput;
          isityours = true;
          tapped = false;
          finish = true;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "Computer Win!",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ));
        } else if (_result<=100 && n == 1 && isityours == false && finish ==false) {
          _controller.restart(duration: _duration);
          computerinput = 12 - userinput;
          _result = _result + computerinput;
          isityours = true;
          tapped = false;
        } else if (_result<=100 && isityours == false && finish==false) {
          _controller.restart(duration: _duration);
          computerinput = 11 - userinput;
          _result = _result + computerinput;
          isityours = true;
          tapped = false;
        }
        n++;
      }else if(wrandom==2)
        {
          if(_result<=100 && isityours==true && finish==false) {
            if ((_result + userinput) <= 100) {
              _result = _result + userinput;
              isityours = false;
              tapped = false;
            } else {
              _controller.pause();
              _result = 100;
              isityours = false;
              tapped = false;
              finish = true;
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  "You Win!",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ));
            }
          }
          else if (_result > 89 && isityours == false && finish==false) {
            _controller.pause();
            computerinput = 100 - _result;
            _result = _result + computerinput;
            isityours = true;
            tapped = false;
            finish = true;
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                "Computer Win!",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ));
          }
          else if(_result>78 && _result<89 && isityours==false && finish == false)
          {
            _controller.restart(duration: _duration);
            computerinput=89-_result;
            _result = _result + computerinput;
            isityours = true;
            tapped = false;
          }
          else if(_result>67 && _result<78 && isityours==false && finish==false)
            {
              _controller.restart(duration: _duration);
              computerinput =78-_result;
              _result = _result + computerinput;
              isityours = true;
              tapped = false;
            }
          else if(_result>56 && _result<67 && isityours==false && finish==false)
          {
            _controller.restart(duration: _duration);
            computerinput =67-_result;
            _result = _result + computerinput;
            isityours = true;
            tapped = false;
          }
          else if (_result<=100 && isityours == false && finish ==false) {
            _controller.restart(duration: _duration);
            computerinput = MyRandom(1, 10);
            _result = _result + computerinput;
            isityours = true;
            tapped = false;
          }
        }
      else if (wrandom ==3){
        if (_result<=100 && isityours == true && finish == false) {
          if ((_result + userinput) <= 100) {
            _result = _result + userinput;
            isityours = false;
            tapped = false;
          } else {
            _controller.pause();
            _result = 100;
            isityours = false;
            tapped = false;
            finish = true;
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                "You Win!",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ));
          }
        } else if (_result > 89 && isityours == false && finish==false) {
          _controller.pause();
            computerinput = 100 - _result;
            _result = _result + computerinput;
            isityours = true;
            tapped = false;
            finish = true;
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                "Computer Win!",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ));
        } else if (_result<=100 && isityours == false && finish ==false) {
          _controller.restart(duration: _duration);
          computerinput = MyRandom(1, 10);
          _result = _result + computerinput;
          isityours = true;
          tapped = false;
        }
      }
    });
  }

  CountDownController _controller = CountDownController();
  static int userinput = 0;
  static int computerinput = 0;
  int _duration = 10;
  int _result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'The Result is: $_result',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal),
            ),
            SizedBox(
              height: 25,
            ),
            Visibility(
                visible: !start,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: wrandom,
                          onChanged: (value) {
                            setState(() {
                              wrandom = int.parse(value.toString());
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Expert",
                          style: TextStyle(fontSize: 22),
                        )
                      ],
                    )
                  ],
                )),
            Visibility(
                visible: !start,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 2,
                          groupValue: wrandom,
                          onChanged: (value) {
                            setState(() {
                              wrandom = int.parse(value.toString());
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Meduim",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    )
                  ],
                )),
            Visibility(
                visible: !start,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 3,
                          groupValue: wrandom,
                          onChanged: (value) {
                            setState(() {
                              wrandom = int.parse(value.toString());
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Easy",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    )
                  ],
                )),
            SizedBox(
              height: 25,
            ),
        Visibility(
          child: CircularCountDownTimer(
              duration: _duration,
              initialDuration: 0,
              controller: _controller,
              width: MediaQuery.of(context).size.width / 20,
              height: MediaQuery.of(context).size.height / 20,
              ringColor: Colors.grey[300]!,
              ringGradient: null,
              fillColor: Colors.purpleAccent[100]!,
              fillGradient: null,
              backgroundColor: Colors.purple[500],
              backgroundGradient: null,
              strokeWidth: 47,
              strokeCap: StrokeCap.butt,
              textStyle: TextStyle(
                  fontSize: 10.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textFormat: CountdownTextFormat.S,
              isReverse: false,
              isReverseAnimation: false,
              isTimerTextShown: true,
              autoStart: false,
              onStart: () {
                print('Countdown Started');
              },
              onComplete: () {
                setState(() {
                  if (isityours == true && tapped == false && _result != 100) {
                    tapped = true;
                    userinput = MyRandom(1, 10);
                    incerement();
                    _controller.restart(duration: _duration);
                    Timer(Duration(seconds: random), () {
                      incerement();
                    });
                  }
                       });
                print('Countdown Ended');
              },
            ),
          visible: timervis,
        ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5),
                    itemBuilder: (BuildContext context, index) {
                      // Clear Button
                      if (index == 0) {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              tapped = true;
                              userinput = int.parse(buttons[index]);
                              incerement();
                              if (finish != true) {
                                _controller.restart(duration: _duration);
                                Timer(Duration(seconds: random), () {
                                  incerement();
                                });
                              }
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                        );
                      } else if (index == 1) {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              tapped = true;
                              userinput = int.parse(buttons[index]);
                              incerement();
                              if (finish != true) {
                                _controller.restart(duration: _duration);
                                Timer(Duration(seconds: random), () {
                                  incerement();
                                });
                              }
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                        );
                      } else if (index == 2) {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              tapped = true;
                              userinput = int.parse(buttons[index]);
                              incerement();
                              if (finish != true) {
                                _controller.restart(duration: _duration);
                                Timer(Duration(seconds: random), () {
                                  incerement();
                                });
                              }
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                        );
                      } else if (index == 3) {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              tapped = true;
                              userinput = int.parse(buttons[index]);
                              incerement();
                              if (finish != true) {
                                _controller.restart(duration: _duration);
                                Timer(Duration(seconds: random), () {
                                  incerement();
                                });
                              }
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                        );
                      } else if (index == 4) {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              tapped = true;
                              userinput = int.parse(buttons[index]);
                              incerement();

                              if (finish != true) {
                                _controller.restart(duration: _duration);
                                Timer(Duration(seconds: random), () {
                                  incerement();
                                });
                              }
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                        );
                      } else if (index == 5) {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              tapped = true;
                              userinput = int.parse(buttons[index]);
                              incerement();

                              if (finish != true) {
                                _controller.restart(duration: _duration);
                                Timer(Duration(seconds: random), () {
                                  incerement();
                                });
                              }
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                        );
                      } else if (index == 6) {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              tapped = true;
                              userinput = int.parse(buttons[index]);
                              incerement();

                              if (finish != true) {
                                _controller.restart(duration: _duration);
                                Timer(Duration(seconds: random), () {
                                  incerement();
                                });
                              }
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                        );
                      } else if (index == 7) {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              tapped = true;
                              userinput = int.parse(buttons[index]);
                              incerement();
                              if (finish != true) {
                                _controller.restart(duration: _duration);
                                Timer(Duration(seconds: random), () {
                                  incerement();
                                });
                              }
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                        );
                      } else if (index == 8) {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              tapped = true;
                              userinput = int.parse(buttons[index]);
                              incerement();
                              if (finish != true) {
                                _controller.restart(duration: _duration);
                                Timer(Duration(seconds: random), () {
                                  incerement();
                                });
                              }
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                        );
                      } else if (index == 9) {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              tapped = true;
                              userinput = int.parse(buttons[index]);
                              incerement();
                              if (finish != true) {
                                _controller.restart(duration: _duration);
                                Timer(Duration(seconds: random), () {
                                  incerement();
                                });
                              }
                            });
                          },
                          buttonText: buttons[index],
                          color: true ? Colors.blueAccent : Colors.white,
                          textColor: true ? Colors.white : Colors.black,
                        );
                      } else {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              tapped = true;
                              userinput = int.parse(buttons[index]);
                              incerement();
                              if (finish != true) {
                                _controller.restart(duration: _duration);
                                Timer(Duration(seconds: random), () {
                                  incerement();
                                });
                              }
                            });
                          },
                          buttonText: buttons[index],
                          color: true ? Colors.blueAccent : Colors.white,
                          textColor: true ? Colors.white : Colors.black,
                        );
                      }
                    }),
              ),
            ),

            Visibility(
              visible: !isityours,
              child: Text(
                "You Choose $userinput",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
            Visibility(
              visible: isityours && start,
              child: Text(
                "I Choose $computerinput",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
            ),
            Column(
              children: [
                Visibility(
                    visible: finish,
                    child: Text("Play Again",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey))),
                Visibility(
                  visible:start || finish,
                    child: IconButton(
                    onPressed: () {
                      setState(() {
                        _result = n = 0;
                        finish = false;
                        isityours = true;
                        tapped = false;
                        userinput = 0;
                        computerinput = 0;
                        start = false;
                        timervis=false;
                        _controller.pause();
                      });
                    },
                    icon: Icon(Icons.replay_sharp),
                    iconSize: 50,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 70,
            )
          ],
        ),
      ),
    );
  }

  _button({required String title, VoidCallback? onPressed}) {
    return Expanded(
        child: RaisedButton(
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: onPressed,
      color: Colors.purple,
    ));
  }
}
