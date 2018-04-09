/*
 * SFM.cpp
 *
 *  Created on: 07.01.2018
 *      Author: KR
 */

#include <eight/fundamental.h>
#include <eight/normalize.h>
#include <eight/distance.h>
#include <eight/essential.h>
#include <eight/project.h>
#include <eight/select.h>
#include <eight/triangulate.h>
#include <random>
#include "SFM.hpp"
#include "xil_printf.h"
//#define MATLAB_LIKE
void SFM_calc(Eigen::Matrix<double, 2, Eigen::Dynamic> points1,
		Eigen::Matrix<double, 2, Eigen::Dynamic> points2, uint16_t cnt,
		uint16_t x[], uint16_t y[], double z[], int* num) {
//	for(int j =0;j<cnt - 1;j++)
//		if((int)p1(0,j)!=(int)p2(0,j) || (int)p1(1,j)!=(int)p2(1,j))
//			xil_printf("PoinT %d %d %d %d\r\n",(int)points1(0,j),(int)points1(1,j),(int)points2(0,j),(int)points2(1,j));

	const double foc = 530.0;
	const int width = 1280;
	const int height = 720;
//	xil_printf("In: %d %d\r\n", points1.cols(), points2.cols());

	Eigen::Matrix3d k;
//	k << foc, 0.0, 0.5 * (width - 1), 0.0, foc, 0.5 * (height - 1), 0.0, 0.0, 1.0;
	k << 1901.6, 0.0, 1051.3, 0.0, 1894.9, 778.6, 0.0, 0.0, 1.0;

	Eigen::AffineCompact3d t0;
	Eigen::AffineCompact3d t1;
	t0.setIdentity();

	std::vector<Eigen::DenseIndex> inliers;

	Eigen::Matrix3d F = eight::fundamentalMatrixRobust(points1, points2,
			inliers, 0.5);
#ifdef LOG
//	printf("F=[%f %f %f;\r\n%f %f %f;\r\n%f %f %f]\r\n", F(0, 0), F(0, 1),
//			F(0, 2), F(1, 0), F(1, 1), F(1, 2), F(2, 0), F(2, 1), F(2, 2));
	printf("RANSAC %4d, ", inliers.size());
#endif

//	F = eight::fundamentalMatrixRobust(points1, points2, inliers, 0.5);
//#ifdef LOG
//	printf("F=[%f %f %f;\r\n%f %f %f;\r\n%f %f %f]\r\n", F(0, 0), F(0, 1),
//			F(0, 2), F(1, 0), F(1, 1), F(1, 2), F(2, 0), F(2, 1), F(2, 2));
//	printf("RANSAC %4d, ", inliers.size());
//#endif
//
//	F = eight::fundamentalMatrixRobust(points1, points2, inliers, 1.5);
//#ifdef LOG
//	printf("F=[%f %f %f;\r\n%f %f %f;\r\n%f %f %f]\r\n", F(0, 0), F(0, 1),
//			F(0, 2), F(1, 0), F(1, 1), F(1, 2), F(2, 0), F(2, 1), F(2, 2));
//	printf("RANSAC %4d, ", inliers.size());
//#endif
//
//	F = eight::fundamentalMatrixRobust(points1, points2, inliers, 3.0);
//#ifdef LOG
//	printf("F=[%f %f %f;\r\n%f %f %f;\r\n%f %f %f]\r\n", F(0, 0), F(0, 1),
//			F(0, 2), F(1, 0), F(1, 1), F(1, 2), F(2, 0), F(2, 1), F(2, 2));
//	printf("RANSAC %4d, ", inliers.size());
//#endif
//
//	F = eight::fundamentalMatrixRobust(points1, points2, inliers, 7.0);
//#ifdef LOG
//	printf("F=[%f %f %f;\r\n%f %f %f;\r\n%f %f %f]\r\n", F(0, 0), F(0, 1),
//			F(0, 2), F(1, 0), F(1, 1), F(1, 2), F(2, 0), F(2, 1), F(2, 2));
//	printf("RANSAC %4d, ", inliers.size());
//#endif
//
//	F = eight::fundamentalMatrixRobust(points1, points2, inliers, 15.0);
//#ifdef LOG
//	printf("F=[%f %f %f;\r\n%f %f %f;\r\n%f %f %f]\r\n", F(0, 0), F(0, 1),
//			F(0, 2), F(1, 0), F(1, 1), F(1, 2), F(2, 0), F(2, 1), F(2, 2));
//	printf("RANSAC %4d, ", inliers.size());
//#endif

	Eigen::Matrix3d E = eight::essentialMatrix(k, F);

	points1 = eight::selectColumnsByIndex(points1, inliers.begin(),
			inliers.end());
	points2 = eight::selectColumnsByIndex(points2, inliers.begin(),
			inliers.end());
//	xil_printf("Select: %d %d\r\n", points1.cols(), points2.cols());

//   Eigen::Matrix<double, 3, 4> t1 = eight::pose(E, k, image0, image1);
	t1 = eight::pose(E, k, points1, points2);
//    std::cout << "Should be: " << std::endl <<  t1.matrix() << std::endl;
//    std::cout << "Pose: " << std::endl << pose << std::endl;
//	xil_printf("Pose OK\r\n");
	// Generate projected image points
	Eigen::Matrix<double, 3, 4> cam0 = eight::cameraMatrix(k, t0);
	Eigen::Matrix<double, 3, 4> cam1 = eight::cameraMatrix(k, t1);
//#ifdef LOG
//	printf("cam0=[%f %f %f %f;\r\n%f %f %f %f;\r\n%f %f %f %f]\r\n", cam0(0, 0),
//			cam0(0, 1), cam0(0, 2), cam0(0, 3), cam0(1, 0), cam0(1, 1),
//			cam0(1, 2), cam0(1, 3), cam0(2, 0), cam0(2, 1), cam0(2, 2),
//			cam0(2, 3));
//	printf("cam1=[%f %f %f %f;\r\n%f %f %f %f;\r\n%f %f %f %f]\r\n", cam1(0, 0),
//			cam1(0, 1), cam1(0, 2), cam1(0, 3), cam1(1, 0), cam1(1, 1),
//			cam1(1, 2), cam1(1, 3), cam1(2, 0), cam1(2, 1), cam1(2, 2),
//			cam1(2, 3));
//
//#endif

	uint16_t samples = points1.cols();

	Eigen::Matrix<double, 3, Eigen::Dynamic> points1B;
	Eigen::Matrix<double, 3, Eigen::Dynamic> points2B;
	points1B.conservativeResize(3, samples);
	points2B.conservativeResize(3, samples);
	for (int j = 0; j < samples; j++) {
		points1B(0, j) = points1(0, j);
		points2B(0, j) = points2(0, j);
		points1B(1, j) = points1(1, j);
		points2B(1, j) = points2(1, j);
		points1B(2, j) = 1;
		points2B(2, j) = 1;
//		printf("P1 %d %d %d P2 %d %d %d\r\n", (int) points1B(0, j),
//				(int) points1B(1, j), (int) points1B(2, j), (int) points2B(0, j),
//				(int) points2B(1, j), (int) points2B(2, j));
	}
	Eigen::Matrix<double, 2, Eigen::Dynamic> image0 = eight::perspectiveProject(
			points1B, cam0).colwise().hnormalized();
	Eigen::Matrix<double, 2, Eigen::Dynamic> image1 = eight::perspectiveProject(
			points2B, cam1).colwise().hnormalized();
	//xil_printf("Project: %d %d\r\n", image0.cols(), image1.cols());
	Eigen::Matrix<double, 3, Eigen::Dynamic> pointsTriangulated =
			eight::triangulateMany(cam0, cam1, image0, image1);

#ifdef MATLAB_LIKE
	printf("[");
#endif
	for (int i = 0; i < pointsTriangulated.cols(); i++) {
		x[i] = (uint16_t) points1B(0, i);
		y[i] = (uint16_t) points1B(1, i);
		z[i] = (double) pointsTriangulated(2, i);

#ifdef MATLAB_LIKE
		printf("%f, %f, %f;\r\n", (double) pointsTriangulated(0, i),
				(double) pointsTriangulated(1, i),
				(double) pointsTriangulated(2, i));
#endif
	}
#ifdef MATLAB_LIKE
	printf("]");
#endif
	*num = pointsTriangulated.cols();

}

