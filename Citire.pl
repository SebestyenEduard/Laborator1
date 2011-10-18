use warnings;
open (FILE,"laborator.txt") or die $!;
$c = 0;
while ($line = <FILE>)
{
	@list = split(" ",$line);
	$c = $c + scalar(@list);
}
close(FILE);
print $c;
print "\n";
$info = "";
open (FILE,"ZteAutofindTelnet.log") or die $!;
while($line = <FILE>)
{
	if(substr($line,0,4) eq "gpon")
	{
		@list = split("/",$line);
		$info = $list[1];
		@list = split(":",$list[2]);
		$info = $info . " " . $list[0];
		@list = split("Z",$list[1]);
		$info = $info . " " . "Z";
		@list = split(" ",$list[1]);
		$info = $info . $list[0];
		print $info;
		print "\n";
		$info="";
	}
}
close(FILE);
