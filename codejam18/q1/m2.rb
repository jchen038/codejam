
def brute(str)
  arr = str.split(" ")
  done = true
  loop do 
    i = 0 
    loop do 
      if arr[i].to_i > arr[i + 2].to_i 
        temp = arr[i]
        arr[i] = arr[i + 2]
        arr[i + 2] = temp
        done = false
      end
      i += 1
      break if i + 2 > arr.size - 1
    end
    break if done
    done = true
  end

  count = 0 
  result = true
  arr.each_with_index do |value, index|
    if index + 1 < arr.size
      if value.to_i > arr[index + 1].to_i
        result = false
        count = index
        break 
      end
    end
  end
  result ? "OK" : count
end

c = 0
arr_c = 0 

ARGF.each_with_index do |line, index|
  line.chomp!("\n")
  if index == 0 
    next
  end
  
  if line.split(" ").count <= 1
    arr_c = line.to_i
    c += 1
    next
  end

  answer = brute(line)

  $stdout.print("Case ##{c}: #{answer}\n")
end
