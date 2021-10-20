import 'package:flutter/material.dart';
import 'package:task2_metrics_conventer/logic/metrics_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _enteredAmount = 0;
  String? _fromMetric;
  String? _toMetric;
  double _convertedAmount = 0;
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();

  final List<String> _metrics = [
    'cm',
    'm',
    'km',
  ];

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => _focusNode.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset : false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'Metrics Converter',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ),
        body:
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 120),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Number:',
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                      SizedBox(
                        height: 50,
                        width: 120,
                        child: Center(
                          child: TextField(
                            focusNode: _focusNode,
                            controller: _textEditingController,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.white,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.blue,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(35),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(35),
                              ),
                            ),
                            onChanged: (text) {
                              setState(() {
                                var amount = double.tryParse(text);
                                if (amount != null) {
                                  _enteredAmount = amount;
                                }
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: 300,
                      height: 300,
                      decoration: const BoxDecoration(
                          color: Color(0xffadd0ff),
                          shape: BoxShape.circle),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                'From:',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                width: 80,
                                height: 45,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    selectedItemBuilder: (_) => _metrics
                                        .map((e) => Center(child: Text(e)))
                                        .toList(),
                                    iconEnabledColor: Colors.blue,
                                    value: _fromMetric,
                                    borderRadius: BorderRadius.circular(35),
                                    style: const TextStyle(
                                        color: Colors.blue, fontSize: 18),
                                    items: _metrics
                                        .map(
                                          (currency) =>
                                              DropdownMenuItem<String>(
                                            value: currency,
                                            child: Text(
                                              currency,
                                              style: const TextStyle(
                                                  color: Colors.blue),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        _fromMetric = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                'To:',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.italic,
                                ),
                                  textAlign: TextAlign.end,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                width: 80,
                                height: 45,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    selectedItemBuilder: (_) => _metrics
                                        .map((e) => Center(child: Text(e)))
                                        .toList(),
                                    iconEnabledColor: Colors.blue,
                                    value: _toMetric,
                                    borderRadius: BorderRadius.circular(35),
                                    style: const TextStyle(
                                        color: Colors.blue, fontSize: 18),
                                    items: _metrics
                                        .map(
                                          (currency) =>
                                              DropdownMenuItem<String>(
                                            value: currency,
                                            child: Text(
                                              currency,
                                              style: const TextStyle(
                                                  color: Colors.blue),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        _toMetric = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Result:',
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        width: 120,
                        height: 50,
                        child: Center(
                          child: Text(
                            "$_convertedAmount",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  MaterialButton(
                    minWidth: 200,
                    height: 50,
                    child: const Text("CONVERSTION"),
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    onPressed: () {
                      if (_fromMetric == null || _toMetric == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please choose the metrics!'),
                          ),
                        );
                      } else {
                        setState(() {
                          _convertedAmount = MetricsHelper()
                              .convertTo(_enteredAmount, _toMetric, _fromMetric);
                        });
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    minWidth: 200,
                    height: 50,
                    child: const Text("RESET"),
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    onPressed: () {
                      setState(() {
                        _focusNode.unfocus();
                        _textEditingController.clear();
                        _enteredAmount = 0;
                        _toMetric = null;
                        _fromMetric = null;
                        _convertedAmount = 0;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
