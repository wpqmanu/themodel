% Script
%
% DATAVISUALIZATION
%   Notes:
%   07/03/2013
%     - display results
%
%   Functions called:
%       reliabledifference
%       bargraph


%%
disp('***********')
disp('* TESTING *')
disp('***********')

disp('PERCENT ACCURACY (BY EXPRESSION)')
disp('Display Format')
disp('HAPPY')
disp('SAD')
disp('SURPRISED')
disp('ANGRY')
disp('DISGUSTED')
disp('FEARFUL')
disp('NEUTRAL')
disp('          LS    RS    BOTH')

disp('NC:')
[percentAccuracy.expression.NC_LS_A,...
 percentAccuracy.expression.NC_RS_A,...
 percentAccuracy.expression.NC_A]
disp('TH:')
[percentAccuracy.expression.TH_LS_A,...
 percentAccuracy.expression.TH_RS_A,...
 percentAccuracy.expression.TH_A]
disp('BH:')
[percentAccuracy.expression.BH_LS_A,...
 percentAccuracy.expression.BH_RS_A,...
 percentAccuracy.expression.BH_A]


disp('PERCENT ACCURACY (OVERALL)')
disp('Display Format')
disp('LS    RS    BOTH')
disp('NC:')
[percentAccuracy.all.NC_LS_A,...
 percentAccuracy.all.NC_RS_A,...
 percentAccuracy.all.NC_A]
disp('TH:')
[percentAccuracy.all.TH_LS_A,...
 percentAccuracy.all.TH_RS_A,...
 percentAccuracy.all.TH_A]
disp('BH:')
[percentAccuracy.all.BH_LS_A,...
 percentAccuracy.all.BH_RS_A,...
 percentAccuracy.all.BH_A]



%%
disp('**********************************************')
disp('* SIMULATION 1 (COMPLETE COMPOSITE PARADIGM) *')
disp('**********************************************')

if SDT.all.failure == 0
    disp('SENSITIVITY (DPRIME)')
    
    disp('INCONGRUENT TRIALS')
    disp('Display Format')
    disp('IT')
    disp('IB')
    disp('           LS     RS     TLBR     TRBL')
    [mean(SDT.all.dprimes.IT_LS_A),...
     mean(SDT.all.dprimes.IT_RS_A),...
     mean(SDT.all.dprimes.IT_TLBR_MA),...
     mean(SDT.all.dprimes.IT_TRBL_MA);

     mean(SDT.all.dprimes.IB_LS_A),...
     mean(SDT.all.dprimes.IB_RS_A),...
     mean(SDT.all.dprimes.IB_TLBR_MA),...
     mean(SDT.all.dprimes.IB_TRBL_MA)]

    disp('Display Format')
    disp('NC     TLBR     TRBL')
    [mean([SDT.all.dprimes.IT_LS_A;
           SDT.all.dprimes.IT_RS_A;
           SDT.all.dprimes.IB_LS_A;
           SDT.all.dprimes.IB_RS_A]),...
     mean([SDT.all.dprimes.IT_TLBR_MA;
           SDT.all.dprimes.IB_TLBR_MA]),...
     mean([SDT.all.dprimes.IT_TRBL_MA;
           SDT.all.dprimes.IB_TRBL_MA])]


    disp('CONGRUENT TRIALS')
    disp('Display Format')
    disp('CT')
    disp('CB')
    disp('           LS     RS     TLBR     TRBL')
    [mean(SDT.all.dprimes.CT_LS_A),...
     mean(SDT.all.dprimes.CT_RS_A),...
     mean(SDT.all.dprimes.CT_TLBR_MA),...
     mean(SDT.all.dprimes.CT_TRBL_MA);
     
     mean(SDT.all.dprimes.CB_LS_A),...
     mean(SDT.all.dprimes.CB_RS_A),...
     mean(SDT.all.dprimes.CB_TLBR_MA),...
     mean(SDT.all.dprimes.CB_TRBL_MA)]

    disp('Display Format')
    disp('NC     TLBR     TRBL')
    [mean([SDT.all.dprimes.CT_LS_A;
           SDT.all.dprimes.CT_RS_A;
           SDT.all.dprimes.CB_LS_A;
           SDT.all.dprimes.CB_RS_A]),...
     mean([SDT.all.dprimes.CT_TLBR_MA;
           SDT.all.dprimes.CB_TLBR_MA]),...
     mean([SDT.all.dprimes.CT_TRBL_MA;
           SDT.all.dprimes.CB_TRBL_MA])]




    disp('ANOVA')
    disp('CONGRUENCY-FACEHALF-ALIGNMENT 3-WAY ANOVA')
    varnames = {'Congruency';'FaceHalf';'Alignment'};
    data = [SDT.all.dprimes.IT_LS_A;
            SDT.all.dprimes.IB_LS_A;
            SDT.all.dprimes.CT_LS_A;
            SDT.all.dprimes.CB_LS_A;
            SDT.all.dprimes.IT_RS_A;
            SDT.all.dprimes.IB_RS_A;
            SDT.all.dprimes.CT_RS_A;
            SDT.all.dprimes.CB_RS_A;
            SDT.all.dprimes.CT_TLBR_MA;
            SDT.all.dprimes.CB_TLBR_MA;
            SDT.all.dprimes.IT_TLBR_MA;
            SDT.all.dprimes.IB_TLBR_MA;
            SDT.all.dprimes.CT_TRBL_MA;
            SDT.all.dprimes.CB_TRBL_MA;
            SDT.all.dprimes.IT_TRBL_MA;
            SDT.all.dprimes.IB_TRBL_MA];
    % 0 - incongruent
    % 1 - congruent
    congruency = [zeros(2*n.subsets,1);
                  ones(2*n.subsets,1);
                  zeros(2*n.subsets,1);
                  ones(4*n.subsets,1);
                  zeros(2*n.subsets,1);
                  ones(2*n.subsets,1);
                  zeros(2*n.subsets,1)];
    % 0 - top half face
    % 1 - bottom half face
    facehalf = [zeros(n.subsets,1);
                ones(n.subsets,1);
                zeros(n.subsets,1);
                ones(n.subsets,1);
                zeros(n.subsets,1);
                ones(n.subsets,1);
                zeros(n.subsets,1);
                ones(n.subsets,1);
                zeros(n.subsets,1);
                ones(n.subsets,1);
                zeros(n.subsets,1);
                ones(n.subsets,1);
                zeros(n.subsets,1);
                ones(n.subsets,1);
                zeros(n.subsets,1);
                ones(n.subsets,1)];
    % 0 - aligned
    % 1 - misaligned
    alignment = [zeros(8*n.subsets,1);...
                 ones(8*n.subsets,1)];

    show(1);

    [p.SDT.C_FH_A_3W,...
     tbl.SDT.C_FH_A_3W,...
     stats.SDT.C_FH_A_3W,...
     terms.SDT.C_FH_A_3W] =...
        anovan(data,{congruency facehalf alignment},3,3,varnames);




