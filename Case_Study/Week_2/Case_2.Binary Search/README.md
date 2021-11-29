## CaseStudy2- Write an alogorithm to depict Binary Search:
 
binarySearch(arr, size)

		   loop until beg is not equal to end
    midIndex = (beg + end)/2
    if (item == arr[midIndex] )
        return midIndex
    else if (item > arr[midIndex] ) 
        beg = midIndex + 1
    else                       
        end = midIndex - 1
