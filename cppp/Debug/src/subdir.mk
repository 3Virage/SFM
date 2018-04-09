################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

CC_SRCS += \
../src/main.cc 

C_SRCS += \
../src/platform.c 

CPP_SRCS += \
../src/interrupts.cpp \
../src/server_pmod.cpp 

CC_DEPS += \
./src/main.d 

OBJS += \
./src/interrupts.o \
./src/main.o \
./src/platform.o \
./src/server_pmod.o 

C_DEPS += \
./src/platform.d 

CPP_DEPS += \
./src/interrupts.d \
./src/server_pmod.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 g++ compiler'
	arm-none-eabi-g++ -DEIGEN_DONT_VECTORIZE -DLOG -Wall -O3 -g3 -I"C:\SFMv2\SFM\SFM.sdk\eigen" -I../../SFMnew_bsp/ps7_cortexa9_0/include -I"C:\SFMv2\SFM\SFM.sdk\cppp\8point\inc" -I"C:\SFMv2\SFM\SFM.sdk\cppp\8point" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -I../../SFMnew_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/%.o: ../src/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 g++ compiler'
	arm-none-eabi-g++ -DEIGEN_DONT_VECTORIZE -DLOG -Wall -O3 -g3 -I"C:\SFMv2\SFM\SFM.sdk\eigen" -I../../SFMnew_bsp/ps7_cortexa9_0/include -I"C:\SFMv2\SFM\SFM.sdk\cppp\8point\inc" -I"C:\SFMv2\SFM\SFM.sdk\cppp\8point" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -I../../SFMnew_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 g++ compiler'
	arm-none-eabi-g++ -DEIGEN_DONT_VECTORIZE -DLOG -Wall -O3 -g3 -I"C:\SFMv2\SFM\SFM.sdk\eigen" -I../../SFMnew_bsp/ps7_cortexa9_0/include -I"C:\SFMv2\SFM\SFM.sdk\cppp\8point\inc" -I"C:\SFMv2\SFM\SFM.sdk\cppp\8point" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -I../../SFMnew_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


