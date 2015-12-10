function y=getgama(PFA,N) 
    x1=1; 
    x2=0; 
    while(abs(x1-x2)>1e-9) 
        x2=x1; 
        x1=iteration(PFA,x1,N); 
    end 
    y=x1;
end

