function [beta, Rsq, MAE] = pcr_fit(X, y, CV, n_comp)

    len       = size(X, 1);
    rand_rows = randperm(len).'; % generate a random permutation of row labels in row form

    frac      = CV/100;
    test      = rand_rows(1:floor(len*frac));
    train     = rand_rows(ceil(len*frac):len);

    X_train   = X(train,:);
    y_train   = y(train,:);
    X_test    = X(test,:);
    y_test    = y(test,:);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    [Loadings, Scores, Var] = pca(X_train,'Economy',false);
    beta = regress(y-mean(y), PCAScores(:,1:n_comp));

    beta = Loadings(:,1:n_comp)*beta;
    beta = [mean(y_train) - mean(X_train)*beta; beta];
 
    msep = sum(crossval(@pcrmod, X, y, 'KFold', 18), 1) / n;
    
    y_fit = [ones(size(X_test,1),1) X_test]*beta;
    
    Rsq   =     1 - sum((y_test - y_fit).^2)/sum((y_test - mean(y_test)).^2);
    Msq   =     sqrt(sum((y_test - y_fit).^2)/size(y_test, 1));
    MAE   =     sum(abs(y_test - y_fit))/size(y_test, 1);
   
    disp(Rsq)
    disp(Msq)
    disp(MAE)
    
    %Plot test data for PCR
    figure
    plot(y_test, y_fit, 'bo')
    xlabel('observed response')
    ylabel('predicted response')
    legend(sprintf('Principal Component Regression,\n  R Square => %d\n Mean Absolute Error => %d', Rsq, MAE), 'location', 'NW')
    refline(1, 0)
    ls = lsline()
    ls.Color = 'r'
 
    return