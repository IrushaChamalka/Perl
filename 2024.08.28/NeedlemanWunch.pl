use List::Util qw(max);

$sequence1 = "ACGCTG";
$sequence2 = "CATGT";

#$sequence1 = "ACGTA";
#$sequence2 = "ACTG";

$match = 1;
$missmatch = -1;
$gap = -2;

@mainMatrix;
@matchCheckerMatrix;

my @char1 = split("",$sequence1);
my @char2 = split("",$sequence2);

for(my $i=0; $i < length($sequence1) ; $i++){
    for(my $j=0; $j < length($sequence2) ; $j++){
        if($char1[$i] eq $char2[$j]){
            $matchCheckerMatrix[$i][$j] = $match;
            #print ($char1[$i] , " " $char2[$j] , "\n");
            print (" ".$matchCheckerMatrix[$i][$j]." ");
        }else{
            $matchCheckerMatrix[$i][$j] = $missmatch;
            print ($matchCheckerMatrix[$i][$j]," ");
        }
    }
    print ("\n");
}
for(my $i=0; $i < length($sequence1) + 1 ; $i++){
    $mainMatrix[$i][0] = $i * $gap;
}

for(my $i=0; $i < length($sequence2) + 1 ; $i++){
    $mainMatrix[0][$i] = $i * $gap;
}

for(my $i=0; $i < length($sequence1) +1 ; $i++){
    for(my $j=0; $j < length($sequence2) + 1 ; $j++){
        $mainMatrix[$i][$j] = max(
            $mainMatrix[$i-1][$j] + $gap,
            $mainMatrix[$i][$j-1] + $gap,
            $mainMatrix[$i-1][$j-1] + $matchCheckerMatrix[$i-1][$j-1],
            );
            #print($mainMatrix[$i][$j]);

    }
}

for(my $i=0; $i < length($sequence1) ; $i++){
    for(my $j=0; $j < length($sequence2) ; $j++){
        print (" ",$mainMatrix[$i][$j]," ");
    }
    print("\n");
}

$aligned1 = "";
$aligned2 = "";

$ti = length($sequence1);
$tj = length($sequence2);

while($ti > 0 or $tj > 0){
    if($ti >0 and $tj >0 and $mainMatrix[$ti][$tj] == $mainMatrix[$ti-1][$tj-1] + $matchCheckerMatrix[$ti-1][$tj-1]){
        $aligned1 = $char1[$ti-1].aligned1;
        $aligned2 = $char2[$tj-1].aligned2;

        $ti = $ti-1;
        $tj = $tj-1;
    }elsif($ti > 0 and $mainMatrix[$ti][$tj] == $mainMatrix[$ti-1]+$gap){
        $aligned1 = $char1[$ti-1].$aligned1;
        $aligned2 = "-".$aligned2;
        $ti = $ti-1;
    }
    else{
        $aligned1 = "-".aligned1;
        $aligned2 = $char2[$ti-1].aligned2;
        $tj = $tj-1;
    }
}

print ($aligned1,"\n");
print ($aligned1,"\n");