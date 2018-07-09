use strict;
use warnings;
use utf8;
use JSON;
use YAML;

my $file = 'thankYou.csv';
my @data;

open(my $fh, '<', $file) or die "Can't read '$file' [$!]\n";
while (my $line = <$fh>) {
    chomp $line;
    my @fields = split(/,/, $line);
    push @data, \@fields;
}

my $json = JSON->new->utf8;
my @inner_hash;

for (my $i = 1; $i <= 30; $i++) {
    my $str->{'language'} = $data[$i][0];
    $str->{'item'} = $data[$i][1];
    $str->{'wow'} = $data[$i][2];
    $str->{'sound'} = $data[$i][3];
    $str->{'description'} = $data[$i][4];
    push @inner_hash, $str;
}

my $hash->{'count'} = scalar @data;
$hash->{'records'} = \@inner_hash;

print $json->encode($hash) . "\n";