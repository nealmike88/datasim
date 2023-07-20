#include <iostream>
#include <cmath> 
#include <vector>
#include "datasim/numbergen.h"

using namespace std;

float Datasim::simdata(int t)
{
    y = sin (2 * pie * 0.15 * t + 0) + ZERO_OFFSET;
    cout << y << endl; 
    return y; 
}

vector<float> Datasim::simdata_array(int count)
{
    vector<float> y;

    for (int i=0; i<count; i++)
    {
        y.push_back(sin (2 * pie * + i) + ZERO_OFFSET);
    }
    
    return y; 
}
