#include <ruby.h>
#include <narray.h>
#include <fftw3.h>

#include <stdio.h>
#include <stdlib.h>

main()
{
	// VALUE vdir;
	// int dir;
	// 
	// vdir = 3.0;
	//   dir = NUM2INT(vdir);
	fftw_complex *in, *out;
	fftw_complex *tmp;
	fftw_plan p;
	double *din;
	int N = 8;
	int i = 0;

	in 	= (fftw_complex *)fftw_malloc(sizeof(fftw_complex) * N);
	out = (fftw_complex *)fftw_malloc(sizeof(fftw_complex) * N);
	din 	= (double *)fftw_malloc(sizeof(double) * N);

	p = fftw_plan_dft_1d(N, in, out, FFTW_FORWARD, FFTW_MEASURE);	

	printf("*************************************\n");

	tmp = in;

	in[0][0] = din[0] = (double)0.3535;
	in[1][0] = din[1] = (double)0.3535;
	in[2][0] = din[2] = (double)0.6464;
	in[3][0] = din[3] = (double)1.0607;
	in[4][0] = din[4] = (double)0.3535;
	in[5][0] = din[5] = (double)-1.0607;
	in[6][0] = din[6] = (double)-1.3535;
	in[7][0] = din[7] = (double)-0.3535;
	
	in[0][1] = (double)0;
	in[1][1] = (double)0;
	in[2][1] = (double)0;
	in[3][1] = (double)0;
	in[4][1] = (double)0;
	in[5][1] = (double)0;
	in[6][1] = (double)0;
	in[7][1] = (double)0;
	
	
	

	// for(i = 0; i < N; i++) {
	// 	// printf("%p\n", tmp);
	// 	tmp[i][0] = din[i] = (double)2.0; //(double)(rand()%(5-0+1)+0);
	// 	tmp[i][1] = (double)0;
	// 
	// 	// printf("%p:%p\n", &tmp[0][0], &tmp[0][1]);
	// 	// tmp++;
	// }
	printf("*************************************\n");
	
	// tmp = in;
	for(i = 0; i < N; i++) {
		printf("%.2f+j%.2f\n", in[i][0], in[i][1]);
		printf("%.2f\n", 			 din[i]);
		// tmp++;
	}
	
	fftw_execute(p);

	printf("*************************************\n");

	// tmp = out;
	for(i = 0; i < N; i++) {
		printf("X(%d):%.2f+j%.2f\n", i, out[i][0], out[i][1]);
		// tmp++;
	}
	fftw_destroy_plan(p);

	p = fftw_plan_dft_r2c_1d(N, din, out, FFTW_MEASURE);	
	fftw_execute(p);
	
	printf("*************************************\n");

	// tmp = out;
	for(i = 0; i < N; i++) {
		printf("X(%d):%.2f+j%.2f\n", i, out[i][0], out[i][1]);
		// tmp++;
	}
	
	
	fftw_destroy_plan(p);
	fftw_free(in);
	fftw_free(out);
	fftw_free(din);
	
  
	// printf("FFTW C Test Routine\n");
	// // printf("dir: %d\n", dir);
	// 
	// 	in = (fftw_complex*)fftw_malloc(sizeof(fftw_complex) * N);
	// 	// out = (fftw_complex*)fftw_malloc(sizeof(fftw_complex) * N);
	// 	
	// 	for(i = 0; i < 8; i++){
	// 		printf("%x\n", (fftw_complex*)in);
	// 		in++;
	// 	}
	// 
	// 	// p = fftw_plan_dft_1d(N, in, out, FFTW_FORWARD, FFTW_ESTIMATE);
	// 	// fftw_execute(p); 
	// 
	// 	
	// 	
	// 	// fftw_destroy_plan(p);
	// 	fftw_free((fftw_complex*)in); 
	// 	// fftw_free((fftw_complex*)out);
}