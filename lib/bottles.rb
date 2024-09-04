class Bottles
  def verse(number)
    return empty_verse if number == 0

    "#{n_bottles_of_beer(number)} on the wall, #{n_bottles_of_beer(number)}.\n" \
    "Take #{item_pronoun(number)} down and pass it around, #{n_bottles_of_beer(number - 1)} on the wall.\n"
  end

  def verses(start_number, end_number)
    remaining_verses =
      if start_number == end_number
        ""
      else
        "\n" + verses(start_number - 1, end_number)
      end

    verse(start_number) + remaining_verses
  end

  def song
    verses(99, 0)
  end

  private

  def empty_verse
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, #{n_bottles_of_beer(99)} on the wall.\n"
  end

  def item_pronoun(number)
    number == 1 ? "it" : "one"
  end

  def n_bottles_of_beer(number)
    if number > 0
      "#{number} bottle#{ number == 1 ? "" : "s"} of beer"
    else
      "no more bottles of beer"
    end
  end
end
