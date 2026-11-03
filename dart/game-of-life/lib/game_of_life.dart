class GameOfLife {
  // Put your code here
  List<List<int>> _grid;

  GameOfLife(this._grid);

  void tick() {
    if (_grid.isEmpty) return;

    final List<List<int>> nextGeneration = [
      for (final List<int> row in _grid) List.of(row)
    ];

    for (final (int rowIndex, List<int> row) in nextGeneration.indexed) {
      for (final (int cellIndex, int cell) in row.indexed) {
        int liveNeighbors = _countLiveNeighbors(rowIndex, cellIndex);
        if (cell == 1 && (liveNeighbors == 2 || liveNeighbors == 3)) {
          nextGeneration[rowIndex][cellIndex] = 1;
        } else if (cell == 0 && liveNeighbors == 3) {
          nextGeneration[rowIndex][cellIndex] = 1;
        } else {
          nextGeneration[rowIndex][cellIndex] = 0;
        }
      }
    }

    _grid = nextGeneration;
  }

  List<List<int>> matrix() => _grid;

  int _countLiveNeighbors(int r, int c) {
    const dirs = [
      (-1, -1),
      (-1, 0),
      (-1, 1),
      (0, -1),
      (0, 1),
      (1, -1),
      (1, 0),
      (1, 1)
    ];
    var count = 0;
    for (final (dr, dc) in dirs) {
      final nr = r + dr, nc = c + dc;
      if (nr < 0 || nr >= _grid.length || nc < 0 || nc >= _grid[nr].length)
        continue;
      if (_grid[nr][nc] == 1) count++;
    }
    return count;
  }
}
