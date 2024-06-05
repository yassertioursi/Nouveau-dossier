part of 'index.dart';

class _Certificates extends StatelessWidget {
  const _Certificates(this._isMe);

  final bool _isMe;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkerProfileCubit, WorkerProfileState>(
      builder: (context, state) {
        final certificates = context.watch<WorkerProfileCubit>().certificates;
        return Column(
          children: [
            ...certificates.map(
              (certificate) => _buildCertificate(
                certificate: certificate,
                onDelete: () {
                  context
                      .read<WorkerProfileCubit>()
                      .deleteCertificate(certificate);
                },
                onEdit: (certificate) {
                  context.to(
                    CreateEditCertificate(certificate: certificate),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCertificate({
    required CertificateEntity certificate,
    required VoidCallback onDelete,
    required void Function(CertificateEntity) onEdit,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 22.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.2),
            blurRadius: 10.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              width(23),
              Expanded(
                child: Text(
                  certificate.title!,
                  maxLines: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    color: AppColors.primary,
                  ),
                ),
              ),
              if (!_isMe)
                PopupMenuButton(
                  icon: const Icon(
                    Icons.more_vert,
                    color: AppColors.primary,
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: onDelete,
                      child: Row(
                        children: [
                          const Icon(Icons.delete),
                          width(10),
                          const Text('Delete'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        onEdit(certificate);
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.edit),
                          width(10),
                          const Text('Edit'),
                        ],
                      ),
                    ),
                  ],
                )
            ],
          ),
          height(8),
          Container(
            height: 320.r,
            width: 320.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: AppColors.grey),
              image: DecorationImage(
                image: NetworkImage(certificate.imageUrl!),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
