def add_to_one(arr, n, r_n)
  arr1 = arr
  diff = n - r_n

  d = 1
  
  loop do 
    break if d > diff
    arr1.each.with_index do |v,index|
      break if d > diff
      t = v + d
      if ( t.to_f / n.to_f * 100 ).round > ( t.to_f / n.to_f * 100 ).floor
        arr1[index] += d 
        diff -= d 
        d = 1
      end
    end
    d += 1
  end
  
  if diff > 0 
    i = 1

    loop do 
      if (i.to_f / n.to_f * 100).round > (i.to_f / n.to_f * 100 ).floor
        loop do 
          break if diff < i
          arr1 << i 
          diff -= i
        end
      end
      break if diff < i
      i += 1
    end
    if (diff.to_f / n.to_f * 100).round > ( diff.to_f / n.to_f * 100 ).floor
      arr1 << diff
      diff = 0 
    end
    arr1.each.with_index do |v,index|
      
      t = v + diff
      if ( t.to_f / n.to_f * 100 ).round > ( t.to_f / n.to_f * 100 ).floor
        arr1[index] += diff
        diff = 0 
        break  
      end
    end
  end

  if diff > 0 
    arr1[0] += diff 
  end
  res = []
  sum = 0 
  arr1.each do |v|
    r = v.to_f / n.to_f
    res << ( r * 100 ).round(2)      
    sum += ( r * 100 ).round      
  end
  sum 
end

# def distribute(arr, n, r_n)
#   diff = n - r_n
#   arr1 = arr
#   i = 0 
#   loop do 
#     arr1[i] += 1

#     diff -= 1
#     i+= 0 
#     break if diff <= 0 
#     i = 0 if i >= arr1.count
#   end  

#   sum = 0 
#   arr1.each do |v|
#     r = v.to_f / n.to_f

#     sum += ( r * 100 ).round      
#   end
#   sum 
# end

# def new_lang(arr, n, r_n)
#   diff = n - r_n
#   arr1 = arr
#   diff.to_i.times do 
#     arr1 << 1.0
#   end
  
#   sum = 0 
#   arr1.each do |v|
#     r = v.to_f / n.to_f
#     sum += ( r * 100 ).round    
#   end
#   sum 
# end

def solution(line, people)
  total_p = people.first.to_f
  t_l = people.last.to_f

  arr = line.split(" ").map{|v| v.to_f}
  total = arr.inject(:+)
  add_to_one(arr, total_p, total)
end

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
