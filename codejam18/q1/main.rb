# filename = ARGV[0]
# p "Processing #{filename}"

# result = File.open("result.txt", 'w')

def dont_shoot(str)
  arr = str.split(" ")
  shield = arr.first.to_i
  bot = arr.last
  shot = bot.count("S")
  charge = bot.count("C")
  return "IMPOSSIBLE" if shot > shield 
  damage = 0 
  strength = 1
  bot.split("").each do |inst|
    if inst == "C"
      strength *= 2
    elsif inst == "S"
      damage += strength
    end
  end
  damage
  
  if damage <= shield
    return "0"
  else
    difference = damage - shield
    c = 0
    i = bot.size - 1
    temp = bot 
    temp_str = strength
    loop do 
      break if difference < 1
      if temp[i] == "C"
        temp_str = temp_str / 2 
      else
        if temp[i] != temp[i-1] 
          t = temp[i]
          temp[i] = temp[i-1]
          temp[i-1] = t
          difference -= temp_str / 2
          i = bot.size
          temp_str = strength
          c += 1
        end
      end
      i -= 1
      break if i == 0 
    end
    c 
  end
end

ARGF.each_with_index do |line, index|
  line.chomp!("\n")
  if index == 0 
    next
  end
  answer = dont_shoot(line)
  $stdout.print("Case ##{index}: #{answer}\n")
end
