   19  ls
   20  sh deleteClusterIfNeeded.sh 
   21  kubectl config get-contexts -o name
   22  kubectl config get-contexts
   23  gcloud container clusters list
   24  kubectl config get-contexts
   25  gcloud container clusters delete translator-app
   26  clear
   27  ls
   28  sh createClusterIfNeeded.sh 
   29  ls
   30  sh gCloudDeployment.sh 
   31  ls
   32  sh deleteClusterIfNeeded.sh 
   33  clear
   34  ls
   35  pwd
   36  cd ../
   37  cd ../
   38  ls
   39  cd translator-frontend/
   40  ls
   41  which nvm
   42  nvm use 12.13.0
   43  node --version
   44  npm --version
   45  rm -fr ./node-modules
   46  npm install
   47  npm audit fix
   48  clear
   49  ls
   50  clear
   51  pwd
   52  pwd
   53  ls
   54  cd gits
   55  ls
   56  cd HowToRun/
   57  ls
   58  cd Local/
   59  ls
   60  sh RunTranslator.sh 
   61  ls
   62  sh StopTranslator.sh 
   63  ls
   64  sh RunTranslator.sh 
   65  ls
   66  cd HowToRun/
   67  ls
   68  cd Local/
   69  ls
   70  clear
   71  ls
   72  sh RunTranslator.sh 
   73  ls
   74  sh StopTranslator.sh 
   75  ls
   76  cd ../Docker/
   77  ls
   78  sh StopTranslatorDocker.sh 
   79  ls
   80  sh RunTranslatorDocker.sh 
   81  ls
   82  sh StopTranslatorDocker.sh 
   83  cd ../
   84  ls
   85  cd GKE/
   86  ls
   87  sh deleteClusterIfNeeded.sh 
   88  ls
   89  sh createClusterIfNeeded.sh 
   90  ls
   91  sh gCloudDeployment.sh 
   92  ls
   93  cd HowToRun/
   94  ls
   95  cd GKE/
   96  ls
   97  sh gCloudDeployment.sh 
   98  clear
   99  ls
  100  sh gCloudDeployment.sh 
  101  sh deleteClusterIfNeeded.sh 
  102  exit
  103  clear
  104  ls
  105  ls
  106  cd sa-logic/
  107  ls
  108  cat Dockerfile 
  109  clear
  110  ks
  111  ls
  112  vi Dockerfile 
  113  cd ../
  114  ls
  115  cd HowToRun/
  116  clear
  117  ls
  118  cd Docker/
  119  ls
  120  cd ../
  121  clear
  122  ls
  123  cd ../
  124  ls
  125  cd sa-logic/
  126  ls
  127  pip3 install --user -r sa/requirements.txt
  128  pip install --upgrade pip
  129  pip3 install --upgrade pip
  130  sudo pip3 install --upgrade pip
  131  clear
  132  clear
  133  ls
  134  cd HowToRun/
  135  ls
  136  cd Local/
  137  ls
  138  sh RunTranslator.sh 
  139  clear
  140  ls
  141  sh StopTranslator.sh 
  142  cd ../
  143  ls
  144  cd Docker/
  145  ls
  146  sh StopTranslatorDocker.sh 
  147  ls
  148  sh RunTranslatorDocker.sh 
  149  clear
  150  ls
  151  sh RunTranslatorDocker.sh 
  152  ls
  153  sh StopTranslatorDocker.sh 
  154  ls
  155  cd ../
  156  ls
  157  cd GKE
  158  ls
  159  cd ../Docker/
  160  clear
  161  ls
  162  sh StopTranslatorDocker.sh 
  163  ls
  164  cd ../
  165  ls
  166  cd GKE/
  167  clear
  168  ls
  169  sh createClusterIfNeeded.sh 
  170  ls
  171  sh gCloudDeployment.sh 
  172  ls
  173  sh deleteClusterIfNeeded.sh 
  174  exit
  175  ls
  176  ls
  177  exit
  178  ls
  179  kubectl --version
  180  kubectl -version
  181  kubectl version
  182  minkube start
  183  cd HowToRun/
  184  clear
  185  ls
  186  ls
  187  cd Minikube/
  188  ls
  189  sh cleanMinikube.sh 
  190  ls
  191  ls
  192  sh cleanMinikube.sh 
  193  ls
  194  sh RunTranslatorMinikube.sh 
  195  sh RunTranslatorMinikube.sh 
  196  ls
  197  sh StopTranslatorMinikube.sh 
  198  ls
  199  sh StopTranslatorMinikube.sh 
  200  ls
  201  sh StopTranslatorMinikube.sh 
  202  ls
  203  sh cleanMinikube.sh 
  204  ls
  205  sh RunTranslatorMinikube.sh 
  206  ls
  207  sh StopTranslatorMinikube.sh 
  208  ls
  209  sh StopTranslatorMinikube.sh 
  210  kubectl get deployments
  211  kubectl get services
  212  clear
  213  unset DOCKER_HOST
  214  unset DOCKER_TLS_VERIFY
  215  unset DOCKER_TLS_PATH
  216  kubectl get services
  217  kubectl get deployments
  218  source ~/.bash_profile
  219  unset DOCKER_HOST
  220  unset DOCKER_TLS_VERIFY
  221  unset DOCKER_TLS_PATH
  222  kubectl get deployments
  223  kubectl get services
  224  echo "$DOCKER_PASSWORD" | docker login --username $DOCKER_USER_ID --password-stdin
  225  docker login
  226  unset DOCKER_HOST
  227  unset DOCKER_TLS_VERIFY
  228  unset DOCKER_TLS_PATH
  229  docker ps
  230  ls
  231  sh StopTranslatorMinikube.sh 
  232  sh StopTranslatorMinikube.sh 
  233  ls
  234  sh cleanMinikube.sh 
  235  exit
  236  pwd
  237  exit
  238  pwd
  239  exit
  240  ls
  241  ls
  242  cd HowToRun/
  243  ls
  244  cd Local/
  245  ls
  246  sh RunTranslator.sh 
  247  ls
  248  sh StopTranslator.sh 
  249  ls
  250  cd ../
  251  ls
  252  cd Docker/
  253  ls
  254  sh RunTranslatorDocker.sh 
  255  ls
  256  sh RunTranslatorDocker.sh 
  257  ls
  258  sh StopTranslatorDocker.sh 
  259  ls
  260  clear
  261  ls
  262  cd ../
  263  ls
  264  cd Minikube/
  265  ls
  266  sh cleanMinikube.sh 
  267  ls
  268  ls
  269  sh RunTranslatorMinikube.sh 
  270  ls
  271  sh StopTranslatorMinikube.sh 
  272  ls
  273  cd ../
  274  ls
  275  cd GKE
  276  ls
  277  sh createClusterIfNeeded.sh 
  278  ls
  279  sh gCloudDeployment.sh 
  280  ls
  281  sh deleteClusterIfNeeded.sh 
  282  ls
  283  cd ../Minikube/
  284  ls
  285  sh StopTranslatorMinikube.sh 
  286  minikube stop
  287  cd ../
  288  clear
  289  ls
  290  ls
  291  cd Local/
  292  ls
  293  sh RunTranslator.sh 
  294  sh RunTranslator.sh 
  295  ls
  296  sh StopTranslator.sh 
  297  ls
  298  sh RunTranslator.sh 
  299  clear
  300  ls
  301  sh StopTranslator.sh 
  302  ls
  303  ls
  304  cd ../
  305  ls
  306  ls
  307  cd Docker/
  308  ls
  309  sh StopTranslatorDocker.sh 
  310  ls
  311  sh RunTranslatorDocker.sh 
  312  ls
  313  sh StopTranslatorDocker.sh 
  314  ls
  315  cd ../
  316  pwd
  317  ls
  318  cd GKE
  319  ls
  320  sh createClusterIfNeeded.sh 
  321  ls
  322  sh gCloudDeployment.sh 
  323  ls
  324  sh deleteClusterIfNeeded.sh 
  325  cd /usr/local/opt/nginx
  326  ls
  327  ls
  328  cd bin/
  329  ls
  330  cd nginx 
  331  cd ../
  332  ls
  333  cd bin/
  334  ps -ef | grep nginx
  335  pwd
  336  pwd
  337  cd ../
  338  ls
  339  ls
  340  exit
  341  pwd
  342  exit
  343  pwd
  344  ls
  345  cd HowToRun/
  346  ls
  347  cd Local/
  348  ls
  349  sh RunTranslator.sh 
  350  ls
  351  sh StopTranslator.sh 
  352  ls
  353  cd ../Docker/
  354  ls
  355  sh RunTranslatorDocker.sh 
  356  ls
  357  sh StopTranslatorDocker.sh 
  358  ls
  359  cd ../
  360  ls
  361  cd Minikube/
  362  ls
  363  sh cleanMinikube.sh 
  364  ls
  365  sh RunTranslatorMinikube.sh 
  366  ls
  367  ls
  368  cd HowToRun/
  369  ls
  370  cd Docker/
  371  ls
  372  sh RunTranslatorDocker.sh 
  373  ls
  374  sh StopTranslatorDocker.sh 
  375  ls
  376  ls
  377  clear
  378  ls
  379  cd ../
  380  ls
  381  cd GKE/
  382  ls
  383  sh createClusterIfNeeded.sh 
  384  ls
  385  sh gCloudDeployment.sh 
  386  sh gCloudDeployment.sh 
  387  ls
  388  ls
  389  cd ../
  390  ls
  391  ls
  392  ls
  393  ls
  394  clear
  395  ls
  396  ls
  397  clear
  398  ls
  399  ls
  400  ls
  401  cd GKE/
  402  ls
  403  clear
  404  ls
  405  sh deleteClusterIfNeeded.sh 
  406  ls
  407  cd ../
  408  ls
  409  cd Local/
  410  ls
  411  sh RunTranslator.sh 
  412  ls
  413  sh RunTranslator.sh 
  414  ls
  415  sh StopTranslator.sh 
  416  MindfulGoals101
  417  ls
  418  cd ../Docker/
  419  clear
  420  ls
  421  sh StopTranslatorDocker.sh 
  422  ls
  423  cd ../
  424  ls
  425  cd GKE/
  426  ls
  427  sh deleteClusterIfNeeded.sh 
  428  clear
  429  ls
  430  cd ../
  431  ls
  432  cd Local/
  433  clear
  434  ls
  435  sh RunTranslator.sh 
  436  sh RunTranslator.sh
  437  ls
  438  sh StopTranslator.sh 
  439  sh StopTranslator.sh 
  440  ls
  441  ls
  442  sh StopTranslator.sh 
  443  ls
  444  sh RunTranslator.sh 
  445  ls
  446  sh StopTranslator.sh 
  447  sh RunTranslator.sh 
  448  ls
  449  sh StopTranslator.sh 
  450  ls
  451  sh RunTranslator.sh 
  452  ls
  453  cd ../
  454  ls
  455  cd Local/
  456  ls
  457  sh StopTranslator.sh 
  458  cd ../Docker/
  459  clear
  460  ls
  461  sh RunTranslatorDocker.sh 
  462  ls
  463  sh StopTranslatorDocker.sh 
  464  clear
  465  ls
  466  cd ../GK
  467  cd ../GKE
  468  ls
  469  cd ../Docker/
  470  ls
  471  sh StopTranslatorDocker.sh 
  472  ls
  473  cd ../GKE
  474  ls
  475  sh deleteClusterIfNeeded.sh 
  476  ls
  477  sh createClusterIfNeeded.sh 
  478  ls
  479  sh gCloudDeployment.sh 
  480  sh deleteClusterIfNeeded.sh 
  481  exit
  482  ls
  483  ls
  484  clear
  485  ls
  486  ps -ef | grep nginx &
  487  ps -p 1741 -o comm=
  488  clear
  489  ls
  490  cd HowToRun/
  491  ls
  492  cd Local/
  493  ls
  494  sh RunTranslator.sh 
  495  clear
  496  ls
  497  ps -ef | grep nginx
  498  ps -p 2408 -o comm=
  499  ps -p 2415 -o comm=
  500  systemctl status nginx
  501  sudo firewall-cmd --add-service=http
  502  mkdir /etc/ssl/private
  503  sudo mkdir /etc/ssl/private
  504  sudo chmod 700 /etc/ssl/private
  505  sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
  506  sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
  507  sudo vi /etc/nginx/conf.d/ssl.conf
  508  vi /etc/nginx/conf.d/ssl.conf
  509  vi ssl.conf
  510  mkdir /etc/nginx/conf.d/
  511  mkdir /etc/nginx
  512  sudo mkdir /etc/nginx
  513  sudo mkdir /etc/nginx/conf.d
  514  mv ssl.conf /etc/nginx/conf.d/ssl.conf
  515  sudo mv ssl.conf /etc/nginx/conf.d/ssl.conf
  516  vi /etc/nginx/conf.d/ssl.conf
  517  sudo vi /etc/nginx/conf.d/ssl.conf
  518  history > LocalCerts.md
