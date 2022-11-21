%% Theorical PER models vs Physical layer graph
    % It obtains the figure PER vs SNR for therorical PER models and for the physical layer.
    %% *Syntax*
    % phy_vs_the(channel)
    %% *Description*
    % The phy_vs_the(channel) function plots the data of all the theorical
    % models for each configuration and compares them with the obtained in
    % the simulation of the IEEE 802.11 physical layer in a graph. 
    % It is shown in both normal and logarithmic scales. 
    % It shows 8 different graphs, one for each modulation scheme,
    % type of coding and data rate
    %
    % *Input Arguments*
    %
    % * channel
    %
    % variable that selects the channel.
    %
    % *Output arguments*
    %
    % * None
    %
%% *Examples*
    % The the_mod function is called.
function phy_vs_the(channel)
%%
% The functions needed to graph the results are called. The first evaluates
% the theoretical models of the PER on the range of SNR that best suits
% a given configuration.While the second collects all the data in a single 
% file to facilitate the management of the values obtained.
PER_Extension(channel);
Data_Consolidation(channel);
%%
% Theoretical data is loaded.
load(strcat('rician_',num2str(channel),'_Consolidated_Data.mat'))
%% 
% Each variable contains a different configuration of modulation
% scheme and coding rate respectively.
zconf1 = 'BPSK - r=1/2 ';
zconf2 = 'BPSK - r=3/4 ';
zconf3 = 'QPSK - r=1/2 ';
zconf4 = 'QPSK - r=3/4 ';
zconf5 = '16QAM - r=1/2';
zconf6 = '16QAM - r=3/4';
zconf7 = '64QAM - r=2/3';
zconf8 = '64QAM - r=3/4';
bs = ' ';
zconf = [zconf1 ; zconf2 ; zconf3 ; zconf4 ; zconf5 ; zconf6 ; zconf7 ; zconf8];
%%
% Each variable contains a theoretical model to calculate the PER.
zmod1 = 'Model 1';
zmod2 = 'Model 2';
zmod3 = 'Model 3';
zmod4 = 'Model 4';
zmod5 = 'Model 5';
zmod6 = 'Model 6';
zmod7 = 'Model 7';
zmod8 = 'Model 8';
zmod9 = 'Model 9';
zmod = [zmod1 ; zmod2 ; zmod3 ; zmod4 ; zmod5 ; zmod6 ; zmod7 ; zmod8; zmod9];
%% 
znconf1 = 'BPSK--R12';
znconf2 = 'BPSK--R34';
znconf3 = 'QPSK--R12';
znconf4 = 'QPSK--R34';
znconf5 = '16QAM-R12';
znconf6 = '16QAM-R34';
znconf7 = '64QAM-R23';
znconf8 = '64QAM-R34';
znconf = [znconf1 ; znconf2 ; znconf3 ; znconf4 ; znconf5 ; znconf6 ; znconf7 ; znconf8];
%%
% The limits for the normal scale graph are set.
lim = [ -4.3    25    0 1;
        0.55    35     0 1;
        -1.4    25      0 1;
        3.3     35    0 1;
        2.15    30      0 1;
        2.8     40    0 1;
        1.5     40      0 1;
        1.6     40      0 1];
%% 
% The limits for the graph for semilogarithmic scale are set.  
limlog = [ -4.3    25    1e-2 1;
        0.55    35     1e-2 1;
        -1.4    25      1e-2 1;
        3.3     35    1e-2 1;
        2.15    35      1e-2 1;
        2.8     40    1e-2 1;
        1.5     40      1e-2 1;
        1.6     40      1e-2 1];

%% 
% The result of the theorical models are plotted.  
% Each figure consists of two graphs, the first shows the graph in normal 
% scale and the second shows the graph in semi-logarithmic scale.
for i=1:8
SNR = linspace(SNRV_FIN_EXT(i,1), SNRV_FIN_EXT(i,2), SNUM_FIN_EXT);
    f1 = figure;
    subplot(1,2,1)
    plot(SNR,PER_SIM_FIN_EXT(i,:),'k','LineWidth',1);
    hold on
    subplot(1,2,2)
    semilogy(SNR,PER_SIM_FIN_EXT(i,:),'k','LineWidth',1);
    hold on
    for j=1:9
        
        if(j>=8)
             subplot(1,2,1)
            plot(SNR,PER_THEO_FIN_EXT((i-1)*9+j,:),'-.', 'MarkerSize', 3);hold on
            subplot(1,2,2)
            semilogy(SNR,PER_THEO_FIN_EXT((i-1)*9+j,:),'-.', 'MarkerSize', 3);hold on
        else
            if(j==4)
                 subplot(1,2,1)
                plot(SNR,PER_THEO_FIN_EXT((i-1)*9+j,:),'-.r', 'MarkerSize', 3);hold on
                subplot(1,2,2)
                semilogy(SNR,PER_THEO_FIN_EXT((i-1)*9+j,:),'-.r', 'MarkerSize', 3);hold on
            else
                 subplot(1,2,1)
                plot(SNR,PER_THEO_FIN_EXT((i-1)*9+j,:),'--');hold on
                subplot(1,2,2)
                semilogy(SNR,PER_THEO_FIN_EXT((i-1)*9+j,:),'--');hold on
            end
            
        end
        
        hold on
    end
%%
    % Aggregation of labels, titles and limits of the normal scale graph.
    subplot(1,2,1)
    legend(' PHY Simulation', zmod1, zmod2, zmod3, zmod4, zmod5, zmod6, zmod7, zmod8, zmod9);
    title(['PHY sim. vs theoretical models   ', ' ', zconf(i,:) ]);
    xlabel('SNR [dB]')
    ylabel('PER')
    grid on
    %grid minor
    axis([lim(i,1) lim(i,2) lim(i,3) lim(i,4)])
%% 
    % Aggregation of labels, titles and limits of the semi-logarithmic scale graph.
    subplot(1,2,2)
    legend(' PHY Simulation', zmod1, zmod2, zmod3, zmod4, zmod5, zmod6, zmod7, zmod8, zmod9, 'Location','northeastoutside');
    title(['PHY sim. vs theoretical models [log]  ', ' ', zconf(i,:) ]);
    xlabel('SNR [dB]')  
    ylabel('PER')
    grid on
    %grid minor
    axis([limlog(i,1) limlog(i,2) limlog(i,3) limlog(i,4)])
end

%%
% An example of the result for each model and simulation is shown below.
%%
% 
% <<pvt_fig.PNG>>
% 
%%
% *See also*
%
% <evaluate_models.html Evaluation of theoretical models>
%
% <simulation_802_11_p.html IEEE 802.11 Physical layer> 
%
% <PER_Extension.html  PER_Extension> 
%
% <Data_Consolidation.html  Data_Consolidation> 