disp('FIGURE')

disp('SIMULATION 1 (COMPLETE COMPOSITE PARADIGM)')
data = [mean([SDT.all.dprimes.CT_LS_A;
              SDT.all.dprimes.CT_RS_A;
              SDT.all.dprimes.CB_LS_A;
              SDT.all.dprimes.CB_RS_A]),...
        mean([SDT.all.dprimes.CT_TLBR_MA;
              SDT.all.dprimes.CB_TLBR_MA;
              SDT.all.dprimes.CT_TRBL_MA;
              SDT.all.dprimes.CB_TRBL_MA]);
        mean([SDT.all.dprimes.IT_LS_A;
              SDT.all.dprimes.IT_RS_A;
              SDT.all.dprimes.IB_LS_A;
              SDT.all.dprimes.IB_RS_A]),...
        mean([SDT.all.dprimes.IT_TLBR_MA;
              SDT.all.dprimes.IB_TLBR_MA
              SDT.all.dprimes.IT_TRBL_MA;
              SDT.all.dprimes.IB_TRBL_MA])];

errorbars = [confidenceInterval.SDT.all.dprime.C_A,...
             confidenceInterval.SDT.all.dprime.C_MA;
             confidenceInterval.SDT.all.dprime.I_A,...
             confidenceInterval.SDT.all.dprime.I_MA];

ctitle = '';
clegend = {'Aligned',...
           'Misaligned'};
cylabel = 'd\prime';
cgrouplabels = {'Congruent',...
                'Incongruent'};

if (isdir('Figures') == 0)
    mkdir('Figures');
end
cfilepath = ['./Figures', '/sim1all'];
cfiletype = 'jpg';

multplot = 0;

bargraph(data, errorbars,...
         ctitle, clegend,...
         cylabel, cgrouplabels,...
         cfilepath, cfiletype,...
         multplot)
else
    disp(['Signal Detection Theory failure point is ',...
          SDT.all.failurePoint])
end

%%
disp('*********************************************')
disp('* SIMULATION 2 (TANAKA ET AL. EXPERIMENT 1) *')
disp('*********************************************')

disp('TESTS OF RELIABLE DIFFERENCES')
showResultsTable = 0;

disp('PERCENT ACCURACY (HAPPY)')

disp(['NORMAL AND ISOLATED: ', num2str(...
      reliabledifference(percentAccuracy.E1.happyHappy_A_bottom,...
                         percentAccuracy.E1.happyBottom,...
                         showResultsTable))]);
disp(['NORMAL AND NEUTRAL: ', num2str(...
      reliabledifference(percentAccuracy.E1.happyHappy_A_bottom,...
                         percentAccuracy.E1.neutralHappy_A_bottom,...
                         showResultsTable))]);
disp(['NORMAL AND ANGRY-HAPPY: ', num2str(...
      reliabledifference(percentAccuracy.E1.happyHappy_A_bottom,...
                         percentAccuracy.E1.angryHappy_A_bottom,...
                         showResultsTable))]);
