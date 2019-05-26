MOVE_MAP = {
  's' => {x: 0, y: -1},
  'e' => {x: -1, y: 0},
  'n' => {x: 0, y: 1},
  'w' => {x: 1, y: 0}
}

def move_it(loca, value)
  x = loca[:x] + MOVE_MAP[value][:x]
  y = loca[:y] + MOVE_MAP[value][:y]
  {
    x: x,
    y: y
  }
end

def same_location(loca1, loca2)
  loca1[:x] == loca2[:x] && loca1[:y] == loca2[:y]
end

def go_op(value)
  value == 'e' ? 's' : 'e'
end

def main(size, path)
  location_u = {x: 0, y: 0}
  location_o = {x: 0, y: 0}
  path_u = []
  path.downcase.split('').each_with_index do |value, index|
    u_move = nil
    if index == 0
      path_u << go_op(value)
      u_move = path_u.last
    else
      if same_location(location_o, location_u)
        u_move = go_op(value)
        path_u << u_move
      else
        u_move = go_op(path_u.last)
        path_u << u_move
      end
    end
    location_o = move_it(location_o, value)
    location_u = move_it(location_u, u_move)
  end
  path_u.join("").upcase
end

c = 1
set = []
ARGF.each_with_index do |line, index|
  line.chomp!("\n")
  if index == 0
    next
  end

  set << line

  if set.count == 2
    answer = main(set[0], set[1])

    $stdout.print("Case ##{c}: #{answer}\n")
    c += 1
    set = []
  end
end
