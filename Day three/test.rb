def verify_solution(input, expected)
  puts "Verifying solution for #{input}"
  actual = solve(input)
  if actual == expected
    puts "PASSED"
  else
    puts "FAILED"
    puts "Expected: #{expected}"
    puts "Actual: #{actual}"
  end
end

p square_of_sum(5000)