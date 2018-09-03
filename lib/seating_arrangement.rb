require_relative './plane/available_seats'
require_relative './plane/block'
require_relative './plane/seat'

module SeatingArrangement
  class Plane
    def initialize(seat_dimesions)
      @max_rows = 0
      @max_columns = 0
      @seat_dimesions = seat_dimesions
      @blocks = allocate_blocks
    end

    def reserve_seats(num_of_passengers)
      available_seats = AvailableSeats.new(@blocks, @max_rows, @max_columns)
      passenger_id = 1
      available_seats.each_seat do |seat|
        break if passenger_id > num_of_passengers
        seat.reserve(passenger_id)
        passenger_id += 1
      end
      display
    end

    private

    def display
      @max_rows.times do |row|
        seats_reserved = @blocks.reduce([]) do |seats_reserved, block|
          seats_reserved << block.display(row)
          seats_reserved
        end
        puts seats_reserved.join(" ")
      end
    end

    def allocate_blocks
      @seat_dimesions.each_with_index.map do |dimension, index|
        near_left_window = index == 0
        near_right_window = index == @seat_dimesions.length - 1
        @max_rows = dimension[1] if dimension[1] > @max_rows
        @max_columns = dimension[0] if dimension[0] > @max_columns
        Block.new(dimension[1], dimension[0], {
          near_left_window: near_left_window,
          near_right_window: near_right_window
        })
      end
    end
  end
end
