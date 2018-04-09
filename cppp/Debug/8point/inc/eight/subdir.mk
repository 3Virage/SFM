################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../8point/inc/eight/distance.cpp 

OBJS += \
./8point/inc/eight/distance.o 

CPP_DEPS += \
./8point/inc/eight/distance.d 


# Each subdirectory must supply rules for building sources it contributes
8point/inc/eight/%.o: ../8point/inc/eight/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 g++ compiler'
	arm-none-eabi-g++ -DEIGEN_DONT_VECTORIZE -Wall -O0 -g3 -I"E:\INZ\eigen" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -I../../cppp_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


