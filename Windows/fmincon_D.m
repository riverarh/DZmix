function [ D ] = wght_cutoffs(xx)

global x_all
global N
global cdf_sink 
global cdf_source

W1 = xx(1);
W2 = xx(2);

if N >= 3 
W3 = xx(3);
end
if N == 3
wghts = [W1,W2,W3];
end

if N >= 4
W4 = xx(4);
end
if N == 4
wghts = [W1,W2,W3,W4];
end

if N >= 5
W5 = xx(5);
end
if N == 5
wghts = [W1,W2,W3,W4,W5];
end

if N >= 6
W6 = xx(6);
end
if N == 6
wghts = [W1,W2,W3,W4,W5,W6];
end

if N >= 7
W7 = xx(7);
end
if N == 7
wghts = [W1,W2,W3,W4,W5,W6,W7];
end

if N >= 8
W8 = xx(8);
end
if N == 8
wghts = [W1,W2,W3,W4,W5,W6,W7,W8];
end

if N >= 9
W9 = xx(9);
end
if N == 9
wghts = [W1,W2,W3,W4,W5,W6,W7,W8,W9];
end

if N >= 10
W10 = xx(10);
end
if N == 10
wghts = [W1,W2,W3,W4,W5,W6,W7,W8,W9,W10];
end

w3 = wghts.*0.01;

wghts3_cdf = repmat(w3,length(x_all),1);

cdf_wghted3(:,:) = cdf_source.*wghts3_cdf(:,:);

cdf_wghted_summed3 = sum(cdf_wghted3,2);

D = max([max(cdf_sink - cdf_wghted_summed3)],[max(cdf_wghted_summed3 - cdf_sink)]);
