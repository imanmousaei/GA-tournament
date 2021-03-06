%% problem : 
%   Irancell wants to install a ... but if the distance to people is less
%   than 100m it hurts them. now Irancell wants to maximize the signal
%   power and minimize people's damage


%% clear everything
clc
clear
close all

%% constants
maxGen=1000;
peoplesize = 30;
popsize=50;
ER=0.5;
NN= round(ER * popsize);
P = 0.3;
K = 5;


xss = rand(1,peoplesize)*1000;
yss = rand(1,peoplesize)*1000;


for i=1:peoplesize
    people(i,1:2)=[xss(i),yss(i)];
end

%% initial population [0,1000]
xs = rand(1,popsize)*1000;
ys = rand(1,popsize)*1000;

for i=1:popsize
    chromosome(i,1:2)=[xs(i),ys(i)];
end

%% Optimization:
for generation=1:maxGen
    for i=1:popsize
        fitness(i)=objfcn(people,chromosome(i));
    end
    [val,idx] = sort(fitness);
    
    % probability 
    %powers = [1:popsize];
    %prob = ones(1,popsize).*(1-P).^powers.*P; % prob(i) = p*(1-p)^i
    
    % sum(prob) should equal 1 so:
    %pb = 1 - sum(prob);
    %prob(1) = prob(1) + pb;

    
    % plot
    disp(['best fitness=', num2str(val(end))]);
    plot(generation,val(end),'k.');
    hold on
    pause(0.0000001)
    
    
    % selection:
    trnmnt = randi(popsize,NN,K);
    for i=1:NN
        newpop(i) = chromosome(trnmnt(i,1));
        for j=2:K
            if objfcn(people, chromosome(trnmnt(i,j))) > objfcn(people, newpop(i))
                newpop(i) = chromosome(trnmnt(i,j));
            end
        end
    end
    for i=NN+1:popsize
        pid1=randsrc(1,1,[1:NN]);
        pid2=randsrc(1,1,[1:NN]);
        parent1=newpop(pid1);
        parent2=newpop(pid2);
    % crossover/ breed
        child=crossover(parent1,parent2);
    % mutation:
        if rand>0.5
          child=mutation(child);
        end
    % replacement:
        newpop(i)=child;
    end
    chromosome=newpop;
end

