#!/usr/bin/env ruby

require 'benchmark'

def quicksort(input)
  if input.empty?
    return []
  end
  pivot = input.slice! 0
  left = input.select { |item| item < pivot }
  right = input.select { |item| item >= pivot }
  return quicksort(left) + [pivot] + quicksort(right)
end

data_set = File.read('dataset.txt')
input = data_set.split(",").map { |item| item.to_i }

output = []

puts Benchmark.measure { output = quicksort(input) }

# puts output
