WIN_COMBINATION = {"scissors" => "paper", "rock" => "scissors", "paper" => "rock"}
SIGNATURE = {"s" => "scissors", "r" => "rock", "p" => "paper"}
ELEM = SIGNATURE.keys

print "Enter s - for scissors, p - for paper, r - for rock: "

user = gets.chomp
computer = ELEM[rand(ELEM.size())]

puts "You choose: #{SIGNATURE[user]}"
puts "Computer choose:  #{SIGNATURE[computer]}"

if SIGNATURE[user] == WIN_COMBINATION[SIGNATURE[computer]]
	puts "You lost"
elsif SIGNATURE[computer] == WIN_COMBINATION[SIGNATURE[user]]
	puts "You won"
else
	puts "Draw"
end