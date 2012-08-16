
rubydir 	= /Users/hl1sqi/.rvm/rubies/ruby-1.9.2-p318/include/ruby-1.9.1/ruby
narraydir = /Users/hl1sqi/.rvm/gems/ruby-1.9.2-p318@rails3.2/gems/narray-0.6.0.1
archdir		= /Users/hl1sqi/.rvm/rubies/ruby-1.9.2-p318/include/ruby-1.9.1/x86_64-darwin11.4.0 
backdir 	= /Users/hl1sqi/.rvm/rubies/ruby-1.9.2-p318/include/ruby-1.9.1/ruby/backward 
rubiesdir = /Users/hl1sqi/.rvm/rubies/ruby-1.9.2-p318/include/ruby-1.9.1 

# /usr/local/include  
# /Users/hl1sqi/.rvm/usr/include 
INCFLAGS 	= -I. -I$(rubydir) -I$(narraydir) -I$(archdir) -I$(backdir) -I$(rubiesdir)

CCFLAGS		=	-fno-common -O3 -ggdb -Wextra -Wno-unused-parameter -Wno-parentheses -Wpointer-arith -Wwrite-strings -Wno-missing-field-initializers -Wshorten-64-to-32 -Wno-long-long  -fno-common -pipe

DEFS 			= -DHAVE_NARRAY_H -DHAVE_NARRAY_CONFIG_H -DHAVE_FFTW3_H -D_XOPEN_SOURCE -D_DARWIN_C_SOURCE   

# LDFLAGS 	= -Wl,-undefined,dynamic_lookup -Wl,-multiply_defined,suppress -Wl,-flat_namespace  

CC 				= /usr/bin/gcc-4.2

LIBPATH		= -L. -L/Users/hl1sqi/.rvm/rubies/ruby-1.9.2-p318/lib -L/usr/local/lib -L/Users/hl1sqi/.rvm/gems/ruby-1.9.2-p318@rails3.2/gems/narray-0.6.0.1 -L/Users/hl1sqi/.rvm/usr/lib 

LIBS			= -lruby.1.9.1 -lpthread -ldl -lobjc -lfftw3  

all: fftw_raw.o 
	$(CC) -o fftw_raw $< $(LDFLAGS) $(LIBPATH) $(LIBS)

fftw_raw.o: fftw_raw.c Makefile
	$(CC) $(CCFLAGS) $(DEFS) $(INCFLAGS) -o $@ -c $< 
	
.PHONY: all clean
	
clean:
	rm *.o


# $(LDSHARED) -o $@ $(OBJS) $(LIBPATH) $(DLDFLAGS) $(LOCAL_LIBS) $(LIBS)


# -dynamic -bundle 


