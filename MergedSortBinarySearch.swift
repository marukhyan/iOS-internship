func mergeSort(array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
        
    }
    
    let middleIndex = array.count / 2
    let leftArray = mergeSort(array: Array(array[0..<middleIndex]))
    let rightArray = mergeSort(array: Array(array[middleIndex..<array.count]))
    
    return merge(leftArray: leftArray, rightArray: rightArray)
}

func merge(leftArray: [Int], rightArray: [Int]) -> [Int] {
  var leftIndex = 0
  var rightIndex = 0

  var temp = [Int]()

  while leftIndex < leftArray.count && rightIndex < rightArray.count {
    if leftArray[leftIndex] < rightArray[rightIndex] {
      temp.append(leftArray[leftIndex])
      leftIndex += 1
    } else if leftArray[leftIndex] > rightArray[rightIndex] {
      temp.append(rightArray[rightIndex])
      rightIndex += 1
    } else {
      temp.append(leftArray[leftIndex])
      leftIndex += 1
      temp.append(rightArray[rightIndex])
      rightIndex += 1
    }
  }

  while leftIndex < leftArray.count {
    temp.append(leftArray[leftIndex])
    leftIndex += 1
  }

  while rightIndex < rightArray.count {
    temp.append(rightArray[rightIndex])
    rightIndex += 1
  }

  return temp
}


func binarySearch(array: [Int], key: Int) -> Int? {
    var left = 0
    var right = array.count
    while left < right {
        let midIndex = left + (right - left) / 2
        if array[midIndex] == key {
            return midIndex
        } else if array[midIndex] < key {
            left = midIndex + 1
        } else {
            right = midIndex
        }
    }
    return nil
}




var arr = [4,5,3,2,6,7,8,9,1,2,3,6,7,77,8,9,0,8,11]
arr = mergeSort(array: arr)
print(arr)
if let index = binarySearch(array: arr, key: 11) {
    print(index)
}
