import 'package:flutter/material.dart';
import 'package:tdp_sprint_2/ui/pages/login_page.dart';
import 'package:tdp_sprint_2/services/mini-storage.dart' as storage;

class UpperBar extends StatelessWidget with PreferredSizeWidget {
  const UpperBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Image.asset(
        'assets/logo.PNG',
        fit: BoxFit.cover,
        width: double.infinity,
      ),
      automaticallyImplyLeading: false,
      actions: [
        Builder(
          builder: (context) {
            return Container(
              padding: EdgeInsets.all(7),
              child: FloatingActionButton(
                onPressed: () => _logout(context),
                child: ClipOval(
                    child: Icon(Icons.power_settings_new_outlined)
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Future<void> _logout(BuildContext context) async {
    await storage.deleteAllAsync();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}