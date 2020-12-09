def get_solution(array)
    valid_passports = 0

    array.each do |passport|
        passport = passport.gsub(/\n/,' ')
        passport = passport.split(/[\s,:]/)
        hash = Hash[*passport]

        error = false
        mandatory_fields.each do |field|
            error = true unless hash[field[:code]] && hash[field[:code]] =~ /#{field[:validation]}/
        end

        valid_passports += 1 unless error
    end

    valid_passports
end

def mandatory_fields
    [
        { code: "byr", validation: "0*(19[2-8][0-9]|199[0-9]|200[0-2])" },
        { code: "ecl", validation: "amb|blu|brn|gry|grn|hzl|oth" },
        { code: "eyr", validation: "0*(202[0-9]|2030)" },
        { code: "hcl", validation: "^#[a-fA-F0-9]{6}" },
        { code: "hgt", validation: "(1[5-8][0-9]|19[0-3])cm|(59|6[0-9]|7[0-6])in" },
        { code: "iyr", validation: "0*(201[0-9]|2020)" },
        { code: "pid", validation: "^\\d{9}$" }
    ]
end

array = File.read("input.txt").split(/\n{2,}/)

solution = get_solution(array)
puts solution