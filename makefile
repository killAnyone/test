NDK_ROOT=/home/moon/workFolder/work_files/ndk/android-ndk-r18b

TOOLCHAINS_ROOT=$(NDK_ROOT)/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64 

TOOLCHAINS_PREFIX=$(TOOLCHAINS_ROOT)\bin\arm-linux-androideabi 

TOOLCHAINS_INCLUDE=$(TOOLCHAINS_ROOT)\lib\gcc\arm-linux-androideabi\4.9\include-fixed 

PLATFORM_ROOT=$(NDK_ROOT)\platforms\android-23\arch-arm 

PLATFORM_INCLUDE=$(PLATFORM_ROOT)\usr\include 

PLATFORM_LIB=$(PLATFORM_ROOT)\usr\lib 



MODULE_NAME=hello 

BUILD_TYPE=c 

PATH_ANDROID=/data/local/tmp/ 

RM=del 

FLAGS=-I$(TOOLCHAINS_INCLUDE) \ -I$(PLATFORM_INCLUDE) \ -L$(PLATFORM_LIB) \ -nostdlib \ -lgcc \ -Bdynamic \ -lc \ -pie -fPIE 

OBJS=$(MODULE_NAME).o \ $(PLATFORM_LIB)\crtbegin_dynamic.o \ $(PLATFORM_LIB)\crtend_android.o 

all: 
$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) -c $(MODULE_NAME).$(BUILD_TYPE) -o $(MODULE_NAME).o $(TOOLCHAINS_PREFIX)-gcc $(FLAGS) -S $(MODULE_NAME).$(BUILD_TYPE) -o $(MODULE_NAME).S $(TOOLCHAINS_PREFIX)-gcc $(FLAGS) $(OBJS) -o $(MODULE_NAME) 

clean: 
$(RM) *.o 

install: 
adb push $(MODULE_NAME) $(PATH_ANDROID) adb shell chmod 755 $(PATH_ANDROID)$(MODULE_NAME) adb shell $(PATH_ANDROID)$(MODULE_NAME)

