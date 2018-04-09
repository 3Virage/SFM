################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../eigen/unsupported/bench/bench_svd.cpp 

OBJS += \
./eigen/unsupported/bench/bench_svd.o 

CPP_DEPS += \
./eigen/unsupported/bench/bench_svd.d 


# Each subdirectory must supply rules for building sources it contributes
eigen/unsupported/bench/%.o: ../eigen/unsupported/bench/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 g++ compiler'
	arm-none-eabi-g++ -DEIGEN_DONT_VECTORIZE -DLOG -Wall -O3 -g3 -I../../cppp_bsp/ps7_cortexa9_0/include -I"E:\INZ\SFM\SFM.sdk\cppp\8point\inc" -I"E:\INZ\SFM\SFM.sdk\cppp\8point" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


