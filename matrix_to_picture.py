import sys
import png

input_filename = sys.argv[1]
output_filename = sys.argv[2]

with open(input_filename, 'r') as input_file:
  array = []
  for line in input_file:
    array.append([int(x) for x in line.split()])
  png.from_array(array, 'L').save(output_filename) 
input_file.closed
