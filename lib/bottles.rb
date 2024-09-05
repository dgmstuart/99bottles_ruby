class Bottles
  def initialize
    @state_builder = StateBuilder.new(singular_noun: "bottle", plural_noun: "bottles")
  end

  def verse(number)
    state = @state_builder.build(number)

    "#{n_bottles_of_beer(state).capitalize} on the wall, #{n_bottles_of_beer(state)}.\n" \
    "#{state.action}, #{n_bottles_of_beer(state.next_state)} on the wall.\n"
  end

  def verses(start_number, end_number)
    start_number.downto(end_number).map do |number|
      verse(number)
    end.join("\n")
  end

  def song
    verses(99, 0)
  end

  private

  def n_bottles_of_beer(state)
    "#{state.amount} #{state.noun} of beer"
  end
end

class StateBuilder
  def initialize(singular_noun:, plural_noun:)
    @singular_noun = singular_noun
    @plural_noun = plural_noun
  end

  def build(number)
    case number
    when 0
      EmptyState.new(noun: @plural_noun, state_builder: self)
    when 1
      State.new(number:, noun: @singular_noun, item_pronoun: "it", state_builder: self)
    else
      State.new(number:, noun: @plural_noun, item_pronoun: "one", state_builder: self)
    end
  end
end

class State
  def initialize(number:, noun:, item_pronoun:, state_builder:)
    @number = number
    @noun = noun
    @item_pronoun = item_pronoun
    @state_builder = state_builder
  end

  attr_reader :noun

  def next_state
    @state_builder.build(@number - 1)
  end

  def action
    "Take #{@item_pronoun} down and pass it around"
  end

  def amount
    @number
  end
end

class EmptyState
  def initialize(noun:, state_builder:)
    @noun = noun
    @state_builder = state_builder
  end

  attr_reader :noun

  def next_state
    @state_builder.build(99)
  end

  def action
    "Go to the store and buy some more"
  end

  def amount
    "no more"
  end
end
