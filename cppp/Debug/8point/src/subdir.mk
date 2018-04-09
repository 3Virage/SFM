################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../8point/src/distance.cpp \
../8point/src/essential.cpp \
../8point/src/fundamental.cpp \
../8point/src/normalize.cpp \
../8point/src/project.cpp \
../8point/src/structure.cpp 

OBJS += \
./8point/src/distance.o \
./8point/src/essential.o \
./8point/src/fundamental.o \
./8point/src/normalize.o \
./8point/src/project.o \
./8point/src/structure.o 

CPP_DEPS += \
./8point/src/distance.d \
./8point/src/essential.d \
./8point/src/fundamental.d \
./8point/src/normalize.d \
./8point/src/project.d \
./8point/src/structure.d 


# Each subdirectory must supply rules for building sources it contributes
8point/src/%.o: ../8point/src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 g++ compiler'
	arm-none-eabi-g++ -DEIGEN_DONT_VECTORIZE -DLOG -Wall -O3 -g3 -I"C:\SFMv2\SFM\SFM.sdk\eigen" -I../../SFMnew_bsp/ps7_cortexa9_0/include -I"C:\SFMv2\SFM\SFM.sdk\cppp\8point\inc" -I"C:\SFMv2\SFM\SFM.sdk\cppp\8point" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -I../../SFMnew_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


