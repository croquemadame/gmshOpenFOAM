//+
SetFactory("OpenCASCADE");
//+
Geometry.OldNewReg=0;
//+
rOuter= DefineNumber[ 200.0, Name "Parameters/rOuter" ];
//+
rInner= DefineNumber[ 0.5, Name "Parameters/rInner" ];
//+
rMiddle= DefineNumber[ 8.0, Name "Parameters/rMiddle" ];
//+
cPoints= DefineNumber[ 199, Name "Parameters/cPoints" ];
//+
rPoints= DefineNumber[ 300, Name "Parameters/rPoints" ];
//+
wPoints= DefineNumber[ 400, Name "Parameters/wPoints" ];
//+
rRatio= DefineNumber[ 1.01, Name "Parameters/rRatio" ];
//+
w1Ratio= DefineNumber[ 1.0, Name "Parameters/w1Ratio" ];
//+
w2Ratio= DefineNumber[ 1.007, Name "Parameters/w2Ratio" ];
//+
lc=1.0;
//+
p1=newp; Point(p1) = {0, 0, 0, lc};
//+
p2=newp; Point(p2) = {0, -rOuter, 0, lc};
//+
p3=newp; Point(p3) = {0, rOuter, 0, lc};
//+
c1=newc; Circle(c1) = {p2, p1, p3};
//+
p4=newp; Point(p4) = {0, rInner, 0, lc};
//+
p5=newp; Point(p5) = {rInner, 0, 0, lc};
//+
c2=newc; Circle(c2) = {p4, p1, p5};
//+
p6=newp; Point(p6) = {0, -rInner, 0, lc};
//+
c3=newc; Circle(c3) = {p6, p1, p4};
//+
c4=newc; Circle(c4) = {p5, p1, p6};
//+
p7=newp; Point(p7) = {0, -rMiddle, 0, lc};
//+
p8=newp; Point(p8) = {0, rMiddle, 0, lc};
//+
c5=newc; Circle(c5) = {p7, p1, p8};
//+
p9=newp; Point(p9) = {rMiddle, rMiddle, 0, lc};
//+
p10=newp; Point(p10) = {rMiddle, 0, 0, lc};
//+
p11=newp; Point(p11) = {rMiddle, -rMiddle, 0, lc};
//+
c6=newc; Curve(c6) = {p4, p8};
//+
c7=newc; Curve(c7) = {p8, p9};
//+
c8=newc; Curve(c8) = {p9, p10};
//+
c9=newc; Curve(c9) = {p10, p5};
//+
c10=newc; Curve(c10) = {p10, p11};
//+
c11=newc; Curve(c11) = {p11, p7};
//+
c12=newc; Curve(c12) = {p7, p6};
//+
l1=newll; Curve Loop(l1) = {-c2, c6, c7, c8, c9};
//+
s1=news; Plane Surface(s1) = {l1};
//+
Transfinite Curve {c6} = rPoints Using Progression rRatio;
//+
Transfinite Curve {c9} = rPoints Using Progression 1/w1Ratio;
//+
Transfinite Curve {c7} = (cPoints+1)/2 Using Progression w1Ratio;
//+
Transfinite Curve {c8} = (cPoints+1)/2 Using Progression 1;///rRatio;
//+
Transfinite Curve {c2} = cPoints;
//+
Transfinite Surface {s1} = {p4, p8, p5, p10};
//+
Recombine Surface {s1};
//+
l2=newll; Curve Loop(l2) = {c5, -c6, -c3, -c12};
//+
s2=news; Plane Surface(s2) = {l2};
//+
Transfinite Curve {c3} = 2*cPoints;
//+
Transfinite Curve {c5} = 2*cPoints;
//+
Transfinite Curve {c12} = rPoints Using Progression 1/rRatio;
//+
Transfinite Surface {s2};
//+
Recombine Surface {s2};
//+
l3=newll; Curve Loop(l3) = {-c9, c10, c11, c12, -c4};
//+
s3=news; Plane Surface(s3) = {l3};
//+
Transfinite Curve {c10} = (cPoints+1)/2 Using Progression 1;//rRatio;
//+
Transfinite Curve {c11} = (cPoints+1)/2 Using Progression 1/w1Ratio;
//+
Transfinite Curve {c4} = cPoints;
//+
Transfinite Surface {s3} = {p6, p7, p5, p10};
//+
Recombine Surface {s3};
//+
p12=newp; Point(p12) = {rOuter, rMiddle, 0, lc};
//+
p13=newp; Point(p13) = {rOuter, 0, 0, lc};
//+
p14=newp; Point(p14) = {rOuter, -rMiddle, 0, lc};
//+
c13=newc; Curve(c13) = {p9, p12};
//+
c14=newc; Curve(c14) = {p12, p13};
//+
c15=newc; Curve(c15) = {p13, p10};
//+
l4=newll; Curve Loop(l4) = {-c8, c13, c14, c15};
//+
s4=news; Plane Surface(s4) = {l4};
//+
Transfinite Curve {c13} = wPoints Using Progression w2Ratio;
//+
Transfinite Curve {c14} = (cPoints+1)/2 Using Progression 1/rRatio;
//+
Transfinite Curve {c15} = wPoints Using Progression 1/w2Ratio;
//+
Transfinite Surface {s4};
//+
Recombine Surface {s4};
//+
c16=newc; Curve(c16) = {p13, p14};
//+
c17=newc; Curve(c17) = {p14, p11};
//+
ll5=newll; Curve Loop(ll5) = {-c10, -c15, c16, c17};
//+
s5=news; Plane Surface(s5) = {ll5};
//+
Transfinite Curve {c17} = wPoints  Using Progression 1/w2Ratio;
//+
Transfinite Curve {c16} = (cPoints+1)/2;
//+
Transfinite Surface {s5};
//+
Recombine Surface {s5};
//+
p15=newp; Point(p15)={rOuter, rOuter, 0, lc};
//+
p16=newp; Point(p16)={rOuter, -rOuter, 0, lc};
//+
c18=newl; Curve(c18) = {p3, p15};
//+
c19=newl; Curve(c19) = {p15, p12};
//+
c20=newl; Curve(c20) = {p14, p16};
//+
c21=newl; Curve(c21) = {p16, p2};
//+
ll6=newll; Curve Loop(ll6) = {c1, c18, c19, -c13, -c7, -c5, -c11, -c17, c20, c21};
//+
s6=news; Plane Surface(s6) = {ll6};
//+
Transfinite Curve {c1} = 40;
//+
Transfinite Curve {c18} = 20;
//+
Transfinite Curve {c19} = 40 Using Progression 1/1.1;
//+
Transfinite Curve {c20} = 40 Using Progression 1.1;
//+
Transfinite Curve {c21} = 20;
//+
//s7=news; Plane Surface(s7)= {s1, s2, s3, s4, s5, s6};
//+
out[]=Extrude {0, 0, 1.0} {
  Surface{s1, s2, s3, s4, s5, s6}; Layers {1}; Recombine;
};
Physical Surface("bottom", 1) = {s1, s2, s3, s4, s5, s6}; //out[3];//{s7};
//+
Physical Surface("top", 2) = {33, 24, 27, 20,  16, 12};//out[0];
//+
Physical Surface("outer", 3) = {28, 29, 30, 22, 26, 31, 32};//out[4];
//+
Physical Surface("cylinder", 4) = {14, 7, 17};//out[2];
//+
Physical Volume("internal") = {1, 2, 3, 4, 5, 6};//out[1];//
// This is a test



