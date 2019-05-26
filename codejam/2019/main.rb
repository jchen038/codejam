def main(num)
  num_s = num.to_s.split('')
  a = num_s.map{|s| s == '4' ? 1 : 0}
  b = a.join('').to_i
  a = num - b
  "#{a} #{b}"
end
c = 1

ARGF.each_with_index do |line, index|
  line.chomp!("\n")
  if index == 0
    next
  end

  answer = main(line.to_i)

  $stdout.print("Case ##{c}: #{answer}\n")
  c += 1
end
