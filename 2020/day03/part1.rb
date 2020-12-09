def get_solution(array)
    h_index = 0
    line_length = array[0].strip.length
    tree_number = 0

    array.each_with_index do |line, index|
        next if index == 0
        h_index += 3
        h_index = h_index % line_length

        tree_number += 1 if line[h_index] == '#'
    end

    tree_number
end

array = []
File.open("input.txt").each do |line|
    array.push("#{line}")
end

solution = get_solution(array)
puts solution