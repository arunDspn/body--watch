class RestoreTableSummary {
  const RestoreTableSummary({
    required this.name,
    this.insertedCount = 0,
    this.skippedCount = 0,
  });

  final String name;
  final int insertedCount;
  final int skippedCount;
}

class RestoreSummary {
  const RestoreSummary({
    required this.scope,
    required this.merge,
    this.tables = const <RestoreTableSummary>[],
    this.sections = const <RestoreSummary>[],
  });

  final String scope;
  final bool merge;
  final List<RestoreTableSummary> tables;
  final List<RestoreSummary> sections;

  int get insertedCount =>
      tables.fold(0, (sum, item) => sum + item.insertedCount) +
      sections.fold(0, (sum, item) => sum + item.insertedCount);

  int get skippedCount =>
      tables.fold(0, (sum, item) => sum + item.skippedCount) +
      sections.fold(0, (sum, item) => sum + item.skippedCount);

  String toUserMessage() {
    final mode = merge ? 'merge' : 'replace';

    if (sections.isNotEmpty) {
      final sectionLines = sections
          .map(
            (section) =>
                '${_labelize(section.scope)}: inserted ${section.insertedCount}, skipped ${section.skippedCount}',
          )
          .join('\n');
      return '${_labelize(scope)} restore completed ($mode).\n'
          'Inserted: $insertedCount, skipped: $skippedCount\n'
          '$sectionLines';
    }

    final detailLines = tables
        .where((table) => table.insertedCount > 0 || table.skippedCount > 0)
        .map(
          (table) =>
              '${_labelize(table.name)}: inserted ${table.insertedCount}, skipped ${table.skippedCount}',
        )
        .join('\n');

    if (detailLines.isEmpty) {
      return '${_labelize(scope)} restore completed ($mode).';
    }

    return '${_labelize(scope)} restore completed ($mode).\n'
        'Inserted: $insertedCount, skipped: $skippedCount\n'
        '$detailLines';
  }

  static String _labelize(String value) {
    return value
        .replaceAll('_', ' ')
        .replaceAllMapped(
          RegExp(r'\b\w'),
          (match) => match.group(0)!.toUpperCase(),
        );
  }
}
