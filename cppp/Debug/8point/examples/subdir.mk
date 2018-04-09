################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../8point/examples/calibrate.cpp \
../8point/examples/defocus.cpp 

OBJS += \
./8point/examples/calibrate.o \
./8point/examples/defocus.o 

CPP_DEPS += \
./8point/examples/calibrate.d \
./8point/examples/defocus.d 


# Each subdirectory must supply rules for building sources it contributes
8point/examples/%.o: ../8point/examples/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 g++ compiler'
	arm-none-eabi-g++ -DEIGEN_DONT_VECTORIZE -Wall -O0 -g3 -I"E:\INZ\eigen" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -I../../cppp_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


