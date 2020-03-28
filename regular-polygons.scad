////////////////////////////////////////////////////////////////
// Regular Polygons
// regular-polygons.scad
//
// A library of regular 2D polygons that can be used with 
//  extrude functions for 3D modeling
// 
// All polygons take 3 parameters
//  * xs = start point in x
//  * ys = start point in y
//  * l  = length of each side
// 
// Currently implemented:
//  triangle(xs,ys,l)
//  pentagon(xs,ys,l)
//  chevron(xs,ys,l)
//  hexagon(xs,ys,l)
//  octagon(xs,ys,l)
//
// This file is free software and may be modified and/or 
// redistribuited under the terms of the GNU General Public 
// License by the Free Software Foundation.
//
// I built the software for my own learning and use. I hope 
// you find it useful. This software comes with NO WARRANTY; 
// without even an implied warranty of merchantability or 
// fitness for a particular purpose. See the GNU General 
// Public License for more details.
//
// There should be a copy of the GNU General Public License 
// stored in any repository hosting this software. If you 
// have not received one, please see 
// <http://www.gnu.org/licenses/>
////////////////////////////////////////////////////////////////

// Version: 2020-03-27
// Author: James Evans
// Copyright: GNU GPL

// Examples
//color("orange") triangle(-60,0,13.5);
//color("yellow") pentagon(-60,-30,13.5);
//color("blue")   chevron(-30,0,13.5);
//color("red")    hexagon(0,0,13.5);
//color("green")  octagon(30,0,13.5);
//linear_extrude(3) hexagon(30,-30,8);
//rotate_extrude(angle=270) chevron(10,0,10);

module triangle(xs=0, ys=0, l=10) {
    polygon([ [xs,ys],
              [xs+l,0],
              [xs+l*cos(60),ys+l*sin(60)]
            ]);
}

module pentagon(xs=0, ys=0, l=10) {
    polygon([ [xs,ys],
              [xs+l,ys],
              [xs+l+l*cos(72),ys+l*sin(72)],
              [xs+l+l*cos(72)+l*cos(144),ys+l*sin(72)+l*sin(144)],
              [xs-l*cos(72),ys+l*sin(72)]
            ]);
}

module chevron(xs=0, ys=0, l=10) {
    polygon([ [xs,ys], 
              [xs+l,ys], 
              [xs+l+l*cos(60),ys+l*sin(60)],
              [xs+l,ys+2*l*sin(60)], [xs,ys+2*l*sin(60)], 
              [xs+l*cos(60),ys+l*sin(60)] 
            ]);
}

module hexagon(xs=0, ys=0, l=10) {
    polygon([ [xs,ys], 
              [xs+l,ys], 
              [xs+l+l*cos(60),ys+l*sin(60)],
              [xs+l,ys+2*l*sin(60)], 
              [xs,ys+2*l*sin(60)], 
              [xs-l*cos(60),ys+l*sin(60)],
            ]);
}

module octagon(xs=0, ys=0, l=10) {
    polygon([ [xs,ys],
              [xs+l,ys],
              [xs+l+l*cos(45),ys+l*sin(45)],
              [xs+l+l*cos(45),ys+l+l*sin(45)],
              [xs+l,ys+l+2*l*sin(45)],
              [xs,ys+l+2*l*sin(45)],
              [xs-l*cos(45),ys+l+l*sin(45)],
              [xs-l*cos(45),ys+l*sin(45)]
            ]);
}