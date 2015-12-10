function y=iteration(PFA,r,N) 
    s=0; 
    for i=1:(N/2)-1 
        s=s+(r.^i)/factorial(i); 
    end 
    y=-log(PFA)+log(1+s); 
end