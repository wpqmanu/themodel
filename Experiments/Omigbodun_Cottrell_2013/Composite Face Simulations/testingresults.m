% Script
%
% TESTINGRESULTS
%   Notes:
%   06/26/2013
%     - displays and saves the results of testing the model

% Accuracy results
%
% Ordering of stimuli for testing (Please see 
% PREPARETESTINGEXPERIMENTFEATURES):
%   attention on full noncomposite left-shifted (1 to 7)
%   attention on full noncomposite right-shifted (1 to 7)
%   attention on top noncomposite left-shifted (1 to 7)
%   attention on top noncomposite right-shifted (1 to 7)
%   attention on bottom noncomposite left-shifted (1 to 7)
%   attention on bottom noncomposite right-shifted (1 to 7)
%
% Display results
%
% left-shifted faces:
disp([perceptronTarget.testing(order.testing.NC.LS*n.expressions + 1:...
                              (order.testing.NC.LS + 1)*n.expressions,:)...
      perceptronOutput.testing(order.testing.NC.LS*n.expressions + 1:...
                              (order.testing.NC.LS + 1)*n.expressions,:)...
      perceptronTarget.testing(order.testing.TH.LS*n.expressions + 1:...
                              (order.testing.TH.LS + 1)*n.expressions,:)...
      perceptronOutput.testing(order.testing.TH.LS*n.expressions + 1:...
                              (order.testing.TH.LS + 1)*n.expressions,:)...
      perceptronTarget.testing(order.testing.BH.LS*n.expressions + 1:...
                              (order.testing.BH.LS + 1)*n.expressions,:)...
      perceptronOutput.testing(order.testing.BH.LS*n.expressions + 1:...
                              (order.testing.BH.LS + 1)*n.expressions,:)]);

% right-shifted faces:
disp([perceptronTarget.testing(order.testing.NC.RS*n.expressions + 1:...
                              (order.testing.NC.RS + 1)*n.expressions,:)...
      perceptronOutput.testing(order.testing.NC.RS*n.expressions + 1:...
                              (order.testing.NC.RS + 1)*n.expressions,:)...
      perceptronTarget.testing(order.testing.TH.RS*n.expressions + 1:...
                              (order.testing.TH.RS + 1)*n.expressions,:)...
      perceptronOutput.testing(order.testing.TH.RS*n.expressions + 1:...
                              (order.testing.TH.RS + 1)*n.expressions,:)...
      perceptronTarget.testing(order.testing.BH.RS*n.expressions + 1:...
                              (order.testing.BH.RS + 1)*n.expressions,:)...
      perceptronOutput.testing(order.testing.BH.RS*n.expressions + 1:...
                              (order.testing.BH.RS + 1)*n.expressions,:)]);


% Store results
%
for i=1:size(perceptronTarget.testing, 1)
    % left-shifted faces
    %
    % full face
    if ((i >= order.testing.NC.LS*n.expressions + 1) &&...
        (i <= (order.testing.NC.LS + 1)*n.expressions))
        confusionMatrix.NC_LS_A(perceptronTarget.testing(i),...
                                perceptronOutput.testing(i)) =...
        confusionMatrix.NC_LS_A(perceptronTarget.testing(i),...
                                perceptronOutput.testing(i)) + 1;
    end

    % top-half face
    if ((i >= order.testing.TH.LS*n.expressions + 1) &&...
        (i <= (order.testing.TH.LS + 1)*n.expressions))
        confusionMatrix.TH_LS_A(perceptronTarget.testing(i),...
                                perceptronOutput.testing(i)) =...
        confusionMatrix.TH_LS_A(perceptronTarget.testing(i),...
                                perceptronOutput.testing(i)) + 1;
    end

    % bottom-half face
    if ((i >= order.testing.BH.LS*n.expressions + 1) &&...
        (i <= (order.testing.BH.LS + 1)*n.expressions))
        confusionMatrix.BH_LS_A(perceptronTarget.testing(i),...
                                perceptronOutput.testing(i)) =...
        confusionMatrix.BH_LS_A(perceptronTarget.testing(i),...
                                perceptronOutput.testing(i)) + 1;
    end

    % right-shifted faces
    %
    % full face
    if ((i >= order.testing.NC.RS*n.expressions + 1) &&...
        (i <= (order.testing.NC.RS + 1)*n.expressions))
        confusionMatrix.NC_RS_A(perceptronTarget.testing(i),...
                                perceptronOutput.testing(i)) =...
        confusionMatrix.NC_RS_A(perceptronTarget.testing(i),...
                                perceptronOutput.testing(i)) + 1;
    end

    % top-half face
    if ((i >= order.testing.TH.RS*n.expressions + 1) &&...
        (i <= (order.testing.TH.RS + 1)*n.expressions))
        confusionMatrix.TH_RS_A(perceptronTarget.testing(i),...
                                perceptronOutput.testing(i)) =...
        confusionMatrix.TH_RS_A(perceptronTarget.testing(i),...
                                perceptronOutput.testing(i)) + 1;
    end

    % bottom-half face
    if ((i >= order.testing.BH.RS*n.expressions + 1) &&...
        (i <= (order.testing.BH.RS + 1)*n.expressions))
        confusionMatrix.BH_RS_A(perceptronTarget.testing(i),...
                                perceptronOutput.testing(i)) =...
        confusionMatrix.BH_RS_A(perceptronTarget.testing(i),...
                                perceptronOutput.testing(i)) + 1;
    end
