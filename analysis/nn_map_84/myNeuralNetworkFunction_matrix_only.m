function [y1] = myNeuralNetworkFunction(x1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 07-Dec-2016 01:30:58.
%
% [y1] = myNeuralNetworkFunction(x1) takes these arguments:
%   x = Qx84 matrix, input #1
% and returns:
%   y = Qx1 matrix, output #1
% where Q is the number of samples.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [0.750981548895176;0.7457730988833;0.722707829472603;7.19746634477717;7.44951851679395;8.40998298358475;5.9373904615495;6.70665520644263;6.25249116098032;5.21614638100313;5.49145346633785;6.79012313677197;5.078951491392;5.95448577185663;5.39076918019321;3.75253391138761;4.09167850188966;5.65979413737019;2.99962510205359;4.23824882593991;3.34621081126817;3.17306174132398;3.70154937627489;5.35265628905892;1.62530825862358;3.27632667022902;2.37958015227771;1.28040530215319;1.96541291858327;4.1226432084448;7.88521503248028;8.1788487473002;8.95432307324356;6.3581439433289;6.8748539920183;6.33724954935033;5.22109867879137;5.2869675189459;6.43105314399135;5.81036620728341;6.68004416019834;5.87599044110021;4.44739574653223;4.53047323068573;5.78756824600687;2.82777867586026;3.82361312935213;2.8191928528829;3.61811366493895;4.36626964170572;5.61297410376299;2.64236625728531;3.64564048700115;2.67514403057723;1.20519453258426;1.44142251593938;3.50358918872376;7.71536485441862;7.6021155312309;8.36482937175152;6.55174475829012;6.93881244584007;7.11398387633462;5.93561634685919;6.33641845109278;7.16816498228173;5.36591335967895;5.83221955728212;6.02681656087233;4.56174855395922;4.37584042050564;5.59698036927646;3.81573957033614;4.57011512425551;3.95400447305728;3.54648149863636;3.46176503498678;4.91655535826151;2.07617518315507;3.07448884065856;3.28790562676683;1.52620414944692;2.21297358290175;3.74740163462218];
x1_step1.gain = [0.746504243345983;1.26223287274873;1.14828383665745;0.457692831377528;0.447792782460567;0.442487863698789;0.453402777030528;0.449581110434127;0.491863621498126;0.490343191020488;0.464732716040075;0.471279725349069;0.445201062661358;0.444565088565755;0.443611711683682;0.470317148404909;0.44659432177479;0.46097876906294;0.474536025309712;0.478978643605493;0.530423861701212;0.425621941648572;0.456814129937211;0.470938956276062;0.44636503423583;0.4705529737056;0.485916578939811;0.557692295545804;0.501401554617977;0.535579235615356;0.630514438328021;0.657179618977796;0.650406160479762;0.627866965362093;0.619058591194642;0.59034347284457;0.632566747587472;0.602904796085175;0.550626368839302;0.611200289716383;0.667973679386534;0.58921214874846;0.677831532863478;0.64083845336565;0.589244838501488;0.607411979011406;0.545990544743619;0.555767187076023;0.543736715943578;0.622223463046281;0.570872533899249;0.71366835227093;0.620252288572977;0.644769545368744;0.710017136262222;0.546616183110971;0.529199187362838;0.614965813181004;0.511077346300094;0.463773212181513;0.643458286292308;0.531900215404845;0.737070086362095;0.7607431119108;0.733592485330893;0.60034127893684;0.519049152400492;0.447385990547904;0.628536693382423;0.707014508112455;0.526234198941551;0.482172028512778;0.762049903976603;0.598135231697453;0.729649138322426;0.551855410111592;0.431860754264269;0.420051963932511;0.534101920149543;0.460695813171385;0.790578745653633;0.739022529135209;0.604378830514263;0.516488075326931];
x1_step1.ymin = -1;

% Layer 1
b1 = [1.2093515795319305095;-3.3934614191199119482;-2.1213344985741580118;0.84230384241335842788;1.369048855496560968];
IW1_1 = [0.22511481559263896157 -2.687485878816679552 -0.24572857256936889159 0.40915061850811268451 0.67720885325535007393 2.3407829318645108074 -1.1443100924894498149 0.56446157189158674417 -0.099935907301889947973 -1.4821268631870345711 -1.2301478958397238372 2.4688213255535718105 -0.25449406182837247536 0.94614441236318258532 0.87247363963843982404 -2.7430291384389264842 -2.1522928525901265928 1.9614696065210226461 -5.2286360445075166226 -0.43090833946962892043 2.4945730036038944455 0.989282016854113877 0.63304209088601559596 2.0613990276267002422 -2.9608898472798426127 -1.0848859571264415358 1.1124056572830860468 4.9040413473544042233 -9.2632697903192049438 7.17996154673197573 0.91576809820469029511 -0.6188839903623529759 -0.95663515032876977884 -0.60504189368973904095 -0.21276408225339571434 2.3471664015690629768 0.8026321640915126121 0.10559284754051112554 1.3070927425854421688 -1.2040241437975314209 -1.3932677044184726967 1.5867928973779470425 -2.5807946770691998495 -1.884244330996562411 0.30927110466749069273 -4.6422879671976584603 1.4227711009244941032 1.9044533961098208952 0.066701205610707914317 -0.81257509331727795221 -1.2741873823359644025 -2.4377704740534538175 2.9243261706186007842 4.3321251794600881269 0.37468924465799813284 3.0659848365458093333 4.5187323796731817538 -1.2972782228596575482 -1.642358809567245892 -2.1697065289423158596 -1.5158782866096278674 -1.9113436969369359542 -1.0725987316390090953 -2.3511735874162145166 -2.9741896124593916184 -3.743448501062736522 -0.53217176380354258569 -0.68488878366692385047 -0.30896582481781875718 0.43876283125144849295 0.93935964856061837658 -0.72060602396986950247 0.94697963979665111811 -0.45821623822795287673 -0.43254336088752115552 -0.57360509313790097874 0.60888135985118907456 -0.0085863526964568524791 5.3980401769691326308 3.1587972881570136607 1.776971565368333783 2.9868957532863706916 7.5916938862398692933 -0.65770743701259537506;0.28555027499092411336 -0.60633395602489914555 0.20848453441609895997 -0.90635769259810861076 -0.71646412937611680949 -5.0273159650628125306 0.29153083546697838857 -0.73754435529632433877 -0.55171877666845481336 -8.6986127361292577831 1.0381749309330616793 1.2015211395937777095 2.8423154895735049941 0.30874500279934652403 -0.87877788262322187318 3.7162374332694345647 3.1875057617520154984 -2.6861217166359847575 2.6558446984674106695 0.84597798892580167163 4.7595220061870566752 4.136275257336788691 -1.2206760316398843624 2.4663502586032781672 -1.7054714228877168036 -2.8493848373372667737 -2.022079566123373251 -1.4587786394652921818 1.2985892550916136035 1.0668454357606995675 -5.0999374919480215951 -0.99351476671716876243 4.0256429775479674049 1.9337325762991053324 4.3577315038540032077 -4.6060081938928423284 -0.55373032907652852685 2.4797918463542396594 2.9286622089876592767 -2.0038706434346429397 0.39241290012825086331 -7.1079936686244566957 -2.825751986130959903 1.0298960266576107081 5.114961582914085092 -5.5670351236150015239 -1.1853194084479263815 7.5444545150887343254 5.4544087539628005601 -1.2524524850528413467 -0.016727312736672775989 0.076655443588675598043 0.039539079104147285826 3.7020188167345988717 -1.1011675961208662322 2.9581487905974581665 -10.884133087841485477 2.4428948830855303775 2.235553270777285384 3.2255327196599257178 1.7867328391622261385 0.56386626043430576605 -2.1430532756898688085 -0.032104663412870569628 0.95636468459181300794 -0.17012815529035590911 -0.76280950205538078368 -0.84871277305023407056 1.8912364049008847378 2.4324573662118811335 -0.93980765043757230615 -1.5921230059715487659 -0.66753019987539563562 -1.8708699315493142468 -3.400069013407559293 -2.9404273763439174871 -2.6564632617430383732 -0.86874106310806253894 0.97280952612517213041 -0.69481897929520508583 -0.67500526822429440799 1.2554457680789650187 1.2409610288050689775 -0.27170060430451864475;0.26847643089282585693 -0.3217907165016794524 -0.53268547391416465331 0.26533822068147533413 1.1451725214421017984 4.9647154200300231963 0.39788837840008922653 0.32339984523447878884 -2.6699560445299423961 3.6164750362297319874 -2.0257972336753695686 -0.32406743510389568463 -3.1107684393769337028 -1.4024361393016775423 -1.9512146094756672721 5.9307659128368701573 -3.3471678862083527051 0.066909372023121860273 -1.1336452895184208067 -0.19829755445581129236 -2.0302928345690136602 1.4856168955862503189 -2.9026684742223629598 1.3873727750358675337 2.6685941273118425343 -2.460254163996223653 0.1466243688711907911 -0.40778830562208567834 1.0520004611969091535 0.04228172329526157236 -0.82775487812291548284 1.8788665049360311343 1.49187106111998391 -1.3192629367462633816 2.0695087699460561481 -1.7963241597358359236 4.276340235430778236 0.12904357111243705547 2.3401749334417702997 0.34938199271779496469 1.3158855849080595135 -2.5013694472353185105 -7.0149467678511738811 0.020719474840653909209 2.2172530983555844841 -7.7625066577313299732 0.65937868314081160559 3.0668912453419698849 6.0109210042310348143 -1.1946016506275467517 -5.4748835834627014307 1.2688503241515085573 1.2765699217040964442 0.27563804145750742114 0.98697617623363465 1.2617811308466828635 -2.6379647026690977718 -0.73266667645842065149 2.2417084831682791979 5.9028836849168149215 -0.61966953060380103313 2.2420978576609673638 3.0377715478895410683 2.1395238124452320427 -1.2755368474132429135 5.1557823028831135659 -0.16481493866734761577 2.5500340372382224174 -6.9065605408853079084 -3.5912452687154767794 -5.0507295322971046403 1.186868126383904043 -4.3963417272817997272 -7.723264595783255082 1.5424029322583934221 0.18337988690720952167 0.79028724477451250952 5.0988861307023727321 2.9668401624210702927 -8.3417302425078787564 1.4329499231882645294 0.81310241204952915517 7.1679583047411048469 -3.6962269995153960167;-0.16171673539795591856 0.56064908440823479907 -0.75007040119711720916 1.4870724845612328657 0.76497288045048694727 -3.6753488122821482698 5.5342403878709536258 2.6814602163049512384 6.2812037677342473785 2.7442431201488943771 3.3399066267711914335 -1.8170040180104434224 -1.4234005104713303158 -2.1348214800371794198 -5.5689859573507582979 3.6045123741439129006 3.4831191544012618522 -0.002877175797839389218 -3.6912633295898085173 -5.9043293288963818455 -9.7308802867070127718 -5.7233110919311220854 -6.1112146623510144039 -2.458415751662215154 -3.0407324110850169063 15.612571163959376719 6.1806314308914878097 0.49306133695581977339 -1.2584502069471081853 -1.8972769409537377783 0.069629616222469922771 0.18664511049473558879 3.8214091397207492484 0.6947298294857086054 1.44368516803598812 1.0524003858282451329 -2.4703150571195795493 -1.1703322208364925761 1.6192771754388568528 -1.0344067030573318444 -0.41524863509435155917 -0.28311912234499359009 -1.4590165172887350487 -1.5073192695737873681 1.4217179080949884362 -0.60543448023308088501 -3.112036678306207893 0.41885599458262162686 0.27205183072431449176 -1.2712297670297409979 1.6785021886362525567 -0.53294883297643980136 -3.977419173211486747 1.6248556060015273417 0.89806722561278362615 2.8901781212611212801 0.96656660611059608268 0.80206234213334159922 0.67238936281428207664 1.0728829054195161419 0.19225945663268392827 0.016580426846087431558 -0.033038645317373313559 3.2749516211591167547 1.025988212836455693 0.8911193320764115855 -0.86067958488594697997 -0.7367276539637401811 -0.93479164615007492856 -4.1994020521336281604 -2.8649196614889760326 -1.4554492775600680332 -6.2472146380346709194 -2.0738217812050838695 4.0575393394577199402 1.4341590635879031268 3.3806485049403769416 -0.65146242047359537164 0.37899043595432174714 2.5171990026757504744 0.13653218604779132628 -0.35062511467277884813 4.0376872201899862702 -0.48603187912898648815;-0.043259531330041782471 -0.031394962807909480851 0.28189976634182872806 0.73204888012599989011 -0.14552214741659066921 1.2686486331941768668 -0.86506112600615170383 -1.2901457729023328991 -3.5180805073244818537 3.6461194404503234345 -3.333261357894020005 -6.436837683383352271 -0.89358274318986052887 0.03660952417712582535 2.9018979547731631463 2.7283179538867297076 0.8239937596459784297 2.0539368079075694951 -0.25792720450951805988 5.9614776043502022418 -0.21574284015718661611 -2.8683328764407596267 2.4108200816631453201 -5.3617005922899299009 -3.0945004532218258753 5.899747172573434284 1.1768180899853495358 -0.65515531788915326583 -0.63260243141298222458 -0.35109817698088408022 -2.866066349330749663 2.7773823998758695453 3.7491468446471447606 -2.6824414034996109102 -0.17701195146689613358 -8.8329766734143202456 0.023894256728241417692 -0.25190552950031863677 2.7821755269823182921 2.1935678012262891379 4.0245692028208788216 -3.74837475522185537 3.8706803516406407262 0.49574830197028946221 -2.4793972006553923748 -0.011307492193463903468 -0.60727635859755313419 5.2063727392591303555 -4.3244106549974059561 0.26104823900440732309 1.5438292970827056649 -1.3585114011195780215 -2.0062361213742194721 4.3918614147186376684 -1.6571385713182960053 2.9216264694930580426 -5.7794424145074945187 0.47668955666417295314 -2.3908421812960312103 -5.4204081180768346471 -0.74985095143120883421 -0.82631099645174255208 7.0427716585404924743 -2.385957810304507376 -2.1585641412887612844 -0.9524163219547712167 0.68236966594595716007 -0.19606097767062574677 3.2006228631311226529 0.73982342174289905667 3.5240105963283805401 1.6485297138110917015 2.8852563712274030827 3.3887368417964376377 -4.0062011052774195718 -1.8789027101178175094 -1.2818752199971152894 -2.0525345808288713023 -0.24593268557868122604 1.7995485829455462046 -1.6449449042968804502 0.34306378059922520984 -3.0516260711341036682 2.4082533780530042122];

% Layer 2
b2 = -17.161805759539753069;
LW2_1 = [0.79686181589172688788 21.304550677613953269 -23.678860263151470633 11.658549262636199728 -23.714326350461686133];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 0.25950794957191;
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