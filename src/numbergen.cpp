#include <iostream>
#include <cmath> 

#include "datasim/numbergen.h"

using namespace std;

float Datasim::simdata(int t)
{
    y = sin (2 * pie * 0.15 * t + 0) + ZERO_OFFSET;
    cout << y << endl; 
    return y; 
}