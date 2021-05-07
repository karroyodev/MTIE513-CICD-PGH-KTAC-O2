echo '=========================================================='
echo '                KARLA TERESA ARROYO CALERO                '
echo '     MODELOS DE ARQUITECTURAS ORIENTADAS A SERVICIOS      '
echo '    MAESTRIA EN TECNOLOGIAS DE INFORMACION EMPRESARIAL    '
echo '              UNIVERSIDAD DE LA SALLE BAJIO               '
echo '=========================================================='
echo '                        karroyodev                        '
echo '                                                          '
echo '                             ##          ·                '
echo '                       ## ## ##         ==                '
echo '                    ## ## ## ## ##     ===                '
echo '                 /""""""""""""""""\____/ ===              '
echo '            ~~~ {~~ ~~~~ ~~~ ~~~~ ~~~ ~ /  ===- ~~~       '
echo '                 \______             __/                  '
echo '                   \    \         __/                     '
echo '                    \____\_______/                        '
echo '                                                          '
echo '                    INICIAMOS  UPGRADE                    '
echo '                                                          '
echo '=========================================================='
echo '===      PASO 1: ELIMINAR CONTENEDORES EXISTENTES      ==='
echo '=========================================================='
docker rm -f $(docker ps -qa)

echo '=========================================================='
echo '===       PASO 2: LIMPIEZA DE REPOSITORIO LOCAL        ==='
echo '=========================================================='
if [ -d ~/MTIE513-CICD-PGH-KTAC-O2/ ]; then
    echo 'sudo rm -R MTIE513-CICD-PGH-KTAC-O2'
    sudo rm -R MTIE513-CICD-PGH-KTAC-O2
else
    echo 'El repositorio anterior no existe...'
fi

echo '=========================================================='
echo '===           PASO 3: LIMPIANDO DATA                   ==='
echo '=========================================================='
if [ -d ~/data/ ]; then
    echo 'sudo rm -R data'
    sudo rm -R data
else
    echo ''
    echo 'No existe la carpeta data antigua'
fi

echo '=========================================================='
echo '===                    PASO 4: GIT                     ==='
echo '=========================================================='
alias git="docker run -ti --rm -v $(pwd):/git bwits/docker-git-alpine"

echo '=========================================================='
echo '===             PASO 5: CLONAR REPOSITORIO             ==='
echo '=========================================================='
git clone https://github.com/karroyodev/MTIE513-CICD-PGH-KTAC-O2.git
cd MTIE513-CICD-PGH-KTAC-O2

echo '=========================================================='
echo '===   PASO 6: CARPETAS DE volumes PARA ELASTICSEARCH   ==='
echo '=========================================================='
if [ -d ./volumes/ ]; then
    sudo cp -R volumes/ ~/
    sudo mkdir -p ~/volumes/elk-stack/elasticsearch
    cd ~/volumes/elk-stack/
    sudo chmod 777 elasticsearch/
    cd ~/MTIE513-CICD-PGH-KTAC-O2
else
    echo 'No existe la carpeta volumes'
fi

if [ -d ./data/ ]; then
    echo 'sudo cp -R data/ ~/'
    sudo cp -R data/ ~/
else
    echo 'No existe la carpeta data'
fi

echo '=========================================================='
echo '===          PASO 7: CREACION DE CONTENEDORES          ==='
echo '=========================================================='
echo 'sudo docker-compose up --build -d'
sudo docker-compose up --build -d
