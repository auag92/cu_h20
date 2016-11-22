function [y1] = myNeuralNetworkFunction(x1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 13-Nov-2016 18:46:24.
%
% [y1] = myNeuralNetworkFunction(x1) takes these arguments:
%   x = Qx40 matrix, input #1
% and returns:
%   y = Qx1 matrix, output #1
% where Q is the number of samples.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-12.7802230639411;-8.02472972114725;-4.47119727909281;-3.72117762922308;-4.51301791096288;-3.01263997240765;-2.42480049553745;-0.900928996546231;-0.975497945980995;-0.992950151526825;-0.751975259498961;-0.514509374167196;-0.347829758284772;-0.348533333735644;-0.285671938393463;-0.298738233791928;-0.176788229982257;-0.189022811369171;-0.111438133671731;-0.0963783182738995;-0.0942724030799313;-0.0907632767205718;-0.0627769149044037;-0.0534843942182564;-0.0519742390141951;-0.0291373243425631;-0.0490705698776343;-0.0244317924974365;-0.0260031604377391;-0.0266343974964539;-0.0210557383892267;-0.0179757197278836;-0.0142382038248756;-0.0106856292777522;-0.0129664830097127;-0.00813080401979843;-0.00863497536010552;-0.00765451299310768;-0.00502459936647711;-0.00483752557834656];
x1_step1.gain = [0.0745494943699028;0.131712219594162;0.237098076086862;0.223678801791652;0.232589022354283;0.320251194109121;0.440225958714896;0.73281656262795;0.800936417858253;1.00436079424693;1.3942338207446;2.10970925420972;1.89407524453323;2.72910661561977;4.10946958825704;4.02403370714447;5.27621628941603;6.04777028823902;8.92430657443746;9.60839043023353;11.297775390638;11.855931971013;13.6884749857404;19.3874018263877;22.2845413624915;29.2831180617466;24.1111970000599;40.4091775586644;28.6063902984765;44.5229310374693;48.4875477789432;55.0581311146987;57.0458451444085;92.1633201443601;78.9510633372986;105.244656187404;115.932591652754;146.750932412307;196.90220366722;224.459390889256];
x1_step1.ymin = -1;

