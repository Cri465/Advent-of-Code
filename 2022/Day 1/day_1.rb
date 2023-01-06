require '../helpers/helpers'

puzzle_input = Helpers.read_puzzle_input.split("\n\n")
puzzle_input.map!{|elf| elf.split("\n") }.map(&:to_i).map!(&:sum) # almost certainly terrible
sorted_puzzle_input = puzzle_input.sort
p sorted_puzzle_input[-3..].sum
