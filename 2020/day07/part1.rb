def get_solution(array)
    structure = []
    array.each_with_index do |line, index|
        splitted_line = line.split("contain")
        container = splitted_line[0].gsub(/bag(?:s)?/,"").gsub(/[^a-zA-Z, ]/,"").strip
        content = splitted_line[1].gsub(/bag(?:s)?/,"").gsub(/[^a-zA-Z, ]/,"").split(",").map { |e| e.strip }

        structure << {
            container: container,
            content: content
        }
    end

    colors = ['shiny gold']
    result = []

    while !colors.empty?
        new_colors = []
        colors.each do |color|
            structure.each do |element|
                if element[:content].include?(color)
                    result << element[:container] unless result.include?(element[:container])
                    new_colors << element[:container] unless new_colors.include?(element[:container])
                end
            end
        end
        colors = new_colors
    end

    result.length
end

array = []
File.open("input.txt").each do |line|
    array.push("#{line}")
end

solution = get_solution(array)
puts solution