class Bottles
  def verse(number)
    "#{n_bottles_of_beer(number).capitalize} on the wall, #{n_bottles_of_beer(number)}.\n" \
    "#{action(number)}, #{n_bottles_of_beer(new_number_of_bottles(number))} on the wall.\n"
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

  def new_number_of_bottles(current_number)
    if current_number > 0
      current_number - 1
    else
      99
    end
  end

  def action(number_of_bottles)
    if number_of_bottles > 0
      "Take #{item_pronoun(number_of_bottles)} down and pass it around"
    else
      "Go to the store and buy some more"
    end
  end

  def item_pronoun(number)
    number == 1 ? "it" : "one"
  end

  def n_bottles_of_beer(number)
    amount = number > 0 ? number : "no more"

    "#{amount} bottle#{ number == 1 ? "" : "s"} of beer"
  end
end
