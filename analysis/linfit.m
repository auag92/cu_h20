function [r, Rsq, MAE] = linfit(X, y, k)
    
    len       = size(X, 1);
    rand_rows = randperm(len).'; % generate a random permutation of row labels in row form
    frac      = k/100;
    test      = rand_rows(1:floor(len*frac));
    train     = rand_rows(ceil(len*frac):len);
    
    X_train   = X(train,:);
    y_train   = y(train,:);
    X_test    = X(test,:);
    y_test    = y(test,:);
    
    r         =     regress(y_train, [ones(size(X_train, 1), 1) X_train]);
    y_fit     =     [ones(size(X_test,1),1) X_test]*r;
    Rsq       =     1 - sum((y_test - y_fit).^2)/sum((y_test - mean(y_test)).^2);
    Msq       =     sqrt(sum((y_test - y_fit).^2)/size(y_test, 1));
    MAE       =     sum(abs(y_test - y_fit))/size(y_test,1);
   
    disp(Rsq)
    disp(Msq)
    disp(MAE)
    
    figure
    plot(y_test, y_fit, 'bo')
    xlabel('observed response')
    ylabel('predicted response')
    legend(sprintf('multiple linear regression,\n  R Square => %d\n Mean Absolute Error => %d eV', Rsq, MAE), 'location', 'NW')
    refline(1, 0);
    ls = lsline();
    ls.Color = 'r'
    
    return