### Setting Erika's variables:
# ERIKA_FILES= ../../..
# APPBASE = .
#
# EEOPT =


RTDRUID_CONFIGURATOR_NUMBER:=1275



############################################################################
#
# User options
#
############################################################################
EEOPT += DEBUG
EEOPT += __ASSERT__
EEOPT += __OO_STARTOS_OLD__

############################################################################
#
# Automatic options
#
############################################################################
EEOPT += __X86__
EEOPT += __USE_UART__
EEOPT += __OO_BCC1__
EEOPT += __OO_EXTENDED_STATUS__
EEOPT += __MONO__
EEOPT += __OO_NO_ALARMS__
EEOPT += __OO_NO_RESOURCES__
EEOPT += __OO_AUTOSTART_TASK__
EEOPT += __ALLOW_NESTED_IRQ__
EEOPT += __DISABLE_EEOPT_DEFINES__


############################################################################
#
# Erika base directory
#
############################################################################
ifdef ERIKA_FILES
ifdef EEBASE
    $(warning EEBASE is set, but it has been overridden by ERIKA_FILES)
endif
EEBASE := $(ERIKA_FILES)

else # ERIKA_FILES

ifndef EEBASE
    EEBASE := /srv/scratch/hoffmann/erika/ee_git
else
        $(warning The usage of EEBASE is deprecated. Please use ERIKA_FILES)
endif
endif # ERIKA_FILES
# ERIKA_FILES has fulfilled its role. Make sure it's not used inside Erika makefiles
ERIKA_FILES :=


############################################################################
#
# Freescale S12
#
############################################################################
APPBASE := ..
OUTBASE := Debug

############################################################################
#
# Flags
#
############################################################################
CFLAGS  += -I. -ggdb
ASFLAGS +=
LDFLAGS +=
LDDEPS  +=
LIBS    +=



############################################################################
#
# Sources
#
############################################################################
APP_SRCS += eecfg.c $(APPBASE)/code.c


############################################################################
#
# end
#
############################################################################
include $(EEBASE)/pkg/cfg/rules.mk
