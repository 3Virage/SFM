################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../eigen/bench/analyze-blocking-sizes.cpp \
../eigen/bench/basicbenchmark.cpp \
../eigen/bench/benchBlasGemm.cpp \
../eigen/bench/benchCholesky.cpp \
../eigen/bench/benchEigenSolver.cpp \
../eigen/bench/benchFFT.cpp \
../eigen/bench/benchGeometry.cpp \
../eigen/bench/benchVecAdd.cpp \
../eigen/bench/bench_gemm.cpp \
../eigen/bench/bench_norm.cpp \
../eigen/bench/bench_reverse.cpp \
../eigen/bench/bench_sum.cpp \
../eigen/bench/benchmark-blocking-sizes.cpp \
../eigen/bench/benchmark.cpp \
../eigen/bench/benchmarkSlice.cpp \
../eigen/bench/benchmarkX.cpp \
../eigen/bench/benchmarkXcwise.cpp \
../eigen/bench/check_cache_queries.cpp \
../eigen/bench/dense_solvers.cpp \
../eigen/bench/eig33.cpp \
../eigen/bench/geometry.cpp \
../eigen/bench/product_threshold.cpp \
../eigen/bench/quat_slerp.cpp \
../eigen/bench/quatmul.cpp \
../eigen/bench/sparse_cholesky.cpp \
../eigen/bench/sparse_dense_product.cpp \
../eigen/bench/sparse_lu.cpp \
../eigen/bench/sparse_product.cpp \
../eigen/bench/sparse_randomsetter.cpp \
../eigen/bench/sparse_setter.cpp \
../eigen/bench/sparse_transpose.cpp \
../eigen/bench/sparse_trisolver.cpp \
../eigen/bench/spmv.cpp \
../eigen/bench/vdw_new.cpp 

OBJS += \
./eigen/bench/analyze-blocking-sizes.o \
./eigen/bench/basicbenchmark.o \
./eigen/bench/benchBlasGemm.o \
./eigen/bench/benchCholesky.o \
./eigen/bench/benchEigenSolver.o \
./eigen/bench/benchFFT.o \
./eigen/bench/benchGeometry.o \
./eigen/bench/benchVecAdd.o \
./eigen/bench/bench_gemm.o \
./eigen/bench/bench_norm.o \
./eigen/bench/bench_reverse.o \
./eigen/bench/bench_sum.o \
./eigen/bench/benchmark-blocking-sizes.o \
./eigen/bench/benchmark.o \
./eigen/bench/benchmarkSlice.o \
./eigen/bench/benchmarkX.o \
./eigen/bench/benchmarkXcwise.o \
./eigen/bench/check_cache_queries.o \
./eigen/bench/dense_solvers.o \
./eigen/bench/eig33.o \
./eigen/bench/geometry.o \
./eigen/bench/product_threshold.o \
./eigen/bench/quat_slerp.o \
./eigen/bench/quatmul.o \
./eigen/bench/sparse_cholesky.o \
./eigen/bench/sparse_dense_product.o \
./eigen/bench/sparse_lu.o \
./eigen/bench/sparse_product.o \
./eigen/bench/sparse_randomsetter.o \
./eigen/bench/sparse_setter.o \
./eigen/bench/sparse_transpose.o \
./eigen/bench/sparse_trisolver.o \
./eigen/bench/spmv.o \
./eigen/bench/vdw_new.o 

CPP_DEPS += \
./eigen/bench/analyze-blocking-sizes.d \
./eigen/bench/basicbenchmark.d \
./eigen/bench/benchBlasGemm.d \
./eigen/bench/benchCholesky.d \
./eigen/bench/benchEigenSolver.d \
./eigen/bench/benchFFT.d \
./eigen/bench/benchGeometry.d \
./eigen/bench/benchVecAdd.d \
./eigen/bench/bench_gemm.d \
./eigen/bench/bench_norm.d \
./eigen/bench/bench_reverse.d \
./eigen/bench/bench_sum.d \
./eigen/bench/benchmark-blocking-sizes.d \
./eigen/bench/benchmark.d \
./eigen/bench/benchmarkSlice.d \
./eigen/bench/benchmarkX.d \
./eigen/bench/benchmarkXcwise.d \
./eigen/bench/check_cache_queries.d \
./eigen/bench/dense_solvers.d \
./eigen/bench/eig33.d \
./eigen/bench/geometry.d \
./eigen/bench/product_threshold.d \
./eigen/bench/quat_slerp.d \
./eigen/bench/quatmul.d \
./eigen/bench/sparse_cholesky.d \
./eigen/bench/sparse_dense_product.d \
./eigen/bench/sparse_lu.d \
./eigen/bench/sparse_product.d \
./eigen/bench/sparse_randomsetter.d \
./eigen/bench/sparse_setter.d \
./eigen/bench/sparse_transpose.d \
./eigen/bench/sparse_trisolver.d \
./eigen/bench/spmv.d \
./eigen/bench/vdw_new.d 


# Each subdirectory must supply rules for building sources it contributes
eigen/bench/%.o: ../eigen/bench/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 g++ compiler'
	arm-none-eabi-g++ -DEIGEN_DONT_VECTORIZE -DLOG -Wall -O3 -g3 -I../../cppp_bsp/ps7_cortexa9_0/include -I"E:\INZ\SFM\SFM.sdk\cppp\8point\inc" -I"E:\INZ\SFM\SFM.sdk\cppp\8point" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


