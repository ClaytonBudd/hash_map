require_relative 'linkedlist'

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
    # need to add if key exists programming
    list = LinkedList.new
    list.add_node(key, value)

    @buckets[hash] = list
  end

  def get(key)
    hash = hash(key)
    @buckets[hash].find_value(key)
  end

  def key?(key)
    hash = hash(key)
    return false if @buckets[hash] == []
    return false if @buckets[hash].find_value(key).nil?

    true
  end

  def remove(key)
    hash = hash(key)
    index = @buckets[hash].find_key_index(key)

    @buckets[hash].remove_at(index)
  end

  def length
    count = 0
    @buckets.each do |each|
      next if each == []

      count += each.size
    end
    count
  end

  def clear
    @buckets = Array.new(16, [])
  end

  def keys
    keys = []
    @buckets.each do |each|
      next if each == []

      keys.append(each.to_array_key)
    end
    keys
  end

  def values
    values = []
    @buckets.each do |each|
      next if each == []

      values.append(each.to_array_value)
    end
    values
  end

  def entries
    entries = []
    @buckets.each do |each|
      next if each == []

      entries.append(each.to_array_entries)
    end
    entries
  end

  # def entries
  #   entries = []
  #   @buckets.each do |each|
  #     entries.append(each) if each != []
  #   end
  #   entries
  # end
end

pipe = HashMap.new
pipe.set('beluga', 'whale')
pipe.set('ebluga', 'whole')
pipe.set('tripe', 'pipe')
# pipe.set('beluga', 'not a whale')
# puts 'get ' + "#{pipe.get('beluga')}"
# puts 'key? t ' + "#{pipe.key?('beluga')}"
# puts 'key? f ' + "#{pipe.key?('hard-fucking')}"
# puts pipe.key?('french')
puts "#{pipe.buckets}"
puts pipe.length
puts "#{pipe.keys}"
puts "#{pipe.values}"
puts "#{pipe.entries}"
