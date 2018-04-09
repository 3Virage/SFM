################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../eigen/bench/spbench/sp_solver.cpp \
../eigen/bench/spbench/spbenchsolver.cpp \
../eigen/bench/spbench/test_sparseLU.cpp 

OBJS += \
./eigen/bench/spbench/sp_solver.o \
./eigen/bench/spbench/spbenchsolver.o \
./eigen/bench/spbench/test_sparseLU.o 

CPP_DEPS += \
./eigen/bench/spbench/sp_solver.d \
./eigen/bench/spbench/spbenchsolver.d \
./eigen/bench/spbench/test_sparseLU.d 


# Each subdirectory must supply rules for building sources it contributes
eigen/bench/spbench/%.o: ../eigen/bench/spbench/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 g++ compiler'
	arm-none-eabi-g++ -DEIGEN_DONT_VECTORIZE -DLOG -Wall -O3 -g3 -I../../cppp_bsp/ps7_cortexa9_0/include -I"E:\INZ\SFM\SFM.sdk\cppp\8point\inc" -I"E:\INZ\SFM\SFM.sdk\cppp\8point" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


