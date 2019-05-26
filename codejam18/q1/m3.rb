def math_me(angle)
  x = 0.5 * Math.cos(angle)
  y = 0.5 * Math.sin(angle)
  [x, y, 0]
end


def solution(str)
  value = str.to_f
  if value == 1
    return ["0.5 0 0", "0 0.5 0", "0 0 0.5"]
  else 
    point1_angle = Math::PI
    point2_angle = 0.5 * Math::PI
    sqrt2 = Math.sqrt(2)
    angle = (45.0 / 180.0 * Math::PI ) - Math.acos(value / sqrt2)
    new_p1_angle = point1_angle - angle
    new_p2_angle = point2_angle - angle
    p1 = math_me(new_p1_angle)
    p2 = math_me(new_p2_angle)
    return [p1.join(" "), p2.join(" "), "0 0 0.5"]
  end
end



ARGF.each_with_index do |line, index|
  line.chomp!("\n")
  if index == 0 
    next
  end

  answer = solution(line)

  $stdout.print("Case ##{index}: \n#{answer.join("\n")}\n")
end