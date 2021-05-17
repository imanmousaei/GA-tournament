function child = crossover(pr1, pr2)
    for i=1:numel(pr1)
        if rand>0.5
            child(i)=pr1(i);
        else
            child(i)=pr2(i);
        end
    end

end