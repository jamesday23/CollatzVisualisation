function varCheck = checkIfDivergent(A)
    varCheck = 0;
    for i=1:1:length(A)
        for j=1:1:(length(A)-i)
            if A(i)==A(i+j)
                varCheck = 1;
                return;
            end
        end
    end
end

