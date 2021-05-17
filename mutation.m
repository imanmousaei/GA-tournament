function child = mutation(child)
    randC=rand(1,numel(child))*1000;
    for i=1:numel(child)
        if rand>0.2
            child(i)=child(i);
        else
            child(i)=randC(i);
        end
    end

end
