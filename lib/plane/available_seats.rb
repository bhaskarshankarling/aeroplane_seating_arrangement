module SeatingArrangement
  class AvailableSeats
    def initialize(blocks, max_rows, max_columns)
      @blocks = blocks
      @max_rows = max_rows
      @max_columns = max_columns
    end

    def each_seat(&callback)
      aisle_seats(&callback)
      window_seats(&callback)
      middle_seats(&callback)
    end

    private

    def aisle_seats
      @max_rows.times do |row|
        @blocks.each do |block|
          block.aisle_seats(row).each { |seat| yield seat }
        end
      end
    end

    def window_seats
      @max_rows.times do |row|
        @blocks.each do |block|
          block.window_seats(row).each { |seat| yield seat }
        end
      end
    end

    def middle_seats
      @max_rows.times do |row|
        @blocks.each do |block|
          block.middle_seats(row).each { |seat| yield seat }
        end
      end
    end
  end
end
