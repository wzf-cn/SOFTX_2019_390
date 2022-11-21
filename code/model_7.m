%% Predictive theoretical model of PER #7
    % Model without coding on AWGN channel, with model to obtain the BER #1.
    %% *Syntax*
    % PER = model_7(SNR, M, r, l)
    %% *Description*
    % The model_7(SNR, M, r, l) function describes a general model for
    % obtaining PER without considering coding schemes on AWGN channels.
    % The BER value for this model is calculated independently in a 
    % function called *model_BER1()* and the PER is ultimately parameterized 
    % with respect to the SNR and the length of the packet (L). 
    %
    % The PER value is given by the equation:
    %%
    % 
    % <<MPER_07.PNG>>
    % 
    % *Input Arguments*
    %
    %
    % * SNR
    %
    % SNR value.
    %   
    % * M
    %
    % Modulation scheme.
    %
    % * r
    %
    % Coding rate.
    %
    % * l
    %
    % Packet length in bits.
    % 
    % *Output arguments*
    %
    % * PER
    %
    % Calculated PER value.
    %
    %% *Examples*
    % The model_7(SNR, M, r, l) function is called.
function PER = model_7(SNR, M, r, l)
%%
    % The BER value is obtained with model_BER1() and depends on the SNR, 
    % the modulation scheme and the coding rate.
    SNR = 10^(SNR/10);
    be = model_BER1(SNR, M, r);
 %%
    % The PER is calculated with the corresponding formula.   
    PER = 1 - ( 1 - be )^l;
    if(PER<0)
        PER = 1;
    end
end
%%
    % *See also*
    %
    % <model_BER1.html model_BER1> 
    % 
    % <evaluate_models.html Evaluation of theoretical models> 