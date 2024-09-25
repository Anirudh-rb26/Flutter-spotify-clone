import 'package:flutter/cupertino.dart';
import 'package:spotifyclone/common/helpers/is_darkmode.dart';

class SmallPlayButton extends StatelessWidget {
  const SmallPlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        CupertinoIcons.play_arrow_solid,
        color: context.isDarkMode ? const Color(0xFFE6E6E6) : const Color(0XFF959595),
      ),
    );
  }
}
