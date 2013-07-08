% Script
%
% PREPAREVALIDATIONFEATURES
%   Notes:
%   06/22/2013
%     - generates Gabor filter feature vectors that correspond to
%       to full and half- face stimuli for cross-validation
%
%   Functions called:
%       generatepartitions
%       selectpartition
%       attention4stimulus
%
% Full face images for cross-validation:
temp.validation.NC_LS_A =...
    abs(NC_LS_A(n.expressions*(i_c-1)+1:n.expressions*i_c,:));
temp.validation.NC_RS_A =...
    abs(NC_RS_A(n.expressions*(i_c-1)+1:n.expressions*i_c,:));

% Use attention masks to compute means along each feature
% dimension
partition.NC_LS_A = generatepartitions(temp.validation.NC_LS_A, mask);
partition.NC_RS_A = generatepartitions(temp.validation.NC_RS_A, mask);
means.validation =...
    mean([selectpartition(partition.NC_LS_A, [1 2], [1 2]);
          selectpartition(partition.NC_RS_A, [1 2], [2 3]);
          selectpartition(partition.NC_LS_A, [1 1], [1 2]);
          selectpartition(partition.NC_RS_A, [1 1], [2 3]);
          selectpartition(partition.NC_LS_A, [2 2], [1 2]);
          selectpartition(partition.NC_RS_A, [2 2], [2 3])]);

gaborFeatures.validation =...
[attention4stimulus(partition.NC_LS_A,...
                    attention.NC.A.full.LS,...
                    means.validation);
 attention4stimulus(partition.NC_RS_A,...
                    attention.NC.A.full.RS,...
                    means.validation);
 attention4stimulus(partition.NC_LS_A,...
                    attention.NC.A.top.LS,...
                    means.validation);
 attention4stimulus(partition.NC_RS_A,...
                    attention.NC.A.top.RS,...
                    means.validation);
 attention4stimulus(partition.NC_LS_A,...
                    attention.NC.A.bottom.LS,...
                    means.validation);
 attention4stimulus(partition.NC_RS_A,...
                    attention.NC.A.bottom.RS,...
                    means.validation)];
                
% Tidy up
clear temp partition means attention