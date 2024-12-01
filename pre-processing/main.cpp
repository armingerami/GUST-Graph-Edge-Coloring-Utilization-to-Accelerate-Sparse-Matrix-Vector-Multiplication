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

#include <iostream>
#include <bits/stdc++.h>
// #include "serpens_scheduler.h"

using namespace std;



int main() {
//    int m = 120000;
//    vector<vector<int>> a(m, vector<int>(m,2000000000));
//    a[m-1][m-1];
    int sizes[7] ={434102,63838,377002,45101,742793,185639,38120};
//    int mm[18] = {512, 820992, 2048, 9728,1536,8192,2048,23808,69120,130304,11008,259840,87296,171008,76032,82176, 8448};
    string names[7] = {"coPapersCiteseer","crankseg_2", "ML_Laplace","mouse_gene","PFlow_742","Si41Ge41H72", "TSOPF_RS_b2383"};
    int i_map[7] = {0,1,2,3,4,5,6};

//    int m = 4096; //matrix height = answer vector size
//    int n = 4096; //matrix width = vector size
    int m,n;
    int x = 256; //number of PEs in each layer, i.e. l
    int x_fafnir = 128;
    int x_ftpu = 16;

    int score = 0;

    ofstream MyFile("result.txt", ios_base::app);


    map<long long, long long> ids;

    unsigned long long schedule_length = 0;




    int ii;
    int blah = 0;
    for(int iii = blah; iii < 7; iii++){
        score = 0;
        ii = i_map[iii];
//        m = mm[ii];
//        n = mm[ii];
        int is_one = (sizes[ii]%x==0)?0:1;
        m = ((sizes[ii]/x)+is_one)*x;
        n = m;
        vector<float> vec (m, 1.0); //The vector in the matrix-vector multiplication. Here, it's just a dummy variable to show functionality of the scheduling
//    cout<<"a";
        vector<vector<pair<long,float>>> edges_b4_load_balancing (m);
//    cout<<"1";
        vector<vector<pair<long,float>>> edges (m);

        vector<long> non_zero_each_row(m);

        vector<vector<float>> schedule(x); //This will be the matrix elements to be streamed after the scheduling (schedule[i] is the first input of multiplier i)
        vector<vector<float>> v_schedule(x); //This will be the vector elements to be streamed after the scheduling (v_schedule[i] is the second input of multiplier i)
        vector<vector<int>> indices(x); //This will be the indices to be streamed after the scheduling (this is the crossbar connector input)
        vector<vector<int>> dump_signal(x); //This tells the adders when to dump their values


        string p = "new data//";
        p.append(names[ii]);
        cout<<names[ii]<<endl;
        p.append(".txt");

        fstream MyReadFile(p);
        long long in1, in2;
        float in3;

//    cout<<"a";
        //for suitesparse
        while (MyReadFile >> in1) {
            MyReadFile >> in2;
            MyReadFile >> in3;

//        edges_b4_load_balancing[in1].emplace_back(in2,in3);
            edges[in1].emplace_back(in2,in3);

        }

//    //for gplus
//    while (MyReadFile >> in1) {
//        MyReadFile >> in2;
//
//        edges_b4_load_balancing[in1].emplace_back(in2,in3);
//
//    }
//    while (MyReadFile >> in1) {
//        MyReadFile >> in2;
//
//        edges_b4_load_balancing[in1].emplace_back(in2,1.0);
//
//    }
//
//    //for pockie
//    while (MyReadFile >> in1) {
//        MyReadFile >> in2;
//
//        edges_b4_load_balancing[in1].emplace_back(in2,1.0);
//
//    }

//    for(int i = 0; i < m; i++) non_zero_each_row[i] = i;
//    sort(non_zero_each_row.begin(),non_zero_each_row.begin()+m);





        auto start = chrono::high_resolution_clock::now();

        bool dump_flag;
#pragma unroll(256)
        for(int l = 0; l < x; ++l) {
            for (int i = 0; i < m/x; ++i) {
                dump_flag = true;
                for (auto j: edges[i*x+l]) {
                    schedule[l].emplace_back(j.second);
                    v_schedule[l].emplace_back(vec[j.first]);
                    indices[l].emplace_back(l);
                    if(dump_flag) {
                        dump_signal.emplace_back(1);
                        dump_flag = false;
                    }
                    else dump_signal.emplace_back(0);
                }
            }
        }

        schedule_length = 0;
        for(int l = 0; l < x; ++l){
            schedule_length = max(schedule[l].size(), schedule_length);
        }







        auto stop = chrono::high_resolution_clock::now();
        auto duration = chrono::duration_cast<chrono::microseconds>(stop - start);
        cout << "Schedule length = "<<schedule_length<< endl;
        cout << "Time = "<<duration.count()*0.000001<< endl;





    }

    return 0;
}

