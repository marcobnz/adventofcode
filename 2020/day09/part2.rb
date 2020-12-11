def get_wrong_number(array, step_size)
    (step_size..(array.length)).each do |index|
        numbers_to_check = array[(index - step_size)..(index - 1)]
        return array[index].to_i unless numbers_to_check.permutation(2).to_a.find{|n| n[0].to_i+n[1].to_i == array[index].to_i}
    end
end

def get_block(wrong_number, array)
    start_index = 0
    loop do
        sum = 0
        index = start_index
        block = []
        loop do
            value = array[index].to_i
            block << value
            sum += value
            return block if sum == wrong_number
            if sum > wrong_number
                start_index += 1
                break
            end
            index += 1
        end
    end
end

array = []
File.open("input.txt").each do |line|
    array.push("#{line.gsub(/[^0-9]/,"")}")
end

wrong_number = get_wrong_number(array, 25)
block = get_block(wrong_number, array)
final_sum = block.min + block.max
puts final_sum