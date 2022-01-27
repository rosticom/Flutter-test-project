
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import '../constant/colors.dart';
import 'screen-1/screen_1_page.dart';
import 'screen-2/screen_2_page.dart';

class Screen0 extends StatelessWidget {
  const Screen0({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) => Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Button(
              title: '1',
              onTap: () => Navigator.of(context).pushNamed(Screen1.routeName),
            ),
            const Gap(16),
            _Button(
              title: '2',
              onTap: () => Navigator.of(context).pushNamed(Screen2.routeName),
            ),
          ],
        ),
      );
}

class _Button extends StatelessWidget {
  const _Button({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: ColoredBox(
          color: ProjectColor.white,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: RichText(
              text: TextSpan(
                text: title,
                style: const TextStyle(
                  color: ProjectColor.black,
                ),
              ),
            ),
          ),
        ),
      );
}
