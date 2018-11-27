#!/usr/bin/perl -w
#use File::Copy qw(move); 

#********************<init>**************************
$c = 1;
if ($ARGV[0] eq "init") {
    foreach $file (glob ".legit") {
        if (-e $file) {
            print "legit.pl: error: .legit already exists\n";
        } else {
            mkdir ".legit";
            print "Initialized empty legit repository in .legit\n"; 
        }
    }
   
}

#********************<add>**************************

if ($ARGV[0] eq "add") {
    #$count = @ARGV;
    #print "$count\n";
    if (!(-e ".legit")) {
        print "legit.pl: error: no .legit directory containing legit repository exists\n";
        exit;
    
    }
    mkdir ".legit/tem";
    foreach $f (@ARGV[1..$#ARGV]) {
        #mkdir ".legit/$f";
        #print "$f\n";
        $source = ".legit/tem/$f";
        if (!(-e $f)) {
            if (!(-e $source)) {
                print "legit.pl: error: can not open '$f'\n";
                exit;         
            } else {
                 my $dir = ".legit/tem/$f$c"; 
                 my $file; 
                 my @dir;

                opendir (DIR, $dir) or die "can't open the directory!"; 
                @dir = readdir DIR; 
                foreach $file (@dir) {
                    if ($file =~ /[a-z]/) {
                        $file =~ s/[0-9]+//;
                        my $var = 0;
                        my $new = ".legit/tem/$file$c/$file$var";
                        while (-e $new) {
                            $var++;
                            $new = ".legit/tem/$file$c/$file$var";            
                        } 
                        #print "new: $new\n";   
                        $origin_file = ".legit/tem/$file";   
                        open my $empty_file, ">", "$origin_file";
                        #my $input = "hello";
                        #print "hello!!!!";
                        print $empty_file "hello";
                        close $empty_file;
                        open my $print_empty, ">", "$new";
                        open my $read_empty, "<", "$origin_file";
                        
                        print $print_empty (<$read_empty>);
                        
                     }
                 } 
            }
            
        } else {           
            #if (!(-z "$f")) {
                #print "empty!!!!";
                open my $in, "<", $f;
                open my $out, ">", ".legit/tem/$f";
                print $out (<$in>);
            #} else {
                #print "empty!!!!";
             #   open my $out, ">", ".legit/tem/$f";
              #  print $out "empty";
            
            
             #  open my $empty_file, ">", "$f";
              # #my $input = "hello";
               #print $empty_file "hello";
               #close $empty_file;
               #open my $print_empty, ">", "$new";
               #open my $read_empty, "<", "$origin_file";
                        
               #print $print_empty (<$read_empty>); 
            #}
             
        }
    }
    
    my $dir = ".legit/tem"; 
    my $file; 
    my @dir;

    opendir (DIR, $dir) or die "can't open the directory!"; 
    @dir = readdir DIR; 
    foreach $file (@dir) { 
        if ( $file =~ /^[a-z]$/) {
            #print "$file\n"; 
            mkdir ".legit/tem/$file$c";
            
            my $var = 0;
            $new = ".legit/tem/$file$c/$file$var";
            while (-e $new) {
                $var++;
                $new = ".legit/tem/$file$c/$file$var";            
            }
        #mkdir $new;                                                
                    #print "$file\n";
                    open my $out, ">", "$new";
                    open my $in, "<", ".legit/tem/$file";
                    print $out (<$in>);
                    
                    #print "Backup of '$ARGV[0]' saved as '$new'\n";
                   
                
            }
         }
        
   }
    
#********************<commit>**************************
my @check;
$flag = 0;
my $count = 0;
my @array;
if ($ARGV[0] eq "commit") { 
    mkdir ".legit/commit";  
    
    #********************commit -m**************************
    
    if ($ARGV[1] eq "\-m" ) { 
        
        open my $out, ">>", ".legit/commit/commit_file$c";
        print $out "$ARGV[2]\n"; 
        close $out;
        
        #push (@array, $ARGV[2]);               
        #print "Committed as commit $#array\n";
        #if (-e) {
        
        #}
        my $check_dir = ".legit/commit"; 
        my $check_file; 
        my @check_dir; 
        my @check_file;       
        opendir (DIR, $check_dir) or die "can't open the directory!"; 
        @check_dir = readdir DIR; 
        foreach $check_file (@check_dir) {
            if ($check_file =~ /^[a-z][0-9]+$/) {
                $check_file =~ s/[0-9]+$//;
                #print "check $check_file\n";
                push (@check_file, "$check_file");                
            }
        
        }
        
        #for (my $i = 0; $i < @check_file; $i ++) {
         #   for (my $j = 0; $j < @check_file; $j ++) {
          #      if ($check_file[$j] ne $check_file[$i]) {
           #         push @new_check;
            #    }
            #}
        #}
        
        foreach $check_f (@check_file) {
            if(!(-e ".legit/tem/$check_f")) {
                $flag = 0;
                push (@check, "$flag");
            } else {
                if (!(-e ".legit/tem/$check_f$c")) {
                     open my $empty_f, ">", ".legit/tem/$check_f";
                     print $empty_f "no directory";
                     close $empty_f;
                } #else {
                   # my $rm_DIR = ".legit/tem/$check_f$c"; 
                    #my @rm_DIR; 
                #opendir (DIR, $rm_DIR) or die "can't open the directory!"; 
                 #   @rm_DIR = readdir DIR;
                  #  if (@rm_DIR = 2){
                   #     open my $empty_f, ">", ".legit/tem/$check_f";
                    #    print $empty_f "no files inside directory";
                     #   close $empty_f;
                     #}
                #}
            }
        }
        
        #***commit nothing***       
        my $dir = ".legit/tem"; 
        my $file; 
        my @dir;        
        opendir (DIR, $dir) or die "can't open the directory!"; 
        @dir = readdir DIR; 
        foreach $file (@dir) {
            
            if ( $file =~ /^[a-z]$c$/) {
                #print "$file";
                my $sub_dir = ".legit/tem/$file";
                my $sub_file; 
                my @sub_dir;        
                opendir (DIR, $sub_dir) or die "can't open the directory!"; 
                @sub_dir = readdir DIR;
                $max = 0;
                foreach $sub_file (@sub_dir){
                    $num = $sub_file;
                    if ($num =~ /[0-9]+/) {
                        $num =~ s/[a-z]+//;
                        #print $num; 
                    }
                    #print "$num";
                    if ($num gt $max) {
                        $max = $num;
                    }
                
                }
                #print "***$max\n";
                $file =~ s/[0-9]+//g;                               
                  
                #print $file;
                    
                 $var = 0;
                 my $new_file = ".legit/commit/$file$var";
                 while (-e $new_file) {
                    $var ++;
                    $new_file = ".legit/commit/$file$var";
                
                 } 
                 
                 if (-e ".legit/tem/$file$c/$file$max"){
                    open my $in, "<", ".legit/tem/$file$c/$file$max";               
                    open my $out, ">", "$new_file"; 
                    print $out (<$in>);
                    close $out;
                    close $in; 
                } else {
                    open my $output, ">", ".legit/tem/$file"; 
                    print $output "$ARGV[2]"; 
                    close $output;
                    open my $in, "<", ".legit/tem/$file";             
                    open my $out, ">", "$new_file"; 
                    print $out (<$in>);
                    close $out;
                    close $in; 
                
                }
                #print "*****var1: $var******\n";
                
                
                if ($var ne 0) {
                    #print "*****$var******\n";
                    my @new_array;
                    my @old_array;
                    
                    #print "*****$new_file******\n";
                    open my $rec, "<", "$new_file";
                    $var -= 1;
                    my $old_file = ".legit/commit/$file$var";
                    
                    if (-z "$old_file") {
                           #print "world\n";
                        if (-z "$new_file") {
                           $flag = 1;
                           push (@check, "$flag");
                         } else {
                           $flag = 0;
                           push (@check, "$flag");
                         }
                    }
                    
                    #print "*****$old_file******\n";
                    open my $pre, "<", "$old_file"; 
                    
                    #print "hello\n";
                    
                    while ($new_line = <$rec>){
                        chomp $new_line;
                        #print "hello\n";
                        push (@new_array,"$new_line");
                    }
                    #print @new_array;
                    while ($old_line = <$pre>){
                        chomp $old_line;
                        #print "$old_line\n";
                        push (@old_array,"$old_line");
                    } 
                    #print @old_array;
                    if (@old_array == @new_array) {
                        #print "same number!!!!\n";
                        for(my $i = 0; $i < @new_array; $i++) {
                            if($new_array[$i] eq $old_array[$i]) {
                                    $flag = 1;
                                    #print "same!!!!";
                                
                            } else {
                                #print "not same!!!!";
                                $flag = 0;
                                last;
                            }
                            
                            #print "****$flag*****\n";
                            #last;
                        }
                    } else {
                        #print "not same ahhah!!!!";
                        $flag = 0;
                    }
                   
                   
                        push (@check, "$flag");
                        #print "same number!!!!";
                        #print "nothing to commit\n";
                        #my @counter;
                        #print "****check:@check*****\n";
                      
                            
                     
                    #print "var1:$var\n";
                }
                #print "var2:$var\n";
                                                                  
                
            } 
                                                           
        }
        #***************revise for file name
        #print "******var2: $var!!!********\n";
        
        #*************************check!!****************************8
        $file = ".legit/commit/a$c";
        
        if (-e $file) { 
            #print "******not equal 0!!!********\n";
            my $count = -1;
            #print "******check!!!********\n";
            #print @check;
            if (@check) {                                            
                foreach $state (@check) {
                    if ($state == 1) { 
                        $count ++;    
                    }        
                 } 
                #print "******count:$count!!!********\n";
                #print "******check: $#check!!!*****\n";
                if ($count == $#check) {
                    open my $in, "<", ".legit/commit/commit_file$c";
                    open my $output, ">", ".legit/commit/commit_file";
                    while ($out_line = <$in>) {
                        if ($out_line !~ /$ARGV[2]/) {
                            #print "*****out_line:$out_line*****\n";
                            print $output "$out_line";
                        }
                    }
                    close $in;
                    close $output;
                    open my $print_in, "<", ".legit/commit/commit_file";
                    open my $print_out, ">", ".legit/commit/commit_file$c";                                       
                    print $print_out (<$print_in>);
                    print "nothing to commit\n";
                    exit;
                }
            }
        } 

        open my $in, "<", ".legit/commit/commit_file$c";
        open my $output, ">", ".legit/commit/commit_file";    
        
        #print "***word*****";
        print $output (<$in>);
        
        foreach $wd (<$in>) {
            #print "***word*****";
            print "$wd\n";
        }                        
            
        close $output;                    

        open my $f_out, "<", ".legit/commit/commit_file";
        while ($line = <$f_out>) {        
                $count++;        
        }
        #open my $f_log
        $count -= 1;
        print "Committed as commit $count\n";
        open my $print_out, ">>", ".legit/commit/commit_file$c";
        open my $count_out, ">>", ".legit/commit/commit_file";
        
        $count += 1;
        print $print_out "$count ";
        print $count_out "$count ";
              
    }    

    #********************commit -a**************************
    #add
    if ($ARGV[1] eq "\-a" ) {
        if (!(-e ".legit")) {
            print "legit.pl: error: no .legit directory containing legit repository exists\n";
            exit;
        
        }
        mkdir ".legit/tem";
        my @files;
        my $dir = "."; 
        my $file; 
        my @dir;        
        opendir (DIR, $dir) or die "can't open the directory!"; 
        @dir = readdir DIR; 
        foreach $file (@dir) {
            if ( $file =~ /^[a-z]$/) {
                #print "*****$file******\n";
                push (@files,$file);
            }            
        }
        
        foreach $f (@files[0..$#files]) {
            #print "****$f****";
            open my $in, "<", "$f";
            open my $out, ">", ".legit/tem/$f";
            print $out (<$in>);             
        }
        
        my $dir1 = ".legit/tem"; 
        my $f; 
        my @dir1;

        opendir (DIR, $dir1) or die "can't open the directory!"; 
        @dir1 = readdir DIR; 
        foreach $f (@dir) { 
            if ( $f =~ /^[a-z]$/) {
                #print "$file\n"; 
                mkdir ".legit/tem/$f$c";
                
                my $var = 0;
                $new = ".legit/tem/$f$c/$f$var";
                while (-e $new) {
                    $var++;
                    $new = ".legit/tem/$f$c/$f$var";            
                }
            #mkdir $new;                                                
                        #print "$file\n";
                        open my $out, ">", "$new";
                        open my $in, "<", ".legit/tem/$f";
                        print $out (<$in>);
                        
                        #print "Backup of '$ARGV[0]' saved as '$new'\n";
                       
                    
                }
             }
             
    #commit
    open my $out, ">>", ".legit/commit/commit_file$c";
        print $out "$ARGV[3]\n"; 
        close $out;
        
        #push (@array, $ARGV[2]);               
        #print "Committed as commit $#array\n";
    

        #***commit nothing***       
        my $dir2 = ".legit/tem"; 
        my $F; 
        my @dir2;        
        opendir (DIR, $dir2) or die "can't open the directory!"; 
        @dir2 = readdir DIR; 
        foreach $F (@dir2) {
            
            if ( $F =~ /^[a-z]$c$/) {
                #print "$file";
                my $sub_dir = ".legit/tem/$F";
                my $sub_file; 
                my @sub_dir;        
                opendir (DIR, $sub_dir) or die "can't open the directory!"; 
                @sub_dir = readdir DIR;
                $max = 0;
                foreach $sub_file (@sub_dir){
                    $num = $sub_file;
                    if ($num =~ /[0-9]+/) {
                        $num =~ s/[a-z]+//;
                        #print $num; 
                    }
                    #print "$num";
                    if ($num gt $max) {
                        $max = $num;
                    }
                
                }
                #print "***$max\n";
                $F =~ s/[0-9]+//g;                               
                  
                #print $file;
                    
                 $var = 0;
                 my $new_file = ".legit/commit/$F$var";
                 while (-e $new_file) {
                    $var ++;
                    $new_file = ".legit/commit/$F$var";
                
                 } 
                open my $in, "<", ".legit/tem/$F$c/$F$max";               
                open my $out, ">", "$new_file"; 
                print $out (<$in>);
                close $out;
                close $in; 
                #print "*****var1: $var******\n";
                
                
                if ($var ne 0) {
                    #print "*****$var******\n";
                    my @new_array;
                    my @old_array;
                    
                    #print "*****$new_file******\n";
                    open my $rec, "<", "$new_file";
                    $var -= 1;
                    my $old_file = ".legit/commit/$F$var";
                    #print "*****$old_file******\n";
                    open my $pre, "<", "$old_file"; 
                    while ($new_line = <$rec>){
                        chomp $new_line;
                        #print "$new_line\n";
                        push (@new_array,"$new_line");
                    }
                    while ($old_line = <$pre>){
                        chomp $old_line;
                        #print "$old_line\n";
                        push (@old_array,"$old_line");
                    } 
                    
                    if (@old_array == @new_array) {
                        #print "same number!!!!\n";
                        for(my $i = 0; $i < @new_array; $i++) {
                            if($new_array[$i] eq $old_array[$i]) {
                                    $flag = 1;
                                    #print "same!!!!";
                                
                            } else {
                                #print "not same!!!!";
                                $flag = 0;
                                last;
                            }
                            
                            #print "****$flag*****\n";
                            #last;
                        }
                    } else {
                        #print "not same ahhah!!!!";
                        $flag = 0;
                    }
                   
                   
                        push (@check, "$flag");
                        #print "same number!!!!";
                        #print "nothing to commit\n";
                        #my @counter;
                        #print "****check:@check*****\n";
                      
                            
                     
                    #print "var1:$var\n";
                }
                #print "var2:$var\n";
                                                                  
                
            } 
        }                                                  
        
        #***************revise for file name
        #print "******var2: $var!!!********\n";
        
        #*************************check!!****************************8
        $file = ".legit/commit/a$c";
        
        if (-e $file) { 
            #print "******not equal 0!!!********\n";
            my $count = -1;
            #print "******check!!!********\n";
            #print @check;
            if (@check) {                                            
                foreach $state (@check) {
                    if ($state == 1) { 
                        $count ++;    
                    }        
                 } 
                #print "******count:$count!!!********\n";
                #print "******check: $#check!!!*****\n";
                if ($count == $#check) {
                    open my $in, "<", ".legit/commit/commit_file$c";
                    open my $output, ">", ".legit/commit/commit_file";
                    while ($out_line = <$in>) {
                        if ($out_line !~ /^$ARGV[2]$/) {
                            #print "*****out_line:$out_line*****\n";
                            print $output "$out_line";
                        }
                    }
                    close $in;
                    close $output;
                    open my $print_in, "<", ".legit/commit/commit_file";
                    open my $print_out, ">", ".legit/commit/commit_file$c";                                       
                    print $print_out (<$print_in>);
                    print "nothing to commit\n";
                    exit;
                }
            }
        } 

        open my $in, "<", ".legit/commit/commit_file$c";
        open my $output, ">", ".legit/commit/commit_file";    
        
        #print "***word*****";
        print $output (<$in>);
        
        foreach $wd (<$in>) {
            #print "***word*****";
            print "$wd\n";
        }                        
            
        close $output;                    

        open my $f_out, "<", ".legit/commit/commit_file";
        while ($line = <$f_out>) {        
                $count++;        
        }
        #open my $f_log
        $count -= 1;
        print "Committed as commit $count\n";
        open my $print_out, ">>", ".legit/commit/commit_file$c";
        open my $count_out, ">>", ".legit/commit/commit_file";
        
        $count += 1;
        print $print_out "$count ";
        print $count_out "$count ";
          
    }
}

#********************<log>**************************

if ($ARGV[0] eq "log") {
    my @words;
    open my $l_out, ">>", ".legit/log";
    print $l_out "0 "; 
    
    open my $f_read , "<", ".legit/commit/commit_file";
    #open my $l2_out, ">>", ".legit/log";
    while ($line = <$f_read>) {
       if ($line =~ /[a-zA-Z]+/) {
            print $l_out $line; 
        }    
    }  
    close $l_out;
    open my $print_out, "<", ".legit/log"; 
    foreach $line  (<$print_out>) {        
        push (@words,$line);
    }
    close $print_out;
    
    #print @words;
    #foreach $word (@array[$#array..0]) {
     #   print $word;
    
    #}
    open my $print_in, "<", ".legit/log";
    open my $rewrite, ">>", ".legit/log1"; 
    while(@words) {
        $word = pop @words;
        print $rewrite "$word";
    }
    close $rewrite;
    
    open my $cat, "<", ".legit/log1";
    while($lines = <$cat>) {
        print $lines;  
    }
    
    
    #pop @words;
}

#********************<show>**************************

if ($ARGV[0] eq "show") {
    mkdir ".legit/show";
    my @files;
        my $dir = ".legit/commit"; 
        my $file; 
        my @dir;        
        opendir (DIR, $dir) or die "can't open the directory!"; 
        @dir = readdir DIR; 
        foreach $file (@dir) {
          if ($file !~ /commit_file/) {
            if ( $file =~ /^[a-z]0$/) {
                #print "*****$file******\n";
                push (@files,$file);
                open my $in, "<", ".legit/commit/$file";
                open my $out, ">", ".legit/show/$file";
                print $out (<$in>);
                close $in;
                close $out;
            } else {            
             if ($file =~ /^([a-z])([1-9][0-9]*)$/ && $file !~ /commit_file1/) {
                    $name = $1;
                    $digit = $2;
                    #print "xxxxxxxxname: $name\n";
                    #print "xxxxxxxxdigit: $digit\n";

                    my $rec_file = ".legit/commit/$name$digit";
                    $digit -= 1;
                    my $pre_file = ".legit/commit/$name$digit";
                    
                    my @rec_array;
                    my @pre_array;
                    my $flag = 0;
                                        
                    open my $rec, "<", "$rec_file";
                    open my $pre, "<", "$pre_file"; 
                    while ($rec_line = <$rec>){
                        chomp $rec_line;                
                        push (@rec_array,"$rec_line");
                    }
                    while ($pre_line = <$pre>){
                        chomp $pre_line;
                        #print "$old_line\n";
                        push (@pre_array,"$pre_line");
                     } 
                        
                     if (@pre_array == @rec_array) {
                            #print "same number!!!!\n";
                        for(my $i = 0; $i < @rec_array; $i++) {
                            if($rec_array[$i] eq $pre_array[$i]) {
                                $flag = 1;
                                #print "same!!!!";
                                    
                             } else {
                                #print "not same!!!!";
                                $flag = 0;
                                last;
                             }
                                
                                #print "****$flag*****\n";
                                #last;
                         }
                      } else {
                        #print "not same ahhah!!!!";
                        $flag = 0;
                      }
                      push (@check, "$flag");
                      
                      if ($flag == 0) {                        
                        my $dir1 = ".legit/show"; 
                        my $file1; 
                        my @dir1;        
                        opendir (DIR, $dir1) or die "can't open the directory!"; 
                        @dir1 = readdir DIR; 
                        my $max = 0;
                        foreach $file1 (@dir1) { 
                            $num = $file1;
                            if ($num =~ /[0-9]+/) {
                                $num =~ s/[a-z]+//;
                                #print $num; 
                            }
                            #print "$num";
                            if ($num gt $max) {
                                $max = $num;
                            }   
                        }
                        
                        $digit = $max + 1;
                       
                        if (!(-e ".legit/show/$name$digit")) {
                            open my $input, "<", "$rec_file";
                            open my $output, ">", ".legit/show/$name$digit";
                            print $output (<$input>);
                            close $input;
                            close $output;
                        }
                        
                     }
                }             
            }           
        }
       }
       
       #$log_file = ".legit/log1";
       open my $f, "<", ".legit/commit/commit_file1";
       while ($max_num = <$f>) {
            if($max_num =~ /^(\d+)/) {
                $max_num = $1;
                last;
            }
             
            #print "*********$max_num";
            
       }
       #print "xxxxx$max_num";
        my @tem_file;
        my $tem_dir = ".legit/tem"; 
        my $tem_file; 
        my @tem_dir; 
              
        opendir (DIR, $tem_dir) or die "can't open the directory!"; 
        @tem_dir = readdir DIR; 
        foreach $tem_file (@tem_dir) {
            if ($tem_file =~ /([a-z])/) {
                $tem_name = $1;
                push (@tem_file, "$tem_name");                
            }
        }
       
        #my @show_file;
        my $show_dir = ".legit/show"; 
        my $show_file; 
        my @show_dir; 
        my $exist = -1;    
          
        opendir (DIR, $show_dir) or die "can't open the directory!"; 
        @show_dir = readdir DIR; 
        foreach $show_file (@show_dir) {
            foreach $f (@tem_file) {
                if ($show_file =~ /$f$max_num/) {
                    $exist ++;
                }
            }
        }
        
        if ($exist != $#tem_file) {
            foreach $f (@tem_file) {
                if (!(-e ".legit/show/$f$max_num")) {
                   open $show_in, "<", ".legit/tem/$f";
                   open $show_out, ">", ".legit/show/$f$max_num";
                   print $show_out (<$show_in>);  
                }             
             }                       
         }
        
        
       
    if ($ARGV[1] =~ /(\d+):(\w+)/) {
        #print "$1  $2\n";
        #print "hello";
        $digit = $1;
        $directory = $2;
        
        my $rm_dir = ".legit/tem"; 
        my $rm_file; 
        my @rm_dir;
        my $rm_count = 0;
        
        opendir (DIR, $rm_dir) or die "can't open the directory!"; 
        @rm_dir = readdir DIR; 
  
        foreach $rm_file (@rm_dir) {
            if ($rm_file =~ /$directory/) {
                $rm_count ++;
            }                   
        }
            if ($rm_count == 0) {
                if (!(-e ".legit/commit/$directory$digit")) {
                     print "legit.pl: error: '$directory' not found in commit $digit\n";
            exit; 
                }
            
            }
        
        my $dir = ".legit/show"; 
        my $file; 
        my @dir;
        
        #if (!(-e $dir)) {
         #   print "legit.pl: error: '$directory' not found in commit $digit\n";
          #  exit;
        #} else {
         #   if(!(-e ".legit/tem/$directory$c/$directory$digit")) {
          #      print "legit.pl: error: unknown commit '$digit'\n";
           #     exit;
            
            #}
        #}
        
        opendir (DIR, $dir) or die "can't open the directory!"; 
        @dir = readdir DIR; 
        my $count_word = 0;
        my $count_digit = 0;
        foreach $file (@dir) {
            if ($file =~ /$directory/) {
                $count_word ++;
                if ($file =~ /$digit/) {
                    $count_digit ++;
                }
            }
                        
            if ( $file =~ /$directory$digit/) {
                #print "$file";
                open my $in, "<", ".legit/show/$directory$digit";
                while ($line = <$in>){
                   print $line;
                } 
            } 
            
        }
        if ($count_word == 0) {
            print "legit.pl: error: '$directory' not found in commit $digit\n";
            exit; 
        }
        if ($count_digit == 0) {
            print "legit.pl: error: unknown commit '$digit'\n";
            exit;
        }
            
             
    } elsif ($ARGV[1] =~ /:(\w+)/) {
            #print "bad";
            
            $file = $1;
            if (!(-e $file)) {
                print "legit.pl: error: '$file' not found in index\n";
                exit;
            }
            if (-e ".legit/tem/$file") {
                open my $in, "<", ".legit/tem/$file";
                while ($line = <$in>) {
                    print $line; 
                }
            } else {
                print "legit.pl: error: '$file' not found in index\n";
            }
            
            

        }
}



#********************<rm>**************************

if ($ARGV[0] eq "rm") {
   if ($ARGV[1] eq "\-\-cached") {
    foreach $f (@ARGV[2..$#ARGV]) {
        $F = ".legit/tem/$f";
        system ("rm $F");
        #$var = 0;
        my $dir = ".legit/tem"; 
        my $file; 
        my @dir;        
        opendir (DIR, $dir) or die "can't open the directory!"; 
        @dir = readdir DIR; 
        foreach $file (@dir) {  
            #print $file;
            if ($file =~ /^$f$c$/) {               
                #print "$file\n";
                #my $dir2 = ".legit/tem/$file"; 
                #my $F; 
                #my @dir2; 
                #opendir (DIR, $dir2) or die "can't open the directory!"; 
                #@dir2 = readdir DIR; 
                #foreach $F (@dir2) {
                $source = ".legit/tem/$file";
                system ("rm -rf $source");
                    #print "$F\n";
                #}
                #if (rmdir ".legit/tem/file") {
                 #   print "hello\n";
                #}
            }
        }
        #unlink glob ".legit/tem/$f";
    }
   } else {
        my $max = 0;
        my $rm_file = $ARGV[1];
        my $RM_file = $rm_file;
        my $RM_dir = ".legit/commit"; 
        my @RM_dir; 
        #$RM_count = 0;       
        opendir (DIR, $RM_dir) or die "can't open the directory!"; 
        @RM_dir = readdir DIR; 
        foreach $f (@RM_dir) { 
            if($f =~ /^$rm_file[0-9]+$/) {
               $f =~ s/[a-z]+// ;
               $num = $f; 
               if ($num gt $max) {
                   $max = $num;
               }  
            }         
         }      
        
        my @new_array;
        my @old_array;

        open my $re_file, "<", ".legit/commit/$rm_file$max";
        open my $wo_file, "<", "$rm_file"; 
        while ($new_line = <$re_file>){
            chomp $new_line;
            push (@new_array,"$new_line");
        }
        while ($old_line = <$wo_file>){
            chomp $old_line;
            push (@old_array,"$old_line");
        } 
        if (@old_array == @new_array) {
            for(my $i = 0; $i < @new_array; $i++) {
                if($new_array[$i] eq $old_array[$i]) {
                    
                    $flag = 1;

                 } else {
                    #print "not same!!!!";
                    $flag = 0;
                    last;
                 }

              }
          } else {
              #print "not same ahhah!!!!";
              $flag = 0;
          }
          push (@check, "$flag");
          
          my @index_array;
          my $index_dir = ".legit/tem/$rm_file"; 
          open my $index_file, "<", "$index_dir";
          while ($index_line = <$index_file>){
            chomp $index_line;
            push (@index_array,"$index_line");
          }
          
          if (@index_array == @new_array) {
            for(my $i = 0; $i < @index_array; $i++) {
                if($index_array[$i] eq $new_array[$i]) {
                    
                    $flag = 1;

                 } else {
                    #print "not same!!!!";
                    $flag = 0;
                    last;
                 }

              }
          } else {
              #print "not same ahhah!!!!";
              $flag = 0;
          }
          push (@check, "$flag");
          
          my @cur_array;
          open my $cur_file, "<", "$rm_file";
          while ($cur_line = <$cur_file>){
            chomp $cur_line;
            push (@cur_array,"$cur_line");
          }
          
          if (@index_array == @cur_array) {
            for(my $i = 0; $i < @cur_array; $i++) {
                if($index_array[$i] eq $cur_array[$i]) {
                    
                    $flag = 1;

                 } else {
                    #print "not same!!!!";
                    $flag = 0;
                    last;
                 }

              }
          } else {
              #print "not same ahhah!!!!";
              $flag = 0;
          }
          push (@check, "$flag");
          
            
          if ($check[0] == 0) {
            if ($check[2] == 0) {
               if ($check[1] == 0) {
                    print "legit.pl: error: '$rm_file' in index is different to both working file and repository\n";
                    
                    exit;
               } 
            print "legit.pl: error: '$rm_file' in repository is different to working file\n";
            
            exit;
          
          }
            print "legit.pl: error: '$rm_file' has changes staged in the index\n";       
            exit;
          } #else {
            #print "legit.pl: error: '$rm_file' has changes staged in the index\n";       
            # exit;
          
          #}
            my $rm_dir = ".legit/tem"; 
            my @rm_dir; 
            $rm_count = 0;       
            opendir (DIR, $rm_dir) or die "can't open the directory!"; 
            @rm_dir = readdir DIR; 
            foreach $file (@rm_dir) {  
                #print $rm_file;
                if ($file =~ /$rm_file/) {
                    $rm_count += 1;               
                }
            }
            if ($rm_count == 0) {
                print "legit.pl: error: '$rm_file' is not in the legit repository\n";
                exit;
            } #elsif ($rm_count == 2) {
                #my $rm_DIR = ".legit/tem/$rm_file$c"; 
                #system ("rm -rf $rm_DIR");
                #my @rm_DIR; 
                ##$rm_count = 0;       
                #opendir (DIR, $rm_DIR) or die "can't open the directory!"; 
                #@rm_DIR = readdir DIR;
               
                 #   foreach $F (@rm_DIR) {
                  #      #print "F: $F\n";
                   #     if ($F ne "." && $F ne "..") {
                    #        $rm_source = ".legit/tem/$rm_file$c/$F";
                     #       system ("rm $rm_source");                    
                      #  }
                     
                    #}
                   # print "legit.pl: error: '$rm_file' has changes staged in the index\n";       
                   # exit;
                    
                #} 
                
                
            #my $RM_file = $rm_file;
            #my $RM_dir = ".legit/tem/$RM_file$c"; 
            #my @RM_dir; 
            #$RM_count = 0;       
            #opendir (DIR, $RM_dir) or die "can't open the directory!"; 
            #@RM_dir = readdir DIR; 
            #foreach $f (@RM_dir) { 
            #    $f =~ s/[a-z]+// ;
            #    $num = $f;
            #            if ($num =~ /[0-9]+/) {
            #                $num =~ s/[a-z]+//;
            #                #print $num; 
            #            }
            #            #print "$num";
            #            if ($num gt $max) {
            #                $max = $num;
            #            }
                    
            
            #}
           
                         
   }

}











