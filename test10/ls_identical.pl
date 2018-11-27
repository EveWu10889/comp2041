#!/usr/bin/perl -w

#print $ARGV[0];
my @array_1;

my $dir_1 = "$ARGV[0]";
my $sub_file_1;
my @dir_1;

opendir (DIR, $dir_1) or die "can't open the directory!";
@dir_1 = readdir DIR;
foreach $sub_file_1 (@dir_1) {
    #print $sub_file_1;
    push (@array_1, "$sub_file_1");
} 

#print @array_1;

my @array_2;

my $dir_2 = "$ARGV[1]";
my $sub_file_2;
my @dir_2;

opendir (DIR, $dir_2) or die "can't open the directory!";
@dir_2 = readdir DIR;
foreach $sub_file_2 (@dir_2) {
    #print $sub_file_1;
    push (@array_2, "$sub_file_2");
} 

#print @array_2;
my @array;
for(my $i = 0; $i < @array_1; $i++) {
    for (my $j = 0; $j < @array_2; $j++){
        if($array_1[$i] eq $array_2[$j]) {
            push (@array,"$array_1[$i]");
        } 
    }
}
#print @array;


my @same;
for $file (@array) {
    #print "$dir_1/$file\n";
    open my $file_1, "<", "$dir_1/$file";
    my @file1;
    while ($line_1 = <$file_1>){
        #print $line;
        #chomp $line_1;
        push (@file1,"$line_1"); 
    }
    close $file_1;
    my @file2;
    open my $file_2, "<", "$dir_2/$file";
    #print "$dir_2/$file\n";
     while ($line_2 = <$file_2>){
        #print $line;
        #chomp $line_2;
        push (@file2,"$line_2"); 
    }
    close $file_2;
    #print @file1;
    my $count = 0;
    if (@file1 == @file2) {
        for(my $i = 0; $i < @file1; $i++) {
            if($file1[$i] eq $file2[$i]) {
                $count += 1;   
            }
        }
        if ($count == @file1) {
            if ($file ne "." && $file ne '..') {
                push(@same,"$file");
            }
        }
        
    }
    #print "hahaha\n";
    
}

#print "@same";

@sort = sort {$a cmp $b} @same;

for $name (@sort) {
    print "$name\n";
}



