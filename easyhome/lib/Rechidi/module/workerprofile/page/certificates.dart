part of 'index.dart';

class _Certificates extends StatelessWidget {
  const _Certificates(this._isMe);

  final bool _isMe;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkerProfileCubit, WorkerProfileState>(
      builder: (context, state) {
        final certificates = context.watch<WorkerProfileCubit>().certificates;
        return NoItemsWidget(
          condition: certificates.isNotEmpty,
          message: 'No certificates found',
          child: ListView(
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
          ),
        );
      },
    );
  }

  Widget _buildCertificate({
    required CertificateEntity certificate,
    required VoidCallback onDelete,
    required void Function(CertificateEntity) onEdit,
  }) {
    if (!(certificate.isValid == true) && !_isMe) return const SizedBox();
    return Column(
      children: [
        Stack(children: [
          Opacity(
            opacity: certificate.isValid! ? 1 : 0.55,
            child: Container(
              padding: EdgeInsets.only(right: 15.w, left: 15.w),
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow( // TODO rigle design 
                  spreadRadius: 0,
                  offset: Offset(0, 0),
                  color: Color.fromARGB(255, 53, 53, 53),
                  blurRadius: 50,
                ),
              ]),
              child: CupertinoContextMenu(
                actions: <Widget>[
                  if (_isMe)
                    CupertinoContextMenuAction(
                      child: const Row(
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Delete Post",
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        onDelete();
                      },
                    )
                ],
                child: SafeArea(
                  child: Image.network(
                    certificate.imageUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          if (!certificate.isValid!)
            Positioned(
              left: 20.w,
              top: 5.h,
              child: Row(
                children: [
                  Icon(
                    Icons.report,
                    color: Colors.red,
                    size: 25.sp,
                  ),
                  Text(
                    "Not Valid Yet",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
        ]),
        SizedBox(
          height: 23.h,
        )
      ],
    );
  }
}
