def get_solution(array, step_size)
    (step_size..(array.length)).each do |index|
        numbers_to_check = array[(index - step_size)..(index - 1)]
        return array[index].to_i unless numbers_to_check.permutation(2).to_a.find{|n| n[0].to_i+n[1].to_i == array[index].to_i}
    end
end

array = []
File.open("input.txt").each do |line|
    array.push("#{line.gsub(/[^0-9]/,"")}")
end

solution = get_solution(array, 25)
puts solution