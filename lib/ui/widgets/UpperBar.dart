import 'package:flutter/material.dart';
import 'package:tdp2/ui/pages/login_page.dart';
import 'package:tdp2/services/mini-storage.dart' as storage;

import '../pages/home_page.dart';


class UpperBar extends StatelessWidget with PreferredSizeWidget {
  UpperBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: null,
          elevation: 0,
          backgroundColor: Colors.white,
          title: SizedBox(
            height: 40,
            width: 40,
            child: Image.asset(
              'assets/logo.PNG',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          automaticallyImplyLeading: false,
          actions: [
            Builder(
              builder: (context) {
                return Container(
                  padding: EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () => _showHome(context),
                    child: const ClipOval(child: Icon(
                      Icons.account_balance_sharp,
                      color: Colors.redAccent,
                    )
                    ),
                  ),
                );
              },
            ),
            Builder(
              builder: (context) {
                return Container(
                  padding: EdgeInsets.all(7),
                  child: GestureDetector(
                    onTap: () => _logout(context),
                    child: const ClipOval(child: Icon(
                            Icons.power_settings_new_outlined,
                            color: Colors.red,
                        )
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      }

  Future<void> _logout(BuildContext context) async {
    await storage.deleteAllAsync();
    Navigator.of(context).push( MaterialPageRoute(builder: (context) => LoginPage()) );
  }

  _showHome(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}