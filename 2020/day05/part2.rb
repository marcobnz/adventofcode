def get_solution(seat_ids)
    counter = 0
    while counter < seat_ids.length - 1
        return seat_ids[counter] + 1 if (seat_ids[(counter + 1)] - seat_ids[counter]) == 2
        counter += 1
    end
end

def get_sorted_seat_ids(array)
    seat_ids = []
    array.each do |seat|
        row = decode(seat, 0, 7)
        column = decode(seat, 7, 3)
        seat_ids << (row * 8) + column
    end
    seat_ids.sort
end

def decode(seat, start_number, last_number)
    code = seat.slice(start_number, last_number)
    max_number = (2 ** last_number) - 1

    min = 0
    max = max_number
    
    code.split('').each do |char|
        medium = ((min + max) / 2).to_i
        if ['F', 'L'].include?(char)
            max = medium
        elsif ['B', 'R'].include?(char)
            min = medium + 1
        end
    end

    min
end

array = []
File.open("input.txt").each do |line|
    array.push("#{line}")
end

solution = get_solution(get_sorted_seat_ids(array))
puts solution