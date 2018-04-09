################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../eigen/bench/btl/libs/blitz/btl_blitz.cpp \
../eigen/bench/btl/libs/blitz/btl_tiny_blitz.cpp 

OBJS += \
./eigen/bench/btl/libs/blitz/btl_blitz.o \
./eigen/bench/btl/libs/blitz/btl_tiny_blitz.o 

CPP_DEPS += \
./eigen/bench/btl/libs/blitz/btl_blitz.d \
./eigen/bench/btl/libs/blitz/btl_tiny_blitz.d 


# Each subdirectory must supply rules for building sources it contributes
eigen/bench/btl/libs/blitz/%.o: ../eigen/bench/btl/libs/blitz/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 g++ compiler'
	arm-none-eabi-g++ -DEIGEN_DONT_VECTORIZE -DLOG -Wall -O3 -g3 -I../../cppp_bsp/ps7_cortexa9_0/include -I"E:\INZ\SFM\SFM.sdk\cppp\8point\inc" -I"E:\INZ\SFM\SFM.sdk\cppp\8point" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


