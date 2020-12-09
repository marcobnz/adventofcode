def get_solution(array)
    valid = 0
    array.each do |line|
        splitted_line = line.split(' ')
        range = splitted_line[0]
        splitted_range = range.split('-')
        range_min = splitted_range[0].to_i
        range_max = splitted_range[1].to_i
        value = splitted_line[1].gsub(':','')
        password = splitted_line[2]

        occurrences = password.scan(/(?=#{value})/).count
        valid += 1 if occurrences.between?(range_min, range_max)
    end

    valid
end

array = []
File.open("input.txt").each do |line|
    array.push("#{line}")
end

solution = get_solution(array)
puts solution