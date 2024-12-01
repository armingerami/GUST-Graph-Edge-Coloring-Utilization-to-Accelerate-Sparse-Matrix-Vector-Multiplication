/*
This code reads the .txt file created by the "format convertor.m" file, performs the edge coloring (scheduling), and
writes the scheduled format into "result.txt". It also prints out the time it takes to perform scheduling and the length
of the scheduled format.

The input matrix file names and sizes should be set using "string names" and "int sizes". If you encounter a runtime
error related to memory, try running the code for one matrix at a time instead of all together. The code below is for 7
matrices.

The scheduling assumes the FPGA utilizes 256 adders and 256 multipliers. IF otherwise, change "int x = 256;".

Note that the read/write from/to text files take considerably more time than the scheduling itself.

For more details such as how to perform the same steps for systolic arrays and adder trees, and load balancing, see
"additional.cpp"
*/

#include <iostream>
#include <bits/stdc++.h>

using namespace std;



int main() {
    int sizes[7] ={434102,63838,377002,45101,742793,185639,38120};
    string names[7] = {"coPapersCiteseer","crankseg_2", "ML_Laplace","mouse_gene","PFlow_742","Si41Ge41H72", "TSOPF_RS_b2383"};


    int m;
    int x = 256; //number of PEs in each layer, i.e. l

    map<long long, long long> ids;

    unsigned long long schedule_length = 0;


    for(int ii = 0; ii < 1; ii++){
        int is_one = (sizes[ii]%x==0)?0:1;
        m = ((sizes[ii]/x)+is_one)*x;

        vector<float> vec (m, 1.0); //The vector in the matrix-vector multiplication. Here, it's just a dummy variable to show functionality of the scheduling
        // If you have a specific vector that you want to multiply the matrix with, you should change the line above

        vector<vector<pair<long,float>>> edges(m); //Data format used for storing and coloring the edges

        vector<vector<float>> schedule(x); //This will be the matrix elements to be streamed after the scheduling (schedule[i] is the first input of multiplier i)
        vector<vector<float>> v_schedule(x); //This will be the vector elements to be streamed after the scheduling (v_schedule[i] is the second input of multiplier i)
        vector<vector<int>> indices(x); //This will be the indices to be streamed after the scheduling (this is the crossbar connector input)
        vector<vector<int>> dump_signal(x); //This tells the adders when to dump their values

        // Reading the .txt files
        string p = "new data//";
        p.append(names[ii]);
        cout<<names[ii]<<endl;
        p.append(".txt");

        fstream MyReadFile(p);
        long long in1, in2;
        float in3;

        while (MyReadFile >> in1) {
            MyReadFile >> in2;
            MyReadFile >> in3;
            edges[in1].emplace_back(in2,in3);
        }

        // Edge Coloring (scheduling)
        auto start = chrono::high_resolution_clock::now();
        bool dump_flag;
#pragma unroll(256)
        for(int l = 0; l < x; ++l) {
            for (int i = 0; i < m/x; ++i) {
                dump_flag = false;
                for (auto j: edges[i*x+l]) {
                    schedule[l].emplace_back(j.second);
                    v_schedule[l].emplace_back(vec[j.first]);
                    indices[l].emplace_back(l);
                    if(dump_flag) dump_signal[l].emplace_back(0);
                    else dump_flag = true;
                }
                dump_signal[l].emplace_back(1);
            }
        }

        //finding the schedule length
        schedule_length = 0;
        for(int l = 0; l < x; ++l){
            schedule_length = max(schedule[l].size(), schedule_length);
        }



        auto stop = chrono::high_resolution_clock::now();
        auto duration = chrono::duration_cast<chrono::microseconds>(stop - start);
        cout << "Schedule length = "<<schedule_length<< endl;
        cout << "Time (s) = "<<duration.count()*0.000001<< endl;

        //filling the empty slots with zero. It's optional; the only reason I'm doing it is to make the writing part easier.
        for(int l = 0; l < x; ++l) {
            for(int row = 0; row < schedule_length - schedule[l].size(); ++row){
                schedule[l].emplace_back(0);
                v_schedule[l].emplace_back(0);
                indices[l].emplace_back(0);
                dump_signal[l].emplace_back(0);
            }
        }

        //Writing the scheduled format. Note that this part take a lot of time since the matrix sizes are huge and writing
        //to text is a slow operation. Comment the below section out if you don't need the scheduled format.
        string output_name = names[ii] + "_scheduled.txt";
        ofstream MyFile(output_name, ios_base::app);
        for(int row = 0; row < schedule_length; ++row){
            for(auto elements: schedule){
                MyFile << elements[row] << "\t";
            }
            for(auto elements: v_schedule){
                MyFile << elements[row] << "\t";
            }
            for(auto elements: indices){
                MyFile << elements[row] << "\t";
            }
            for(auto elements: dump_signal){
                MyFile << elements[row] << "\t";
            }
            MyFile << "\n";
        }



    }

    return 0;
}
