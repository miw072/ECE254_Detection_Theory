function ret=getthres(PFA,N) 
    gamma1=1; 
    gamma2=0; 
    epis = 1e-5;
    while(abs(gamma1-gamma2)>epis) 
        gamma2=gamma1; 
        sigma=0; 
        for r=1:(N/2)-1 
            sigma=sigma+(gamma2.^r)/factorial(r); 
        end 
        gamma1=-log(PFA)+log(1+sigma); 
    end 
    ret=gamma1; 
end
