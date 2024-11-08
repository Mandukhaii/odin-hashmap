class HashMap

  attr_accessor :buckets

  def initialize(load_factor)
    @buckets = Array.new(16) {[]}
    @load_factor = load_factor
  end
  
  #project provided hash function
  def hash(key)
    hash_code = 0
    prime_number = 31
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
    hash_code
  end

  # if a key already exists, then the old value is overwritten or we can say that we update the key’s value 
  def set(key, value)

    index = hash(key) % @buckets.length
    
    @buckets[index].each do |pair|
      if pair[0] == key
        pair[1] = value
        return
      end
    end

    #appending pairs to the hashed bucket
    @buckets[index] << [key, value]

    #increasing the size of the bucket and rehashing the entries
    if length > @buckets.length * @load_factor
      old_buckets = @buckets
      @buckets = Array.new(@buckets.length * 2) {[]}

      old_buckets.flatten(1).each do |key, value|
        new_index = hash(key) % @buckets.length
        @buckets[new_index] << [key, value]
      end
    end
  end

  def get(key)
    #takes one argument as a key and returns the value that is assigned to this key
    #if key is not found, return nil
    
    index = hash(key) % @buckets.length

    @buckets[index].each do |pair|
      if pair[0] == key
        return pair[1]
      end
    end
    return nil
  end

  def has?(key)
    # takes a key as an argument and 
    # returns true or false based on whether or not the key is in the hash map
    
    index = hash(key) % buckets.length
    
    @buckets[index].each do |pair|
      if pair[0] == key
        return true
      end
    end
    return false
  end

  def remove(key)
    #takes a key as an argument: 
    #if the given key is in the hash map, it should remove the entry with that key and return the deleted entry’s value
    #if the key isn’t in the hash map, it should return nil
    
    index = hash(key) % buckets.length

    @buckets[index].each do |pair|
      if pair[0] == key
        @buckets[index].delete(pair)
        return pair[1]
      end
    end

    return nil
  end

  def length
    #returns the number of stored keys or pairs in the hash map.
    length = 0

    @buckets.each do |pair|
      pair.each do |entry|
        length += 1
      end
    end

    return length
  end

  def clear
    #removes all entries in the hash map
    @buckets.clear()
  end

  def keys
    #returns an array containing all the keys inside the hash map
    keys = []

    @buckets.flatten(1).each do |key, value|
      keys << key
    end
    return keys 
  end

  def values
    #returns an array containing all the values
    values = []
   
    @buckets.flatten(1).each do |key, value|
      values << value
    end
    return values
  end

  def entries
    #returns an array that contains each key, value pair
    #example: [[first_key, first_value], [second_key, second_value]]
    entries = []
   
    @buckets.flatten(1).each do |key, value|
      entries << [key, value]
    end
    return entries
  end
  
end