class Bottles
  def verse(initial_number)
    return empty_verse if initial_number == 0

    line1 = "#{n_bottles_of_beer(initial_number)} on the wall, #{n_bottles_of_beer(initial_number)}.\n"
    new_number = initial_number - 1
    line2 =
      if new_number > 0
        "Take one down and pass it around, #{n_bottles_of_beer(new_number)} on the wall.\n"
      else
        "Take it down and pass it around, no more bottles of beer on the wall.\n"
      end
    line1 + line2
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

  def n_bottles_of_beer(number)
    "#{number} bottle#{ number == 1 ? "" : "s"} of beer"
  end
end
