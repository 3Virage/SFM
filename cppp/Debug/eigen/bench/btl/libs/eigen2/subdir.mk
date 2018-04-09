################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../eigen/bench/btl/libs/eigen2/btl_tiny_eigen2.cpp \
../eigen/bench/btl/libs/eigen2/main_adv.cpp \
../eigen/bench/btl/libs/eigen2/main_linear.cpp \
../eigen/bench/btl/libs/eigen2/main_matmat.cpp \
../eigen/bench/btl/libs/eigen2/main_vecmat.cpp 

OBJS += \
./eigen/bench/btl/libs/eigen2/btl_tiny_eigen2.o \
./eigen/bench/btl/libs/eigen2/main_adv.o \
./eigen/bench/btl/libs/eigen2/main_linear.o \
./eigen/bench/btl/libs/eigen2/main_matmat.o \
./eigen/bench/btl/libs/eigen2/main_vecmat.o 

CPP_DEPS += \
./eigen/bench/btl/libs/eigen2/btl_tiny_eigen2.d \
./eigen/bench/btl/libs/eigen2/main_adv.d \
./eigen/bench/btl/libs/eigen2/main_linear.d \
./eigen/bench/btl/libs/eigen2/main_matmat.d \
./eigen/bench/btl/libs/eigen2/main_vecmat.d 


# Each subdirectory must supply rules for building sources it contributes
eigen/bench/btl/libs/eigen2/%.o: ../eigen/bench/btl/libs/eigen2/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 g++ compiler'
	arm-none-eabi-g++ -DEIGEN_DONT_VECTORIZE -DLOG -Wall -O3 -g3 -I../../cppp_bsp/ps7_cortexa9_0/include -I"E:\INZ\SFM\SFM.sdk\cppp\8point\inc" -I"E:\INZ\SFM\SFM.sdk\cppp\8point" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


