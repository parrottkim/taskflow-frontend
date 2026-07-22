part of '../widget.dart';

class ClientInformation extends StatelessWidget {
  final int clientId;
  final String name;

  const ClientInformation({
    super.key,
    required this.clientId,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final clientType = ClientType.fromKey(clientId);

    return Row(
      children: [
        Skeleton.leaf(
          child: Container(
            width: 28.0,
            height: 28.0,
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Color(clientType.color),
            ),
            child: SvgPicture.asset(
              clientType.asset,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
