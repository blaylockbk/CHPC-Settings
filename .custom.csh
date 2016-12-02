#!/bin/tcsh


#ncview
module load ncview

# NCL
setenv NCARG_ROOT /uufs/chpc.utah.edu/common/home/u0553130/NCL
setenv PATH $NCARG_ROOT/bin:$PATH

# Matlab
module load matlab/R2014a	#Old Matlab
#module load matlab		#Defult Matlab

# Python
module load python/2.7.3
	  
	  
#---------------------------------------------------------------------------
# Do Ember specific initializations
if ($UUFSCELL == "ember.arches") then
	module load intel
#you can add custom module loads here
## DONT HAVE TO SOURCE THINGS. JUST USE 'module load' INSTEAD
        module load pgi
        module load mvapich2
#        source /uufs/chpc.utah.edu/sys/pkg/pgi/12.1_rh6/etc/pgi.csh
#        source /uufs/ember.arches/sys/pkg/mvapich2/1.7p/etc/mvapich2.csh

        module load perl
        setenv PERL5LIB /uufs/chpc.utah.edu/sys/pkg/perllib

        setenv NCARG_ROOT /uufs/chpc.utah.edu/sys/pkg/ncarg/std
        setenv PATH "/uufs/chpc.utah.edu/sys/pkg/ncarg/std/bin:$PATH"

        setenv NETCDF /uufs/chpc.utah.edu/sys/pkg/netcdf/std_pgi_rh6
        setenv LD_LIBRARY_PATH "/uufs/chpc.utah.edu/sys/pkg/netcdf/std_pgi_rh6/lib:$LD_LIBRARY_PATH"
#        setenv NETCDF /uufs/chpc.utah.edu/sys/pkg/netcdf/4.2.0i_rh6
#        setenv LD_LIBRARY_PATH "/uufs/chpc.utah.edu/sys/pkg/netcdf/4.2.0i_rh6/lib:$LD_LIBRARY_PATH"
#        setenv LD_LIBRARY_PATH "/uufs/chpc.utah.edu/sys/pkg/openmotif/std_rh6/lib64:$LD_LIBRARY_PATH"
        setenv MANPATH "$NETCDF/man:$MANPATH"

	
	# JASPER Library required for grib2 processing in WPS
	setenv JASPERLIB /uufs/chpc.utah.edu/sys/installdir/jasper/1.900.1-atmos07102015/lib
	setenv JASPERINC  /uufs/chpc.utah.edu/sys/installdir/jasper/1.900.1-atmos07102015/include
    echo "Loaded Ember Settings"

#---------------------------------------------------------------------------
# Do Kingspeak specific initializations
else if ($UUFSCELL == "kingspeak.peaks") then
	echo ""
	echo "==============================="
	echo "Hi Brian. Welcome to Kingspeak!"
	echo "==============================="
	echo ""
	#module load intel
#you can add custom module loads here
## DONT HAVE TO SOURCE THINGS. JUST USE 'module load' INSTEAD
	module load pgi
	module load mvapich2
#   module load netcdf-f
#	module load perl
	
	# My WRF Settings
    setenv NETCDF /uufs/chpc.utah.edu/sys/pkg/netcdf/std_pgi_rh6
	setenv WRF_EM_CORE 1
	setenv WRFIO_NCD_LARGE_FILE_SUPPORT 1
	setenv LD_LIBRARY_PATH "/uufs/chpc.utah.edu/sys/pkg/netcdf/std_rh6/lib:$LD_LIBRARY_PATH"
	setenv LD_LIBRARY_PATH "/uufs/chpc.utah.edu/sys/pkg/openmotif/std_rh6/lib64:$LD_LIBRARY_PATH"
	setenv MANPATH "$NETCDF/man:$MANPATH"
	
	setenv NCARG_ROOT /uufs/chpc.utah.edu/sys/pkg/ncarg/std
    setenv PATH "/uufs/chpc.utah.edu/sys/pkg/ncarg/std/bin:$PATH"
	
	# JASPER Library required for grib2 processing in WPS
	setenv JASPERLIB /uufs/chpc.utah.edu/sys/installdir/jasper/1.900.1-atmos07102015/lib
	setenv JASPERINC  /uufs/chpc.utah.edu/sys/installdir/jasper/1.900.1-atmos07102015/include


#---------------------------------------------------------------------------	
# Do meso1, 2, 3, 4 specific initializations
# (note: some of these settings don't load correctly for some reason...
# it's probably CHPC's fault. JK. I don't know what's going on.)
# Still, I'm having trouble compiling WRF on meso3 and meso4. Sometimes
# it works, other times it doesn't.
else if ($UUFSCELL == "hiddenarch.arches") then
	module load intel
#you can add custom module loads here
## DONT HAVE TO SOURCE THINGS. JUST USE 'module load' INSTEAD
	module load pgi
	module load mvapich2
#   module load netcdf-f
#	module load perl
	
	# My WRF Settings
        setenv NETCDF /uufs/chpc.utah.edu/sys/pkg/netcdf/std_pgi_rh6
	setenv WRF_EM_CORE 1
	setenv WRFIO_NCD_LARGE_FILE_SUPPORT 1
	setenv LD_LIBRARY_PATH "/uufs/chpc.utah.edu/sys/pkg/netcdf/std_rh6/lib:$LD_LIBRARY_PATH"
	setenv LD_LIBRARY_PATH "/uufs/chpc.utah.edu/sys/pkg/openmotif/std_rh6/lib64:$LD_LIBRARY_PATH"
	setenv MANPATH "$NETCDF/man:$MANPATH"
	
	setenv NCARG_ROOT /uufs/chpc.utah.edu/sys/pkg/ncarg/std
    setenv PATH "/uufs/chpc.utah.edu/sys/pkg/ncarg/std/bin:$PATH"
	
	# JASPER Library required for grib2 processing in WPS
	setenv JASPERLIB /uufs/chpc.utah.edu/sys/installdir/jasper/1.900.1-atmos07102015/lib
	setenv JASPERINC  /uufs/chpc.utah.edu/sys/installdir/jasper/1.900.1-atmos07102015/include


        # Note- I use the local python version on meso3 and meso4 and source
        # it in my .aliases file. I don't use the chpc version of python.
	
#---------------------------------------------------------------------------	
# Do Lonepeak specific initializations
else if ($UUFSCELL == "lonepeak.peaks") then
	module load intel
#you can add custom module loads here

#---------------------------------------------------------------------------
# Do Ash specific initializations
else if ($UUFSCELL == "ash.peaks") then
	module load intel
#you can add custom module loads here

#---------------------------------------------------------------------------
# Do Apex arch (HIPPA cluster) specific initializations
else if ($UUFSCELL == "apexarch.bridges") then
# set up custom prompt with HIPAA string
        set prompt="[%n@%m *HIPAA* %c]%#"   # command prompt
	module load intel
#you can add custom module loads here

#---------------------------------------------------------------------------
# Do astro.utah.edu specific initializations
else if ($UUFSCELL == "astro.utah.edu") then
#	module load intel
#you can add custom module loads here

#---------------------------------------------------------------------------
# Do cemi specific initializations
else if ($UUFSCELL == "cemi") then
#	module load intel
#you can add custom module loads here


#---------------------------------------------------------------------------
#---------------------------------------------------------------------------
endif
