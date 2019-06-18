echo "Configuring and building Thirdparty/DBoW2 ..."

cd Thirdparty/DBoW2
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DEIGEN3_INCLUDE_DIR=/home/old-ufo/dev/navigation-benchmark/3rdparty/eigen3_installed/include/eigen3/ -DCMAKE_INSTALL_PREFIX=/home/old-ufo/dev/navigation-benchmark/3rdparty/ORBSLAM2_installed 
make -j

cd ../../g2o

echo "Configuring and building Thirdparty/g2o ..."

mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DEIGEN3_INCLUDE_DIR=/home/old-ufo/dev/navigation-benchmark/3rdparty/eigen3_installed/include/eigen3/ -DCMAKE_INSTALL_PREFIX=/home/old-ufo/dev/navigation-benchmark/3rdparty/ORBSLAM2_installed 
make -j

cd ../../../

echo "Uncompress vocabulary ..."

cd Vocabulary
tar -xf ORBvoc.txt.tar.gz
cd ..

echo "Configuring and building ORB_SLAM2 ..."

mkdir build
cd build
cmake .. -DSaddle_DIR=/home/old-ufo/dev/navigation-benchmark/3rdparty/Saddle_SLAM/Thirdparty/saddle/src/ -DCMAKE_BUILD_TYPE=Release -DEIGEN3_INCLUDE_DIR=/home/old-ufo/dev/navigation-benchmark/3rdparty/eigen3_installed/include/eigen3/ -DCMAKE_INSTALL_PREFIX=/home/old-ufo/dev/navigation-benchmark/3rdparty/ORBSLAM2_installed 
make -j
