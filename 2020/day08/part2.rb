def get_solution(array)
    executed_indexes = []
    index = 0
    accumulator = 0

    loop do
        return false if executed_indexes.include?(index)
        if !array[index]
            puts accumulator
            return true
        end

        executed_indexes << index
        line = array[index]
        case line[0]
        when "nop"
            index += 1
        when "acc"
            accumulator += line[1].to_i
            index += 1
        when "jmp"
            index += line[1].to_i
        end
    end
end

array = File.open("input.txt") { |file| file.read}.split("\n").map {|line| line.split(" ") }
array.each_with_index do |line, index|
    fixed_array = File.open("input.txt") { |file| file.read}.split("\n").map {|line| line.split(" ") }
    if ['jmp', 'nop'].include?(fixed_array[index][0])
        fixed_array[index][0] = (fixed_array[index][0] == 'jmp') ? 'nop' : 'jmp'
        is_fixed = get_solution(fixed_array)
        break if is_fixed
    end
end
