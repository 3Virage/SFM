################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../eigen/bench/tensors/benchmark_main.cc \
../eigen/bench/tensors/contraction_benchmarks_cpu.cc \
../eigen/bench/tensors/tensor_benchmarks_cpu.cc \
../eigen/bench/tensors/tensor_benchmarks_sycl.cc 

CC_DEPS += \
./eigen/bench/tensors/benchmark_main.d \
./eigen/bench/tensors/contraction_benchmarks_cpu.d \
./eigen/bench/tensors/tensor_benchmarks_cpu.d \
./eigen/bench/tensors/tensor_benchmarks_sycl.d 

OBJS += \
./eigen/bench/tensors/benchmark_main.o \
./eigen/bench/tensors/contraction_benchmarks_cpu.o \
./eigen/bench/tensors/tensor_benchmarks_cpu.o \
./eigen/bench/tensors/tensor_benchmarks_sycl.o 


# Each subdirectory must supply rules for building sources it contributes
eigen/bench/tensors/%.o: ../eigen/bench/tensors/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 g++ compiler'
	arm-none-eabi-g++ -DEIGEN_DONT_VECTORIZE -DLOG -Wall -O3 -g3 -I../../cppp_bsp/ps7_cortexa9_0/include -I"E:\INZ\SFM\SFM.sdk\cppp\8point\inc" -I"E:\INZ\SFM\SFM.sdk\cppp\8point" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


