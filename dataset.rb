#!/usr/bin/env ruby

output = []
size = 100000
for i in 0..size
  output << "#{rand(size)}"
end
file = output.join ","
File.write('dataset.txt', file)