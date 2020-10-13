## Assignment 1 Concurrent Merge Sort

##### CSCI 2110 programming language

##### Mucheng Luo



### 1. Project structure



#### 1. Main.abd

 1. function

    read from txt file, then run the sorting. Finally output the sum and the array

 2. procedures and tasks
 
    	1. Procedure Read

        	1. Task ReadTXT: read txt file into array A

    	2. Procedure SumandPrint

        	1. Task GetSum: get the sum of the array, when finished, will send signal to entry sum_gotten of task Print

        	2. Task Print: after getting the signal at entry, print the sum and the array

            

#### 2. MSort.ads

1. funtion: defind package Msort, set parameters

   

#### 3. Msort.adb

1. function: the main body of package Msort, will sort array A using Merge Sort

2. procedures and tasks

   1. procedure Sort:

      the preprocess procedure, will get the range of the array, then call ConcurrentSort procedure

   2. procedure ConcurrentSort:

      1. function: the Sort part of Merge Sort, will call recursive tasks then Merge them together. Achieved concurrent merge sort.

      2. task sort_task: the recursive task that sort specific part of the array

   3. procedure Merge:

      merge specific part of the array, then copy the result from array res back to array A

      

### 2. Running demo



#### 1. How to run:

1. firstly, head to the directory and make the file using:

   ```shell
   gnatmake Main
   ```

2. Then, run the command using a exists TXT file by:

   ```shell
   ./main < test1.txt
   ```



#### 2. Example:

![avatar](https://s1.ax1x.com/2020/10/12/02iqFe.png)