disp(['ISOLATED AND NEUTRAL: ', num2str(...
      reliabledifference(percentAccuracy.E1.happyBottom,...
                         percentAccuracy.E1.neutralHappy_A_bottom,...
                         showResultsTable))]);
disp(['ISOLATED AND ANGRY-HAPPY: ', num2str(...
      reliabledifference(percentAccuracy.E1.happyBottom,...
                         percentAccuracy.E1.angryHappy_A_bottom,...
                         showResultsTable))]);
disp(['NEUTRAL AND ANGRY-HAPPY: ', num2str(...
      reliabledifference(percentAccuracy.E1.neutralHappy_A_bottom,...
                         percentAccuracy.E1.angryHappy_A_bottom,...
                         showResultsTable))]);


disp('PERCENT ACCURACY (ANGRY)')

disp(['NORMAL AND ISOLATED: ', num2str(...
      reliabledifference(percentAccuracy.E1.angryAngry_A_top,...
                         percentAccuracy.E1.angryTop,...
                         showResultsTable))]);
disp(['NORMAL AND NEUTRAL: ', num2str(...
      reliabledifference(percentAccuracy.E1.angryAngry_A_top,...
                         percentAccuracy.E1.angryNeutral_A_top,...
                         showResultsTable))]);
disp(['NORMAL AND ANGRY-HAPPY: ', num2str(...
      reliabledifference(percentAccuracy.E1.angryAngry_A_top,...
                         percentAccuracy.E1.angryHappy_A_top,...
                         showResultsTable))]);
disp(['ISOLATED AND NEUTRAL: ', num2str(...
      reliabledifference(percentAccuracy.E1.angryTop,...
                         percentAccuracy.E1.angryNeutral_A_top,...
                         showResultsTable))]);
disp(['ISOLATED AND ANGRY-HAPPY: ', num2str(...
      reliabledifference(percentAccuracy.E1.angryTop,...
                         percentAccuracy.E1.angryHappy_A_top,...
                         showResultsTable))]);
disp(['NEUTRAL AND ANGRY-HAPPY: ', num2str(...
      reliabledifference(percentAccuracy.E1.angryNeutral_A_top,...
                         percentAccuracy.E1.angryHappy_A_top,...
                         showResultsTable))]);




disp('REACTION TIME (HAPPY)')

disp(['NORMAL AND ISOLATED: ', num2str(...
      reliabledifference(reactionTime.E1.happyHappy_A_bottom...
                            (reactionTime.E1.happyHappy_A_bottom ~= wrong),...
                         reactionTime.E1.happyBottom...
                            (reactionTime.E1.happyBottom ~= wrong),...
                         showResultsTable))]);
disp(['NORMAL AND NEUTRAL: ', num2str(...
      reliabledifference(reactionTime.E1.happyHappy_A_bottom...
                            (reactionTime.E1.happyHappy_A_bottom ~= wrong),...
                         reactionTime.E1.neutralHappy_A_bottom...
                            (reactionTime.E1.neutralHappy_A_bottom ~= wrong),...
                         showResultsTable))]);
disp(['NORMAL AND ANGRY-HAPPY: ', num2str(...
      reliabledifference(reactionTime.E1.happyHappy_A_bottom...
                            (reactionTime.E1.happyHappy_A_bottom ~= wrong),...
                         reactionTime.E1.angryHappy_A_bottom...
                            (reactionTime.E1.angryHappy_A_bottom ~= wrong),...
                         showResultsTable))]);
disp(['ISOLATED AND NEUTRAL: ', num2str(...
      reliabledifference(reactionTime.E1.happyBottom...
                            (reactionTime.E1.happyBottom ~= wrong),...
                         reactionTime.E1.neutralHappy_A_bottom...
                            (reactionTime.E1.neutralHappy_A_bottom ~= wrong),...
                         showResultsTable))]);
disp(['ISOLATED AND ANGRY-HAPPY: ', num2str(...
      reliabledifference(reactionTime.E1.happyBottom...
                            (reactionTime.E1.happyBottom ~= wrong),...
                         reactionTime.E1.angryHappy_A_bottom...
                            (reactionTime.E1.angryHappy_A_bottom ~= wrong),...
                         showResultsTable))]);
disp(['NEUTRAL AND ANGRY-HAPPY: ', num2str(...
      reliabledifference(reactionTime.E1.neutralHappy_A_bottom...
                            (reactionTime.E1.neutralHappy_A_bottom ~= wrong),...
                         reactionTime.E1.angryHappy_A_bottom...
                            (reactionTime.E1.angryHappy_A_bottom ~= wrong),...
                         showResultsTable))]);


disp('REACTION TIME (ANGRY)')

disp(['NORMAL AND ISOLATED: ', num2str(...
      reliabledifference(reactionTime.E1.angryAngry_A_top...
                            (reactionTime.E1.angryAngry_A_top ~= wrong),...
                         reactionTime.E1.angryTop...
                            (reactionTime.E1.angryTop ~= wrong),...
                         showResultsTable))]);
