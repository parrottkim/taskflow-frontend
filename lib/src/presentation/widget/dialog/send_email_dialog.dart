part of '../widget.dart';

class SendEmailDialog extends HookConsumerWidget {
  final String title;
  final Future<void> Function(List<User> selectedUsers, bool isAllSelected)?
  onPressed;

  const SendEmailDialog({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final isAllSelected = useState(true);
    final selectedUsers = useState<List<User>>([]);

    return Dialog(
      child: ContentContainer(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        constraints: const BoxConstraints(maxWidth: 430.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                title,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(Intl.message('project_mail_select_1')),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AppToggleButton(
                value: isAllSelected.value,
                onChanged: (value) {
                  isAllSelected.value = value;
                  if (isAllSelected.value) selectedUsers.value = [];
                },
                child: Text(Intl.message('common_send_all')),
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton.icon(
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) => UserSelectorDialog(
                    selectionType: UserSelectionType.multiple,
                    initialSelectedUsers: selectedUsers.value,
                    onMultiSelected: (users) {
                      selectedUsers.value = users;
                      if (selectedUsers.value.isNotEmpty) {
                        isAllSelected.value = false;
                      }
                    },
                  ),
                ),
                icon: Icon(
                  selectedUsers.value.isEmpty
                      ? Symbols.person_rounded
                      : Symbols.people_rounded,
                ),
                label: Text(
                  selectedUsers.value.isEmpty
                      ? Intl.message('project_form_user_search')
                      : '${selectedUsers.value.length} ${Intl.message('filter_suffix')}',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => context.pop(),
                      child: Text(
                        Intl.message('common_close'),
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed:
                          onPressed != null &&
                              (isAllSelected.value ||
                                  selectedUsers.value.isNotEmpty)
                          ? () async {
                              try {
                                await onPressed?.call(
                                  selectedUsers.value,
                                  isAllSelected.value,
                                );
                                ref
                                    .read(toastProvider)
                                    .showToast(
                                      child: Toast(
                                        message: Intl.message(
                                          'project_mail_send',
                                        ),
                                      ),
                                    );
                                if (!context.mounted) return;
                                context.pop();
                              } catch (e) {
                                ref
                                    .read(toastProvider)
                                    .showToast(
                                      child: Toast(
                                        type: ToastType.alert,
                                        message: Intl.message(
                                          'project_mail_send_fail',
                                        ),
                                      ),
                                    );
                              }
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: colorScheme.onPrimary,
                        backgroundColor: colorScheme.primary,
                      ),
                      child: Text(
                        Intl.message('common_ok'),
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
