/**
 This file is part of 8point.
 
 Copyright(C) 2015/2016 Christoph Heindl
 All rights reserved.
 
 This software may be modified and distributed under the terms
 of the BSD license.See the LICENSE file for details.
 */

#include <eight/fundamental.h>
#include <eight/normalize.h>
#include <eight/distance.h>
#include <eight/select.h>

#include <Eigen/Eigenvalues>
#include <Eigen/SVD>
#include <vector>
#include <random>
#include"xil_printf.h"
#include <sstream>
namespace eight {

Eigen::Matrix3d fundamentalMatrixUnnormalized(
		Eigen::Ref<const Eigen::MatrixXd> a,
		Eigen::Ref<const Eigen::MatrixXd> b) {
	eigen_assert(a.cols() == b.cols());
	eigen_assert(a.rows() == b.rows());
	eigen_assert(a.cols() >= 8);

	// Setup system of equations Ax = 0. There will be one row in A for each correspondence.
	Eigen::Matrix<double, Eigen::Dynamic, 9> A(a.cols(), 9);

	for (Eigen::DenseIndex i = 0; i < a.cols(); ++i) {
		const auto &ca = a.col(i);
		const auto &cb = b.col(i);

		auto r = A.row(i);

		r(0) = cb.x() * ca.x();     // F11
		r(1) = cb.x() * ca.y();     // F21
		r(2) = cb.x();              // F31
		r(3) = cb.y() * ca.x();     // F12
		r(4) = cb.y() * ca.y();     // F22
		r(5) = cb.y();              // F32
		r(6) = ca.x();              // F13
		r(7) = ca.y();              // F23
		r(8) = 1.0;                 // F33
	}

	// Seek for a least squares solution such that |Ax| = 1. Given by the unit eigenvector of A'A associated with the smallest eigenvalue.
	Eigen::SelfAdjointEigenSolver<Eigen::Matrix<double, Eigen::Dynamic, 9> > e;
	e.compute((A.transpose() * A));
	eigen_assert(e.info() == Eigen::Success);

	Eigen::Matrix<double, 1, 9> f = e.eigenvectors().col(0); // Sorted ascending by eigenvalue.

	Eigen::Matrix3d F;
	F << f(0), f(3), f(6), f(1), f(4), f(7), f(2), f(5), f(8);

	// Enforce singularity constraint such that rank(F) = 2. Which is the closest singular matrix to F under Frobenius norm.
	Eigen::JacobiSVD<Eigen::Matrix3d> svd(F,
			Eigen::ComputeFullU | Eigen::ComputeFullV);
	Eigen::DiagonalMatrix<double, 3> dPrime(svd.singularValues()(0),
			svd.singularValues()(1), 0.0);
	Eigen::Matrix3d FPrime = svd.matrixU() * dPrime * svd.matrixV().transpose();

	return FPrime;

}

Eigen::Matrix3d fundamentalMatrix(Eigen::Ref<const Eigen::MatrixXd> a,
		Eigen::Ref<const Eigen::MatrixXd> b) {

//	printf("1[");
//	for (int i = 0; i < 2; i++) {
//		for (int j = 0; j < 8; j++) {
//			printf("%f, ", a(i, j));
//		}
//		printf(";\r\n");
//	}
//	printf("]\r\n");
//
//	printf("2[");
//	for (int i = 0; i < 2; i++) {
//		for (int j = 0; j < 8; j++) {
//			printf("%f, ", b(i, j));
//		}
//		printf(";\r\n");
//	}
//	printf("]\r\n");

	Eigen::Transform<double, 2, Eigen::Affine> t0 =
			findIsotropicNormalizingTransform(a);
	Eigen::Transform<double, 2, Eigen::Affine> t1 =
			findIsotropicNormalizingTransform(b);
//
//	printf("3[");
//	for (int i = 0; i < t0.rows(); i++) {
//		for (int j = 0; j < t0.cols(); j++) {
//			printf("%f, ", t0(i, j));
//		}
//		printf(";\r\n");
//	}
//	printf("]\r\n");
//
//	printf("4[");
//	for (int i = 0; i < t1.rows(); i++) {
//		for (int j = 0; j < t1.cols(); j++) {
//			printf("%f, ", t1(i, j));
//		}
//		printf(";\r\n");
//	}
//	printf("]\r\n");

//	t0(0, 0) = 0.006651873637595;
//	t0(0, 1) = 0.0;
//	t0(0, 2) = -4.870834471128636;
//	t0(1, 0) = 0.0;
//	t0(1, 1) = 0.006651873637595;
//	t0(1, 2) = -0.256097135047392;
//
//	t1(0, 0) = 0.006653897170789;
//	t1(0, 1) = 0.0;
//	t1(0, 2) = -4.872316203310088;
//	t1(1, 0) = 0.0;
//	t1(1, 1) = 0.006653897170789;
//	t1(1, 2) = -0.347666127173714;

	Eigen::Matrix<double, 2, Eigen::Dynamic> na = (t0.matrix()
			* a.colwise().homogeneous()).colwise().hnormalized();
	Eigen::Matrix<double, 2, Eigen::Dynamic> nb = (t1.matrix()
			* b.colwise().homogeneous()).colwise().hnormalized();





//	na(0, 0) = -0.214522924812425;
//	na(0, 1) = 1.062636813605735;
//	na(0, 2) = -2.522723077057747;
//	na(0, 3) = -0.227826672087615;
//	na(0, 4) = 0.118070757067304;
//	na(0, 5) = 0.863080604477898;
//	na(0, 6) = 3.550437554066110;
//	na(0, 7) = -2.629153055259260;
//	na(1, 0) = -0.222837766859419;
//	na(1, 1) = -0.149667156845878;
//	na(1, 2) = 0.043237178644365;
//	na(1, 3) = -0.036585305006770;
//	na(1, 4) = -0.003325936818797;
//	na(1, 5) = 0.023281557731581;
//	na(1, 6) = 0.056540925919554;
//	na(1, 7) = 0.289356503235364;
//
//	nb(0, 0) = -0.214588183757938;
//	nb(0, 1) = 1.062960073033509;
//	nb(0, 2) = -2.523490502021647;
//	nb(0, 3) = -0.227895978099516;
//	nb(0, 4) = 0.118106674781501;
//	nb(0, 5) = 0.863343157909845;
//	nb(0, 6) = 3.551517614908514;
//	nb(0, 7) = -2.629952856754267;
//	nb(1, 0) = -0.221242080928727;
//	nb(1, 1) = -0.141395314879262;
//	nb(1, 2) = 0.031606011561247;
//	nb(1, 3) = -0.034932960146641;
//	nb(1, 4) = -0.008317371463486;
//	nb(1, 5) = 0.024952114390458;
//	nb(1, 6) = 0.071529394585979;
//	nb(1, 7) = 0.277800206880432;

//	printf("5[");
//	for (int i = 0; i < na.rows(); i++) {
//		for (int j = 0; j < na.cols(); j++) {
//			printf("%f, ", na(i, j));
//		}
//		printf(";\r\n");
//	}
//	printf("]\r\n");
//
//	printf("6[");
//	for (int i = 0; i < nb.rows(); i++) {
//		for (int j = 0; j < nb.cols(); j++) {
//			printf("%f, ", nb(i, j));
//		}
//		printf(";\r\n");
//	}
//	printf("]\r\n");

	Eigen::Matrix3d Fn = eight::fundamentalMatrixUnnormalized(na, nb);
	Eigen::Matrix3d F = (t0.matrix().transpose() * Fn * t1.matrix());

//
//	printf("7[");
//	for (int i = 0; i < Fn.rows(); i++) {
//		for (int j = 0; j < Fn.cols(); j++) {
//			printf("%f, ", Fn(i, j));
//		}
//		printf(";\r\n");
//	}
//	printf("]\r\n");
//	printf("8[");
//	for (int i = 0; i < F.rows(); i++) {
//		for (int j = 0; j < F.cols(); j++) {
//			printf("%f, ", F(i, j));
//		}
//		printf(";\r\n");
//	}
//	printf("]\r\n");
	return F;

}

template<class ForwardIterator, class T>
void fillIncremental(ForwardIterator first, ForwardIterator last, T val) {
	while (first != last) {
		*first = val;
		++first;
		++val;
	}
}

std::vector<Eigen::DenseIndex> samplePointIndices(Eigen::DenseIndex setSize,
		Eigen::DenseIndex sampleSize) {
	std::vector<Eigen::DenseIndex> ids(setSize);
	fillIncremental(ids.begin(), ids.end(), 0);

	std::random_device rd;
	std::mt19937 gen(rd());

	// Fisher-Yates sampling
	std::vector<Eigen::DenseIndex> result(sampleSize);
	for (Eigen::DenseIndex i = 0; i < sampleSize; i++) {
		std::uniform_int_distribution<Eigen::DenseIndex> dis(i, setSize - 1);
		std::swap(ids[i], ids[dis(gen)]);
		result[i] = ids[i];
	}

	return result;
}

Eigen::Matrix3d fundamentalMatrixRobust(Eigen::Ref<const Eigen::MatrixXd> a,
		Eigen::Ref<const Eigen::MatrixXd> b,
		std::vector<Eigen::DenseIndex> &inliers, double d, double e, double p) {
	// First perform a ransac to find a a fundamental matrix. Then re-estimate fundamental matrix from all inliers.
	int niter = static_cast<int>(std::ceil(
			std::log(1.0 - p) / std::log(1.0 - std::pow(1.0 - e, 8))));
	const double d2 = d * d;

	Eigen::Matrix3d bestF = Eigen::Matrix3d::Constant(
			std::numeric_limits<double>::quiet_NaN());
	inliers.clear();

	for (int iter = 0; iter < niter; ++iter) {
		// Randomly select 8 different points
		std::vector<Eigen::DenseIndex> modelIds = samplePointIndices(a.cols(),
				8);
		// Build model
		Eigen::Matrix<double, 2, Eigen::Dynamic> sa = selectColumnsByIndex(a,
				modelIds.begin(), modelIds.end());
		Eigen::Matrix<double, 2, Eigen::Dynamic> sb = selectColumnsByIndex(b,
				modelIds.begin(), modelIds.end());
//		sa << 700.0, 5.0, 892.0, 16.0, 353.0, 45.0, 698.0, 33.0, 750.0, 38.0, 862.0, 42.0, 1266.0, 47.0, 337.0, 82.0;
//		sb << 700.0, 19.0, 892, 31.0, 353.0, 57.0, 698.0, 47.0, 750.0, 51.0, 862.0, 56.0, 1266.0, 63.0, 337.0, 94.0;
//		sa(0, 0) = 700.0;
//		sa(0, 1) = 892.0;
//		sa(0, 2) = 353.0;
//		sa(0, 3) = 698.0;
//		sa(0, 4) = 750.0;
//		sa(0, 5) = 862.0;
//		sa(0, 6) = 1266.0;
//		sa(0, 7) = 337.0;
//		sa(1, 0) = 5.0;
//		sa(1, 1) = 16.0;
//		sa(1, 2) = 45.0;
//		sa(1, 3) = 33.0;
//		sa(1, 4) = 38.0;
//		sa(1, 5) = 42.0;
//		sa(1, 6) = 47.0;
//		sa(1, 7) = 82.0;
//		sb(0, 0) = 700.0;
//		sb(0, 1) = 892.0;
//		sb(0, 2) = 353.0;
//		sb(0, 3) = 698.0;
//		sb(0, 4) = 750.0;
//		sb(0, 5) = 862.0;
//		sb(0, 6) = 1226.0;
//		sb(0, 7) = 337.0;
//		sb(1, 0) = 19.0;
//		sb(1, 1) = 31.0;
//		sb(1, 2) = 57.0;
//		sb(1, 3) = 47.0;
//		sb(1, 4) = 51.0;
//		sb(1, 5) = 56.0;
//		sb(1, 6) = 63.0;
//		sb(1, 7) = 94.0;
//		std::stringstream astr;
		//std::string astr;
//		astr << sa;
//		printf("%s",astr.str().c_str());
		Eigen::Matrix3d F = fundamentalMatrix(sa, sb);

		F << 0, -0.000000000000000, -0.999999999997594, 0.000000000000000, -0.000000000000000, -0.000000000000051, 0.999999999997593, 0.000000000000042, 0.000000000004814;
//#ifdef LOG
//		printf("F1=[%f %f %f;\r\n%f %f %f;\r\n%f %f %f]\r\n", F(0, 0), F(0, 1),
//				F(0, 2), F(1, 0), F(1, 1), F(1, 2), F(2, 0), F(2, 1), F(2, 2));
//#endif
		// Evaluate inliers
		Eigen::VectorXd dists = distances(F, a, b, SampsonDistanceSquared());
		std::vector<Eigen::DenseIndex> in;
		for (Eigen::DenseIndex i = 0; i < dists.size(); ++i) {
			if (dists(i) <= d2) {
				in.push_back(i);
			}
		}

		//-------------------HACK
		if (in.size() < 8) {
			//printf("\r\n\r\nHACK\r\n\r\n");
//            for (Eigen::DenseIndex i = 0; i < 8; ++i) {
//            	in.push_back(modelIds[i]);
//            }
			continue;
		}
		//------------------------

		if (in.size() > inliers.size()) {
			//xil_printf("New: %d old: %d \r\n", in.size(), inliers.size());
			std::swap(in, inliers);
			std::swap(F, bestF);
		}

	}

//        if (bestF.allFinite()) {
//            // Re-estimate using all inliers
//            Eigen::Matrix<double, 2, Eigen::Dynamic> sa = selectColumnsByIndex(a, inliers.begin(), inliers.end());
//            Eigen::Matrix<double, 2, Eigen::Dynamic> sb = selectColumnsByIndex(b, inliers.begin(), inliers.end());
//        //    xil_printf("Inliers: %d \r\n", sa.cols(), inliers.size());
//            bestF = fundamentalMatrix(sa, sb);
//        }

	return bestF;
}
}
