#ifndef DATASIM_H
#define DATASIM_H

#pragma once

class Datasim 
{
    public: 
        float y; 
        float simdata(int t);
        std::vector<float> simdata_array(int count);

    private:
        int ZERO_OFFSET = 9;
        float pie = 3.14;
};

#endif
