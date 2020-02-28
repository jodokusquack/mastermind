module MastermindUtils
  POSSIBLE_COLORS = ["b", "r", "m", "y", "g", "c"]


  ANSWERS = {
    one: "Congratulations Codebreaker! You broke the code.\nAre you a super spy?".green,
    two: "Oh no! The Codemaker won. Better Luck Next time.".red,
    three: "Good job Codemaker! The AI couldn't break your code.".green,
    four: "Oh no, the AI broke your code. You should choose a harder one next time.".red,
    five: "Congratulations, the Codebreaker won!".green,
    six: "Good job Codemaker! You won.".green
  }

end
