# GUST: Graph Edge Coloring Utilization to Accelerate Sparse Matrix Vector Multiplication
This is the code-base for GUST (a software/hardware co-design for SpMV acceleration), and the paper can be found [here](https://www.to.be.added). There are 3 folders: **format convertor**, **pre-processing**, and **SpMV**.
1. **format convertor**: This folder includes a matlab file which turn the matrices stored as ".mat" format to a COO format in a ".txt" file.
2. **pre-processing**: This folder includes a C++ code which takes in the ".txt" file given by the matlab code, performs perprocessing, and produces a ".txt" file, which is marix in the edge-coloring scheduled format.
   This code also prints the expected number of clock cycles needed for the SpMV (if you looking to compare GUST with your work, this number times the clock duration produces the SpMV time).
