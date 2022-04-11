import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_test/bloc/bloc/dashboard_bloc.dart';

import '../../constants.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  BoxDecoration _boxDeco([Color? color, double? radius]) {
    return BoxDecoration(
        color: color ?? Colors.blueAccent,
        borderRadius: BorderRadius.circular(radius ?? 8));
  }

  Widget _buildSqContainer() {
    return Container(
      height: 120,
      decoration: _boxDeco(),
    );
  }

  AppBar _buildAppBar(String name) {
    return AppBar(
      leading: Transform.translate(
        offset: const Offset(20, 0),
        child: CircleAvatar(
          child: ClipOval(
              child: Image.network(
                  'http://brupea.com/wp-content/uploads/2018/04/profile-placeholder.jpg',
                  fit: BoxFit.cover)),
        ),
      ),
      toolbarHeight: 100,
      title: Text(
        name,
        style: const TextStyle(color: Colors.blueAccent),
      ),
      titleSpacing: 40,
      backgroundColor: Colors.grey[50],
      elevation: 0,
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: CircleAvatar(
            backgroundColor: Colors.blueGrey,
            child: Icon(Icons.notifications, color: Colors.white),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if(state is DashboardLoadingState) return const Scaffold(body: Center(child: CircularProgressIndicator()));
        
        if(state is DashBoardLoadedState){
          final user = state.user;

          return Scaffold(
            appBar: _buildAppBar(user.name),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: _boxDeco(Colors.blueAccent),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.user.brandName,
                                  style: const TextStyle(
                                      fontSize: 28,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Icon(Icons.more_vert, color: Colors.white)
                              ],
                            ),
                            Text(
                              user.email,
                              style: TextStyle(color: Colors.grey.shade100),
                            ),
                            const Spacer(),
                            Text(
                              'BALANCE',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey.shade100),
                            ),
                            Text(
                              numFormatNoDec.format(double.parse(user.balance)),
                              style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.pushNamed(context, '/addMoney'),
                                  child: Container(
                                    height: 30,
                                    width: 130,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.amberAccent,
                                        borderRadius: BorderRadius.circular(100)),
                                    child: const Text(
                                      '+ ADD MONEY',
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: const Icon(Icons.qr_code_2),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Card(
                        elevation: 4,
                        child: ListTile(
                          minLeadingWidth: 0,
                          dense: true,
                          leading: const Icon(Icons.star, color: Colors.blueAccent),
                          title: const Text('REWARD POINTS'),
                          trailing: Text(numFormatNoDec.format(double.parse(user.rewardPoints))),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: _buildSqContainer()),
                              const SizedBox(width: 20),
                              Expanded(child: _buildSqContainer()),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(child: _buildSqContainer()),
                              const SizedBox(width: 20),
                              Expanded(child: _buildSqContainer())
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(child: _buildSqContainer()),
                              const SizedBox(width: 20),
                              Expanded(child: _buildSqContainer()),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        return const Scaffold(body: Center(child: Text('Error')));
      },
    );
  }
}
