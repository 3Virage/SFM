################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../8point/SFM.cpp 

OBJS += \
./8point/SFM.o 

CPP_DEPS += \
./8point/SFM.d 


# Each subdirectory must supply rules for building sources it contributes
8point/%.o: ../8point/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 g++ compiler'
	arm-none-eabi-g++ -DEIGEN_DONT_VECTORIZE -DLOG -Wall -O3 -g3 -I"C:\SFMv2\SFM\SFM.sdk\eigen" -I../../SFMnew_bsp/ps7_cortexa9_0/include -I"C:\SFMv2\SFM\SFM.sdk\cppp\8point\inc" -I"C:\SFMv2\SFM\SFM.sdk\cppp\8point" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -I../../SFMnew_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


