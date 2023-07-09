% 用2公里的参数设定。

Bc = 20e+6; % bandwidth in Hz
d = 2;  % distance in Km
Ptx = 46; % transmit power in dbm
Lp = 128.1 + 36.7* log10(d); % path loss defined in ITU
N0 = -174; % noise floor
Prx = Ptx - Lp;
SNRdb = Prx - N0 - (10*log10(Bc));
SNR2 = 10^(SNRdb / 10);

% for testing
% Prx_value = 10^(Prx / 10)*0.001;
% N0_value = 10^(N0 / 10)*0.001;
% SNR = Prx_value ./ (N0_value* Bc);