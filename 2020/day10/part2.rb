def get_solution(array)
    
end

array = []
File.open("input.txt").each do |line|
    array.push(line.gsub(/[^0-9]/,"").to_i)
end
array.push(0, (array.max + 3))
array.sort!

solution = get_solution(array)
puts solution