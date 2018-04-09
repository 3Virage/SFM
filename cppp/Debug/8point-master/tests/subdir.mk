################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../8point-master/tests/test_pose.cpp \
../8point-master/tests/test_pose_outliers.cpp \
../8point-master/tests/test_structure.cpp \
../8point-master/tests/test_triangulation.cpp 

OBJS += \
./8point-master/tests/test_pose.o \
./8point-master/tests/test_pose_outliers.o \
./8point-master/tests/test_structure.o \
./8point-master/tests/test_triangulation.o 

CPP_DEPS += \
./8point-master/tests/test_pose.d \
./8point-master/tests/test_pose_outliers.d \
./8point-master/tests/test_structure.d \
./8point-master/tests/test_triangulation.d 


# Each subdirectory must supply rules for building sources it contributes
8point-master/tests/%.o: ../8point-master/tests/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 g++ compiler'
	arm-none-eabi-g++ -DEIGEN_DONT_VECTORIZE -Wall -O0 -g3 -I"E:\INZ\eigen" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -I../../cppp_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


