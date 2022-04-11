import 'package:bloc_test/bloc/bloc/dashboard_bloc.dart';
import 'package:bloc_test/services/user.dart';
import 'package:bloc_test/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart';

class AddMoney extends StatefulWidget {
  const AddMoney({Key? key}) : super(key: key);

  @override
  State<AddMoney> createState() => _AddMoneyState();
}

class _AddMoneyState extends State<AddMoney> {
  String _amt = '0';

  final TextStyle txtStyle = const TextStyle(fontSize: 20, fontWeight:FontWeight.bold);

  void _cashIn() {
    context.read<DashboardBloc>().add(CashInEvent(double.parse(_amt)));
  }

  InkWell _buildNumbers(int i){
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: () {
        double currAmt = double.parse(_amt);
        if(currAmt <= 0 && currAmt.toString().endsWith('.')) {
          setState(() {
            _amt = '0.';
          });
          return;
        } else {
          double currAmt = double.parse(_amt);
          if (currAmt == 0) {
            setState(() {
              _amt = '$i';
            });
            return;
          }
        }

        if (_amt.contains('.')) {
          if (_amt.split('.')[1].length == 2) return;
        }

        setState(() {
          _amt = '$_amt$i';
        });
        print(_amt);
      },
      child: Center(child: Text(i.toString(), style: txtStyle)),
    );
  }

  InkWell _buildBackspace(){
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: () {
        double currAmt = double.parse(_amt);
        // print(currAmt);
        if (currAmt == 0) return;
        if (currAmt < 1) {
          String subStr = _amt.substring(0, _amt.length - 1);
          setState(() {
            if (subStr == '0.') subStr = '0';
            _amt = subStr;
          });
          return;
        }

        if (currAmt == 0 || currAmt.toInt().toString().length == 1) {
          setState(() {
            _amt = '0';
          });
          return;
        }

        String subStr = _amt.substring(0, _amt.length - 1);
        // print('subStr ');
        if (subStr.endsWith('.')) {
          currAmt = double.parse(_amt);
          subStr = _amt.substring(0, _amt.length - 1);
          // print('endsWith ');
        }

        setState(() {
          _amt = subStr;
        });
      },
      child: const Center(child: Icon(Icons.backspace)),
    );
  }

  InkWell _buildZero(){
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: () {
        double currAmt = double.parse(_amt);
        if (currAmt == 0) return;

        setState(() {
          _amt = '${_amt}0';
        });
      },
      child: Center(child: Text('0', style: txtStyle)),
    );
  }

  InkWell _buildDot(){
    return InkWell(
      customBorder: const CircleBorder(),
        onTap: () {
          if (_amt.contains('.')) return;

          double currAmt = double.parse(_amt);
          if (currAmt == 0) {
            _amt = '0.';
            return;
          }

          setState(() {
            _amt = '.';
          });
        },
      child: Center(child: Text('.', style: txtStyle)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cash In')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  Card(
                    elevation: 4,
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        alignment: Alignment.center,
                        color: Colors.white,
                        constraints: const BoxConstraints(minHeight: 70),
                        child: FittedBox(
                          child: Text(
                            'PHP ${numFormat.format(double.tryParse(_amt))}',
                            style: const TextStyle(fontSize: 42),
                          ),
                        )),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (_, boxCons) => Material(
                        color: Colors.white,
                        child: Center(
                          child: GridView.count(
                            primary: false,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            childAspectRatio: boxCons.maxWidth / (boxCons.maxHeight * 0.6),
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 3,
                            shrinkWrap: true,
                            children: List.generate(12, (index) {
                              int i = index + 1;
                              if(index == 9) return _buildDot();
                              if(index == 10) return _buildZero();
                              if(index == 11) return _buildBackspace();

                              return _buildNumbers(i);
                            }),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    color: Colors.white,
                    child: appBtn(Colors.white, Colors.blueAccent, 'Cash In', double.tryParse(_amt) == 0 ? null : _cashIn, radius: 100),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
