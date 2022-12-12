puts "Enter a string:"
string = gets.chomp

print "[ "
string.chars.each { |letter|
    if letter =~ /[[:alpha:]]/
        shift = "a".ord - 1
        ch_code = letter.downcase.ord - shift
        print "#{ch_code} "
    end
}
puts "]"