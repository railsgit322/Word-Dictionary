# contents_array = ["arrows", "carrots", "give", "me"]

file = File.open('dictionary words')
contents_array = []
file.each_line do |line|
  if line.chars.count >= 4
    contents_array << line.strip
  end
end
file.close 

sequences_array = []
words_array = []
puts "sequences"+"        "+"words"      
contents_array.each_index do |index|
  word = contents_array[index]
  pairs = (word.chars.count - 3)
  if (word.chars.count == 4)
    sequences_array.append(word)
    words_array.append(word)
  elsif (word.chars.count > 4)
    a = 0
    pairs.times {
      s = word.slice(a..(a+3))
      reg = Regexp.new s
      if  (contents_array.grep(reg).count == 1)
          sequences_array.append(s)
          words_array.append(word)
      end
      a += 1
    }
  end
end
File.open("sequences.txt", "w+") do |f| 
  f.puts(sequences_array) 
end 
File.open("words.txt", "w+") do |f| 
  f.puts(words_array) 
end 


    

