def anagram?(str1, str2)
  perms = permutations(str1.chars)
  p perms.include?(str2)
end

def permutations(str_arr)
  result = []
  return str_arr if str_arr.length == 1
  curr_ch = str_arr.shift
  prev_perm = permutations(str_arr)
  prev_perm.each do |perm|
    (0..perm.length).each do |i|
      perm_dup = perm.dup
      result << perm_dup.insert(i, curr_ch)
    end
  end
  result
end

def second_anagram?(str1, str2)
  str1_ch = str1.chars
  str2_ch = str2.chars
  i = 0
  while i < str1_ch.length
    p str1_ch[i]
    str2_ch.each_index do |i2|
      if str2_ch[i2] == str1_ch[i]
        str2_ch.delete_at(i2)
        str1_ch.delete_at(i)
        i -= 1
        break
      end
    end
    i += 1
  end
  return true if str1_ch.empty? && str2_ch.empty?
  false
end

def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

def fourth_anagram?(str1,str2)

  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  str1.each_char {|char| hash1[char] +=1}
  str2.each_char {|char| hash2[char] +=1}

  hash1 == hash2

end

def fifth_anagram?(str1,str2)
  hash1 = Hash.new(0)
  str1.each_char {|char| hash1[char] +=1}
  str2.each_char {|ch| hash1[ch] -= 1}
  hash1.values.all? {|el| el.zero?}
end


if $PROGRAM_NAME == __FILE__
  p fourth_anagram?("gizmo", "sally")
  p fourth_anagram?("elvis", "lives")


end
