%% RAmen!
%
%                            _ooOoo_
%                           o8888888o
%                           88" . "88
%                           (| -_- |)
%                            O\ = /O
%                        ____/`---'\____
%                      .   ' \\| |// `.
%                       / \\||| : |||// \
%                     / _||||| -:- |||||- \
%                       | | \\\ - / | |
%                     | \_| ''\---/'' | |
%                      \ .-\__ `-` ___/-. /
%                   ___`. .' /--.--\ `. . __
%                ."" '< `.___\_<|>_/___.' >'"".
%               | | : `- \`.;`\ _ /`;.`/ - ` : | |
%                 \ \ `-. \_ __\ /__ _/ .-` / /
%         ======`-.____`-.___\_____/___.-`____.-'======
%                            `=---='
%
%         .............................................
%                Dear Mr. Buddha No Bug Please
%
%  Created by Du Pupu on 19/5/17.
%



function [betas,ses,vols,covAMs] = getBetas(Returns)

uuz=Returns(:,1);
rMkt = Returns(:,12)';
varMkt = var(rMkt);
betas = [];
ses = [];
covAMs = [];
for i=1:12
    rAst = Returns(:,i)';
    
    covAM = cov(rAst,rMkt);
    covAM = covAM(1,2);
    
    
    [corr,astBeta,astSlope]=regression(rMkt-uuz',rAst-uuz');
    betas = [betas astBeta];
    ses = [ses sqrt(var(rAst)/(length(rAst)-2)/var(rMkt))];
    covAMs = [covAMs covAM];
end

vols = sqrt(var(Returns));
end 