OPERATOR_PRIORITY = {
    "(" => 0,
    "+" => 1,
    "-" => 1,
    "*" => 2,
    "/" => 2,
    "^" => 3, 
    "sin" => 4,
    "cos" => 4,
    "tan" => 4,
    "cot" => 4
}

SUPPORTED_OPERATIONS = ["+", "-", "*", "/", "^", "sin", "cos", "tan", "cot"]

def calculated_function(operator, number1, number2)
    res = 0

    if operator == "+"
        res = number1 + number2
    elsif operator == "-"
        res = number1 - number2
    elsif operator == "*"
        res = number1 * number2
    elsif operator == "/"
        begin
            res = number1 / number2
        rescue ZeroDivisionError => error
            puts error.message
            exit(1)
        end
    elsif operator == "^"
        res = number1.pow(number2)
    end
    
    res
end

def calculate_polish_line(polishLine)
    stackResult = Array.new

    iter = 0
    while iter < polishLine.length do 
        ch = ""

        if polishLine[iter] == " "
            iter += 1
            next
        end

        while polishLine[iter] != " " && iter < polishLine.length do
            ch << polishLine[iter]
            iter += 1
        end

        if ch =~ /[[:digit:]]/
            stackResult.push(ch)
        else
            b = stackResult.pop.to_i
            a = stackResult.pop.to_i
            stackResult.push(calculated_function(ch, a, b))
        end

    end

    stackResult.pop
end

def read_number(position, string)
    operator = ""
    while string[position] =~ /[[:digit:]]/ do 
        operator << string[position]
        position += 1
    end
    operator
end

def parse_in_polish_line(simpleLine)
    polishLine = ""
    stackOperation = Array.new

    iter = 0
    while iter < simpleLine.length do
        if "0123456789".include?(simpleLine[iter])
            ch = read_number(iter, simpleLine)
        else
            ch = simpleLine[iter]
        end
        iter += ch.length()

        if ch == " " 
            if polishLine[polishLine.length-1] != " "
                polishLine << ch
            end
            next
        end

        if ch =~ /[[:digit:]]/
            polishLine << ch

        elsif ch == "("
            stackOperation.push(ch)

        elsif ch == ")"
            while stackOperation.last != "(" do
                polishLine << stackOperation.pop()
            end
            stackOperation.pop()

        else
            if stackOperation.empty?
                stackOperation.push(ch)
            elsif OPERATOR_PRIORITY[stackOperation.last] < OPERATOR_PRIORITY[ch]
                stackOperation.push(ch)
            else
                while !stackOperation.empty? &&
                    OPERATOR_PRIORITY[stackOperation.last] >= OPERATOR_PRIORITY[ch] do
                    if polishLine[polishLine.length-1] != " "
                        polishLine << " "
                    end
                    polishLine << stackOperation.pop()
                end
                
                stackOperation.push(ch)
            end
        end
    end
 
    while !stackOperation.empty?
        if polishLine[polishLine.length-1] != " "
            polishLine << " "
        end
        polishLine << stackOperation.pop()
    end

    polishLine
end


string = "7 + 12"
polish_line = parse_in_polish_line(string)

puts polish_line
puts "Result: #{calculate_polish_line(polish_line)}"