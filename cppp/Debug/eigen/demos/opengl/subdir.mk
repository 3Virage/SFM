################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../eigen/demos/opengl/camera.cpp \
../eigen/demos/opengl/gpuhelper.cpp \
../eigen/demos/opengl/icosphere.cpp \
../eigen/demos/opengl/quaternion_demo.cpp \
../eigen/demos/opengl/trackball.cpp 

OBJS += \
./eigen/demos/opengl/camera.o \
./eigen/demos/opengl/gpuhelper.o \
./eigen/demos/opengl/icosphere.o \
./eigen/demos/opengl/quaternion_demo.o \
./eigen/demos/opengl/trackball.o 

CPP_DEPS += \
./eigen/demos/opengl/camera.d \
./eigen/demos/opengl/gpuhelper.d \
./eigen/demos/opengl/icosphere.d \
./eigen/demos/opengl/quaternion_demo.d \
./eigen/demos/opengl/trackball.d 


# Each subdirectory must supply rules for building sources it contributes
eigen/demos/opengl/%.o: ../eigen/demos/opengl/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 g++ compiler'
	arm-none-eabi-g++ -DEIGEN_DONT_VECTORIZE -DLOG -Wall -O3 -g3 -I../../cppp_bsp/ps7_cortexa9_0/include -I"E:\INZ\SFM\SFM.sdk\cppp\8point\inc" -I"E:\INZ\SFM\SFM.sdk\cppp\8point" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


