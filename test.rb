a = [1,2,3,4]
b = [1,2,4,5]

a.each_with_index do |num, index|
  if num == b[index]
    print a
    puts
    print b
    puts
    puts "Removing at Index #{index}"
    a.delete_at(index)
    b.delete_at(index)
    redo
  end
  print a
  puts
  print b
  puts
  puts index
end
