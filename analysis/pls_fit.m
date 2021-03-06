function [beta, Rsq, MAE] = pls_fit(X, y, CV, n_comp)

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

    [Xloadings,Yloadings,Xscores,Yscores,beta, PctVar, msep] = plsregress(X_train, y_train, n_comp, 'CV',10);

    y_fit =     [ones(size(X_test,1),1) X_test]*beta;
    Rsq   =     1 - sum((y_test - y_fit).^2)/sum((y_test - mean(y_test)).^2);
    Msq   =     sqrt(sum((y_test - y_fit).^2)/size(y_test, 1));
    AE    =     abs(y_test - y_fit);
    MAE   =     mean(AE);
    disp(Rsq)
    disp(Msq)
    disp(MAE)
    disp(std(AE))
    disp(msep)
%     
    figure
    plot(1:n_comp,cumsum(100*PctVar(2,:)),'-bo');
    xlabel('Number of PLS components');
    ylabel('Percent Variance Explained in Y');
    legend('Partial Least Squares', 'location', 'SE')

    figure
    plot(0:n_comp,msep(2,:),'b-o');
    xlabel('Number of components');
    ylabel('Estimated Mean Squared Prediction Error');
    legend('PLSR','location','NE');

    figure
    plot(y_test, y_fit, 'bo')
    xlabel('observed response')
    ylabel('predicted response')
    legend(sprintf('Partial Least Squares,\n  R Square => %d \n Mean Absolute Error => %d eV', Rsq, MAE), 'location', 'NW')
    refline(1, 0)
    ls = lsline()
    ls.Color = 'r'
 
    return
