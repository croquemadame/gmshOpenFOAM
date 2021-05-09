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
cPoints= DefineNumber[ 99, Name "Parameters/cPoints" ];
//+
rPoints= DefineNumber[ 100, Name "Parameters/rPoints" ];
//+
wPoints= DefineNumber[ 400, Name "Parameters/wPoints" ];
//+
rRatio= DefineNumber[ 1.01, Name "Parameters/rRatio" ];
//+
wRatio= DefineNumber[ 1.007, Name "Parameters/wRatio" ];
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
Transfinite Curve {c9} = rPoints Using Progression 1/rRatio;
//+
Transfinite Curve {c7} = (cPoints+1)/2;
//+
Transfinite Curve {c8} = (cPoints+1)/2 Using Progression 1/rRatio;
//+
Transfinite Curve {c2} = cPoints;
//+
Transfinite Surface {s1} = {p4, p8, p5, p10};
//+
Recombine Surface {s1};

