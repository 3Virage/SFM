/*
 * SFM.hpp
 *
 *  Created on: 07.01.2018
 *      Author: KR
 */

#ifndef POINT_SFM_HPP_
#define POINT_SFM_HPP_


#include <eight/fundamental.h>
#include <eight/normalize.h>
#include <eight/distance.h>
#include <eight/essential.h>
#include <eight/project.h>
#include <eight/select.h>
#include <random>

void SFM_calc(Eigen::Matrix<double, 2, Eigen::Dynamic> points1,
		Eigen::Matrix<double, 2, Eigen::Dynamic> points2, uint16_t cnt,uint16_t x[],uint16_t y[],double z[], int* num);


#endif /* 8POINT_SFM_HPP_ */
