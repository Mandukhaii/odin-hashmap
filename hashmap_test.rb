require './hashmap.rb'

test = HashMap.new(0.75)

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')


puts "Displaying hashmap entries:"
test.entries.each do |pair|
  puts "#{pair[0]}, #{pair[1]}"
end

puts "---------------------------"
puts "Initial bucket size:"
puts test.buckets.length

puts "---------------------------"
puts "Entry size:"
puts test.length


puts "---------------------------"
puts "Added new entry: moon, silver"
test.set('moon', 'silver')

puts "---------------------------"
puts "Displaying new hashmap entries:"
test.entries.each do |pair|
  puts "#{pair[0]}, #{pair[1]}"
end

puts "---------------------------"
puts "Entry size new:"
puts test.length

puts "---------------------------"
puts "Bucket size:"
puts test.buckets.length

puts "---------------------------"
puts "Updated entries moon, gold and dog, cute"
test.set('moon', 'gold')
test.set('dog', 'cute')

puts "---------------------------"
puts "Displaying new hashmap entries:"
test.entries.each do |pair|
  puts "#{pair[0]}, #{pair[1]}"
end

puts "---------------------------"
puts "Print out the distribution of the key-value pairs across the buckets:"

test.buckets.each_with_index do |bucket, index|
  puts "Bucket #{index}: #{bucket.size} entries"
end

puts "---------------------------"
puts "get('dog'): "
puts test.get('dog')

puts "---------------------------"
puts "has?('ice cream'): "
puts test.has?('ice cream')

puts "---------------------------"
puts "has?('cat'): "
puts test.has?('cat')

puts "---------------------------"
puts "remove('dog')"
puts test.remove('dog')

puts "---------------------------"
puts "Displaying new hashmap entries:"
test.entries.each do |pair|
  puts "#{pair[0]}, #{pair[1]}"
end

puts "---------------------------"
puts "Displaying hashmap keys: "
puts test.keys

puts "---------------------------"
puts "Displaying hashmap values: "
puts test.values

puts "---------------------------"
puts "Testing clear function: "
test.clear

puts "After clearing:"
test.entries.each do |pair|
 puts "#{pair[0]}, #{pair[1]}"
end


