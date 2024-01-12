require 'linkedlist'

class HashMap
  attr_accessor :table, :buckets, :capacity, :load_factor

  def initialize
    @buckets = Array.new(16, [])
    @capacity = @buckets.length
    @load_factor = 0.75
  end

  def string_to_number(string)
    hash_code = 0
    string.each_char { |char| hash_code += char.ord }
    hash_code % 16
  end

  def hash(value)
    key = string_to_number(value)
  end

  def set(key, value)
    hash = hash(key)

    if @buckets[hash][0] == key
      @buckets[hash][1]
    else
      (@buckets[hash] = [key, value])
    end
  end

  def get(key)
    hash = hash(key)
    @buckets[hash][1]
  end

  def key?(key)
    hash = hash(key)
    @buckets[hash][0] == key
  end

  def remove(key)
    hash = hash(key)
    (@buckets[hash] = [])
    @buckets
  end

  def length
    count = 0
    @buckets.each do |each|
      count += 1 unless each == []
    end
    count
  end

  def clear
    @buckets = Array.new(16, [])
  end

  def keys
    keys = []
    @buckets.each do |each|
      keys.append(each[0]) if each != []
    end
    keys
  end

  def values
    values = []
    @buckets.each do |each|
      values.append(each[1]) if each != []
    end
    values
  end

  def entries
    entries = []
    @buckets.each do |each|
      entries.append(each) if each != []
    end
    entries
  end
end

pipe = HashMap.new
pipe.set('pipe', 'tool')
pipe.set('car', 'transport')
puts pipe.get('car')
puts pipe.key?('car')
puts pipe.key?('french')
# pipe.remove('car')
# puts pipe.key?('car')
# puts "#{pipe.buckets}"
# puts pipe.length
# pipe.clear
# puts "#{pipe.buckets}"
puts "#{pipe.keys}"
puts "#{pipe.values}"
puts "#{pipe.entries}"
