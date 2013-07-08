function decision = perceptroncompare(data, perceptron, noise)
%PERCEPTRONCOMPARE uses one or more perceptrons to compare input
%   data. The consensus of the perceptrons is the decision that is
%   output.
% N.B. Implementation can be generalized to handle perceptrons
%      with more than one hidden layer
%
% INPUTS
%   data = {[data111    [data121    -  for comparison
%            data112     data122
%               ...         ...
%            data11N],   data12N],
%                     ...         }
%   CELL INDICES: {perceptron index,
%                  which-stimulus-in-pair index,
%                  which-data-comparison index}
%   N.B. DATA is a cell array. The data are side by side in two
%   columns of the cell array
%
%   perceptron
%   N.B. PERCEPTRON is a cell array in the case when more than
%   one perceptron is used in classification
%       fields:
%           nHiddenUnits    - number of hidden units
%           weightsInput    - weights of connections
%                             leaving the input layer
%           weightsHidden   - weights of connections
%                                     leaving the hidden layer
%           weights matrix format:
%               Number of rows    - Number of units in succeeding
%                                   layer
%               Number of columns - Number of units in preceding
%                                   layer (+1 for a bias unit)
%
%   noise                           - factor multiplied by inputs
%                                     to units in layers after the
%                                     input layer to compute the 
%                                     standard deviation of zero 
%                                     mean Gaussian noise that is
%                                     added
%
% OUTPUTS
%   decision                        - comparison decisions

    % Number of perceptrons
    if iscell(perceptron)
        nPerceptrons = length(perceptron);
    elseif isstruct(perceptron)
        % convert to cell
        perceptron = {perceptron};
        nPerceptrons = 1;
    end

    % For storing classification decisions
    class = zeros(length(target), nPerceptrons);
    decision = zeros(length(target), 1);

    for iStimulus=1:2
        for iPerceptrons=1:nPerceptrons
            % Number of data vectors
            nData = size(data{iPerceptrons,iStimulus}, 1);

            % Number of feature dimensions (excluding the bias unit)
            nFeatures = size(data{iPerceptrons,iStimulus}, 2);

            % If there are no hidden layers, the single-layer
            % perceptron implementation is executed.
            if ~(perceptron.nHiddenUnits > 0)
                % Number of output classes
                nClass =...
                    size(perceptron{iPerceptrons}.weightsInput, 1);
                for n=1:nData
                    % Calculate the sum of the inputs to each of the
                    % output units
                    a_n = perceptron{iPerceptrons}.weightsInput(:,1);
                    a_n = a_n +...
                        perceptron{iPerceptrons}.weightsInput...
                            (:,2:(nFeatures+1))*...
                            data{iPerceptrons,iStimulus}(n,:)';

                    % Add noise to the inputs to the output units
                    if (noise > 0)
                        a_n = a_n +...
                            mvnrnd(zeros(1,nClass),...
                                   diag((noise*a_n).^2))';
                    end

                    % Calculate the outputs from each of the output 
                    % units using softmax activation functions
                    y_n = exp(a_n)/sum(exp(a_n));

                    % classification
                    [~, positionMaximum] = max(y_n(category));
                    class(n, iPerceptrons) = category(positionMaximum);

                    % comparison
                    if (iPerceptrons == nPerceptrons)
                        if (iStimulus == 1)
                            % classify first stimulus
                            decision(n) = mode2(class(n,:));
                        elseif (iStimulus == 2)
                            % compare the two decisions
                            decision(n) =...
                                (decision(n) == mode2(class(n,:)));
                        end
                    end
                end
            elseif (perceptron.nHiddenUnits > 0)
                for n=1:nData
                    % Number of output classes
                    nClass =...
                        size(perceptron{iPerceptrons}.weightsHidden, 1);

                    % Number of hidden units (excluding the bias unit)
                    nHiddenUnits = perceptron{iPerceptrons}.nHiddenUnits;

                    % Calculate the sum of the inputs to each of the
                    % hidden units
                    a_n = perceptron{iPerceptrons}.weightsInput(:,1);
                    a_n = a_n +...
                        perceptron{iPerceptrons}.weightsInput...
                            (:,2:(nFeatures+1))*data{iPerceptrons}(n,:)';

                    % Add noise to the inputs to the hidden units
                    if (noise > 0)
                       a_n = a_n +...
                           mvnrnd(zeros(1,nHiddenUnits),...
                                  diag((noise*a_n).^2))';
                    end

                    % Calculate the outputs from each of the hidden 
                    % units using sigmoid activation functions
                    % y_n = sigmoid(a_n)
                    y_n = 1./(1 + exp(-a_n));

                    % Calculate the sum of the inputs from the hidden
                    % layer to each of the output units
                    b_n = perceptron{iPerceptrons}.weightsHidden(:,1);
                    b_n = b_n +...
                        perceptron{iPerceptrons}.weightsHidden...
                            (:,2:(nHiddenUnits+1))*y_n;

                    % Add noise to the inputs to the output units
                    if (noise > 0)
                       b_n = b_n +...
                           mvnrnd(zeros(1,nClass),...
                                  diag((noise*b_n).^2))';
                    end

                    % Calculate the outputs from each of the output
                    % units using softmax activation functions.
                    % z_n = softmax(b_n)
                    z_n = exp(b_n)/sum(exp(b_n));

                    % classification
                    [~, positionMaximum] = max(z_n(category));
                    class(n, iPerceptrons) = category(positionMaximum);

                    % comparison
                    if (iPerceptrons == nPerceptrons)
                        if (iStimulus == 1)
                            % classify first stimulus
                            decision(n) = mode2(class(n,:));
                        elseif (iStimulus == 2)
                            % compare the two decisions
                            decision(n) =...
                                (decision(n) == mode2(class(n,:)));
                        end
                    end
                end
            end
        end
    end
end