def without(arr, index)
  if index == 0 
    t[index+1..t.count-1]
  elsif index == t.count - 1
    t[0..index-1]
  else 
    t[0..index-1] + t[index+1..t.count-1]
  end
end

def rec(t, c, og)
  h = Hash.new
  c.times do |i|
    h[i] = og.map{|arr| arr[i]}
  end
  p h
  a = []
  c.times do |i|
    if a.empty?
      a = h[i] 
    else
      
    end
  end
end

def solution(arr, info)
  n = info.first.to_i
  l = info.last.to_i
  t = arr.map{|a| a.split("")}.flatten

  return "-" if l == 1 

  rec(t, l, arr)
end

c = 0
info = nil
arr = []
problem_c = 0 
ARGF.each_with_index do |line, index|
  line.chomp!("\n")
  if index == 0 
    next
  end

  if info.nil?
    info = line.split(" ")
    problem_c = info.first.to_i
    next
  end

  problem_c -= 1
  
  if problem_c > 0 
    arr << line
    next 
  end
  c += 1
  arr << line

  answer = solution(arr, info)
  info = nil
  arr = []

  $stdout.print("Case ##{c}: #{answer}\n")
end
