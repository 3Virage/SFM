################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../eigen/lapack/cholesky.cpp \
../eigen/lapack/complex_double.cpp \
../eigen/lapack/complex_single.cpp \
../eigen/lapack/double.cpp \
../eigen/lapack/eigenvalues.cpp \
../eigen/lapack/lu.cpp \
../eigen/lapack/single.cpp \
../eigen/lapack/svd.cpp 

OBJS += \
./eigen/lapack/cholesky.o \
./eigen/lapack/complex_double.o \
./eigen/lapack/complex_single.o \
./eigen/lapack/double.o \
./eigen/lapack/eigenvalues.o \
./eigen/lapack/lu.o \
./eigen/lapack/single.o \
./eigen/lapack/svd.o 

CPP_DEPS += \
./eigen/lapack/cholesky.d \
./eigen/lapack/complex_double.d \
./eigen/lapack/complex_single.d \
./eigen/lapack/double.d \
./eigen/lapack/eigenvalues.d \
./eigen/lapack/lu.d \
./eigen/lapack/single.d \
./eigen/lapack/svd.d 


# Each subdirectory must supply rules for building sources it contributes
eigen/lapack/%.o: ../eigen/lapack/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 g++ compiler'
	arm-none-eabi-g++ -DEIGEN_DONT_VECTORIZE -DLOG -Wall -O3 -g3 -I../../cppp_bsp/ps7_cortexa9_0/include -I"E:\INZ\SFM\SFM.sdk\cppp\8point\inc" -I"E:\INZ\SFM\SFM.sdk\cppp\8point" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


