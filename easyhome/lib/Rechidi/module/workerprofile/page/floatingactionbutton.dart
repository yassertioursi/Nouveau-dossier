part of 'index.dart';

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton(this._isMe);

  final bool _isMe;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WorkerProfileCubit>();
    return _isMe
        ? PopupMenuButton(
            itemBuilder: (context) => [
              _PopUpItem(
                icon: Icons.add,
                title: 'Add new certificate',
                onTap: () async {
                  final certificate = await context
                      .to<CertificateEntity>(const CreateEditCertificate());
                  cubit.addCertificate(certificate);
                },
              ),
              _PopUpItem(
                icon: Icons.add,
                title: 'Add new post',
                onTap: ()async {
                  final post = await context
                      .to<PortfolioPostEntity>(const CreateEditPost(null));
                  cubit.addPost(post);
                  
                  
                },
              ),
            ].map((item) {
              return PopupMenuItem(
                onTap: item.onTap,
                child: Row(
                  children: [
                    Icon(item.icon),
                    width(10),
                    Text(item.title),
                  ],
                ),
              );
            }).toList(),
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 30.sp,
              ),
            ),
          )
        : const SizedBox();
  }
}

class _PopUpItem {
  const _PopUpItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final void Function() onTap;
}
