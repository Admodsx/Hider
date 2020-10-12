route="$(cat /sdcard/Android/data/com.hider/files/.res/.rt)"
assets="cd /sdcard/Android/data/com.hider/files/.res/assets"
visible_folder_true="$(cat /sdcard/Android/data/com.hider/files/.res/.vft)"
visible_folder_false="$(cat /sdcard/Android/data/com.hider/files/.res/.vff)"
FILE=/sdcard/Android/data/com.hider/files/.res/.rt
FILE1=/sdcard/Android/data/com.hider/files/.res/.vft
FILE2=/sdcard/Android/data/com.hider/files/.res/.vff
FILE3=/sdcard/Android/data/com.hider/files/.res/.hided
TIME=$((0))
timemath=$((0))
cd /sdcard/Android/data/com.hider/files/.res/


if test -f "$FILE"; then
echo ""
else
touch .rt
echo "cd /sdcard/Pictures" > .rt
fi


if test -f "$FILE1"; then
echo ""
else
touch .vft
echo "Hider" > .vft
fi

if test -f "$FILE2"; then
echo ""
else
touch .vff
echo "666" > .vff
fi

$route
status="$(if [ -d "$(pwd)/.$visible_folder_false" ] ; then echo -e "Estado: \e[1;32mINVISIBLE" ; else echo -e "Estado: \e[1;31mVISIBLE" ; fi )"
clear

echo -e "\n\n"
echo -e "\e[0;1m\e[1;34mVersión: 111020"
echo -e ""

echo -e " $status"

echo -e ""

echo -e "\e[0;1m   1) \e[1;34mOcultar todo"
echo -e "\e[0;1m   2) \e[1;34mMostrar todo"
echo -e "\e[0;1m   3) \e[1;34mMostrar y ocultar por tiempo"

echo -e ""

echo -e "\e[0;1m   4) \e[1;34mCrear carpeta Hider"
echo -e "\e[0;1m   5) \e[1;34mCambiar contraseña"
echo -e "\e[0;1m   6) \e[1;34mAyuda"
echo -e "\e[0;1m   7) \e[1;34mLista de Cambios"

echo -e "\e[0m"
read op

case $op in
6)
clear
echo -e " \e[1;34mAyuda:\n  \e[0;1mSi es la primera vez que inicia\n  seleccione *Crear carpeta Hider* y luego\n  coloque los archivos que se desean ocultar\n  en la carpeta Pictures --> Hider"
;;
4)
clear && echo 'Por favor espere.' && sleep 0.$RANDOM && clear && echo 'Por favor espere..' && sleep 0.$RANDOM && clear && echo 'Por favor espere...' && sleep 0.$RANDOM && clear
$route
mkdir -p $visible_folder_true
cd $visible_folder_true
echo "✓ $(pwd)"
echo -e "\e[0;1;34m   Carpeta creada correctamente"
;;
1)
clear && echo 'Por favor espere.' && sleep 0.$RANDOM && clear && echo 'Por favor espere..' && sleep 0.$RANDOM && clear && echo 'Por favor espere...' && sleep 0.$RANDOM && clear
if test -f "$FILE3"; then
echo "Los archivos ya se encuentran ocultos"
else
$route
mv $visible_folder_true .$visible_folder_false
cd .$visible_folder_false
for file in *.jpg ; do mv -v $file ${file%.*}.chk ; done
for file in *.mp4 ; do mv -v $file ${file%.*}.cfg ; done
cd /sdcard/Android/data/com.hider/files/.res/
touch .hided
echo -e "Archivos ocultos correctamente"
fi
;;
2)
clear && echo 'Por favor espere.' && sleep 0.$RANDOM && clear && echo 'Por favor espere..' && sleep 0.$RANDOM && clear && echo 'Por favor espere...' && sleep 0.$RANDOM && clear
if test -f "$FILE3"; then
$route
mv .$visible_folder_false $visible_folder_true
cd $visible_folder_true
for file in *.chk ; do mv -v $file ${file%.*}.jpg ; done
for file in *.cfg ; do mv -v $file ${file%.*}.mp4 ; done
cd /sdcard/Android/data/com.hider/files/.res/
rm -rf .hided
echo -e "Archivos restaurados correctamente"
else
echo "Los archivos ya se encuentran visibles"
fi
;;
5)
clear && echo 'Por favor espere.' && sleep 0.$RANDOM && clear && echo 'Por favor espere..' && sleep 0.$RANDOM && clear && echo 'Por favor espere...' && sleep 0.$RANDOM && clear
$assets
cd ..
rm .ps
$assets
sh pass.sh
;;
3)
clear && echo 'Por favor espere.' && sleep 0.$RANDOM && clear && echo 'Por favor espere..' && sleep 0.$RANDOM && clear && echo 'Por favor espere...' && sleep 0.$RANDOM && clear

