################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../eigen/blas/complex_double.cpp \
../eigen/blas/complex_single.cpp \
../eigen/blas/double.cpp \
../eigen/blas/single.cpp \
../eigen/blas/xerbla.cpp 

OBJS += \
./eigen/blas/complex_double.o \
./eigen/blas/complex_single.o \
./eigen/blas/double.o \
./eigen/blas/single.o \
./eigen/blas/xerbla.o 

CPP_DEPS += \
./eigen/blas/complex_double.d \
./eigen/blas/complex_single.d \
./eigen/blas/double.d \
./eigen/blas/single.d \
./eigen/blas/xerbla.d 


# Each subdirectory must supply rules for building sources it contributes
eigen/blas/%.o: ../eigen/blas/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 g++ compiler'
	arm-none-eabi-g++ -DEIGEN_DONT_VECTORIZE -DLOG -Wall -O3 -g3 -I../../cppp_bsp/ps7_cortexa9_0/include -I"E:\INZ\SFM\SFM.sdk\cppp\8point\inc" -I"E:\INZ\SFM\SFM.sdk\cppp\8point" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


