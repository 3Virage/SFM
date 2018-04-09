/*
 * interrupts.cpp
 *
 *  Created on: 21 Dec 2017
 *      Author: tomasz
 */

#include "xtime_l.h"
#include "interrupts.hpp"
#include <Eigen/Core>
#include <SFM.hpp>
#include <cstdio>

uint32_t buff_in_x1[920] = { 0 };
uint32_t buff_in_y1[920] = { 0 };
uint32_t buff_in_x2[920] = { 0 };
uint32_t buff_in_y2[920] = { 0 };
uint32_t buf_x_out[920] = { 0 };
uint32_t buf_y_out[920] = { 0 };
double buf_z_out[920] = { 0 };
double min = -99999999;
double max = 99999999;

volatile uint8_t interrupt = 0;
volatile uint8_t processing = 0;

XTime tInt, tIntNow = 0;
static XScuGic interruptController; // Interrupt Controller Driver

uint64_t win2mem(uint8_t row, uint8_t col) {
	uint16_t temp = (((uint16_t) row << 6) & 0xFC0) | (col & 0x3F);
	return XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR + temp * 8;

}

void mem2win(uint64_t mem, uint16_t *r, uint16_t *c) {
	*c = ((mem - XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR) / 8) & 0x3F;
	*r = ((((mem - XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR) / 8) & 0xFC0) >> 6);

}

