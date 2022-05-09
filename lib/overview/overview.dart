import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watcha_body/add_data/add_data.dart';
import 'package:watcha_body/overview/cubit/getchestdata_cubit.dart';

// import 'package:flutter/cupertino.dart';

class OverView extends StatelessWidget {
  const OverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overview'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute(
                  builder: (context) => AddData(),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<GetchestdataCubit, GetchestdataState>(
            builder: (context, state) {
              return state.maybeMap(
                orElse: () {
                  return const Text('data');
                },
                success: (list) {
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          border: Border.all(
                            width: 1,
                            color: Color.fromARGB(255, 112, 112, 112),
                          ),
                        ),
                        height: 200,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Chest : ${list.list.first.measurement}',
                                style: const TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                list.list.first.date.toIso8601String(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            if (list.list.length > 1)
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Previous : ${list.list.last.measurement.toString()}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              )
                            else
                              const Text('No previous data'),
                          ],
                        ),
                      )
                    ],
                  );
                },
                failure: (cause) {
                  return Text(cause.casue);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
