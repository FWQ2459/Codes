function [M0,M1,M2] = make_operator(theta,phi)
%生成测量算符
    Z1 = [cos(theta/2);exp(-1i*phi)*sin(theta/2)];
    Z2 = [sin(theta/2);-exp(-1i*phi)*cos(theta/2)];
    X1 = (Z1+Z2)/sqrt(2);
    X2 = (Z1-Z2)/sqrt(2);
    Y1 = (Z1+1i*Z2)/sqrt(2);
    Y2 = (Z1-1i*Z2)/sqrt(2);

    M0 = X1*X1'-X2*X2';
    M1 = Y1*Y1'-Y2*Y2';
    M2 = Z1*Z1'-Z2*Z2';    
end