disp(['NORMAL AND NEUTRAL: ', num2str(...
      reliabledifference(reactionTime.E1.angryAngry_A_top...
                            (reactionTime.E1.angryAngry_A_top ~= wrong),...
                         reactionTime.E1.angryNeutral_A_top...
                            (reactionTime.E1.angryNeutral_A_top ~= wrong),...
                         showResultsTable))]);
disp(['NORMAL AND ANGRY-HAPPY: ', num2str(...
      reliabledifference(reactionTime.E1.angryAngry_A_top...
                            (reactionTime.E1.angryAngry_A_top ~= wrong),...
                         reactionTime.E1.angryHappy_A_top...
                            (reactionTime.E1.angryHappy_A_top ~= wrong),...
                         showResultsTable))]);
disp(['ISOLATED AND NEUTRAL: ', num2str(...
      reliabledifference(reactionTime.E1.angryTop...
                            (reactionTime.E1.angryTop ~= wrong),...
                         reactionTime.E1.angryNeutral_A_top...
                            (reactionTime.E1.angryNeutral_A_top ~= wrong),...
                         showResultsTable))]);
disp(['ISOLATED AND ANGRY-HAPPY: ', num2str(...
      reliabledifference(reactionTime.E1.angryTop...
                            (reactionTime.E1.angryTop ~= wrong),...
                         reactionTime.E1.angryHappy_A_top...
                            (reactionTime.E1.angryHappy_A_top ~= wrong),...
                         showResultsTable))]);
disp(['NEUTRAL AND ANGRY-HAPPY: ', num2str(...
      reliabledifference(reactionTime.E1.angryNeutral_A_top...
                            (reactionTime.E1.angryNeutral_A_top ~= wrong),...
                         reactionTime.E1.angryHappy_A_top...
                            (reactionTime.E1.angryHappy_A_top ~= wrong),...
                         showResultsTable))]);


disp('FIGURES')

disp('TANAKA ET AL. EXPERIMENT 1 PERCENT ACCURACY')
data = [94  97  94  71.5;
        90 81.5 93  44];

errorbars = [1  0.5 0.5 4;
             2  2   2   5];

ctitle = '';
clegend = {'Normal',...
           'Isolated',...
           'Neutral',...
           'Angry-Happy'};
cylabel = 'Percent Accuracy';
cgrouplabels = {'Happy',...
                'Angry'};

cfilepath = ['./Figures', '/tanaka1accuracy'];
cfiletype = 'jpg';

multplot = 1;

bargraph(data, errorbars,...
         ctitle, clegend,...
         cylabel, cgrouplabels,...
         cfilepath, cfiletype,...
         multplot)


disp('SIMULATION 2 PERCENT ACCURACY')
data = [percentAccuracy.E1.overall.happyHappy_A_bottom,...
        percentAccuracy.E1.overall.happyBottom,...
        percentAccuracy.E1.overall.neutralHappy_A_bottom,...
        percentAccuracy.E1.overall.angryHappy_A_bottom;

        percentAccuracy.E1.overall.angryAngry_A_top,...
        percentAccuracy.E1.overall.angryTop,...
        percentAccuracy.E1.overall.angryNeutral_A_top,...
        percentAccuracy.E1.overall.angryHappy_A_top];

errorbars =...
    [confidenceInterval.percentAccuracy.E1.happyHappy_A_bottom,...
     confidenceInterval.percentAccuracy.E1.happyBottom,...
     confidenceInterval.percentAccuracy.E1.neutralHappy_A_bottom,...
     confidenceInterval.percentAccuracy.E1.angryHappy_A_bottom;

     confidenceInterval.percentAccuracy.E1.angryAngry_A_top,...
     confidenceInterval.percentAccuracy.E1.angryTop,...
     confidenceInterval.percentAccuracy.E1.angryNeutral_A_top,...
     confidenceInterval.percentAccuracy.E1.angryHappy_A_top];

ctitle = '';
clegend = {'Normal',...
           'Isolated',...
           'Neutral',...
           'Angry-Happy'};
cylabel = 'Percent Accuracy';
cgrouplabels = {'Happy',...
                'Angry'};

cfilepath = ['./Figures', '/sim2accuracy'];
cfiletype = 'jpg';

multplot = 1;

bargraph(data, errorbars,...
         ctitle, clegend,...
         cylabel, cgrouplabels,...
         cfilepath, cfiletype,...
         multplot)


disp('TANAKA ET AL. EXPERIMENT 1 REACTION TIME')
data = [691, 682, 678, 898;
        852, 900, 850, 933];

errorbars = [29, 26, 33, 63;
             61, 45, 52, 87];


ctitle = '';
clegend = {'Normal',...
           'Isolated',...
           'Neutral',...
           'Angry-Happy'};
cylabel = 'Reaction Time (ms)';
cgrouplabels = {'Happy',...
                'Angry'};

cfilepath = ['./Figures', '/tanaka1reactiontime'];
cfiletype = 'jpg';

multplot = 1;

bargraph(data, errorbars,...
         ctitle, clegend,...
         cylabel, cgrouplabels,...
         cfilepath, cfiletype,...
         multplot)


