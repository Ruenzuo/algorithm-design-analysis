#!/usr/bin/env ruby

def merge_and_count(first_half, second_half)
  merge = []
  inversions = 0
  while !first_half.empty? and !second_half.empty?
    if first_half.first <= second_half.first
      merge << first_half.shift
    else
      merge << second_half.shift
      inversions += first_half.size
    end
  end
  while !first_half.empty?
    merge << first_half.shift
  end
  while !second_half.empty?
    merge << second_half.shift
  end
  return merge, inversions
end

def sort_and_count(input)
  if input.length <= 1
    return input, 0
  end
  half = input.size / 2
  first_half = input.slice(0, half)
  second_half = input.slice(half, input.length - half)
  first_half_sorted, first_half_count = sort_and_count(first_half)
  second_half_sorted, second_half_count = sort_and_count(second_half)
  merge_sorted, merge_count = merge_and_count(first_half_sorted, second_half_sorted)
  return merge_sorted, first_half_count + second_half_count + merge_count
end

data_set = File.read('inversions-dataset.txt')
input = data_set.split("\n").map { |item| item.to_i }

output, count = sort_and_count(input)

puts count
