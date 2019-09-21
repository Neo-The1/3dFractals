#version 3.7;
global_settings {  assumed_gamma 1.0 }

#include "golds.inc"
#include "metals.inc"
#include "finish.inc"   
#include "textures.inc"  
#include "glass.inc"

#declare VP = <-2,1.5,1.5>;
#declare VU = <0,1,0>;
#declare VD = vnormalize(<0,0,0> - VP);
#declare VR = vcross(VU,VD);
#declare ConstC = <-0.08,0.0,-0.83,-0.025>;
#declare SLICEDIST = 0.1;

camera {
   location VP
   up y
   right x
   angle 60
   sky VU
   look_at VD
}

global_settings {
   ambient_light
   rgb <1,1,1>
}

background {
   //color rgb <1,1,1>
}

light_source {
   VP + VU + 2*VR
   color rgb <1,1,1>
}
light_source {
   VP - VR
   color rgb <1,1,1>
}

julia_fractal {
   ConstC
   quaternion
   sqr
   max_iteration 10
   precision 200
   slice <0,0,0,1>   clock
   texture { Ruby_Glass }
}