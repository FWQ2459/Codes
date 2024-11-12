function C = inequality6(psai,theta,phi)
%bound等于2*sqrt(6)
I = eye(2);

[MB0,MB1,MB2] = make_operator(theta,phi);
MB = zeros(2,2,6);
MB(:,:,1) = (I+MB0)/2;
MB(:,:,2) = (I-MB0)/2;
MB(:,:,3) = (I+MB1)/2;
MB(:,:,4) = (I-MB1)/2;
MB(:,:,5) = (I+MB2)/2;
MB(:,:,6) = (I-MB2)/2;

C = 0;
for k = 1:3
    for i = 1:3
        if i ~= k
    for b = 1:2
    M = kron(kron(I,I),MB(:,:,2*(i-1)+b));
    rho1 = M*psai;
    p = trace(M*psai);
    GHZ_Alice_C = PartialTrace(rho1,2,[2,2,2]);
    GHZ_Alice = PartialTrace(GHZ_Alice_C,2);
    if trace(GHZ_Alice) ~= 0
        GHZ_Alice = GHZ_Alice/trace(GHZ_Alice);
    end
    [r] = rho2bloch(GHZ_Alice);
    C = C+p*sqrt(sum(r.^2)-r(k)^2);
    end
        end
    end
end
end

