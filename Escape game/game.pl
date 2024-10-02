use List::Util qw(shuffle);
$attempt = 5;

@objects = ("chair","table","drawer","box","shelf","lamp","sofa","cabinet");

my @shuffled_objects = shuffle(@objects);

@inventory;

while($attempt > 0) {
    print "Search objects: ";
    $input = <STDIN>;
    $output = lc($input);
    chomp($input);
    
    my $key_object = $shuffled_objects[0];

    if($input eq $key_object[0]) {
        print "You found the key! You escaped the room!\n";
        $attempt = 0;
    }elsif($input eq "inventory"){
        if(scalar(@inventory) > 0) {
            print "@inventory\n";
        }else{
            print "Inventory empty\n";
        }
    }else{
        print "You search the ".$input." but find nothing.Try again\n";
    }
    $attempt--;
    push(@inventory,$shuffled_objects[0]);
    @shuffled_objects = grep { $_ ne $input} @shuffled_objects;

}
