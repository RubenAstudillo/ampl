## SETS 
param N>=1, integer ;
set I:= 1..N ;         

## PARAMETERS 
param K;   
param d{i in I} = Uniform(1,100) ;
param sol{i in I} = Uniform(1,100) ;



## VARIABLES
# real
var x{i in I}, binary ;
var y{i in I}, >= 0 ;
var z{i in I}, >= 0 ;

var u{i in I}, binary ;
var v{i in I}, >= 0 ;
var w{i in I}, >= 0 ;

var t{i in I}, >= 0 ;

var r{i in I}, binary ;
var s{i in I}, >= 0 ;
var p{i in I}, >= 0 ;
## OBJECTIVE 
minimize obj_qp: sum{i in I} d[i]*y[i]^2 ;
minimize obj_pr: sum{i in I} d[i]*z[i] ;
minimize obj_dist: sum{i in I} (w[i]-2*y[i]*v[i]+y[i]^2);
minimize obj_newc: sum{i in I} d[i]*t[i]^2 ;
minimize obj_newc2: sum{i in I} d[i]*p[i] ;

## CONSTRAINTS 
subject to y_convexity:
   sum{i in I} y[i] == 1 ;
subject to v_convexity:
   sum{i in I} v[i] == 1 ;
subject to s_convexity:
   sum{i in I} s[i] == 1 ;

subject to xy_order{i in I}:
   y[i] <= x[i] ;
subject to x_cardinality:
   sum{i in I} x[i] <= K;

subject to rot_soc{i in I}:
   y[i]^2 + ((x[i]-z[i])/2)^2 <= ((x[i]+z[i])/2)^2 ;
subject to rot_soc_dist{i in I}:
   v[i]^2 + ((u[i]-w[i])/2)^2 <= ((u[i]+w[i])/2)^2 ;
  subject to rot_soc_dist2{i in I}:
   s[i]^2 + ((r[i]-p[i])/2)^2 <= ((r[i]+p[i])/2)^2 ; 

subject to x2_cardinality:
   sum{i in I} x[i]^2 <= K;
subject to u2_cardinality:
   sum{i in I} u[i]^2 <= K;
subject to r2_cardinality:
   sum{i in I} r[i]^2 <= K;

subject to s_bola:
   sum{i in I} (s[i]-y[i])^2 >= sum{i in I} (w[i]-2*y[i]*v[i]+y[i]^2);
subject to t_convexity:
   sum{i in I} t[i] == 1 ;
 
 
 
   