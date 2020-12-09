def get_solution(array, goal_number)
    array.each do |number|
        first_other_numbers = array.select{ |n| (goal_number - number - n) > 0 }
        first_other_numbers.each do |first_other_number|
            second_other_number = array.find{ |n| (goal_number - number - first_other_number - n) == 0 }
            return (number * first_other_number * second_other_number) if second_other_number
        end
    end
end

goal_number = 2020

array = []
File.open("input.txt").each do |line|
    array.push("#{line}".to_i)
end

solution = get_solution(array, goal_number)
puts solution