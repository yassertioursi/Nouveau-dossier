part of 'index.dart';

class _PersonalInfo extends StatelessWidget {
  const _PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EditProfileCubit>();
    return Column(
      children: [
        ...[
          _PersonalInfoItem(
            label: 'Name',
            controller: cubit.name,
            icon: Icons.person,
            inputType: TextInputType.name,
          ),
          _PersonalInfoItem(
            label: 'Bio',
            controller: cubit.bio,
            icon: Icons.info,
            inputType: TextInputType.multiline,
          ),
          _PersonalInfoItem(
            label: 'Phone',
            controller: cubit.phone,
            icon: Icons.phone,
            inputType: TextInputType.phone,
          ),
          _PersonalInfoItem(
            label: 'Email',
            controller: cubit.email,
            icon: Icons.email,
            inputType: TextInputType.emailAddress,
          ),
          _PersonalInfoItem(
            label: 'Facebook',
            controller: cubit.facebook,
            icon: Icons.facebook,
            inputType: TextInputType.url,
          ),
        ].map((e) => _buildPersonalInfoItem(e))
      ],
    );
  }

  Widget _buildPersonalInfoItem(_PersonalInfoItem item) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: item.controller,
            keyboardType: item.inputType,
            maxLines: item.inputType == TextInputType.multiline ? 3 : 1,
            textAlignVertical: TextAlignVertical.top,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              prefixIcon: Icon(item.icon),
              labelText: item.label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PersonalInfoItem {
  final String label;
  final TextEditingController controller;
  final IconData icon;
  final TextInputType inputType;

  _PersonalInfoItem({
    required this.label,
    required this.controller,
    required this.icon,
    required this.inputType,
  });
}
