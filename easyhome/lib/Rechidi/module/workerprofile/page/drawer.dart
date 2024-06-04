part of 'index.dart';

class _Drawer extends StatelessWidget {
  const _Drawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ...[
            _DrawerItem(
              title: 'Home',
              icon: Icons.home,
              onTap: () {},
            ),
            _DrawerItem(
              title: 'Edit Profile',
              icon: Icons.settings,
              onTap: () {
                final worker = context.read<WorkerProfileCubit>().worker!;
                context.to(EditProfile(worker: worker));
              },
            ),
            _DrawerItem(
              title: 'ChangePassword',
              icon: Icons.password,
              onTap: () {},
            ),
            _DrawerItem(
              title: 'About',
              icon: Icons.info,
              onTap: () {},
            ),
            _DrawerItem(
              title: 'Help',
              icon: Icons.help,
              onTap: () {},
            ),
            _DrawerItem(
              title: 'Logout',
              icon: Icons.logout,
              onTap: () {},
            ),
          ].map(
            (item) => _buildDrawerItem(item.title, item.icon, item.onTap),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(String title, IconData icon, Function() onTap) {
    return ListTile(
      title: Text(title,
          style: TextStyle(fontSize: 20.sp, color: AppColors.primary)),
      leading: Icon(icon, size: 30.r, color: AppColors.primary),
      onTap: onTap,
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
