def get_solution(array)
    valid_passports = 0

    array.each do |passport|
        passport = passport.gsub(/\n/,' ')
        passport = passport.split(/[\s,:]/)
        hash = Hash[*passport]

        error = false
        mandatory_fields.each do |field|
            error = true unless hash[field]
        end

        valid_passports += 1 unless error
    end

    valid_passports
end

def mandatory_fields
    [
        'byr',
        'ecl',
        'eyr',
        'hcl',
        'hgt',
        'iyr',
        'pid'
    ]
end

array = File.read("input.txt").split(/\n{2,}/)

solution = get_solution(array)
puts solution