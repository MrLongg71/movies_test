import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'loading_app.dart';

class CustomList extends StatefulWidget {
  const CustomList({
    super.key,
    required this.child,
    this.onRefresh,
    this.onLoadMore,
    required this.isComplete,
    this.scrollDirection = Axis.vertical,
    this.loadingWidget,
    this.hasReachedMax = false,
  });

  final Widget child;
  final Function? onRefresh;
  final Function? onLoadMore;
  final bool isComplete;
  final Axis scrollDirection;
  final Widget? loadingWidget;
  final bool hasReachedMax;

  @override
  State<CustomList> createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  RefreshController? _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController(initialRefresh: false);
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController?.dispose();
  }

  @override
  void didUpdateWidget(covariant CustomList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isComplete) {
      _refreshController?.refreshCompleted();
      _refreshController?.loadComplete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      scrollDirection: widget.scrollDirection,
      enablePullDown: widget.onRefresh != null,
      enablePullUp: widget.onLoadMore != null && widget.hasReachedMax == false,
      header: CustomHeader(
        completeDuration: const Duration(milliseconds: 100),
        refreshStyle: RefreshStyle.Follow,
        builder: (BuildContext context, RefreshStatus? mode) {
          if (mode == RefreshStatus.refreshing) {
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: const LoadingApp(),
            );
          }
          return const SizedBox();
        },
      ),
      footer: CustomFooter(
        height: 200,
        builder: (BuildContext context, LoadStatus? mode) {
          if (mode == LoadStatus.loading) {
            return Container(
              margin: const EdgeInsets.only(top: 16),
              child: const LoadingApp(),
            );
          }
          return const SizedBox();
        },
      ),
      controller: _refreshController!,
      onRefresh: () async {
        if (!mounted) return;
        widget.onRefresh?.call();
      },
      onLoading: () async {
        if (!mounted || widget.hasReachedMax) return;
        widget.onLoadMore?.call();
      },
      child: widget.child,
    );
  }
}
