module SeatingArrangement
  class Block
    def initialize(rows, columns, options={})
      @rows = rows
      @columns = columns
      @seats = {}
      @extras = options
      @seat_matirx = allocate_seats
    end

    def aisle_seats(row)
      if @seats[:aisle] != nil
        @seats[:aisle][row] || []
      else
        []
      end
    end

    def window_seats(row)
      if @seats[:window] != nil
        @seats[:window][row] || []
      else
        []
      end
    end

    def middle_seats(row)
      if @seats[:middle] != nil
        @seats[:middle][row] || []
      else
        []
      end
    end

    def display(row)
      if @seat_matirx[row] != nil
        "#{@seat_matirx[row].map(&:display).join}"
      else
        "#{@columns.times.map { '    ' }.join}"
      end
    end

    private

    def allocate_seats
      @rows.times.map do |row|
        @columns.times.map do |column|
          seat = Seat.new(row + 1, column + 1)
          seat.type = seat_type(seat)
          @seats[seat.type] = [] if @seats[seat.type] == nil
          @seats[seat.type][row] = [] if @seats[seat.type][row] == nil
          @seats[seat.type][row] << seat
          seat
        end
      end
    end

    def seat_type(seat)
      if @extras[:near_left_window]
        if seat.column == @columns
          return :aisle
        elsif seat.column == 1
          return :window
        end
      elsif @extras[:near_right_window]
        if seat.column == 1
          return :aisle
        elsif seat.column == @columns
          return :window
        end
      end
      seat.column > 1 && seat.column < @columns ? :middle : :aisle
    end
  end
end
