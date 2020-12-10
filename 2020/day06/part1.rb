def get_solution(array)
    total_questions = 0
    array.each do |group|
        group = group.gsub(/\n/,'')
        single_questions = group.split('').uniq
        total_questions += single_questions.length
    end

    total_questions
end

array = File.read("input.txt").split(/\n{2,}/)

solution = get_solution(array)
puts solution