static void interruptHandler(void *CallBackRef, int Bank, u32 Status) {
#ifdef LOG_INT
	xil_printf("Int ");
#endif
	XTime_GetTime(&tInt);
	int cnt = 0;
	for (uint8_t row = 0; row < 22; row++) { //delete last row detections
		for (uint8_t col = 0; col < 40; col++) {
			uint64_t addr = win2mem(row, col);
			uint64_t bram_out = Xil_In64(addr);
			uint32_t ypos = (bram_out & 0xFFE00000000) >> 33;
			uint32_t xpos = (bram_out & 0x1FFC00000) >> 22;
			uint32_t ypos2 = (bram_out & 0x3FF800) >> 11;
			uint32_t xpos2 = (bram_out & 0x7FF);

			buff_in_x1[cnt] = xpos;
			buff_in_y1[cnt] = ypos;
			buff_in_x2[cnt] = xpos2;
			buff_in_y2[cnt] = ypos2;
			cnt++;
		}
	}
	for (uint8_t row = 0; row < 23; row++) { //delete last row detections
			for (uint8_t col = 0; col < 40; col++) {
				Xil_Out64(win2mem(row, col), 0);
			}
		}

	for (int i = 0; i < 920; i++) {
		uint16_t xpos = buf_x_out[i];
		uint16_t ypos = buf_y_out[i];
		uint8_t row = ypos / 32;
		uint8_t col = xpos / 32;
		double color = 255.0 * (buf_z_out[i] - min) / (max - min);
		//double color = (buf_z_out[i] - min) * 2550 > 255 ? 255 : (buf_z_out[i] - min) * 2550;
		uint64_t bram_in = ((uint64_t) color & 0xFF)
				| (((uint64_t) xpos << 22) & 0x1FFC00000)
				| (((uint64_t) ypos << 33) & 0xFFE00000000);
		uint64_t addr = win2mem(row, col);
		Xil_Out64(addr, bram_in);
	}
	XTime_GetTime(&tIntNow);
#ifdef LOG_INT
	printf("T_Int: %llu\r\n",
			(tIntNow - tInt) / (COUNTS_PER_SECOND / 1000000));
#endif
	interrupt = 1;

	uint32_t IntIDFull = XScuGic_CPUReadReg(&interruptController,
			XSCUGIC_INT_ACK_OFFSET);
	XScuGic_CPUWriteReg(&interruptController, XSCUGIC_EOI_OFFSET, IntIDFull);

//--------------------------------------------------
//	XTime_GetTime(&tStart);
//
//
//
//
//	Eigen::Matrix<double, 2, Eigen::Dynamic> p1;
//	Eigen::Matrix<double, 2, Eigen::Dynamic> p2;
//
//	p1.conservativeResize(2, 920);
//	p2.conservativeResize(2, 920);
//	uint16_t cnt_diff=0;
//	uint16_t cnt = 0;
//
//	for (uint8_t row = 0; row < 22; row++) {	//delete last row detections
//		for (uint8_t col = 0; col < 40; col++) {
//			uint64_t addr = win2mem(row, col);
//			uint64_t bram_out = Xil_In64(addr);
//			uint32_t ypos = (bram_out & 0xFFE00000000) >> 33;
//			uint32_t xpos = (bram_out & 0x1FFC00000) >> 22;
//			uint32_t ypos2 = (bram_out & 0x3FF800) >> 11;
//			uint32_t xpos2 = (bram_out & 0x7FF);
//
//			if (xpos != xpos2 || ypos != ypos2)
//				//xil_printf("Point2 %d %d %d %d\r\n", xpos, ypos,xpos2,ypos2);
//				cnt_diff++;
//
//			if (xpos == 0 || ypos == 0 || xpos2 == 0 || ypos2 == 0
//					|| xpos > 1280 || ypos > 720 || xpos2 > 1280 || ypos2 > 720)
//				continue;
//
//			p1(0, cnt) = xpos;
//			p1(1, cnt) = ypos;
//			p2(0, cnt) = xpos2;
//			p2(1, cnt) = ypos2;
//			cnt++;
//			//char buf[200];
//			//xil_printf("Row %d col %d Point %u %u %u %u, addr: %x\r\n",row,col,xpos,ypos,xpos2,ypos2,addr);
//
//		}
//	}
//
//	for(uint8_t row = 0; row < 23; row++){
//		for(uint8_t col = 0; col < 40; col++){
//			//uint64_t bram_in = ((uint64_t)color & 0xFF) | (((uint64_t)xpos << 22) & 0x1FFC00000) | (((uint64_t)ypos << 33) & 0xFFE00000000);
//			uint64_t addr = win2mem(row,col);
//			Xil_Out64(addr , 0);
//		}
//	}
//
//	printf("Detect %4d, Diff %4d, ",cnt, cnt_diff);
//	if (p1.cols() < 8) {
//		return;
//	}
//
//	p1.conservativeResize(2, cnt);
//	p2.conservativeResize(2, cnt);
////memset(buf_x,0,920*2);
////memset(buf_y,0,920*2);
////memset(buf_z,0,920*sizeof(double));
//
////	SFM_calc(p1,p2,cnt,buf_x,buf_y,buf_z);
//	XTime_GetTime(&tEnd);
////	int elapsed = (tEnd - tStart) / (COUNTS_PER_SECOND/1000);
////	printf("elapsed: %d, ",elapsed);
////	if(elapsed<16)
//	for(int i =0;i<920;i++){
//	uint16_t xpos = buf_x[i];
//	uint16_t ypos = buf_y[i];
//	int color = buf_z[i] * 128.0;
//	color += 128;
//	uint64_t bram_in = ((uint64_t)color & 0xFF) | (((uint64_t)xpos << 22) & 0x1FFC00000) | (((uint64_t)ypos << 33) & 0xFFE00000000);
//	uint64_t addr = win2mem(ypos/5,xpos/5);
//	Xil_Out64(addr , bram_in);
//	}
//
//		XTime_GetTime(&tEnd);
//
////	   printf("Output took %llu clock cycles.\n", 2*(tEnd- tStart));
////	   printf("Output took %llu us.\n",
////	           (tEnd - tStart) / (COUNTS_PER_SECOND/1000000));
//	   printf("Time %5llu\r\n", (tEnd - tStart) / (COUNTS_PER_SECOND/1000));

//------------------------------------------------
//	xil_printf("A");

//
//	for (int i = 0; i < 2048; ++i){
////		uint64_t bram_out = Xil_In64(XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR +i*8 );
////		uint32_t ypos = (bram_out & 0xFFE00000000) >> 33;
////		uint32_t xpos = (bram_out & 0x1FFC00000) >> 22;
////		uint32_t ypos2 = (bram_out & 0x3FF800) >> 11;
////		uint32_t xpos2 = (bram_out & 0x7FF);
//		char buf[100];
//		uint16_t r, c;
//		mem2win(XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR +i*8 ,&r, &c );
//	//	sprintf(buf,"Row:%d Col:%d ,Point %u %u %u %u\r\n",r,c,xpos,ypos,xpos2,ypos2);
//	//	xil_printf(buf);
//	}
////	for(uint8_t row = 0; row < 23; row++){
////		for(uint8_t col = 0; col < 40; col++){
////			uint64_t addr = win2mem(row,col);
////			uint64_t bram_out = Xil_In64(addr );
////			uint32_t xpos = (bram_out & 0xFFE00000000) >> 33;
////			uint32_t ypos = (bram_out & 0x1FFC00000) >> 22;
////			uint32_t xpos2 = (bram_out & 0x3FF800) >> 11;
////			uint32_t ypos2 = (bram_out & 0x7FF);
////			char buf[200];
////			xil_printf("Row %d col %d Point %u %u %u %u, addr: %x\r\n",row,col,xpos,ypos,xpos2,ypos2,addr);
////
////		}
////	}
////
////
//	for(uint8_t row = 0; row < 23; row++){
//		for(uint8_t col = 0; col < 40; col++){
//			uint16_t xpos = col * 32 + 16;
//			uint16_t ypos = row * 32 + 16;
//			uint16_t color = col * 5;
//			uint64_t bram_in = ((uint64_t)color & 0xFF) | (((uint64_t)xpos << 22) & 0x1FFC00000) | (((uint64_t)ypos << 33) & 0xFFE00000000);
//			uint64_t addr = win2mem(row,col);
//			Xil_Out64(addr , bram_in);
//		}
//	}
////
//	XTime_GetTime(&tEnd);
//    xil_printf("Output took %u clock cycles.\n", 2*(tEnd- tStart));
//    xil_printf("Output took %u us.\n",
//           (tEnd - tStart) / (COUNTS_PER_SECOND/1000000));

}

