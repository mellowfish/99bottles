class Bottles
  def verse(count)
    Verse.for(count).to_s
  end

  def verses(from, to)
    counts = (to..from).to_a.reverse
    counts.map { |count| verse(count) }.join("\n")
  end

  def song
    verses(99, 0)
  end

  class Verse
    def self.for(count)
      if count.zero?
        <<~VERSE
          No more bottles of beer on the wall, no more bottles of beer.
          Go to the store and buy some more, 99 bottles of beer on the wall.
        VERSE
      else
        new(count)
      end
    end

    attr_reader :count
    def initialize(count)
      @count = count
    end

    def to_s
      <<~VERSE
        #{collection.count_bottles} of beer on the wall, #{collection.count_bottles} of beer.
        Take #{collection.unit_word} down and pass it around, #{next_collection.count_bottles} of beer on the wall.
      VERSE
    end

    def collection
      Collection.new(count)
    end

    def next_collection
      Collection.new(count - 1)
    end
  end

  class Collection
    attr_reader :count
    def initialize(count)
      @count = count
    end

    def unit_word
      case count
      when 1 then "it"
      else "one"
      end
    end

    def count_bottles
      case count
      when 0 then "no more bottles"
      when 1 then "1 bottle"
      else "#{count} bottles"
      end
    end
  end
end
