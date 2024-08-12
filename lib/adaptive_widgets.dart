library adaptive_widgets;

import 'package:adaptive_widgets_flutter/bottom_action_sheet/adaptive_bottom_action_sheet.dart';
import 'package:adaptive_widgets_flutter/date_picker/adaptive_date_picker.dart';
import 'package:adaptive_widgets_flutter/dialog/adaptive_dialog.dart';
import 'package:adaptive_widgets_flutter/refreshable_scroll_view/adaptive_refreshable_scroll_view.dart';
import 'package:flutter/material.dart';

export 'bottom_action_sheet/adaptive_bottom_action_sheet.dart';
export 'date_picker/adaptive_date_picker.dart';
export 'dialog/adaptive_dialog.dart';
export 'refreshable_scroll_view/adaptive_refreshable_scroll_view.dart';

class AdaptiveWidgets {
  static Future<T?> showDialog<T>(
    BuildContext context, {
    String? title,
    String? content,
    required List<AdaptiveDialogButtonBuilder> actionButtons,
    bool dismissible = true,
  }) {
    return AdaptiveDialog(Theme.of(context).platform).show<T>(
      context,
      title: title ?? '',
      content: content,
      actionButtons: actionButtons,
      dismissible: dismissible,
    );
  }

  static Future<T?> showBottomActionSheet<T>(
    BuildContext context, {
    required List<AdaptiveBottomSheetButtonBuilder> actionButtons,
    bool dismissible = true,
  }) {
    return AdaptiveBottomActionSheet(Theme.of(context).platform).show<T>(
      context,
      actionButtons: actionButtons,
      dismissible: dismissible,
    );
  }

  /// Constructs a platform-specific refreshable scroll view.
  static Widget buildRefreshableScrollView(
    BuildContext context, {
    Key? key,
    Widget? header,
    required List<Widget> slivers,
    ScrollController? controller,
    Future<void> Function()? onRefresh,
    Clip clipBehavior = Clip.hardEdge,
    ScrollPhysics? physics,
    bool reverse = false,
    ScrollBehavior? scrollBehavior,
    bool shrinkWrap = false,
    Color? color,
    Color? refreshControlBackgroundColor,
    EdgeInsets padding = EdgeInsets.zero,
  }) {
    return AdaptiveRefreshableScrollView(Theme.of(context).platform).build(
      context,
      key: key,
      header: header,
      slivers: slivers,
      controller: controller,
      onRefresh: onRefresh,
      clipBehavior: clipBehavior,
      physics: physics,
      reverse: reverse,
      scrollBehavior: scrollBehavior,
      shrinkWrap: shrinkWrap,
      color: color,
      refreshControlBackgroundColor: refreshControlBackgroundColor,
      padding: padding,
    );
  }

  static Future<DateTime?> showDatePicker(
    BuildContext context, {
    DateTime? minimumDate,
    DateTime? maximumDate,
    DateTime? initialDate,
  }) async {
    final minDate = minimumDate ?? DateTime(1900);
    final maxDate = maximumDate ?? DateTime(2100);

    // Ensure initialDate is not null. If it is, set it to the current date as a fallback
    var initDate = initialDate ?? DateTime.now();

    // Adjust initialDate if it's outside the range of minDate and maxDate
    if (initDate.isAfter(maxDate)) {
      initDate = maxDate;
    } else if (initDate.isBefore(minDate)) {
      initDate = minDate;
    }

    return AdaptiveDatePicker(Theme.of(context).platform).show(
      context,
      minimumDate: minDate,
      maximumDate: maxDate,
      initialDate: initDate,
    );
  }
}
