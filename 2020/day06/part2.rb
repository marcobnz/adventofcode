def get_solution(array)
    total_yes_questions = 0
    array.each do |group|
        single_questions = group.gsub(/\n/,'')
        single_questions = single_questions.split('').uniq
        person_questions = group.split(/\n/)

        single_questions.each do |single_question|
            occurrences = 0
            person_questions.each do |person_question|
                occurrences += 1 if person_question.include?(single_question)
            end
            total_yes_questions += 1 if occurrences == person_questions.size
        end
    end

    total_yes_questions
end

array = File.read("input.txt").split(/\n{2,}/)

solution = get_solution(array)
puts solution