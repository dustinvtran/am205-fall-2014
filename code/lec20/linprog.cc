// Single Voronoi cell example code
//
// Author   : Chris H. Rycroft (LBL / UC Berkeley)
// Email    : chr@alum.mit.edu
// Date     : August 30th 2011

#include "voro++.hh"
using namespace voro;

// This function returns a random floating point number between 0 and 1
double rnd() {return double(rand())/RAND_MAX;}

int main() {
	double x,y,z,rsq,r;
	voronoicell v;

	// Initialize a large box
	v.init(0,50,0,50,0,50);

	// Apply the three constraints
	v.plane(1,-1,1,2*20);
	v.plane(3,2,4,2*42);
	v.plane(3,2,0,2*30);

	// Output the polyhedron to a file, in the gnuplot format
	v.draw_gnuplot(0,0,0,"linprog.gnu");
}
