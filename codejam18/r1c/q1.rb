def math_it(arr)
  return 1 if arr.class != Array
  c = 1
  sum = 0 

  i = 0

  loop do 
    break if i >= arr.count - 1

    sum += arr[i]
    if sum <= arr[i + 1] * 6
      c += 1 
    else
      sum -= arr[i]
    end
    
    i += 1    
  end
  c
end

def solution(count, ants)
  return 1 if ants.class != Array
  i = ants.count - 1
  arr = ants.map{|v| v.to_i}
  c = math_it(arr)
  a = [c]

  if arr.count > c + 1
    diff = arr.count - c
    arr_t = arr
    diff.times do 
      m = arr_t.max
      arr_t.delete_at(arr_t.index(m))
      c = math_it(arr_t)

      a << c
      break if c >= arr_t.count
    end

    arr_t = arr

    diff.times do 
      m = arr_t.min
      arr_t.delete_at(arr_t.index(m))

      c = math_it(arr_t)

      a << c
      break if c >= arr_t.count
    end
  end

  a.max
end
def without(a, i)
  return if a.class != Array

  [a[0..i-1], a[i+1..a.count-1]].flatten
end

def s2(count, ants)
  arr = ants.map{|v| v.to_i}

  i = 0 
  sum = 0 
  
  indexes = []
  results = [math_it(arr)]

  loop do 
    break if i >= arr.count - 1

    sum += arr[i]

    if sum > arr[i + 1] * 6
      a = arr[0..i].max
      max_i = arr.index(a)

      r1 = math_it(without(arr, max_i))
      r2 = math_it(without(arr, i + 1))
      if r1 > r2
        arr.delete_at(i + 1) 
      else 
        sum -= arr[max_i]
        arr.delete_at(max_i)
      end
      i -= 1
    end

    i += 1    
  end

  results << math_it(arr)

  results.max
end

c = 0
temp = ""
count = 0 
ARGF.each_with_index do |line, index|
  line.chomp!("\n")
  if index == 0 
    next
  end
  if index % 2 == 0
    temp = line.split(" ")
  else 
    count = line
    next
  end
  c += 1

  answer = s2(count, temp)

  $stdout.print("Case ##{c}: #{answer}\n")
end
