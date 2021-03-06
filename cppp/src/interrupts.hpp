#ifndef IRQ_INIT_HPP
#define IRQ_INIT_HPP

#define LOG_INT

#include "xscugic.h"
#include "xil_exception.h"
#include "xparameters.h"
#include "xdebug.h"
#include "xil_cache.h"
#include "xil_io.h"
#include "platform.h"

#define IRQ_PIN 62
uint64_t win2mem(uint8_t row, uint8_t col);

void mem2win(uint64_t mem, uint16_t *r, uint16_t *c);
int initInterrupts() ;
#endif
