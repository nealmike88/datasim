float y[];
int ZERO_OFFSET = 9;
float M_PI = 3.14;
for (int t=0; t<100; t++)
{ 
    y[t] = sin (2 * M_PI * 0.15 * t + 0) + ZERO_OFFSET;
    cout << y[t] << endl; 
}
