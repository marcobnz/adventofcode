def get_solution(array)
    executed_indexes = []
    index = 0
    accumulator = 0

    loop do
        break if executed_indexes.include?(index)

        executed_indexes << index
        line = array[index].split(" ")
        case line[0]
        when "nop"
            index += 1
        when "acc"
            accumulator += line[1].to_i
            index += 1
        when "jmp"
            index += line[1].to_i
        else
            return false
        end

        puts accumulator
    end
end

array = []
File.open("input.txt").each do |line|
    array.push("#{line}")
end

solution = get_solution(array)
puts solution