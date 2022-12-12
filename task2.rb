puts "Enter first number:"
num1 = gets.chomp
puts "Enter second number:"
num2 = gets.chomp
puts "Operations [+, -, *, /]:"
op = gets.chomp

if !(num1 =~ /[[:digit:]]/) || !(num2 =~ /[[:digit:]]/)
    puts "Error while entering numbers"
elsif !("+-*/".include?(op))
    puts "Error while entering operations"
end
num1 = num1.to_i
num2 = num2.to_i
case op
when "+" 
    puts "<< #{num1} + #{num2} = #{num1 + num2}"
when "-"
    puts "<< #{num1} - #{num2} = #{num1 - num2}"
when "*"
    puts "<< #{num1} * #{num2} = #{num1 * num2}"
when "/"
    begin
        puts "<< #{num1} / #{num2} = #{num1 / num2}"
    rescue ZeroDivisionError => error
        puts error.message
    end
end