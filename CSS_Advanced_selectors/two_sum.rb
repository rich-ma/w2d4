def bad_two_sum?(arr, target_sum)
 arr.each_with_index do |i|
   j = i + 1
   while j < arr.length
     return true if arr[i] + arr[j] == target_sum
     j+=1
   end
 end
 false
end

def okay_two_sums?(arr, target)
  arr.sort!

  arr.each do |num|
    next if num + num == target
    target_num = target - num
    return true if binary_search(arr, target_num)
  end
  false
end

def binary_search(arr, target)
  return false if arr.empty?
  mid = arr.length/2
  case arr[mid] <=> target
  when 0
    return true
  when -1
    binary_search(arr.drop(mid + 1), target)
  when 1
    binary_search(arr.take(mid), target)
  end
end

def two_sum?(arr, target)
  num_hash = Hash.new(0)
  arr.each {|num| num_hash[num] += 1}

  num_hash.keys.each do |key|
    target_num = target - key
    num_hash[key] -= 1
    return true if num_hash[target_num] > 0
  end

  false
end



if $PROGRAM_NAME == __FILE__
  arr = [0, 1, 5, 7]
  p okay_two_sums?(arr, 6) # => should be true
  p okay_two_sums?(arr, 10)

end
