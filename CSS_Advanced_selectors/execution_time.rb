def my_min(arr)
  smallest = arr.first
  arr.each do |el|
    smallest = el if el < smallest
  end
  smallest
end

# def largest_contiguous_subsum(arr)
#   largest = arr.first
#   arr.each_with_index do |el, i|
#     j = i
#     while j < arr.length
#       new_sum = arr[i..j].reduce(:+)
#       largest = new_sum if new_sum > largest
#       j += 1
#     end
#   end
#   p largest
# end



def largest_contiguous_subsum(arr)
  largest = arr.first
  current_sum = arr.first
    i = 1
    while i < arr.length
      if arr[i] < 0
        largest = current_sum if current_sum > largest
         largest = arr[i] if arr[i] > largest
        if current_sum + arr[i] > 0
          current_sum += arr[i]
        else
          current_sum = 0 unless current_sum < 0
        end
      else
        current_sum += arr[i]
      end
      i+=1
    end
    largest = current_sum if current_sum > largest
    largest
end

# if youre currently negative and the next value is positive, curr_sum = 0 , i += 1




if $PROGRAM_NAME == __FILE__
  list = [2,3,-6,7,-6,7]
  p largest_contiguous_subsum(list)
  list = [-5, -1, -3]
  p largest_contiguous_subsum(list)
  list = [1, 2, -4, 4, -3, 4]
  p largest_contiguous_subsum(list)
end