disp('SIMULATION 2 REACTION TIME')
data = [reactionTime.E1.overall.happyHappy_A_bottom,...
        reactionTime.E1.overall.happyBottom,...
        reactionTime.E1.overall.neutralHappy_A_bottom,...
        reactionTime.E1.overall.angryHappy_A_bottom;
        reactionTime.E1.overall.angryAngry_A_top,...
        reactionTime.E1.overall.angryTop,...
        reactionTime.E1.overall.angryNeutral_A_top,...
        reactionTime.E1.overall.angryHappy_A_top];

errorbars = [confidenceInterval.reactionTime.E1.happyHappy_A_bottom,...
             confidenceInterval.reactionTime.E1.happyBottom,...
             confidenceInterval.reactionTime.E1.neutralHappy_A_bottom,...
             confidenceInterval.reactionTime.E1.angryHappy_A_bottom;

             confidenceInterval.reactionTime.E1.angryAngry_A_top,...
             confidenceInterval.reactionTime.E1.angryTop,...
             confidenceInterval.reactionTime.E1.angryNeutral_A_top,...
             confidenceInterval.reactionTime.E1.angryHappy_A_top];

ctitle = '';
clegend = {'Normal',...
           'Isolated',...
           'Neutral',...
           'Angry-Happy'};
cylabel = '1 - Confidence';
cgrouplabels = {'Happy',...
                'Angry'};

cfilepath = ['./Figures', '/sim2confidence'];
cfiletype = 'jpg';

multplot = 1;


bargraph(data, errorbars,...
         ctitle, clegend,...
         cylabel, cgrouplabels,...
         cfilepath, cfiletype,...
         multplot)


%%
disp('*********************************************')
disp('* SIMULATION 3 (TANAKA ET AL. EXPERIMENT 3) *')
disp('*********************************************')

disp('TESTS OF RELIABLE DIFFERENCES')

disp('PERCENT ACCURACY (HAPPY)')

disp(['NORMAL ALIGNED AND NORMAL MISALIGNED: ', num2str(...
      reliabledifference(percentAccuracy.E3.happyHappy_A_bottom,...
                         percentAccuracy.E3.happyHappy_MA_bottom,...
                         showResultsTable))]);

disp(['NORMAL ALIGNED AND ANGRY-HAPPY ALIGNED: ', num2str(...
      reliabledifference(percentAccuracy.E3.happyHappy_A_bottom,...
                         percentAccuracy.E3.angryHappy_A_bottom,...
                         showResultsTable))]);

disp(['NORMAL ALIGNED AND ANGRY-HAPPY MISALIGNED: ', num2str(...
      reliabledifference(percentAccuracy.E3.happyHappy_A_bottom,...
                         percentAccuracy.E3.angryHappy_MA_bottom,...
                         showResultsTable))]);

disp(['NORMAL MISALIGNED AND ANGRY-HAPPY ALIGNED: ', num2str(...
      reliabledifference(percentAccuracy.E3.happyHappy_MA_bottom,...
                         percentAccuracy.E3.angryHappy_A_bottom,...
                         showResultsTable))]);

disp(['NORMAL MISALIGNED AND ANGRY-HAPPY MISALIGNED: ', num2str(...
      reliabledifference(percentAccuracy.E3.happyHappy_MA_bottom,...
                         percentAccuracy.E3.angryHappy_MA_bottom,...
                         showResultsTable))]);

disp(['ANGRY-HAPPY ALIGNED AND ANGRY-HAPPY MISALIGNED: ', num2str(...
      reliabledifference(percentAccuracy.E3.angryHappy_A_bottom,...
                         percentAccuracy.E3.angryHappy_MA_bottom,...
                         showResultsTable))]);


disp('PERCENT ACCURACY (ANGRY)')

disp(['NORMAL ALIGNED AND NORMAL MISALIGNED: ', num2str(...
      reliabledifference(percentAccuracy.E3.angryAngry_A_top,...
                         percentAccuracy.E3.angryAngry_MA_top,...
                         showResultsTable))]);

disp(['NORMAL ALIGNED AND ANGRY-HAPPY ALIGNED: ', num2str(...
      reliabledifference(percentAccuracy.E3.angryAngry_A_top,...
                         percentAccuracy.E3.angryHappy_A_top,...
                         showResultsTable))]);

disp(['NORMAL ALIGNED AND ANGRY-HAPPY MISALIGNED: ', num2str(...
      reliabledifference(percentAccuracy.E3.angryAngry_A_top,...
                         percentAccuracy.E3.angryHappy_MA_top,...
                         showResultsTable))]);

disp(['NORMAL MISALIGNED AND ANGRY-HAPPY ALIGNED: ', num2str(...
      reliabledifference(percentAccuracy.E3.angryAngry_MA_top,...
                         percentAccuracy.E3.angryHappy_A_top,...
                         showResultsTable))]);

disp(['NORMAL MISALIGNED AND ANGRY-HAPPY MISALIGNED: ', num2str(...
      reliabledifference(percentAccuracy.E3.angryAngry_MA_top,...
                         percentAccuracy.E3.angryHappy_MA_top,...
                         showResultsTable))]);

