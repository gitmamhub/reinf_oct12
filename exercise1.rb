system('clear')
def check_syntax(str)
  openables = {
    "(" => ")",
    "[" => "]",
    "{" => "}"
  }
  open_1 = []
  opening_chars = openables.keys
  closing_chars = openables.values

  str.each_char do |char|

    if opening_chars.include?(char) # opening bracket

      open_1 << char

    elsif closing_chars.include?(char) # closing bracket

      required_char = openables[open_1.last]

      if char == required_char # it's the right kind of closing bracket

        open_1.pop

      else

        if open_1.any? # it's the wrong kind of closing bracket
          # m = open_1.pop
          # puts "#{m}"
          # a = openables[m]
          # puts "#{a}"
          puts "* You have a syntax error: there is an unexpected #{char} where there should be a #{openables[open_1.pop]}"
        else # there's nothing to close
          puts "* You have a syntax error: there is an unexpected #{char} where there is nothing to close."
        end

        return false

      end

    end
  end

  if open_1.any?
    required_char = openables[open_1.last]
    puts "* You have a syntax error: the string ended without a closing #{required_char}"
  end

  return open_1.empty?
end

# system('clear')
# puts check_syntax("(this)[] is some text")
# puts "*****"
# puts check_syntax("(this)] is some text")
# puts "*****"
# puts check_syntax("[(this] is some text")
# puts "*****"
# puts check_syntax("[this][ is some text")
# puts "*****"
# puts check_syntax("[this] is some text")

puts check_syntax("(this)[] is some text")
puts check_syntax("(this)] is some text")

puts "\n\n"


puts check_syntax("[(this] is some text")
puts check_syntax("[this][ is some text")
