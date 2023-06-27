#ifndef DATASIM_H
#define DATASIM_H

//#pragma once

class Datasim 
{
    public: 
        float simdata(int t);
    
    private:
        float y;
        int ZERO_OFFSET = 9;
        float pie = 3.14;
};

#endif
