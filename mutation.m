function child = mutation(child)
    for i=1:numel(child)
        if rand>0.2
            child(i)=child(i);
        else
            child(i)=rand*1000;
        end
    end

end
