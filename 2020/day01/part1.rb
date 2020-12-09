def get_solution(array, goal_number)
    array.each do |number|
        other_number = array.find{ |n| n == (goal_number - number) }
        return (number * other_number) if other_number
    end
end

goal_number = 2020

array = []
File.open("input.txt").each do |line|
    array.push("#{line}".to_i)
end

solution = get_solution(array, goal_number)
puts solution