% Layer 1
b1 = [-0.016936666906402852;0.4115435138935018;-0.18966275155739365;-0.20219054615151841;2.250199677140297];
IW1_1 = [0.46047142457016144 0.2698762763029729 0.091164488660869403 -0.14863151813553624 0.10398074217561946 0.10152435489115062 -0.52834630062964172 0.001525331957214892 -0.12942212829870781 -0.15724844050028863 0.1451084107159889 0.52352418232079168 -0.1569666456529471 0.08439289269237564 -0.16627131803015219 -0.22813269034424613 -0.20917758181134097 -0.17925014920774548 -0.11519266333817667 0.11796526061537342 0.27241767391677774 -0.0069108288557012572 -0.30194007697301406 0.2902163842695471 0.039353868349481784 -0.25738924040466904 0.39918776747962298 -0.027044635596448527 0.18713192330262532 -0.018810148973354552 -0.28141409403093187 -0.0083513978060759594 0.2595253497634063 -0.23120276136557952 0.00013366666038380139 -0.032838452111670947 -0.1373090225755963 -0.1385710935958922 -0.28448975954490391 -0.13828733621647848;-0.39484276645878169 -0.055560597399993951 0.28362531665987534 -0.40566826786916338 -0.050530120761416691 -0.82861452379003298 -0.080919973368686768 -0.32837954180314521 -0.46920691368434869 -0.32157467430539921 -0.68414263784129681 -0.11624515403469274 -0.5088526494688177 0.11610644155054393 -0.21325633580677081 -1.2714080186461183 -0.11118974277260138 0.38141471684755973 0.14797830352450483 -0.22299451166852374 0.22850706422261263 1.0770316478386417 0.04125773863480612 -0.38386747711714697 0.095279535540025578 0.19163271689783007 0.029293784427764789 0.25241247693604058 0.56411084451882409 0.34764074533329714 0.39142367026205049 -0.0038298790522297002 0.35637811302924693 0.26849037019385597 0.094463763017765087 0.019694691871762128 -0.50346629140552868 0.29342274832581461 -0.29830341662529741 -0.29203099252446729;0.21278346338998327 -0.30469994713876508 -0.52345018842599234 -0.066833395910196811 -0.15527800765853877 0.36333057212535297 -0.00083359595569903815 0.16323725860381766 0.37281324587240106 0.13914711055758014 -0.26867961338574364 0.21537526698044712 -0.29088838071449796 0.1890755634674586 0.077924629059668862 -0.52267671121463433 -0.27915825864384708 -0.39686199846315839 -0.17678408295876066 -0.014609931050407299 0.52804469172617507 -0.089778872581697325 -0.19467333803660702 -0.23032443033152153 0.20649404005241398 -0.21136690602843075 0.44505775005119946 -0.28606109624272402 0.12383271707180472 -0.0080396824479208213 -0.25542836094315374 0.10217261001777543 0.13152841248183827 -0.52850629412348582 0.0017869977082474522 -0.095817007794031184 0.047317438947420236 -0.053249309640158372 -0.36563812529541129 0.035272417685981376;-0.022720384037256468 -0.38211632116009608 -0.58768127742499643 0.1277744913773648 -0.29313908705406794 0.74529943063342408 0.2057696078053439 0.2349237187884238 0.26745242420743542 0.21949470203446825 -0.0089396963650136326 -0.088637243792960729 0.02340659958891517 0.015083630289627342 0.22697723381286186 0.14501736737390791 -0.075222049410079359 -0.37644314702363496 -0.27032050005018804 0.069770778900636946 0.18058087017615004 -0.66073327235711254 -0.081625160179744208 -0.18843325618011406 0.079140458986783638 -0.10275131937322089 0.030198345715336358 -0.3870118592568193 -0.42493494456195369 -0.057626586932399873 -0.36935661183606111 0.071677526344554501 -0.29590933131225622 -0.43951848490722584 -0.031210167674654638 0.0048245152358222789 0.49004951698347915 -0.23202375778886797 -0.02134642257535245 0.18911340197504534;-0.54477037337538525 0.095374392322507065 -0.82068118029693504 0.164023768620984 0.50098452503718671 -0.1154129084964383 1.1531561495991263 -0.66197691046413076 1.5443931922150635 1.7178416244787365 -1.7063633547920383 -0.66201899879717663 0.42240497777143549 -0.664327078665363 1.0013574239270242 0.15345389974854667 -0.35165043044435806 -0.20200769368615482 0.29945773735862447 0.09868348409592255 -0.12989705492296416 0.032989759711528059 0.15819097393969134 0.22238320855633525 0.37924956873398502 -0.010519274365498977 0.7746033369614298 -0.3695602392973073 -0.45466479321898595 -0.74336887243432637 0.45892546506074439 1.2889850586338341 0.28308997095836924 0.094394737951152427 0.30945856613153716 -0.1945527973869304 0.48332289699293013 0.50846091304157348 0.40909611579031402 0.65375523141982139];

% Layer 2
b2 = -1.4352507115653503;
LW2_1 = [1.8095310010211243 1.4958149139917876 -2.1763433489434059 2.4334272949633156 1.5018157286772684];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 0.259586766422414;
y1_step1.xoffset = 2049.8207;

% ===== SIMULATION ========

% Dimensions
Q = size(x1,1); % samples

% Input 1
x1 = x1';
xp1 = mapminmax_apply(x1,x1_step1);

% Layer 1
a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*xp1);

% Layer 2
a2 = repmat(b2,1,Q) + LW2_1*a1;

% Output 1
y1 = mapminmax_reverse(a2,y1_step1);
y1 = y1';
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
y = bsxfun(@minus,x,settings.xoffset);
y = bsxfun(@times,y,settings.gain);
y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
x = bsxfun(@minus,y,settings.ymin);
x = bsxfun(@rdivide,x,settings.gain);
x = bsxfun(@plus,x,settings.xoffset);
end