function [S,Q] = concom(G)
%G表示邻接矩阵
%S表示分的块数
%Q表示顶点所在块数
n = size(G,1);
m = sum(sum(G))/2;
S = 0;
j = 1;
C = 1;
Q = zeros(n,1);
for i = 1 : n
    for j = (i + 1) : n
        if G(i,j) == 1
            if Q(i) == Q(j)
                if Q(i) == 0
                    Q(i) = C;
                    Q(j) = C;
                    C = C + 1;
                    S = S + 1;
                end
            else
                if Q(i) == 0
                    Q(i) = Q(j);
                elseif Q(j) == 0
                    Q(j) = Q(i);
                else
                    for k = 1 : n
                        if Q(k) == Q(i)
                            Q(k) = Q(j);
                        end
                    end
                    S = S - 1;
                end
            end
        end
    end
end
S;
Q;
