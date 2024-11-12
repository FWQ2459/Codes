function C = inequality3(psai,theta,phi)
%bound等于sqrt(6)
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
    for b = 1:2
    M = kron(kron(I,MB(:,:,2*(k-1)+b)),I);
    rho1 = M*psai;
    p = trace(M*psai);
    GHZ_Alice_Bob = PartialTrace(rho1,3,[2,2,2]);
    GHZ_Alice = PartialTrace(GHZ_Alice_Bob,2);
    if trace(GHZ_Alice) ~= 0
        GHZ_Alice = GHZ_Alice/trace(GHZ_Alice);
    end
    [r] = rho2bloch(GHZ_Alice);
    C = C+p*sqrt(sum(r.^2)-r(k)^2);
    end
end
end

