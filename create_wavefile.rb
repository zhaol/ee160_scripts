require 'wavefile'
include WaveFile

original_filename = 'original.wav'
input_filename = ARGV[0].dup
output_filename = input_filename.gsub('.data', '') + '.wav'

# get .wav file meta data from original.wav
song = Reader.new(original_filename)
sample_frame_count = Reader.info(original_filename).duration.sample_frame_count

# get array of audio data from input data file
data = []
read_data = IO.readlines(input_filename)
read_data.each do |number|
  data << number.to_i
end

# output the meta data and array of audio data to a separate file
Writer.new(output_filename, song.format) do |writer|
  buffer = Buffer.new(data, song.format)
  writer.write(buffer)
end
