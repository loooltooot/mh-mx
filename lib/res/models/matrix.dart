class Matrix {
  List<List<int>> matrix = [];
  int rows = 0;
  int columns = 0;

  Matrix(int rows, int columns) {
    resizeMatrix(rows, columns, true);
  }

  List<List<int>> resizeMatrix(int rows, int columns, bool rewrite) {
    if(rows < this.rows) {
      for(int i = 0; i < this.rows - rows; i++) {
        matrix.removeLast();
      }
      for(List<int> row in matrix) {
        for(int i = 0; i < this.columns - columns; i++) {
          row.removeLast();
        }
      }
    } else {
      for (int i = 0; i < rows; i++) {
        if (i >= this.rows) {
          matrix.add([]);
        }
        for (int j = 0; j < columns; j++) {
          if (!rewrite) {
            if (i >= this.rows || j >= this.columns) {
              matrix[i].add(0);
            }
          } else {
            matrix[i].add(0);
          }
        }
      }
    }

    this.rows = rows;
    this.columns = columns;

    return matrix;
  }

  void insertValue(int value, int rowNum, int colNum) {
    matrix[rowNum][colNum] = value;
  }

  void clear() {
    matrix = resizeMatrix(2, 2, true);
  }
}