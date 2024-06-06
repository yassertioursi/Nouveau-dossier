part of 'index.dart';

class _Drawer extends StatelessWidget {
  const _Drawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const drawerHeader(),
          SizedBox(
            height: 10.h,
          ),
          drawerItem(
              //  this function switch the user to worker 3 cases
              myicon: Icons.work,
              text: "Switch To user",
              onTap: () {
                context.read<WorkerProfileCubit>().switchAccount();
                context.to(const Home_User());
              }),
          Divider(
            thickness: 0.8,
            endIndent: 16.sp,
            indent: 16.sp,
            color: Colors.black,
          ),
          drawerItem(
              //
              myicon: Icons.edit,
              text: "Edit Profile",
              onTap: () {
                final worker = context.read<WorkerProfileCubit>().worker!;
                context.to(EditProfile(worker: worker));
              }),
          drawerItem(
            myicon: Icons.lock,
            text: "Change Password",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => PasswrodCubit(locator<Repo>()),
                      child: const ChangePassword(),
                    ),
                  ));
            },
          ),

          Divider(
            thickness: 0.8.sp,
            endIndent: 16,
            indent: 16,
            color: Colors.black,
          ),
          drawerItem(
            myicon: Icons.logout,
            text: "Log Out",
            onTap: () {
              AuthCache.logOut();
              context.off(Login());
            },
          )

          // ...[
          //   _DrawerItem(
          //     title: 'Home',
          //     icon: Icons.home,
          //     onTap: () {},
          //   ),
          //   _DrawerItem(
          //     title: 'Edit Profile',
          //     icon: Icons.settings,
          //     onTap: () {
          //       final worker = context.read<WorkerProfileCubit>().worker!;
          //       context.to(EditProfile(worker: worker));
          //     },
          //   ),
          //   _DrawerItem(
          //     title: 'ChangePassword',
          //     icon: Icons.password,
          //     onTap: () {},
          //   ),
          //   _DrawerItem(
          //     title: 'About',
          //     icon: Icons.info,
          //     onTap: () {},
          //   ),
          //   _DrawerItem(
          //     title: 'Help',
          //     icon: Icons.help,
          //     onTap: () {},
          //   ),
          //   _DrawerItem(
          //     title: 'Logout',
          //     icon: Icons.logout,
          //     onTap: () {},
          //   ),
          // ].map(
          //   (item) => _drawerItem(
          //     myicon: item.icon ,

          //     text: item.title ,
          //     function: item.onTap
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _drawerItem({
    required IconData myicon,
    required String text,
    VoidCallback? function,
  }) {
    return InkWell(
      onTap: function,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.sp, vertical: 14.sp),
        child: Row(
          children: [
            Expanded(
              child: Icon(
                myicon,
                size: 20,
                color: Colors.black,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem {
  final String title;
  final IconData icon;
  final Function() onTap;

  _DrawerItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}
