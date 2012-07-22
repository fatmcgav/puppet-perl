
define perl::cpan(

){
  exec{"cpan_load_${name}":
   command 	=> "perl -MCPAN -e '\$ENV{PERL_MM_USE_DEFAULT}=1; CPAN::Shell->install(\"${name}\")'",
   onlyif 	=> "test `perl -M${name} -e 'print 1' 2>/dev/null || echo 0` == '0'",
   require 	=> [Package[$perl::package],File["/root/.cpan/CPAN/MyConfig.pm"]],
  }
}