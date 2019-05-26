filename = ARGV[0]

casefile = File.open(filename)
i = 0
file = casefile.read.split("\n")

def color_by_index(index)
  case index
  when 0
    "R"
  when 1
    "O"
  when 2
    "Y"
  when 3
    "G"
  when 4
    "B"
  when 5
    "V"
  end
end

def next_stall(index)
  return [2,3,4] if index == 0
  return [4] if index == 1
  return [0,4,5] if index == 2
  return [0] if index == 3
  return [0,1,2] if index == 4
  return [2] if index == 5
end

def solve(line)
  colors = line.split(" ") # R[0] O[1] Y[2] G[3] B[4] V[5]
  total = 0
  colors.shift
  colors.map!{|color| color.to_i}
  total = colors.inject(&:+)

  str = []
  c = colors.index(colors.max)

  (total+1).times do |i|

    if str.count == 0
      str << c
      colors[c] -= 1
    else
      next_to = next_stall(str.last)
      max = next_to[0]
      next_to.each{|n| max = n if colors[n] > colors[max]}
      max = str.first if next_to.include?(str.first) && colors[str.first] > 0
      # p "#{max} #{str.first}"
      if next_to.include?(1)
        max = 1 if colors[1] > 0
      elsif next_to.include?(3)
        max = 3 if colors[3] > 0
      elsif next_to.include?(5)
        max = 5 if colors[5] > 0
      end
      break if colors[max] == 0

      str << max
      colors[max] -= 1
    end
  end
  return "IMPOSSIBLE" if str.first == str.last
  colors.inject(&:+) > 0 ? "IMPOSSIBLE": str.map{|s| color_by_index(s)}.join("")
end

f = File.open("./resultb.txt", 'w+')

file.each_with_index do |line,index|
  next if index == 0
  answer = solve(line)

  f << "Case ##{index}: #{answer}\n"
end