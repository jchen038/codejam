
c = 0
temp = ""
ARGF.each_with_index do |line, index|
  line.chomp!("\n")
  if index == 0 
    next
  end
  if index % 2 == 1
    temp = line.split(" ")
    next
  end
  c += 1

  answer = solution(line, temp)

  $stdout.print("Case ##{c}: #{answer}\n")
end
