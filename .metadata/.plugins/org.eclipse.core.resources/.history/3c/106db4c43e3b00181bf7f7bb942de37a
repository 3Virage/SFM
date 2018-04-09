/*
 * Empty C++ Application
 */
#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xil_io.h"
#include "interrupts.hpp"
#include "xtime_l.h"
#include "SFM.hpp"
#include <Eigen/Dense>
#include "server_pmod.hpp"
using Eigen::MatrixXd;

//#define MATLAB_LIKE

extern volatile uint8_t interrupt;
extern volatile uint8_t processing;
extern volatile uint32_t buff_in_x1[920];
extern volatile uint32_t buff_in_y1[920];
extern volatile uint32_t buff_in_x2[920];
extern volatile uint32_t buff_in_y2[920];
extern volatile uint32_t buf_x_out[920];
extern volatile uint32_t buf_y_out[920];
extern volatile double buf_z_out[920];
extern volatile double min;
extern volatile double max;
extern XTime tInt;
XTime tNow, tStart1;

uint16_t buf_x[920];
uint16_t buf_y[920];
double buf_z[920];

int main() {

	init_platform();
	xil_printf("Starting\n\r");
	MatrixXd m(2, 2);
	m(0, 0) = 3;
	m(1, 0) = 2.5;
	m(0, 1) = -1;
	m(1, 1) = m(1, 0) + m(0, 1);

	if (m(1, 1 == -1.5))
		xil_printf("OK\r\n");

	if (initInterrupts() == XST_FAILURE) {
		xil_printf("Failed to initialize interrupts\n\r");
		return 1;
	} else {
		xil_printf("Interrupts initialized successfully\n\r");
	}

	interrupt = 0;
	   Xil_ICacheEnable();
	   Xil_DCacheEnable();

	   xil_printf("TCP Echo Server\r\nConnecting...\r\n");
	   DemoInitialize();

	while (1) {
		 //xil_printf("Demo run\r\n");
		//DemoRun();
		if (interrupt) {

			xil_printf("Int process\r\n");
			Eigen::Matrix<double, 2, Eigen::Dynamic> p1;
			Eigen::Matrix<double, 2, Eigen::Dynamic> p2;
			XTime_GetTime(&tStart1);
			p1.conservativeResize(2, 920);
			p2.conservativeResize(2, 920);
			uint16_t same = 0;
			uint16_t cnt = 0;
#ifdef MATLAB_LIKE
			xil_printf("[");
#endif
			for (int i = 0; i < 920; i++) { //delete last row detections
				if (buff_in_x1[i] == 0 || buff_in_y1[i] == 0
						|| buff_in_x2[i] == 0 || buff_in_y2[i] == 0
						|| buff_in_x1[i] > 1280 || buff_in_y1[i] > 720
						|| buff_in_x2[i] > 1280 || buff_in_y2[i] > 720)
					continue;
				if (buff_in_x1[i] == buff_in_x2[i]
						&& buff_in_y1[i] == buff_in_y2[i]) {
					same++;
					continue;
				}

				p1(0, cnt) = buff_in_x1[i];
				p1(1, cnt) = buff_in_y1[i];
				p2(0, cnt) = buff_in_x2[i];
				p2(1, cnt) = buff_in_y2[i];
				cnt++;

#ifdef MATLAB_LIKE
				xil_printf("%d, %d, %d, %d;\r\n", buff_in_x1[i], buff_in_y1[i],
						buff_in_x2[i], buff_in_y2[i]);
#endif
			}
#ifdef MATLAB_LIKE
			xil_printf("]");
#endif
#ifdef LOG
			printf("Detect %4d, Same %4d, ", cnt, same);
#endif
			if (cnt < 8) {
#ifdef LOG
				printf("Next--------------\r\n");
#endif
				interrupt = 0;
				continue;
			}

			p1.conservativeResize(2, cnt);
			p2.conservativeResize(2, cnt);
			memset(buf_x, 0, sizeof(buf_x));
			memset(buf_y, 0, sizeof(buf_y));
			memset(buf_z, 0, sizeof(buf_z));
			int count = 0;
			SFM_calc(p1, p2, cnt, buf_x, buf_y, buf_z, &count);
			XTime_GetTime(&tNow);
#ifdef LOG
			printf("T_SFM: %5llu ",
					(tNow - tStart) / (COUNTS_PER_SECOND / 1000000));
#endif


			for (int i = 0; i < 920; i++) {
				buf_x_out[i] = buf_x[i];
				buf_y_out[i] = buf_y[i];
				buf_z_out[i] = buf_z[i];
			}

			min = 99999999;
			max = -99999999;
			for (int i = 0; i < count; i++) {
				if (buf_z[i] > max)
					max = buf_z[i];
				if (buf_z[i] < min)
					min = buf_z[i];
			}
#ifdef LOG
	//		printf("min: %f, max: %f, dif: %f ", min, max, max - min);
#endif

			XTime_GetTime(&tNow);
#ifdef LOG
			printf("T_all: %5llu\r\n",
					(tNow - tStart) / (COUNTS_PER_SECOND / 1000000));
#endif
			interrupt = 0;

		}
	}

	cleanup_platform();

}
