string = "In a village of La Mancha, the name of which I have no desire to call to
            mind, there lived not long since one of those gentlemen that keep a lance
            in the lance-rack, an old buckler, a lean hack, and a greyhound for
            coursing. An olla of rather more beef than mutton, a salad on most
            nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
            on Sundays, made away with three-quarters of his income."

substring = string.downcase.split(/[^[[:word:]'-]]+/)

WORD_COUNT = Hash.new
substring.each { |word|
    if word.length == 0 || WORD_COUNT.include?(word)
        next
    else
        WORD_COUNT[word] = substring.count(word)
    end
}

top_three_words = WORD_COUNT.sort_by {|k, v| v}.to_h.keys.reverse
print top_three_words[0..2]
