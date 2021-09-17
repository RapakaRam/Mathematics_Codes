% Program for solving linear system using Gauss Elemination Method
clc;                                % Clear Screen
clear all;                          % Clear Workspace
format short;
  
A=[ 2 1 2;-2 2 1; 1 2 -2];          % Coefficient Matrix A   
b=[ 0;0;18];                        % Coefficient Matrix b   
Au=[A b]                            % Augmented Matrix Au    
n=size(A,1);                        % Number of rows

%Gauss Elemination Method  
for k= 1:n-1
    m=k;      
    for j=k+1:n
        if abs(Au(m,k))<abs(Au(j,k))
           m=j;   
        end  
    end
    % Checking for Non Unique solution      
    if Au(m,k)==0               
       disp('No unique Solution');
       break;
       % Partial Pivoting of Rows if necessary
    else                             
       u=Au(k,:);
       Au(k,:)=Au(m,:);
       Au(m,:)=u;  
    end
    % Row elemination
    for j=k+1:n                       
        v=Au(j,k)/Au(k,k);
        for p=k:n+1
            Au(j,p)=Au(j,p)-(v*Au(k,p));
        end  
    end
    Au    
end

s=Au(n,n);
t=Au(n,n+1);
if s<=0.000001 && s>=-0.000001 && t>0.000001  && t<-0.000001 
       disp('No unique Solution');
       disp('Augmented Matrix')
       disp(Au)
elseif s<=0.000001  && s>=-0.000001 && t<=0.000001  && t>=-0.000001
       disp('Multiple Solutions exist');
       disp('Augmented Matrix')
       disp(Au)
else
       % Backward Substitution
       x(n)=Au(n,n+1)/Au(n,n);
       for i=n-1:-1:1
          w=0;
          for j=i+1:n
             w=w+(Au(i,j)*x(j));  
          end
          x(i)=(1/Au(i,i))*(Au(i,n+1)-w);
       end
       disp('Augmented Matrix')
       disp(Au)
       disp('Solution')
       disp(x')       
end       