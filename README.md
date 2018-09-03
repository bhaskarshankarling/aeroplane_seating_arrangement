# Aeroplane Seating Arramgement

This is the implmentation of aeroplane seating arrangement problem. Ruby 2.5.0 is used for developing the library. Use
the below steps to execute/test the code.

### Get into ruby shell
```bash
cd aeroplane_seating_arrangement/lib
irb
```

### Load and run the library
```ruby
require './seating_arrangement'
dimension_of_empty_seats = [[3,2], [3,4], [2,3]]
seating_arrangement = SeatingArrangement::Plane.new(dimension_of_empty_seats)
number_of_seats_to_reserve = 26
seating_arrangement.reserve_seats(number_of_seats_to_reserve)
```

### Run some test cases
```bash
ruby tests/test_seat.rb
ruby tests/test_block.rb
```
**Note:** All test cases are not being covered.
