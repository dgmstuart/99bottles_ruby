class Bottles
  def verse(number)
    state = BottleStateBuilder.new.build(number)
    "#{n_bottles_of_beer(state).capitalize} on the wall, #{n_bottles_of_beer(state)}.\n" \
    "#{state.action}, #{n_bottles_of_beer(state.next_state)} on the wall.\n"
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

  def n_bottles_of_beer(state)
    "#{state.amount} #{state.noun} of beer"
  end
end

class BottleStateBuilder
  def build(number_of_bottles)
    if number_of_bottles > 0
      State.new(number_of_bottles, state_builder: self)
    else
      EmptyState.new(state_builder: self)
    end
  end
end

class State
  def initialize(number, state_builder:)
    @number = number
    @state_builder = state_builder
  end

  def next_state
    @state_builder.build(@number - 1)
  end

  def action
    "Take #{item_pronoun} down and pass it around"
  end

  def noun
    "bottle#{ @number == 1 ? "" : "s"}"
  end

  def amount
    @number
  end

  private

  def item_pronoun
    @number == 1 ? "it" : "one"
  end
end

class EmptyState
  def initialize(state_builder:)
    @state_builder = state_builder
  end

  def next_state
    @state_builder.build(99)
  end

  def action
    "Go to the store and buy some more"
  end

  def noun
    "bottles"
  end

  def amount
    "no more"
  end
end
