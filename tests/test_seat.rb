require_relative '../lib/seating_arrangement'
require 'test/unit'

class TestSeat < Test::Unit::TestCase
  def test_init
    seat = SeatingArrangement::Seat.new(2, 3)
    assert_equal(seat.row, 2)
    assert_equal(seat.column, 3)
  end

  def test_reserve
    seat = SeatingArrangement::Seat.new(2, 3)
    assert_equal(seat.instance_variable_get(:@passenger_number), nil)
    assert_equal(seat.instance_variable_get(:@vacant), true)
    seat.reserve(14)
    assert_equal(seat.instance_variable_get(:@passenger_number), 14)
    assert_equal(seat.instance_variable_get(:@vacant), false)
  end

  def test_seat_with_single_digit
    seat = SeatingArrangement::Seat.new(2, 3)
    seat.reserve(8)
    seat.type = :middle
    assert_equal(seat.display, "\e[41;1m 08 \e[0m")
  end

  def test_aisle_seat
    seat = SeatingArrangement::Seat.new(2, 3)
    seat.reserve(8)
    seat.type = :aisle
    assert_equal(seat.display, "\e[44;1m 08 \e[0m")
  end

  def test_middle_seat
    seat = SeatingArrangement::Seat.new(2, 3)
    seat.reserve(8)
    seat.type = :middle
    assert_equal(seat.display, "\e[41;1m 08 \e[0m")
  end

  def test_window_seat
    seat = SeatingArrangement::Seat.new(2, 3)
    seat.reserve(8)
    seat.type = :window
    assert_equal(seat.display, "\e[42;1m 08 \e[0m")
  end
end
