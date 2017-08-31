# Compute the number of inversions in the file given, 
# where the ith row of the file indicates the ith entry of an array.

# Use divide and conquer!
# Goal: Implement merge_and_count_splitinv in O(n)
# sort_and_count will run in O(nlogn)

### Warmup - write merge sort! 

def merge_sort(arr) 
  return arr if arr.length <= 1

  left = merge_sort(arr.take(arr.length / 2))
  right = merge_sort(arr.drop(arr.length / 2))

  merge(left, right)
end

def merge(left, right)
  output = []

  until left.empty? || right.empty? do 
    if left[0] <= right[0]
      output << left.shift 
    else 
      output << right.shift
    end 
  end
  output + left + right
end

p merge_sort([1,3,2,5,3,2])

integers = File.readlines('./integers.txt')

def merge_and_count_splitinv(array, length)
 
end

def sort_and_count(array, length) 
  return 0 if length == 1
  x = sort_and_count(array.take(array.length / 2), (array.length / 2))
  y = sort_and_count(array.drop(array.length / 2), (array.length / 2))
  z = merge_and_count_splitinv(array, length)

  x + y + z
end
