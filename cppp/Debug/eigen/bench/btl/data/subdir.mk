################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CXX_SRCS += \
../eigen/bench/btl/data/mean.cxx \
../eigen/bench/btl/data/regularize.cxx \
../eigen/bench/btl/data/smooth.cxx 

OBJS += \
./eigen/bench/btl/data/mean.o \
./eigen/bench/btl/data/regularize.o \
./eigen/bench/btl/data/smooth.o 

CXX_DEPS += \
./eigen/bench/btl/data/mean.d \
./eigen/bench/btl/data/regularize.d \
./eigen/bench/btl/data/smooth.d 


# Each subdirectory must supply rules for building sources it contributes
eigen/bench/btl/data/%.o: ../eigen/bench/btl/data/%.cxx
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 g++ compiler'
	arm-none-eabi-g++ -DEIGEN_DONT_VECTORIZE -DLOG -Wall -O3 -g3 -I../../cppp_bsp/ps7_cortexa9_0/include -I"E:\INZ\SFM\SFM.sdk\cppp\8point\inc" -I"E:\INZ\SFM\SFM.sdk\cppp\8point" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


