part of 'index.dart';

class _JobList extends StatelessWidget {
  const _JobList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsMapCubit, PostsMapState>(
      builder: (context, state) {
        final cubit = context.read<PostsMapCubit>();
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: _buildList(
            cubit.jobList,
            (job) {
              cubit.job = job;
              cubit.fecthPosts();
            },
          ),
        );
      },
    );
  }

  Row _buildList(Map<String, bool> jobList, ValueChanged<String> onTap) {
    return Row(children: [
      width(12),
      ...jobList.entries.map(
        (e) => Row(
          children: [
            _buildJobItem(e.key, e.value, onTap),
            width(12),
          ],
        ),
      ),
    ]);
  }

  Widget _buildJobItem(
      String job, bool isSelected, ValueChanged<String> onTap) {
    final boxColor = isSelected ? AppColors.primary : Colors.white;
    final textColor = isSelected ? Colors.white : AppColors.primary;
    return InkWell(
      onTap: () => onTap(job),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: AppColors.primary, width: 2),
        ),
        child: Text(
          job[0].toUpperCase() + job.substring(1).toLowerCase(),
          style: TextStyle(
            color: textColor,
            fontSize: 14.sp,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w600,
            fontFamily: '',
          ),
        ),
      ),
    );
  }
}
