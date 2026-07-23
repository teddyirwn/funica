import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuPopUp extends StatelessWidget {
  const MenuPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: SvgPicture.asset(
            "assets/icons/Group.svg",
            width: 24,
            height: 24,
          ),
          onPressed: () async {
            final RenderBox button = context.findRenderObject() as RenderBox;
            final RenderBox overlay =
                Overlay.of(context).context.findRenderObject() as RenderBox;

            final buttonPosition = button.localToGlobal(
              Offset.zero,
              ancestor: overlay,
            );

            const double popupWidth = 100;
            const double rightMargin = 15;
            const double topMargin = 8;

            final position = RelativeRect.fromLTRB(
              overlay.size.width - popupWidth - rightMargin,
              buttonPosition.dy + button.size.height + topMargin,
              rightMargin,
              0,
            );

            final result = await showMenu<String>(
              context: context,
              position: position,
              color: Colors.white,
              elevation: 8,
              menuPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              items: [
                PopupMenuItem(
                  value: "share",
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _MenuTile(
                    icon: "assets/icons/send.svg",
                    text: "Share E-Receipt",
                  ),
                ),

                PopupMenuItem(
                  enabled: false,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 1,
                  child: Divider(
                    height: 1,
                    thickness: 1,
                    color: Colors.grey.shade300,
                  ),
                ),
                PopupMenuItem(
                  value: "download",
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const _MenuTile(
                    icon: "assets/icons/dowload.svg",
                    text: "Download E-Receipt",
                  ),
                ),

                PopupMenuItem(
                  enabled: false,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 1,
                  child: Divider(
                    height: 1,
                    thickness: 1,
                    color: Colors.grey.shade300,
                  ),
                ),
                PopupMenuItem(
                  value: "print",
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const _MenuTile(
                    icon: "assets/icons/list.svg",
                    text: "Print",
                  ),
                ),
              ],
            );

            debugPrint(result);
          },
        );
      },
    );
  }
}

class _MenuTile extends StatelessWidget {
  final String icon;
  final String text;

  const _MenuTile({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      height: 44,
      child: Row(
        children: [
          SvgPicture.asset(icon, width: 20, height: 20),
          const SizedBox(width: 14),
          Text(
            text,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
