filename = ARGV[0]

cases = []
casefile = File.open(filename)
i = 0
file = casefile.read.split("\n")

while true
  if i != 0
    distance, number = file[i].split(" ")

    horses = []
    i += 1
    number.to_i.times do
      horses << file[i]
      i += 1
    end
    i -= 1

    cases << {distance: distance.to_i, number: number.to_i, horses: horses}

  end
  break if i == file.count - 1

  i += 1
end

def solve(line)
  slowest = 0
  line[:horses].each do |horse|
    location,pace = horse.split(" ")
    travel_distance = line[:distance] - location.to_i
    travel_time = travel_distance.to_f / pace.to_i
    slowest = travel_time if slowest < travel_time
  end

  (line[:distance].to_f / slowest.to_f).to_f
end

f = File.open("./resulta.txt", 'w')

cases.each_with_index do |line,index|
  f << "Case ##{index+1}: #{solve(line)}\n"
end