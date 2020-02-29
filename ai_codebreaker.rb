class AICodebreaker < Codebreaker

  def make_a_guess()
    puts "Press Enter to see the AI's next guess."
    gets

    super
  end

  private


  def create_guess()
    if @guesses.length >= 1
      last_guess = @guesses[-1]
      last_hint = @hints[-1]
      green = Pin.new("gr")
      white = Pin.new("wh")
      correct_places = last_hint.count(green)
      correct_colors = last_hint.count(white)

      free_positions = [0,1,2,3]
      new_guess = Array.new(4)

      # take exactly as many samples
      # as there were correct
      # positions and copy them over
      free_positions.sample(correct_places).each do |pos|
        new_guess[pos] = last_guess[pos].color

        # after copying the guess, make
        # the position occupied
        free_positions.delete(pos)
      end

      # next, map all remaining free
      # positions to a new place:
      free_positions.shuffle!
      map = free_positions.zip(free_positions.rotate).to_h

      # now for every correct color,
      # take a line from the mapping
      # and copy the color
      to_map = map.to_a.sample(correct_colors).to_h
      to_map.each do |from, to|
        new_guess[to] = last_guess[from].color
      end

      # finally fill up all remaining
      # places with a random color
      new_guess.map! do |color|
        if color == nil
          color = POSSIBLE_COLORS.sample
        end
        color
      end

      guess = Sequence.new(new_guess)
    else
      template =[]
      CODE_LENGTH.times do
        template.append(POSSIBLE_COLORS.sample)
      end
      guess = Sequence.new(template)
    end

    return guess
  end
end
