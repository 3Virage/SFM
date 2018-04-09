################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../8point-master/src/distance.cpp \
../8point-master/src/essential.cpp \
../8point-master/src/fundamental.cpp \
../8point-master/src/normalize.cpp \
../8point-master/src/project.cpp \
../8point-master/src/structure.cpp 

OBJS += \
./8point-master/src/distance.o \
./8point-master/src/essential.o \
./8point-master/src/fundamental.o \
./8point-master/src/normalize.o \
./8point-master/src/project.o \
./8point-master/src/structure.o 

CPP_DEPS += \
./8point-master/src/distance.d \
./8point-master/src/essential.d \
./8point-master/src/fundamental.d \
./8point-master/src/normalize.d \
./8point-master/src/project.d \
./8point-master/src/structure.d 


# Each subdirectory must supply rules for building sources it contributes
8point-master/src/%.o: ../8point-master/src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 g++ compiler'
	arm-none-eabi-g++ -DEIGEN_DONT_VECTORIZE -Wall -O0 -g3 -I"E:\INZ\eigen" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -I../../cppp_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


