def get_solution(array, step_array)
    single_results = []
    step_array.each do |step|
        single_results << get_single_solution(array, step[0], step[1])
    end

    single_results.inject{ |p,x| p * x }
end

def get_single_solution(array, h_step, v_step)
    h_index = 0
    line_length = array[0].strip.length
    tree_number = 0

    array.each_with_index do |line, index|
        next if index == 0 || (index % v_step) != 0
        h_index += h_step
        h_index = h_index % line_length

        tree_number += 1 if line[h_index] == '#'
    end

    tree_number
end

array = []
File.open("input.txt").each do |line|
    array.push("#{line}")
end

step_array = [
    [1, 1],
    [3, 1],
    [5, 1],
    [7, 1],
    [1, 2]
]

solution = get_solution(array, step_array)
puts solution