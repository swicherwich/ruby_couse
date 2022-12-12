MATRIX_ROW = 9          
MATRIX_COLUMN = 9       
SUB_MATRIX = 3

# Function checks if the given matrix is a valid sudoku
def is_conditions_meet(matrix, row, column, digit)

    #Check if this row contains the number
    for i in 0..MATRIX_ROW - 1 do
        if matrix[row][i] == digit
            return false
        end
    end

    #Check if this column contains the number
    for i in 0..MATRIX_COLUMN - 1 do
        if matrix[i][column] == digit
            return false
        end
    end

    # Check if we find the same num
    # in the particular 3*3 matrix
    start_row = row - row % SUB_MATRIX
    start_col = column - column % SUB_MATRIX
    for i in 0..SUB_MATRIX - 1 do
        for j in 0..SUB_MATRIX - 1 do
            if matrix[i + start_row][j + start_col] == digit
                return false
            end
        end
    end

    # all condition are meet 
    true
end

def solve_sudoku(matrix, row, column)

    #if we have reached the 8th row and 9th column
    # Exit condition
    if row == MATRIX_ROW - 1 && column == MATRIX_COLUMN
        return true
    end

    if column == MATRIX_COLUMN 
        column = 0
        row += 1
    end

    if matrix[row][column] != 0
        return solve_sudoku(matrix, row, column + 1)
    end

    for digit in 1..9 do
        if is_conditions_meet(matrix, row, column, digit)
            matrix[row][column] = digit

            if solve_sudoku(matrix, row, column + 1)
                return true
            end
        end

        # removing the assigned num , since our
        # assumption was wrong , and we go for next
        # assumption with diff num value
        matrix[row][column] = 0
    end
    
    # not found assumption
    false
end

def print_matrix(matrix)
    for i in 0..MATRIX_ROW - 1 do
        for j in 0..MATRIX_COLUMN - 1 do
            print "#{matrix[i][j]} "
        end
        puts 
    end
end

grid = [[ 3, 0, 6, 5, 0, 8, 4, 0, 0 ],
        [ 5, 2, 0, 0, 0, 0, 0, 0, 0 ],
        [ 0, 8, 7, 0, 0, 0, 0, 3, 1 ],
        [ 0, 0, 3, 0, 1, 0, 0, 8, 0 ],
        [ 9, 0, 0, 8, 6, 3, 0, 0, 5 ],
        [ 0, 5, 0, 0, 9, 0, 6, 0, 0 ],
        [ 1, 3, 0, 0, 0, 0, 2, 5, 0 ],
        [ 0, 0, 0, 0, 0, 0, 0, 7, 4 ],
        [ 0, 0, 5, 2, 0, 6, 3, 0, 0 ]]

print_matrix(grid)
puts 
solve_sudoku(grid, 0, 0)
print_matrix(grid)