disp(['ANGRY-HAPPY ALIGNED AND ANGRY-HAPPY MISALIGNED: ', num2str(...
      reliabledifference(percentAccuracy.E3.angryHappy_A_top,...
                         percentAccuracy.E3.angryHappy_MA_top,...
                         showResultsTable))]);


disp('PERCENT ACCURACY (OVERALL)')

disp(['NORMAL ALIGNED AND NORMAL MISALIGNED: ', num2str(...
      reliabledifference(percentAccuracy.E3.normal_A,...
                         percentAccuracy.E3.normal_MA,...
                         showResultsTable))]);

disp(['NORMAL ALIGNED AND ANGRY-HAPPY ALIGNED: ', num2str(...
      reliabledifference(percentAccuracy.E3.normal_A,...
                         percentAccuracy.E3.angryHappy_A,...
                         showResultsTable))]);

disp(['NORMAL ALIGNED AND ANGRY-HAPPY MISALIGNED: ', num2str(...
      reliabledifference(percentAccuracy.E3.normal_A,...
                         percentAccuracy.E3.angryHappy_MA,...
                         showResultsTable))]);

disp(['NORMAL MISALIGNED AND ANGRY-HAPPY ALIGNED: ', num2str(...
      reliabledifference(percentAccuracy.E3.normal_MA,...
                         percentAccuracy.E3.angryHappy_A,...
                         showResultsTable))]);

disp(['NORMAL MISALIGNED AND ANGRY-HAPPY MISALIGNED: ', num2str(...
      reliabledifference(percentAccuracy.E3.normal_MA,...
                         percentAccuracy.E3.angryHappy_MA,...
                         showResultsTable))]);

disp(['ANGRY-HAPPY ALIGNED AND ANGRY-HAPPY MISALIGNED: ', num2str(...
      reliabledifference(percentAccuracy.E3.angryHappy_A,...
                         percentAccuracy.E3.angryHappy_MA,...
                         showResultsTable))]);




disp('REACTION TIME (HAPPY)')

disp(['NORMAL ALIGNED AND NORMAL MISALIGNED: ', num2str(...
      reliabledifference(reactionTime.E3.happyHappy_A_bottom...
                            (reactionTime.E3.happyHappy_A_bottom ~= wrong),...
                         reactionTime.E3.happyHappy_MA_bottom...
                            (reactionTime.E3.happyHappy_MA_bottom ~= wrong),...
                         showResultsTable))]);

disp(['NORMAL ALIGNED AND ANGRY-HAPPY ALIGNED: ', num2str(...
      reliabledifference(reactionTime.E3.happyHappy_A_bottom...
                            (reactionTime.E3.happyHappy_A_bottom ~= wrong),...
                         reactionTime.E3.angryHappy_A_bottom...
                            (reactionTime.E3.angryHappy_A_bottom ~= wrong),...
                         showResultsTable))]);

disp(['NORMAL ALIGNED AND ANGRY-HAPPY MISALIGNED: ', num2str(...
      reliabledifference(reactionTime.E3.happyHappy_A_bottom...
                            (reactionTime.E3.happyHappy_A_bottom ~= wrong),...
                         reactionTime.E3.angryHappy_MA_bottom...
                            (reactionTime.E3.angryHappy_MA_bottom ~= wrong),...
                         showResultsTable))]);

disp(['NORMAL MISALIGNED AND ANGRY-HAPPY ALIGNED: ', num2str(...
      reliabledifference(reactionTime.E3.happyHappy_MA_bottom...
                            (reactionTime.E3.happyHappy_MA_bottom ~= wrong),...
                         reactionTime.E3.angryHappy_A_bottom...
                            (reactionTime.E3.angryHappy_A_bottom ~= wrong),...
                         showResultsTable))]);

disp(['NORMAL MISALIGNED AND ANGRY-HAPPY MISALIGNED: ', num2str(...
      reliabledifference(reactionTime.E3.happyHappy_MA_bottom...
                            (reactionTime.E3.happyHappy_MA_bottom ~= wrong),...
                         reactionTime.E3.angryHappy_MA_bottom...
                            (reactionTime.E3.angryHappy_MA_bottom ~= wrong),...
                         showResultsTable))]);

disp(['ANGRY-HAPPY ALIGNED AND ANGRY-HAPPY MISALIGNED: ', num2str(...
      reliabledifference(reactionTime.E3.angryHappy_A_bottom...
                            (reactionTime.E3.angryHappy_A_bottom ~= wrong),...
                         reactionTime.E3.angryHappy_MA_bottom...
                            (reactionTime.E3.angryHappy_MA_bottom ~= wrong),...
                         showResultsTable))]);


disp('REACTION TIME (ANGRY)')

disp(['NORMAL ALIGNED AND NORMAL MISALIGNED: ', num2str(...
      reliabledifference(reactionTime.E3.angryAngry_A_top...
                            (reactionTime.E3.angryAngry_A_top ~= wrong),...
                         reactionTime.E3.angryAngry_MA_top...
                            (reactionTime.E3.angryAngry_MA_top ~= wrong),...
                         showResultsTable))]);

