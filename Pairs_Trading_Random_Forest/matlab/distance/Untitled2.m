n = 12;

maze = -50*ones(n,n);
for i=1:(n-3)*n
    maze(randi([1,n]),randi([1,n]))=1;
end

disp(maze)

n=length(maze);
figure
imagesc(maze)
colormap(winter)
for i=1:n
    for j=1:n
        if maze(i,j)==min(maze)
            text(j,i,'X','HorizontalAlignment','center')
        end
    end
end
text(1,1,'START','HorizontalAlignment','center')
text(n,n,'GOAL','HorizontalAlignment','center')
axis off

Goal=n*n;
fprintf('Goal State is: %d',Goal)

reward=zeros(n*n);
for i=1:Goal
    reward(i,:)=reshape(maze',1,Goal);
end
for i=1:Goal
    for j=1:Goal
        if j~=i-n  && j~=i+n  && j~=i-1 && j~=i+1 && j~=i+n+1 && j~=i+n-1 && j~=i-n+1 && j~=i-n-1
            reward(i,j)=-Inf;
        end    
    end
end
for i=1:n:Goal
    for j=1:i+n
        if j==i+n-1 || j==i-1 || j==i-n-1
            reward(i,j)=-Inf;
            reward(j,i)=-Inf;
        end
    end
end

q = randn(size(reward)); % distance
gamma = 0.9;
alpha = 0.2;
maxItr = 50;

for i=1:maxItr
    
    % Starting from start position    
    cs=1;
    
    % Repeat until Goal state is reached
    while(1)
        
    % possible actions for the chosen state
    n_actions = find(reward(cs,:)>0);
    % choose an action at random and set it as the next state
    ns = n_actions(randi([1 length(n_actions)],1,1));
       
            % find all the possible actions for the selected state
            n_actions = find(reward(ns,:)>=0);
            
            % find the maximum q-value i.e, next state with best action
            max_q = 0;
            for j=1:length(n_actions)
                max_q = max(max_q,q(ns,n_actions(j)));
            end
            
            % Update q-values as per Bellman's equation
            q(cs,ns)=reward(cs,ns)+gamma*max_q;
            
            % Check whether the episode has completed i.e Goal has been reached
            if(cs == Goal)
                break;
            end
            
            % Set current state as next state
            cs=ns;
    end
end