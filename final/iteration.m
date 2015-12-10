function y=iteration(PFA,gamma,N) 
    sigma=0; 
    for r=1:(N/2)-1 
        sigma=sigma+(gamma.^r)/factorial(r); 
    end 
    y=-log(PFA)+log(1+sigma); 
end
