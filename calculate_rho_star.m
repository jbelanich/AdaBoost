function rho_star = calculate_rho_star(w,j,M)
c3 = calculate_c3(w,j,M);
c2 = calculate_c2(w,j,M);

c2_nonzero = find(c2 >= .0000000000000001);

rho_star = min(c2(c2_nonzero)./c3(c2_nonzero));

end