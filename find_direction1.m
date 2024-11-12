function [value,Theta,Phi] = find_direction1(rho)
%FIND_DIRECTION 计算不等式A1的最大违背方向和违背值

theta = linspace(0,2*pi,50);
phi = linspace(0,2*pi,50);
Cl1 = zeros(length(theta),length(phi));

for index_theta = 1:length(theta)
    theta_1 = theta(index_theta);
    for index_phi = 1:length(phi)
        phi_1 = phi(index_phi);
        Cl1(index_theta,index_phi) = inequality1(rho,theta_1,phi_1);
    end
end
value = max(max(Cl1));
[r_theta,l_phi] = find(Cl1 == value);
Theta = theta(min(r_theta));
Phi = phi(min(l_phi));
end

