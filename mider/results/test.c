//hello.c 2.0
#include "mex.h"
void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]){
	int i;
	i=mxGetScalar(prhs[0]);
	if(i==1)
		mexPrintf("hello,world!\n");
	else
		mexPrintf("大家好！\n");
}