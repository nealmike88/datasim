#include <iostream>
#include <cmath> 

#include "datasim.h"

using namespace std;

void Datasim::simdata()
{
    for (int t=0; t<100; t++)
    { 
        y[t] = sin (2 * pie * 0.15 * t + 0) + ZERO_OFFSET;
        cout << y[t] << endl; 
    }
}