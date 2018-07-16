class Bottles
  def verse(count)
    if count == 0
      <<~VERSE
        No more bottles of beer on the wall, no more bottles of beer.
        Go to the store and buy some more, 99 bottles of beer on the wall.
      VERSE
    else
      <<~VERSE
        #{count_bottles(count)} of beer on the wall, #{count_bottles(count)} of beer.
        Take #{unit_word(count)} down and pass it around, #{count_bottles(count - 1)} of beer on the wall.
      VERSE
    end
  end

  def verses(from, to)
    counts = (to..from).to_a.reverse
    counts.map { |count| verse(count) }.join("\n")
  end

  def song
    verses(99, 0)
  end

private

  def unit_word(n)
    case n
    when 1 then "it"
    else "one"
    end
  end

  def count_bottles(n)
    case n
    when 0
      "no more bottles"
    when 1
      "1 bottle"
    else
      "#{n} bottles"
    end
  end
end
