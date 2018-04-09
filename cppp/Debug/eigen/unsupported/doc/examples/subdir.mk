################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../eigen/unsupported/doc/examples/BVH_Example.cpp \
../eigen/unsupported/doc/examples/EulerAngles.cpp \
../eigen/unsupported/doc/examples/FFT.cpp \
../eigen/unsupported/doc/examples/MatrixExponential.cpp \
../eigen/unsupported/doc/examples/MatrixFunction.cpp \
../eigen/unsupported/doc/examples/MatrixLogarithm.cpp \
../eigen/unsupported/doc/examples/MatrixPower.cpp \
../eigen/unsupported/doc/examples/MatrixPower_optimal.cpp \
../eigen/unsupported/doc/examples/MatrixSine.cpp \
../eigen/unsupported/doc/examples/MatrixSinh.cpp \
../eigen/unsupported/doc/examples/MatrixSquareRoot.cpp \
../eigen/unsupported/doc/examples/PolynomialSolver1.cpp \
../eigen/unsupported/doc/examples/PolynomialUtils1.cpp 

OBJS += \
./eigen/unsupported/doc/examples/BVH_Example.o \
./eigen/unsupported/doc/examples/EulerAngles.o \
./eigen/unsupported/doc/examples/FFT.o \
./eigen/unsupported/doc/examples/MatrixExponential.o \
./eigen/unsupported/doc/examples/MatrixFunction.o \
./eigen/unsupported/doc/examples/MatrixLogarithm.o \
./eigen/unsupported/doc/examples/MatrixPower.o \
./eigen/unsupported/doc/examples/MatrixPower_optimal.o \
./eigen/unsupported/doc/examples/MatrixSine.o \
./eigen/unsupported/doc/examples/MatrixSinh.o \
./eigen/unsupported/doc/examples/MatrixSquareRoot.o \
./eigen/unsupported/doc/examples/PolynomialSolver1.o \
./eigen/unsupported/doc/examples/PolynomialUtils1.o 

CPP_DEPS += \
./eigen/unsupported/doc/examples/BVH_Example.d \
./eigen/unsupported/doc/examples/EulerAngles.d \
./eigen/unsupported/doc/examples/FFT.d \
./eigen/unsupported/doc/examples/MatrixExponential.d \
./eigen/unsupported/doc/examples/MatrixFunction.d \
./eigen/unsupported/doc/examples/MatrixLogarithm.d \
./eigen/unsupported/doc/examples/MatrixPower.d \
./eigen/unsupported/doc/examples/MatrixPower_optimal.d \
./eigen/unsupported/doc/examples/MatrixSine.d \
./eigen/unsupported/doc/examples/MatrixSinh.d \
./eigen/unsupported/doc/examples/MatrixSquareRoot.d \
./eigen/unsupported/doc/examples/PolynomialSolver1.d \
./eigen/unsupported/doc/examples/PolynomialUtils1.d 


# Each subdirectory must supply rules for building sources it contributes
eigen/unsupported/doc/examples/%.o: ../eigen/unsupported/doc/examples/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 g++ compiler'
	arm-none-eabi-g++ -DEIGEN_DONT_VECTORIZE -DLOG -Wall -O3 -g3 -I../../cppp_bsp/ps7_cortexa9_0/include -I"E:\INZ\SFM\SFM.sdk\cppp\8point\inc" -I"E:\INZ\SFM\SFM.sdk\cppp\8point" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


