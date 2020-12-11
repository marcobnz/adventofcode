def get_solution(array)
    current_jolt = array.min
    one_diff_jolts = 0
    three_diff_jolts = 0
    array.each do |line|
        diff = line - current_jolt
        case diff
        when 1
            one_diff_jolts += 1
        when 3
            three_diff_jolts += 1
        end
        current_jolt = line
    end

    (one_diff_jolts * three_diff_jolts)
end

array = []
File.open("input.txt").each do |line|
    array.push(line.gsub(/[^0-9]/,"").to_i)
end
array.push(0, (array.max + 3))
array.sort!

solution = get_solution(array)
puts solution