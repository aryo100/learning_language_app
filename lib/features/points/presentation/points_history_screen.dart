import 'package:flutter/material.dart';
import 'package:learning_language_app/const/color.dart';
import 'package:learning_language_app/const/injection/service_locator.dart';
import 'package:learning_language_app/const/typography.dart';
import 'package:learning_language_app/features/points/domain/entities/points_entities.dart';
import 'package:learning_language_app/features/points/domain/usecases/points_usecases.dart';
import 'package:learning_language_app/router/navigation_extensions.dart';
import 'package:learning_language_app/router/path.dart';
import 'package:learning_language_app/widgets/flashcard_style_scaffold.dart';

class PointsHistoryScreen extends StatefulWidget {
  const PointsHistoryScreen({super.key});

  @override
  State<PointsHistoryScreen> createState() => _PointsHistoryScreenState();
}

class _PointsHistoryScreenState extends State<PointsHistoryScreen> {
  final _getHistory = sl<GetPointsHistoryUsecase>();

  final List<PointTransactionEntity> _items = [];
  bool _isLoading = true;
  bool _isLoadingMore = false;
  bool _hasMore = true;
  String? _error;
  int _offset = 0;
  static const _pageSize = 20;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load({bool loadMore = false}) async {
    if (loadMore) {
      if (_isLoadingMore || !_hasMore) return;
      setState(() => _isLoadingMore = true);
    } else {
      setState(() {
        _isLoading = true;
        _error = null;
        _offset = 0;
        _items.clear();
        _hasMore = true;
      });
    }

    final result = await _getHistory.call(
      GetPointsHistoryParams(limit: _pageSize, offset: _offset),
    );
    if (!mounted) return;

    result.fold(
      (history) {
        setState(() {
          _items.addAll(history.items);
          _offset += history.items.length;
          _hasMore = _items.length < history.total;
          _isLoading = false;
          _isLoadingMore = false;
        });
      },
      (error) => setState(() {
        _error = '$error';
        _isLoading = false;
        _isLoadingMore = false;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlashcardStyleScaffold.page(
      title: 'Points History',
      onBack: () => context.popOrGo(Paths.setting),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
        child: Container(
          decoration: flashcardStylePanelDecoration(),
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(_error!, style: caption, textAlign: TextAlign.center),
              const SizedBox(height: 12),
              TextButton(onPressed: () => _load(), child: const Text('Retry')),
            ],
          ),
        ),
      );
    }

    if (_items.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Text('No point transactions yet.', style: caption),
        ),
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.pixels >=
                notification.metrics.maxScrollExtent - 120 &&
            !_isLoadingMore &&
            _hasMore) {
          _load(loadMore: true);
        }
        return false;
      },
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: _items.length + (_hasMore ? 1 : 0),
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          if (index >= _items.length) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          final item = _items[index];
          final sign = item.amount >= 0 ? '+' : '';
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Color.lerp(
                ColorPallete.accent,
                Colors.white,
                0.85,
              ),
              child: Text(
                '$sign${item.amount}',
                style: caption.copyWith(
                  color: ColorPallete.accent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(item.sourceLabel, style: body),
            subtitle: Text(
              item.description.isNotEmpty
                  ? item.description
                  : _formatDate(item.createdAt),
              style: caption,
            ),
            trailing: Text(
              _formatDate(item.createdAt),
              style: caption.copyWith(fontSize: 11),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          );
        },
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
