def get_solution(array)
    structure = []
    array.each_with_index do |line, index|
        splitted_line = line.split("contain")
        container = splitted_line[0].gsub(/bag(?:s)?/,"").gsub(/[^a-zA-Z, ]/,"").strip
        content = splitted_line[1].gsub(/bag(?:s)?/,"").gsub(/[^a-zA-Z0-9, ]/,"").split(",").map { |e| e.strip }

        structure << {
            container: container,
            content: content
        }
    end

    colors = ['shiny gold']
    result = 0

    while !colors.empty?
        new_colors = []
        colors.each do |color|
            color_number = color.scan(/\d/).join('').to_i
            color_number += 1 if color_number == 0
            color_name = color.gsub(/[^a-zA-Z ]/,"").strip
            element = structure.find { |element| element[:container].gsub(/[^a-zA-Z ]/,"").strip == color_name}
            if element
                element[:content].each do |content|
                    number = content.scan(/\d/).join('').to_i
                    new_color_name = content.gsub(/[^a-zA-Z ]/,"").strip
                    if number > 0
                        product_to_add = color_number * number
                        result += product_to_add
                        new_colors << "#{product_to_add} #{new_color_name}" unless new_colors.include?(new_color_name)
                    end
                end
            end
        end
        colors = new_colors
    end

    result
end

array = []
File.open("input.txt").each do |line|
    array.push("#{line}")
end

solution = get_solution(array)
puts solution