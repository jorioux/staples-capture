Param (
   [Parameter(Mandatory=$true)]
   [string]$ContainerID
)

$ErrorActionPreference = 'Stop';

mkdir .\capture -force | out-null
docker run -it --net=container:$ContainerID -v $pwd\capture:c:\capture capture