disp(['NORMAL ALIGNED AND ANGRY-HAPPY ALIGNED: ', num2str(...
      reliabledifference(reactionTime.E3.angryAngry_A_top...
                            (reactionTime.E3.angryAngry_A_top ~= wrong),...
                         reactionTime.E3.angryHappy_A_top...
                            (reactionTime.E3.angryHappy_A_top ~= wrong),...
                         showResultsTable))]);

disp(['NORMAL ALIGNED AND ANGRY-HAPPY MISALIGNED: ', num2str(...
      reliabledifference(reactionTime.E3.angryAngry_A_top...
                            (reactionTime.E3.angryAngry_A_top ~= wrong),...
                         reactionTime.E3.angryHappy_MA_top...
                            (reactionTime.E3.angryHappy_MA_top ~= wrong),...
                         showResultsTable))]);

disp(['NORMAL MISALIGNED AND ANGRY-HAPPY ALIGNED: ', num2str(...
      reliabledifference(reactionTime.E3.angryAngry_MA_top...
                            (reactionTime.E3.angryAngry_MA_top ~= wrong),...
                         reactionTime.E3.angryHappy_A_top...
                            (reactionTime.E3.angryHappy_A_top ~= wrong),...
                         showResultsTable))]);

disp(['NORMAL MISALIGNED AND ANGRY-HAPPY MISALIGNED: ', num2str(...
      reliabledifference(reactionTime.E3.angryAngry_MA_top...
                            (reactionTime.E3.angryAngry_MA_top ~= wrong),...
                         reactionTime.E3.angryHappy_MA_top...
                            (reactionTime.E3.angryHappy_MA_top ~= wrong),...
                         showResultsTable))]);

disp(['ANGRY-HAPPY ALIGNED AND ANGRY-HAPPY MISALIGNED: ', num2str(...
      reliabledifference(reactionTime.E3.angryHappy_A_top...
                            (reactionTime.E3.angryHappy_A_top ~= wrong),...
                         reactionTime.E3.angryHappy_MA_top...
                            (reactionTime.E3.angryHappy_MA_top ~= wrong),...
                         showResultsTable))]);


disp('REACTION TIME (OVERALL)')

disp(['NORMAL ALIGNED AND NORMAL MISALIGNED: ', num2str(...
      reliabledifference(reactionTime.E3.normal_A...
                            (reactionTime.E3.normal_A ~= wrong),...
                         reactionTime.E3.normal_MA...
                            (reactionTime.E3.normal_MA ~= wrong),...
                         showResultsTable))]);

disp(['NORMAL ALIGNED AND ANGRY-HAPPY ALIGNED: ', num2str(...
      reliabledifference(reactionTime.E3.normal_A...
                            (reactionTime.E3.normal_A ~= wrong),...
                         reactionTime.E3.angryHappy_A...
                            (reactionTime.E3.angryHappy_A ~= wrong),...
                         showResultsTable))]);

disp(['NORMAL ALIGNED AND ANGRY-HAPPY MISALIGNED: ', num2str(...
      reliabledifference(reactionTime.E3.normal_A...
                            (reactionTime.E3.normal_A ~= wrong),...
                         reactionTime.E3.angryHappy_MA...
                            (reactionTime.E3.angryHappy_MA ~= wrong),...
                         showResultsTable))]);

disp(['NORMAL MISALIGNED AND ANGRY-HAPPY ALIGNED: ', num2str(...
      reliabledifference(reactionTime.E3.normal_MA...
                            (reactionTime.E3.normal_MA ~= wrong),...
                         reactionTime.E3.angryHappy_A...
                            (reactionTime.E3.angryHappy_A ~= wrong),...
                         showResultsTable))]);

disp(['NORMAL MISALIGNED AND ANGRY-HAPPY MISALIGNED: ', num2str(...
      reliabledifference(reactionTime.E3.normal_MA...
                            (reactionTime.E3.normal_MA ~= wrong),...
                         reactionTime.E3.angryHappy_MA...
                            (reactionTime.E3.angryHappy_MA ~= wrong),...
                         showResultsTable))]);

disp(['ANGRY-HAPPY ALIGNED AND ANGRY-HAPPY MISALIGNED: ', num2str(...
      reliabledifference(reactionTime.E3.angryHappy_A...
                            (reactionTime.E3.angryHappy_A ~= wrong),...
                         reactionTime.E3.angryHappy_MA...
                            (reactionTime.E3.angryHappy_MA ~= wrong),...
                         showResultsTable))]);




disp('FIGURES')
disp('TANAKA ET AL. EXPERIMENT 3 PERCENT ACCURACY')
data = [92 91;
        88 93];

errorbars = [2 2.5;
             3 2];

ctitle = '';
clegend = {'Aligned',...
           'Misaligned'};
cylabel = 'Percent Accuracy';
cgrouplabels = {'Normal',...
                'Angry-Happy'};