int initInterrupts() {
	int status;

	XScuGic_Config *gicConfig;
	/*
	 * Initialize the interrupt controller driver so that it is ready to
	 * use.
	 * */
	Xil_ExceptionInit();

	gicConfig = XScuGic_LookupConfig(XPAR_PS7_SCUGIC_0_DEVICE_ID);
	if (NULL == gicConfig) {
		return XST_FAILURE;
	}

	status = XScuGic_CfgInitialize(&interruptController, gicConfig,
			gicConfig->CpuBaseAddress);

	if (status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Connect the interrupt controller interrupt handler to the hardware
	 * interrupt handling logic in the ARM processor.
	 */
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_IRQ_INT,
			(Xil_ExceptionHandler) XScuGic_InterruptHandler,
			(void *) &interruptController);

	/*
	 * Connect a device driver handler that will be called when an
	 * interrupt for the device occurs, the device driver handler performs
	 * the specific interrupt processing for the device
	 * since the xparameters.h file doesnt detect the external interrupts, we have to manually
	 * use the IRQ_F2P port numbers ; 91, 90, ect..
	 */
	status = XScuGic_Connect(&interruptController, IRQ_PIN,
			(Xil_ExceptionHandler) interruptHandler,
			(void *) &interruptController);
	XScuGic_SetPriorityTriggerType(&interruptController, IRQ_PIN, 0x0, 0x3); // 0x3 = rising edge

	XScuGic_Enable(&interruptController, IRQ_PIN);

	// Enable interrupts in the ARM
	Xil_ExceptionEnable();
	XScuGic_CPUWriteReg(&interruptController, XSCUGIC_EOI_OFFSET, IRQ_PIN);
//	XScuGic_SetPriorityTriggerType(&interruptController, IRQ_PIN, 0xa0, 3);

	if (status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

