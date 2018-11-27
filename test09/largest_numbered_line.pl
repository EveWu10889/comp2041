#!/usr/bin/perl -w


my $max = 0;
#open my $f, "<", $ARGV[0];
while ($line = <STDIN>) {
   my @number = $line =~ /(-?(?:\d+(?:\.\d*)?|\.\d+))/g;


    #print @number;
    if (@number) {
		my $largest_num = (sort {$b <=> $a} @number)[0];
		push @numbers, $largest_num;
		#push @lines, $line;
	}
	push @lines, $line;
    
}

if (@numbers) {
    my $largest_number = (sort {$b <=> $a} @numbers)[0];
   # print $largest_number;
    foreach $word (@lines) {
    if ($word =~ /($largest_number).*?/) {
        print $word;
    } 

}
}






#print $numbers[0];
#print $array[0];

#foreach $word (@number) {
    #print $word;
    #$word =~ s/\.$//g;    
    #print $word;
    #@num = (split /[^0-9\.]+/, $word);
    #eval @num;
    #foreach $w (@num[1..$#num]) {
     #   print "$w\n";
    #}
    #eval @num;
    #print @num;
    #my $largest_number = (sort {$b cmp $a} @num)[0];
    #print $largest_number;
    #foreach $w (@num) {
     #   @n = (split /\s/, $w);
    #}
   # print "$largest_number\n";
#}
