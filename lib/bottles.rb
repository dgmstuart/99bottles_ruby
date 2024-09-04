class Bottles
  def verse(initial_number)
    if initial_number > 0
      line1 = "#{initial_number} bottle#{ initial_number == 1 ? "" : "s"} of beer on the wall, #{initial_number} bottle#{ initial_number == 1 ? "" : "s"} of beer.\n"
      new_number = initial_number - 1
      line2 =
        if new_number > 0
          "Take one down and pass it around, #{new_number} bottle#{ new_number == 1 ? "" : "s"} of beer on the wall.\n"
        else
          "Take it down and pass it around, no more bottles of beer on the wall.\n"
        end
      line1 + line2
    else
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end

  def verses(start_number, end_number)
    first_verse = verse(start_number)
    next_number = start_number - 1
    if next_number == end_number
      first_verse + "\n" + verse(end_number)
    else
      first_verse + "\n" + verses(start_number - 1, end_number)
    end
  end

  def song
    verses(99, 0)
  end
end
