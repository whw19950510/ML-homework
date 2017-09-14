function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.

temp1=X*theta;
temp1=temp1-y;
temp1=temp1.^2;
J=J+1/(2*m)*sum(temp1);

temp2=theta.^2;%全部正交化,multivariables
temp2(1)=0;%避免正交化第一项theta
temp2=sum(temp2);
J=J+lambda/(2*m)*temp2;

n=size(theta,1);
temp1=X*theta;
temp1=temp1-y;
for i=1:m
    grad(1,1)=grad(1,1)+temp1(i,1)*X(i,1);
    for j=2:n
        grad(j,1)=grad(j,1)+temp1(i,1)*X(i,j);
    end
end
grad=1/m*grad;
for j=2:n
    grad(j,1)=grad(j,1)+lambda/m*theta(j,1);
end









% =========================================================================

grad = grad(:);

end
