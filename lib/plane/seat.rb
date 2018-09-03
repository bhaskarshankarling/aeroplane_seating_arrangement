module SeatingArrangement
  class Seat
    attr_accessor :type, :row, :column

    def initialize(row, column)
      @row = row
      @column = column
      @vacant = true
      @passenger_number = nil
    end

    def reserve(passenger_number)
      return unless @vacant
      @passenger_number = passenger_number
      @vacant = false
    end

    def display
      number_to_display = @passenger_number == nil ? "XX" : formatted_passenger_number
      color_format(number_to_display)
    end

    private

    def color_format(number)
      return blue(number) if type == :aisle
      return green(number) if type == :window
      return red(number) if type == :middle
    end

    def red(number)
      "\e[41;1m #{number} \e[0m"
    end

    def blue(number)
      "\e[44;1m #{number} \e[0m"
    end

    def green(number)
      "\e[42;1m #{number} \e[0m"
    end

    def formatted_passenger_number
      @passenger_number > 9 ? @passenger_number : "0#{@passenger_number}"
    end
  end
end
