///////////////////////////////////////////////////////////////////////
// Copyright 2020 James Evans <jwhevans@hotmail.com>
//
// This file contains an OpenSCAD <http://www.openscad.org> module
// that creates a 3D model of a standard LEGO(R) compatible brick.
//
// This file is free software and may be modified and/or 
// redistribuited under the terms of the GNU General Public License 
// by the Free Software Foundation.
//
// I built the software for my own learning and use. I hope you find it
// useful. This software comes with NO WARRANTY; without even an
// implied warranty of merchantability or fitness for a particular
// purpose. See the GNU General Public License for more details.
//
// There should be a copy of the GNU General Public License stored in
// any repository hosting this software. If you have not received one,
// please see <http://www.gnu.org/licenses/>
///////////////////////////////////////////////////////////////////////

// Version: 2020-02-19
// Author: James Evans
// Copyright: GNU GPL

// CONSTANTS
L_WID = 8;   // 1 brick unit is always 8 mm
L_TOL = 0.2; // 0.2 mm tolerance for fit
L_HGT = 3.2; // bricks come in 3.2, 6.4, 9.6 heights
L_THK = 1.6; // brick wall thickness
tol = 0.001; // connection tolerance for printing

// BRICK
// To use this module add the current file to the same folder as your
// .scad file and add the following to the top of your .scad file
//    import <lego.scad>
// It is also possible to use relative or absolute paths inside the 
// brackets <>.  For more information www.openscad.org
// Then create a new brick
//      brick();    with no arguments will generate a standard 
//                  4x2 brick with color grey
//                  pass your own arguments to create other
//                  sizes and colors
module brick(LEN=4, WID=2, HGT=3, COL="grey") {
    LEN = floor(LEN); // must be integer
    WID = floor(WID); // must be integer
    HGT = floor(HGT); // must be integer

    if (LEN < 1) {
        LEN = 1;}     // null brick is no fun
    if (WID < 1) {
        WID = 1;}
    if (HGT < 1) {
        HGT = 1;}

    color(COL) union() {
        // create the basic brick structure
        // remove the interior (wall thickness is 1.6 mm)
        difference() {
            cube([(L_WID*LEN)-L_TOL,(L_WID*WID)-L_TOL,(L_HGT*HGT)]);
            translate([L_THK-L_TOL/2,L_THK-L_TOL/2,0])
            cube([(L_WID*LEN)-L_TOL-3.2,(L_WID*WID)-L_TOL-3.2,(L_HGT*HGT)-1.6]);}
    
        // create the connection points 1 cylinder per unit length
        // and 1 cylinder per unit width
        for (dx=[0:1:LEN-1]) {      // loop LEN
            for (dy=[0:1:WID-1])  { // loop WID
                translate([3.9+(dx*L_WID),3.9+(dy*L_WID),(L_HGT*HGT)-tol])
                cylinder(h=1.8,r=2.4);}}
    
        // create the structural cylinder inside the brick
        // if the brick is 1 unit wide or long no cylinder is needed
        if (LEN > 1 && WID > 1) {
            for (dx=[0:1:LEN-2]) {     // loop LEN
                for (dy=[0:1:WID-2]) { // loop WID
                translate([7.9+(dx*L_WID),7.9+(dy*L_WID),0])
                difference () {
                    cylinder(h=L_HGT*HGT-L_THK+tol,r=3.25);
                    cylinder(h=L_HGT*HGT-L_THK,r=2.4);
}}}}}}