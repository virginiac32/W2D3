class Array

  def my_uniq
    new_array = []

    each do |el|
      new_array << el unless new_array.include?(el)
    end

    new_array
  end

  def two_sum
    new_array = []
    idx1 = 0

    while idx1 < length - 1
      idx2 = idx1 + 1
      while idx2 < length
        new_array << [idx1,idx2] if self[idx1] + self[idx2] == 0
        idx2 += 1
      end
      idx1 += 1
    end

    new_array
  end

  #works only for square matrices
  def my_transpose
    raise 'needs to be a square matrix' unless length == self[0].length

    transposed = []
    col = []

    each_index do |row_idx|
      temp_arr = []
      each do |sub_arr|
        temp_arr << sub_arr[row_idx]
      end
      transposed << temp_arr
    end

    transposed
  end

  def stock_picker
    idx = 0
    most_profitable = 0
    result = []
    while idx < length - 1
      idx2 = idx + 1
      while idx2 < length
        if self[idx2]-self[idx] > most_profitable
          most_profitable = self[idx2]-self[idx]
          result = [idx,idx2]
        end
        idx2 += 1
      end
      idx += 1
    end

    return nil if result.empty?
    result
  end



end


class TowersOfHanoi
  attr_accessor :grid

  def initialize
    @grid = [[1, 2, 3], [], []]
  end

  def move
    # puts "Please enter a move in this format: 0,1"
    # s = gets.chomp
    # move = s.split(',').map(&:to_i)
    move = [0,1]
    start_pos = move[0]
    end_pos = move[1]
    raise 'that tower has no piece' if grid[start_pos].empty?
    piece = grid[start_pos].shift
    if !grid[end_pos].empty? && (piece > grid[end_pos].first)
      raise 'the piece is larger than the tower\'s top stack'
    end

    grid[end_pos].unshift(piece) if valid_move?(start_pos, end_pos, piece)

  end

  def valid_move?(start_pos, end_pos, piece)
    #starting grid is not empty
    return true if grid[end_pos].empty?

    !(grid[start_pos].empty?) && (piece < grid[end_pos].first)
  end

  def won?

    (grid[0].empty? && grid[1].empty?) || (grid[0].empty? && grid[2].empty?)
  end


end

tower = TowersOfHanoi.new

tower.move
p tower.grid
