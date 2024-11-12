function [n] = rho2bloch(rho)
%此函数实现输入单比特密度矩阵，输出单比特bloch矢量
%泡利矩阵
X = [0,1;1,0];
Y = [0,-1i;1i,0];
Z = [1,0;0,-1];
x = trace(rho*X);
y = trace(rho*Y);
z = trace(rho*Z);
n = [x,y,z];

end

