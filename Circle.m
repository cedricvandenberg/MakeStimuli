
%written by John A. Endler

function [cx,cy]=Circle(ox,oy,rd)
% [cx,cy]=Circle(ox,oy,rd);
% draw a circle of radius rd centered on (ox,oy)
r=1;
x=-1:0.01:1; x2=fliplr(x);
y1=(r^2-x.^2).^(1/2);
y2=-(r^2-x.^2).^(1/2);
cy=rd*[y1 y2]; cx=rd*[x x2];
cy=cy+oy; cx=cx+ox;