echo -e "\e[1;34mTiempo que desea mantenerlas visibles (en minutos): "
read timemath
TIME=$(($timemath*60))
if test -f "$FILE3"; then
$route
mv .$visible_folder_false $visible_folder_true
cd $visible_folder_true
for file in *.chk ; do mv -v $file ${file%.*}.jpg ; done
for file in *.cfg ; do mv -v $file ${file%.*}.mp4 ; done
cd /sdcard/Android/data/com.hider/files/.res/
rm -rf .hided
echo -e "\e[0;1mArchivos restaurados temporalmente"
else
echo -e "\e[0;1mLos archivos ya se encuentran visibles"
fi
sleep $TIME
if test -f "$FILE3"; then
echo -e "\e[0;1mLos archivos ya se encuentran ocultos"
else
$route
mv $visible_folder_true .$visible_folder_false
cd .$visible_folder_false
for file in *.jpg ; do mv -v $file ${file%.*}.chk ; done
for file in *.mp4 ; do mv -v $file ${file%.*}.cfg ; done
cd /sdcard/Android/data/com.hider/files/.res/
touch .hided
echo -e "\e[0;1mArchivos ocultos correctamente"
fi
;;
sdcard)
clear
echo -e "\e[1;31m   ***DEVELOPER OPTIONS***"
echo -e "\e[0;1m"
echo "   Cambiando ubicación a SDCARD"
$assets
cd ..
rm .rt
touch .rt
echo "cd /mnt/media_rw/3839-6331/Pictures/" > .rt
echo "OK"
echo "Toca enter para continuar..."
read enter
$assets
sh script.sh
;;
custhiderroute)
clear
$assets
cd ..
rm .rt
touch .rt
echo -e "\e[1;31m   ***DEVELOPER OPTIONS***"
echo -e "\e[0;1m"
echo "   Ruta personalizada de carpeta Hider:"
read custrt
echo "cd $custrt" > .rt
echo "OK"
;;
custfoldernames)
clear
$assets
cd ..
rm .vft
rm .vff
touch .vft
touch .vff
echo -e "\e[1;31m   ***DEVELOPER OPTIONS***"
echo -e "\e[0;1m"
echo "   Visible_Folder_True"
echo "   Folder name:"
read vftn
echo $vftn > .vft
echo ""
echo "   Visible_Folder_False"
echo "   Folder name:"
read vffn
echo $vffn > .vff
echo "OK"
;;
dev)
clear
echo -e "\e[1;31m   ***DEVELOPER OPTIONS***"
echo -e "\e[0;1m"
echo "   custfoldernames"
echo "   custhiderroute"
echo "   restore"
echo "   dir"
;;
restore)
clear
echo -e "\e[1;31m   ***DEVELOPER OPTIONS***"
echo -e "\e[0;1m"
echo -e "   Default settings restored"
$assets
cd ..
rm .vft
rm .vff
rm .rt
;;
dir)
clear
echo -e "\e[1;31m   ***DEVELOPER OPTIONS***"
echo -e "\e[0;1m"
$route
echo "   Visible: $(pwd)/$visible_folder_true"
echo ""
echo "   Invisible: $(pwd)/.$visible_folder_false"
echo ""
echo "   MagicFolder: $(pwd)"
echo ""
echo "   Configurations: $($assets && cd .. && pwd)"
;;
7)
clear
$assets
cat changelog.txt
;;
*)
clear
echo -e "\e[0mOpcion incorrecta, vuelva a intentarlo"
;;
esac

echo -e "\e[0m"
echo -e "Toca enter para continuar..."
read enter
$assets
sh script.sh