end


% full, top-half, bottom-half faces
confusionMatrix.NC_A = confusionMatrix.NC_LS_A + confusionMatrix.NC_RS_A;
confusionMatrix.TH_A = confusionMatrix.TH_LS_A + confusionMatrix.TH_RS_A;
confusionMatrix.BH_A = confusionMatrix.BH_LS_A + confusionMatrix.BH_RS_A;


% Percentage Error
%
% left-shifted faces
%
% full face
percentAccuracy.NC_LS_A(i_t, i_i) = 100*(1 - pdist(...
    [perceptronOutput.testing(order.testing.NC.LS*n.expressions + 1:...
                              (order.testing.NC.LS + 1)*n.expressions,:)';
     perceptronTarget.testing(order.testing.NC.LS*n.expressions + 1:...
                              (order.testing.NC.LS + 1)*n.expressions,:)'],...
     'hamming'));

% top-half face
percentAccuracy.TH_LS_A(i_t, i_i) = 100*(1 - pdist(...
    [perceptronOutput.testing(order.testing.TH.LS*n.expressions + 1:...
                              (order.testing.TH.LS + 1)*n.expressions,:)';
     perceptronTarget.testing(order.testing.TH.LS*n.expressions + 1:...
                              (order.testing.TH.LS + 1)*n.expressions,:)'],...
     'hamming'));

% bottom-half face
percentAccuracy.BH_LS_A(i_t, i_i) = 100*(1 - pdist(...
    [perceptronOutput.testing(order.testing.BH.LS*n.expressions + 1:...
                              (order.testing.BH.LS + 1)*n.expressions,:)';
     perceptronTarget.testing(order.testing.BH.LS*n.expressions + 1:...
                              (order.testing.BH.LS + 1)*n.expressions,:)'],...
     'hamming'));

% right-shifted faces
%
% full face
percentAccuracy.NC_RS_A(i_t, i_i) = 100*(1 - pdist(...
    [perceptronOutput.testing(order.testing.NC.RS*n.expressions + 1:...
                              (order.testing.NC.RS + 1)*n.expressions,:)';
     perceptronTarget.testing(order.testing.NC.RS*n.expressions + 1:...
                              (order.testing.NC.RS + 1)*n.expressions,:)'],...
     'hamming'));

% top-half face
percentAccuracy.TH_RS_A(i_t, i_i) = 100*(1 - pdist(...
    [perceptronOutput.testing(order.testing.TH.RS*n.expressions + 1:...
                              (order.testing.TH.RS + 1)*n.expressions,:)';
     perceptronTarget.testing(order.testing.TH.RS*n.expressions + 1:...
                              (order.testing.TH.RS + 1)*n.expressions,:)'],...
     'hamming'));

% bottom-half face
percentAccuracy.BH_RS_A(i_t, i_i) = 100*(1 - pdist(...
    [perceptronOutput.testing(order.testing.BH.RS*n.expressions + 1:...
                              (order.testing.BH.RS + 1)*n.expressions,:)';
     perceptronTarget.testing(order.testing.BH.RS*n.expressions + 1:...
                              (order.testing.BH.RS + 1)*n.expressions,:)'],...
     'hamming'));


% full, top-half and bottom-half faces
percentAccuracy.NC_A(i_t, i_i) = 100*(1 - pdist(...
    [perceptronOutput.testing(order.testing.NC.LS*n.expressions + 1:...
                              (order.testing.NC.RS + 1)*n.expressions,:)';
     perceptronTarget.testing(order.testing.NC.LS*n.expressions + 1:...
                              (order.testing.NC.RS + 1)*n.expressions,:)'],...
     'hamming'));
percentAccuracy.TH_A(i_t, i_i) = 100*(1 - pdist(...
    [perceptronOutput.testing(order.testing.TH.LS*n.expressions + 1:...
                              (order.testing.TH.RS + 1)*n.expressions,:)';
     perceptronTarget.testing(order.testing.TH.LS*n.expressions + 1:...
                              (order.testing.TH.RS + 1)*n.expressions,:)'],...
     'hamming'));
percentAccuracy.BH_A(i_t, i_i) = 100*(1 - pdist(...
    [perceptronOutput.testing(order.testing.BH.LS*n.expressions + 1:...
                              (order.testing.BH.RS + 1)*n.expressions,:)';
     perceptronTarget.testing(order.testing.BH.LS*n.expressions + 1:...
                              (order.testing.BH.RS + 1)*n.expressions,:)'],...
     'hamming'));