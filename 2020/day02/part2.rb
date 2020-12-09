def get_solution(array)
    valid = 0
    array.each do |line|
        splitted_line = line.split(' ')
        range = splitted_line[0]
        splitted_range = range.split('-')
        range_min = splitted_range[0].to_i - 1
        range_max = splitted_range[1].to_i - 1
        value = splitted_line[1].gsub(':','')
        password = splitted_line[2]

        first_check = password[range_min] == value
        second_check = password[range_max] == value

        valid += 1 if first_check != second_check
    end

    valid
end

array = []
File.open("input.txt").each do |line|
    array.push("#{line}")
end

solution = get_solution(array)
puts solution