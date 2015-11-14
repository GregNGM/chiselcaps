wallThickness = 1.5;
nominalChiselWidth = 25;
nominalChiselThickness = 4;




chiselWidth = nominalChiselWidth * 1.1;
chiselThickness = nominalChiselThickness + 1.5;

outerWidth = chiselWidth + 2*wallThickness;
outerThickness = chiselThickness + 2*wallThickness;
height = (chiselWidth + chiselThickness) * 1.25;

cutWidth = 1;
cutHeight = height * 0.75;
tabWidth = outerWidth * 0.5;

gripHeight = 1;
circleQuality = 50;

union(){
    difference(){
        cube([outerWidth,outerThickness,height]);
        translate([wallThickness,wallThickness,0]){
            cube([chiselWidth,chiselThickness,height - wallThickness]);
        }
        
        translate([((outerWidth - tabWidth) / 2) - cutWidth,0,0]){
            cube([cutWidth,outerThickness,cutHeight]);
        }
        
        translate([outerWidth - ((outerWidth - tabWidth) / 2),0,0]){
            cube([cutWidth,outerThickness,cutHeight]);
        }
        
        translate([outerWidth / 2,0.25,height - 5]){
            rotate([90,90,0]){
                linear_extrude(0.5){
                    text(text = str(nominalChiselWidth), font = "FreeMono:style=bold", size = tabWidth * 0.75, valign = "center",$fn=circleQuality);
                }
            }
        }
    }

    translate([((outerWidth - tabWidth) / 2),wallThickness,gripHeight]){ 
        rotate([90,180,90]){
            difference(){
                cylinder(tabWidth,gripHeight,gripHeight,$fn=circleQuality);
                translate([0,-gripHeight,0]){
                    cube([gripHeight,gripHeight*2,tabWidth]);
                }
            }
        }
    }
    
    translate([((outerWidth - tabWidth) / 2),outerThickness - wallThickness,gripHeight]){    
        rotate([90,0,90]){
            difference(){
                cylinder(tabWidth,gripHeight,gripHeight,$fn=circleQuality);
                translate([0,-gripHeight,0]){
                    cube([gripHeight,gripHeight*2,tabWidth]);
                }
            }
        }
    }

}