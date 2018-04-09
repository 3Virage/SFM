################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../eigen/blas/f2c/chbmv.c \
../eigen/blas/f2c/chpmv.c \
../eigen/blas/f2c/complexdots.c \
../eigen/blas/f2c/ctbmv.c \
../eigen/blas/f2c/d_cnjg.c \
../eigen/blas/f2c/drotm.c \
../eigen/blas/f2c/drotmg.c \
../eigen/blas/f2c/dsbmv.c \
../eigen/blas/f2c/dspmv.c \
../eigen/blas/f2c/dtbmv.c \
../eigen/blas/f2c/lsame.c \
../eigen/blas/f2c/r_cnjg.c \
../eigen/blas/f2c/srotm.c \
../eigen/blas/f2c/srotmg.c \
../eigen/blas/f2c/ssbmv.c \
../eigen/blas/f2c/sspmv.c \
../eigen/blas/f2c/stbmv.c \
../eigen/blas/f2c/zhbmv.c \
../eigen/blas/f2c/zhpmv.c \
../eigen/blas/f2c/ztbmv.c 

OBJS += \
./eigen/blas/f2c/chbmv.o \
./eigen/blas/f2c/chpmv.o \
./eigen/blas/f2c/complexdots.o \
./eigen/blas/f2c/ctbmv.o \
./eigen/blas/f2c/d_cnjg.o \
./eigen/blas/f2c/drotm.o \
./eigen/blas/f2c/drotmg.o \
./eigen/blas/f2c/dsbmv.o \
./eigen/blas/f2c/dspmv.o \
./eigen/blas/f2c/dtbmv.o \
./eigen/blas/f2c/lsame.o \
./eigen/blas/f2c/r_cnjg.o \
./eigen/blas/f2c/srotm.o \
./eigen/blas/f2c/srotmg.o \
./eigen/blas/f2c/ssbmv.o \
./eigen/blas/f2c/sspmv.o \
./eigen/blas/f2c/stbmv.o \
./eigen/blas/f2c/zhbmv.o \
./eigen/blas/f2c/zhpmv.o \
./eigen/blas/f2c/ztbmv.o 

C_DEPS += \
./eigen/blas/f2c/chbmv.d \
./eigen/blas/f2c/chpmv.d \
./eigen/blas/f2c/complexdots.d \
./eigen/blas/f2c/ctbmv.d \
./eigen/blas/f2c/d_cnjg.d \
./eigen/blas/f2c/drotm.d \
./eigen/blas/f2c/drotmg.d \
./eigen/blas/f2c/dsbmv.d \
./eigen/blas/f2c/dspmv.d \
./eigen/blas/f2c/dtbmv.d \
./eigen/blas/f2c/lsame.d \
./eigen/blas/f2c/r_cnjg.d \
./eigen/blas/f2c/srotm.d \
./eigen/blas/f2c/srotmg.d \
./eigen/blas/f2c/ssbmv.d \
./eigen/blas/f2c/sspmv.d \
./eigen/blas/f2c/stbmv.d \
./eigen/blas/f2c/zhbmv.d \
./eigen/blas/f2c/zhpmv.d \
./eigen/blas/f2c/ztbmv.d 


# Each subdirectory must supply rules for building sources it contributes
eigen/blas/f2c/%.o: ../eigen/blas/f2c/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 g++ compiler'
	arm-none-eabi-g++ -DEIGEN_DONT_VECTORIZE -DLOG -Wall -O3 -g3 -I../../cppp_bsp/ps7_cortexa9_0/include -I"E:\INZ\SFM\SFM.sdk\cppp\8point\inc" -I"E:\INZ\SFM\SFM.sdk\cppp\8point" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