cfilepath = ['./Figures', '/tanaka3accuracy'];
cfiletype = 'jpg';

multplot = 0;

bargraph(data, errorbars,...
         ctitle, clegend,...
         cylabel, cgrouplabels,...
         cfilepath, cfiletype,...
         multplot)


disp('SIMULATION 3 PERCENT ACCURACY')
data = [percentAccuracy.E3.overall.normal_A,...
        percentAccuracy.E3.overall.normal_MA;

        percentAccuracy.E3.overall.angryHappy_A,...
        percentAccuracy.E3.overall.angryHappy_MA];

errorbars = [confidenceInterval.percentAccuracy.E3.normal_A,...
             confidenceInterval.percentAccuracy.E3.normal_MA;

             confidenceInterval.percentAccuracy.E3.angryHappy_A,...
             confidenceInterval.percentAccuracy.E3.angryHappy_MA];

ctitle = '';
clegend = {'Aligned',...
           'Misaligned'};
cylabel = 'Percent Accuracy';
cgrouplabels = {'Normal',...
                'Angry-Happy'};

cfilepath = ['./Figures', '/sim3accuracy'];
cfiletype = 'jpg';

multplot = 0;

bargraph(data, errorbars,...
         ctitle, clegend,...
         cylabel, cgrouplabels,...
         cfilepath, cfiletype,...
         multplot)


disp('TANAKA ET AL. EXPERIMENT 3 REACTION TIME (HAPPY)')
data = [ 993, 872;
        1088, 867];

errorbars = [113, 64;
             113, 57];

ctitle = '';
clegend = {'Aligned',...
           'Misaligned'};
cylabel = 'Reaction Time (ms)';
cgrouplabels = {'Normal',...
                'Angry-Happy'};

cfilepath = ['./Figures', '/tanaka3reactiontimehappy'];
cfiletype = 'jpg';

multplot = 0;

bargraph(data, errorbars,...
         ctitle, clegend,...
         cylabel, cgrouplabels,...
         cfilepath, cfiletype,...
         multplot)


disp('TANAKA ET AL. EXPERIMENT 3 REACTION TIME (ANGRY)')
data = [854, 806;
        929, 821];

errorbars = [45, 51;
             52, 43];

ctitle = '';
clegend = {'Aligned',...
           'Misaligned'};
cylabel = 'Reaction Time (ms)';
cgrouplabels = {'Normal',...
                'Angry-Happy'};

cfilepath = ['./Figures', '/tanaka3reactiontimeangry'];
cfiletype = 'jpg';

multplot = 0;

bargraph(data, errorbars,...
         ctitle, clegend,...
         cylabel, cgrouplabels,...
         cfilepath, cfiletype,...
         multplot)


disp('SIMULATION 3 REACTION TIME (HAPPY)')
data = [reactionTime.E3.overall.happyHappy_A_bottom,...
        reactionTime.E3.overall.happyHappy_MA_bottom;
        
        reactionTime.E3.overall.angryHappy_A_bottom,...
        reactionTime.E3.overall.angryHappy_MA_bottom];

errorbars = [confidenceInterval.reactionTime.E3.happyHappy_A_bottom,...
             confidenceInterval.reactionTime.E3.happyHappy_MA_bottom;

             confidenceInterval.reactionTime.E3.angryHappy_A_bottom,...
             confidenceInterval.reactionTime.E3.angryHappy_MA_bottom];

% ctitle = 'Simulation 3 Results';
ctitle = '';
clegend = {'Aligned',...
           'Misaligned'};
cylabel = '1 - Confidence';
cgrouplabels = {'Normal',...
                'Angry-Happy'};

cfilepath = ['./Figures', '/sim3confidencehappy'];
cfiletype = 'jpg';

multplot = 0;

bargraph(data, errorbars,...
         ctitle, clegend,...
         cylabel, cgrouplabels,...
         cfilepath, cfiletype,...
         multplot)


disp('SIMULATION 3 REACTION TIME (ANGRY)')
data = [reactionTime.E3.overall.angryAngry_A_top,...
        reactionTime.E3.overall.angryAngry_MA_top;
        reactionTime.E3.overall.angryHappy_A_top,...
        reactionTime.E3.overall.angryHappy_MA_top];

errorbars = [confidenceInterval.reactionTime.E3.angryAngry_A_top,...
             confidenceInterval.reactionTime.E3.angryAngry_MA_top;

             confidenceInterval.reactionTime.E3.angryHappy_A_top,...
             confidenceInterval.reactionTime.E3.angryHappy_MA_top];

ctitle = '';
clegend = {'Aligned',...
           'Misaligned'};
cylabel = '1 - Confidence';
cgrouplabels = {'Normal',...
                'Angry-Happy'};

cfilepath = ['./Figures', '/sim3confidenceangry'];
cfiletype = 'jpg';

multplot = 0;

bargraph(data, errorbars,...
         ctitle, clegend,...
         cylabel, cgrouplabels,...
         cfilepath, cfiletype,...
         multplot)