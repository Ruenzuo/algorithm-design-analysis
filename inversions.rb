#!/usr/bin/env ruby

def merge(first_half, second_half)
  merge = []
  while !first_half.empty? and !second_half.empty?
    if first_half.first <= second_half.first
      merge << first_half.shift
    else
      merge << second_half.shift
    end
  end
  while !first_half.empty?
    merge << first_half.shift
  end
  while !second_half.empty?
    merge << second_half.shift
  end
  return merge
end

def sort(input)
  if input.length <= 1
    return input
  end
  half = input.size / 2
  first_half = input.slice(0, half)
  second_half = input.slice(half, input.length - half)
  first_half_sorted = sort(first_half)
  second_half_sorted = sort(second_half)
  return merge(first_half_sorted, second_half_sorted)
end

data_set = File.read('inversions-dataset.txt')
input = data_set.split("\n").map { |item| item.to_i }

output = sort(input)

puts output
