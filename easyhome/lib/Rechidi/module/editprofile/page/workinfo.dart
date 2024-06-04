part of 'index.dart';

class _WorkInfo extends StatelessWidget {
  const _WorkInfo();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EditProfileCubit>();
    return Column(
      children: [
        ...[
          _WorkInfoItem(
            label: 'Job',
            controller: cubit.job,
            icon: Icons.work,
            items: StaticStuf.jobs,
          ),
          _WorkInfoItem(
            label: 'Wilaya',
            controller: cubit.wilaya,
            icon: Icons.location_city,
            items: StaticStuf.wilayas,
          ),
        ].map((e) => _buildWorkInfoItem(e))
      ],
    );
  }

  Widget _buildWorkInfoItem(_WorkInfoItem item) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField<String>(
            value: item.controller.text.isEmpty ? null : item.controller.text,
            onChanged: (value) => item.controller.text = value!,
            items: item.items
                .map((e) => DropdownMenuItem<String>(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            decoration: InputDecoration(
              prefixIcon: Icon(item.icon),
              labelText: item.label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WorkInfoItem {
  const _WorkInfoItem({
    required this.label,
    required this.controller,
    required this.icon,
    required this.items,
  });

  final String label;
  final TextEditingController controller;
  final IconData icon;
  final List<String> items;
}
