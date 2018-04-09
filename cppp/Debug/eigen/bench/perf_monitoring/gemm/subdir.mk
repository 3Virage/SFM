################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../eigen/bench/perf_monitoring/gemm/gemm.cpp \
../eigen/bench/perf_monitoring/gemm/lazy_gemm.cpp 

OBJS += \
./eigen/bench/perf_monitoring/gemm/gemm.o \
./eigen/bench/perf_monitoring/gemm/lazy_gemm.o 

CPP_DEPS += \
./eigen/bench/perf_monitoring/gemm/gemm.d \
./eigen/bench/perf_monitoring/gemm/lazy_gemm.d 


# Each subdirectory must supply rules for building sources it contributes
eigen/bench/perf_monitoring/gemm/%.o: ../eigen/bench/perf_monitoring/gemm/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 g++ compiler'
	arm-none-eabi-g++ -DEIGEN_DONT_VECTORIZE -DLOG -Wall -O3 -g3 -I../../cppp_bsp/ps7_cortexa9_0/include -I"E:\INZ\SFM\SFM.sdk\cppp\8point\inc" -I"E:\INZ\SFM\SFM.sdk\cppp\8point" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


