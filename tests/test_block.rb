require_relative '../lib/seating_arrangement'
require 'test/unit'

class TestBlock < Test::Unit::TestCase
  def test_aisle_seats_for_center_blocks
    block = SeatingArrangement::Block.new(1, 3)
    seat_positions = [[1, 1], [1, 3]]
    block.aisle_seats(0).each_with_index do |seat, index|
      assert_equal(seat.row, seat_positions[index][0])
      assert_equal(seat.column, seat_positions[index][1])
    end
  end

  def test_middle_seats_for_center_blocks
    block = SeatingArrangement::Block.new(1, 4)
    seat_positions = [[1, 2], [1, 3]]
    block.middle_seats(0).each_with_index do |seat, index|
      assert_equal(seat.row, seat_positions[index][0])
      assert_equal(seat.column, seat_positions[index][1])
    end
  end

  def test_middle_seats_for_the_block_near_left_window
    block = SeatingArrangement::Block.new(1, 4, { near_left_window: true })
    seat_positions = [[1, 2], [1, 3]]
    block.middle_seats(0).each_with_index do |seat, index|
      assert_equal(seat.row, seat_positions[index][0])
      assert_equal(seat.column, seat_positions[index][1])
    end
  end

  def test_window_seats_for_the_block_near_left_window
    block = SeatingArrangement::Block.new(1, 4, { near_left_window: true })
    seat_positions = [[1, 1]]
    block.window_seats(0).each_with_index do |seat, index|
      assert_equal(seat.row, seat_positions[index][0])
      assert_equal(seat.column, seat_positions[index][1])
    end
  end

  def test_aisle_seats_for_the_block_near_left_window
    block = SeatingArrangement::Block.new(1, 4, { near_left_window: true })
    seat_positions = [[1, 4]]
    block.aisle_seats(0).each_with_index do |seat, index|
      assert_equal(seat.row, seat_positions[index][0])
      assert_equal(seat.column, seat_positions[index][1])
    end
  end

  def test_middle_seats_for_the_block_near_right_window
    block = SeatingArrangement::Block.new(1, 4, { near_right_window: true })
    seat_positions = [[1, 2], [1, 3]]
    block.middle_seats(0).each_with_index do |seat, index|
      assert_equal(seat.row, seat_positions[index][0])
      assert_equal(seat.column, seat_positions[index][1])
    end
  end

  def test_window_seats_for_the_block_near_right_window
    block = SeatingArrangement::Block.new(1, 4, { near_right_window: true })
    seat_positions = [[1, 4]]
    block.window_seats(0).each_with_index do |seat, index|
      assert_equal(seat.row, seat_positions[index][0])
      assert_equal(seat.column, seat_positions[index][1])
    end
  end

  def test_aisle_seats_for_the_block_near_right_window
    block = SeatingArrangement::Block.new(1, 4, { near_right_window: true })
    seat_positions = [[1, 1]]
    block.aisle_seats(0).each_with_index do |seat, index|
      assert_equal(seat.row, seat_positions[index][0])
      assert_equal(seat.column, seat_positions[index][1])
    end
  end
end