#include <iostream>
#include <bits/stdc++.h>

using namespace std;



int main() {
//    int m = 120000;
//    vector<vector<int>> a(m, vector<int>(m,2000000000));
//    a[m-1][m-1];
    int sizes[19] ={23560,68902,130228,10774,259789,87190,170998,75888,82168,8297,659033,1899,9506,1535,8140,85623,87190,1916, 3557};
//    int mm[18] = {512, 820992, 2048, 9728,1536,8192,2048,23808,69120,130304,11008,259840,87296,171008,76032,82176, 8448};
    string names[19] = {"af23560", "bcircuit", "cage12", "nopoly", "offshore", "rajat28", "scircuit", "soc-Epinions1", "soc-Slashdot0902", "wiki-Vote","pre2",
                        "CollegeMsg", "nemeth22", "mycielskian11", "TSC_OPF_1047", "poisson3Db", "rajat28", "CAG_mat1916", "heart1"};
    int i_map[12] = {10,6,7,2,3,9,11,14,13,18,1, 15};

//    int m = 4096; //matrix height = answer vector size
//    int n = 4096; //matrix width = vector size
    int m,n;
    int x = 256; //number of PEs in each layer, i.e. l
    int x_fafnir = 128;
    int x_ftpu = 16;

    int score = 0;

    ofstream MyFile("result.txt", ios_base::app);


    map<long long, long long> ids;



    long long non_zero_count = 0;
    long long oned_length = 0;
    long long at_length = 0;
    long long oned_length_pre = 0;
    long long at_length_pre = 0;
    long long fafnir_length = 0;
    long long ftpu_length = 0;
    long long naive_schedule_length = 0;
    long long schedule_length = 0;



    vector<vector<vector<vector<float>>>> edges_b4_load_balancing;
    vector<vector<vector<vector<float>>>> edges;
    vector<vector<vector<int>>> vertically_compressed_height;
    vector<vector<bool>> row_empty;
    vector<pair<int,int>> non_zero_each_row;
    vector<vector<pair<int,int>>> non_zero_each_col;
    vector<vector<int>> non_zero_each_col_oned_pre;
    vector<vector<float>> pos_col;
    vector<int> non_zero_each_row_viz;
    vector<int> non_zero_each_row_window;
    vector<vector<int>> non_zero_each_col_viz;
    vector<int> non_zero_each_col_window;


    int ii;
    int blah = 4;
    for(int iii = blah; iii < blah+1; iii++){
        score = 0;
        ii = i_map[iii];
        non_zero_count = 0;
//        m = mm[ii];
//        n = mm[ii];
        int is_one = (sizes[ii]%x==0)?0:1;
        m = ((sizes[ii]/x)+is_one)*x;
        n = m;
        cout<<"a";
        edges_b4_load_balancing.resize(m/x,vector<vector<vector<float>>>(x));
        cout<<"1";
        edges.resize(m/x,vector<vector<vector<float>>>(x));
        cout<<"2";
        vertically_compressed_height.resize(m/x_fafnir, vector<vector<int>>(n/x_fafnir,vector<int>(x_fafnir,0)));
        row_empty.resize(m/x,vector<bool>(n/x, true));
        cout<<"3";
        non_zero_each_row.resize(m, pair<int,int>(0,0));
        cout<<"4";
        non_zero_each_col.resize(m/x, vector<pair<int,int>>(n,pair<int,int>(0,0)));
        cout<<"5";
        non_zero_each_col_oned_pre.resize(m/x, vector<int>(n));
        cout<<"6";
        pos_col.resize(m/x,vector<float>(n));
        cout<<"7";
        non_zero_each_row_viz.resize(m, 0);
        cout<<"8";
        non_zero_each_row_window.resize(m/x, 0);
        cout<<"9";
        non_zero_each_col_viz.resize(m/x, vector<int>(x,0));
        cout<<"10";
        non_zero_each_col_window.resize(m/x, 0);
        cout<<"a";

        string p = "real//";
        p.append(names[ii]);
        p.append(".txt");

        string namee = names[ii];

        cout<<namee<<endl;

        fstream MyReadFile(p);
        long long in1, in2;
        float in3;

        cout<<"a";
        //for suitesparse
        while (MyReadFile >> in1) {
            MyReadFile >> in2;
            MyReadFile >> in3;
//        a[in1][in2] = true;
            edges[in1/x][in1%x].push_back({float(in2%x),float(in2+1)});
            edges_b4_load_balancing[in1/x][in1%x].push_back({float(in2%x),in3});
            row_empty[in1/x][in1%x] = false;
            non_zero_count += 1;
            non_zero_each_row[in1].first += 1;
//        non_zero_each_col[in1/x][in2%x].first += 1;
            non_zero_each_col[in1/x][in2].first += 1;
            non_zero_each_col_oned_pre[in1/x][in2] = 1;
            vertically_compressed_height[in1/x_fafnir][in2/x_fafnir][in2%x_fafnir] += 1;
//        non_zero_each_row_viz[in1] += 1;
//        non_zero_each_col_viz[in1/x][in2%x] += 1;
        }

        for(int i = 0; i < m; i++) non_zero_each_row[i].second = i;
        sort(non_zero_each_row.begin(),non_zero_each_row.begin()+m);

        for(int i = 0; i < m; i++){
            for(int j = 0; j<edges_b4_load_balancing[non_zero_each_row[i].second/x][non_zero_each_row[i].second%x].size(); j++){
//           edges_b3_load_balancing[i/x][i%x].push_back({edges_b4_load_balancing[non_zero_each_row[i].second/x][non_zero_each_row[i].second%x][j][0],edges_b4_load_balancing[non_zero_each_row[i].second/x][non_zero_each_row[i].second%x][j][1]});
//            edges[i/x][i%x].push_back({edges_b4_load_balancing[non_zero_each_row[i].second/x][non_zero_each_row[i].second%x][j][0],edges_b4_load_balancing[non_zero_each_row[i].second/x][non_zero_each_row[i].second%x][j][1]});
                non_zero_each_row_viz[i] += 1;
                non_zero_each_col_viz[i/x][edges_b4_load_balancing[non_zero_each_row[i].second/x][non_zero_each_row[i].second%x][j][0]] += 1;
            }
        }

        cout<<"a";
//    for(int i = 0; i < m/x; i++){
//        for(int j = 0; j < n; j++){
//            non_zero_each_col[i][j].second = j;
//        }
////        sort(non_zero_each_col[i].begin(), non_zero_each_col[i].begin() + n);
////        for(int j = 0; j < n/x; j++) {
////            if(j%2==1) reverse(non_zero_each_col[i].begin() + j*x, non_zero_each_col[i].begin() + (j+1)*x);
////        }
//        for(int j = 0; j < n; j++){
//            pos_col[i][j] = non_zero_each_col[i][j].second;
//        }
//    }
//
//    for(int i = 0; i < m; i++){
//        for(int j = 0; j<edges_b3_load_balancing[i/x][i%x].size(); j++){
//            edges[i/x][i%x].push_back({float(int(pos_col[i/x][edges_b3_load_balancing[i/x][i%x][j][0]])%x),edges_b3_load_balancing[i/x][i%x][j][1]});
//            non_zero_each_row_viz[i] += 1;
//            non_zero_each_col_viz[i/x][int(pos_col[i/x][edges_b3_load_balancing[i/x][i%x][j][0]])%x] += 1;
//        }
//    }

        for(int i = 0; i < m/x; i++) {
            non_zero_each_row_window[i] = *max_element(non_zero_each_row_viz.begin()+i*x,non_zero_each_row_viz.begin()+(i+1)*x);
            non_zero_each_col_window[i] = *max_element(non_zero_each_col_viz[i].begin(),non_zero_each_col_viz[i].end());
        }

        double d = ((double)non_zero_count/(double)sizes[ii])/(double)sizes[ii];

//-------------------------------------------------------------------------------------------------
//        1D systolic array
        oned_length = ((double)m*n/(double)x) + x + 1;

//-------------------------------------------------------------------------------------------------

        //adder tree
        at_length = ((double)m*n/(double)x) + log(x) + 1;

//-------------------------------------------------------------------------------------------------

//    //1D with preprocessing
//    oned_length_pre = 0;
//    for(auto aaa: non_zero_each_col_oned_pre){
//        for(auto aaaa: aaa){
//            oned_length_pre += aaaa;
//        }
//    }
//    oned_length_pre += x + 1;
//
////-------------------------------------------------------------------------------------------------
//
//    //AT with preprocessing
//    at_length_pre = 0;
//    for(auto aaa: non_zero_each_row) at_length_pre += (aaa.first/x)+1;
//    at_length_pre += log(x) + 1;

        //fafnir
        fafnir_length = 0;
        for(int i = 0; i < m/x_fafnir; i++){
            for(int j = 0; j < n/x_fafnir; j++){
                int max_fafnir  = 0;
                for(int k = 0; k < x_fafnir; k++){
                    max_fafnir = max(max_fafnir,vertically_compressed_height[i][j][k]);
                }
                fafnir_length += max_fafnir;
            }
        }

        cout<<"faf";
//-------------------------------------------------------------------------------------------------

        //ftpu
//        ftpu_length = ((double)(non_zero_count)/x_ftpu*x_ftpu)*(3*x_ftpu+((x_ftpu*x_ftpu)/(d*m)))+0.9*m;
        ftpu_length = ((double)(3*x_ftpu*non_zero_count)/(x_ftpu*x_ftpu)) + m;

        cout<<"f";
//-------------------------------------------------------------------------------------------------

        //naive scheduling
        naive_schedule_length = non_zero_count;
        for(int i = 0; i < m/x; i++){
            for(int k = 0; k < x; k++){
                if(!row_empty[i][k]) naive_schedule_length--;
            }
        }
        naive_schedule_length += 2;


//-------------------------------------------------------------------------------------------------
        cout << "A"<<"\n";
        // Scheduling (edge coloring a bipartite graph)
        long long vizing = 0;
        auto start = chrono::high_resolution_clock::now();
        vector<queue<int>> scheduled(x);
        vector<queue<int>> scheduled_index(x);
        vector<queue<int>> scheduled_signals(x);


        vector<vector<vector<float>>> uncolored_edges;
        for(int i = 0; i < m/x; i++) {

            uncolored_edges = edges[i];
            vector<vector<int>> colors;
            vector<vector<int>> original_pos;
            vector<int> temp;
            for(int j = 0; j < x; j++) {
                if(uncolored_edges.empty()) colors.push_back(vector<int>(0));
                else colors.push_back(vector<int>(uncolored_edges[j].size()));
                if(uncolored_edges.empty()) original_pos.push_back(vector<int>(0));
                else{
                    for(int pos = 0; pos < uncolored_edges[j].size(); pos++) temp.push_back(pos);
                    original_pos.push_back(temp);
                }
            }
            int color = -1;
            bool all_colored = false;
            while (!all_colored) {
                all_colored = true;
                color += 1;
                vector <bool> matching(x, false);

                for(int j = 0; j < x; j++){
                    if(uncolored_edges[j].empty()) continue;
                    all_colored = false;
                    for(int k = 0; k < uncolored_edges[j].size(); k++){
                        if(!matching[uncolored_edges[j][k][0]]){
                            matching[uncolored_edges[j][k][0]] = true;
                            colors[j][original_pos[j][k]] = color;
                            uncolored_edges[j].erase(uncolored_edges[j].begin()+k);
                            original_pos[j].erase(original_pos[j].begin()+k);
                            break;
                        }
                    }
                }
            }

            int max_color = color;
            if (max_color == 0) {
                for (int j = 0; j < x; j++) {
                    scheduled[j].push(0);
                    scheduled_index[j].push(0);
                    scheduled_signals[j].push(1);
                }
                continue;
            }

            vector<vector<int>> row_of_windows(max_color, vector<int>(x, 0));
            vector<vector<int>> row_of_windows_index_row(max_color, vector<int>(x, 0));
            for (int j = 0; j < x; j++) {
                for(int k = 0; k <colors[j].size(); k++) {
                    row_of_windows[colors[j][k]][edges[i][j][k][0]] = edges[i][j][k][1];
                    row_of_windows_index_row[colors[j][k]][edges[i][j][k][0]]  = j + 1;
                }
            }

            for (int j = 0; j < x; j++) {
                for (int k = 0; k < max_color; k++) {
                    scheduled[j].push(row_of_windows[k][j]);
                    scheduled_index[j].push(row_of_windows_index_row[k][j]);
                    if (k == max_color - 1) scheduled_signals[j].push(1);
                    else scheduled_signals[j].push(0);
                }
            }

            vizing += max(non_zero_each_row_window[i], non_zero_each_col_window[i]);


            float previous = -1;
            for(int kkk = 0; kkk < x; ++kkk){
                for(int kkkk = 1; kkkk < max_color; ++kkkk){
                    if(row_of_windows[kkkk][kkk] != 0 and row_of_windows[kkkk][kkk] != previous){
                        previous = row_of_windows[kkkk][kkk];
                        score +=1;
                    }
                }
            }
        }

//        cout<<"viz = "<<vizing<<endl;


        auto stop = chrono::high_resolution_clock::now();
        auto duration = chrono::duration_cast<chrono::microseconds>(stop - start);
        cout << duration.count()*0.000001<< endl;
        cout << non_zero_count*4*4*0.000001<< endl;

        schedule_length = scheduled[0].size()+2;


        cout << "b"<< endl;

        score += sizes[ii];
        //writing
        MyFile << oned_length <<"\t" << at_length<<"\t" << 0 <<"\t" << 0<<"\t" << fafnir_length<<"\t"
               << ftpu_length <<"\t" << naive_schedule_length <<"\t" << schedule_length << "\t" << vizing <<"\t"<< d<< "\t"<<sizes[ii]<<"\t"<<non_zero_count<<"\t"<<namee<<"\t"<<score<<"\n";
        cout << ii<< endl;
        cout << sizes[ii]<< endl;

    }
    MyFile.close();

    return 0;
}
