def main
    words = ["rock", "paper", "tree", "car"]
    guess_word = words[rand(words.length)]
    count_s = guess_word.length 
    lives = 5
    mistakes = Array.new()
    already_guess = ""
    game_result = ""

    puts guess_word

    copy = Array.new(guess_word.length, "_")
    loop do

        puts "Word: #{copy.join(".")}"
        puts "Tries left: #{lives}"
        puts "Mistakes: #{mistakes.join(", ")}"

        print "Enter a letter to guess: "
        user_ch = gets.chomp

        if !(/[[:alpha:]]/.match(user_ch))
            puts "Only letters are allowed to enter"
            next
        elsif already_guess.include?(user_ch)
            puts "You already guessed this letter"
            next
        end

        duplicate = guess_word.count(user_ch.downcase)
        if duplicate == 0
            puts "Wrong guess"
            lives -= 1
            mistakes << user_ch
        else
            puts "True guess"
            count_s -= duplicate
            change_string(copy, guess_word, user_ch)
            already_guess << user_ch
        end

        if count_s == 0
            game_result = "You guessed the word #{guess_word}"
            break
        elsif lives == 0
            game_result = "You didn't guess the word #{guess_word}"
            break
        end
    end

    puts game_result

    end

def change_string(copy, guess_word, user_ch)
    d = 0
    while d < guess_word.length do
        if guess_word[d] == user_ch
            copy[d] = user_ch
        end
        d += 1
    end
end

main