# pmailq - Postfix Mail Queue manager

## Description

pmailq processes the output of the Postfix mailq command, and can list, parse (machine-readably), or delete queued messages in batches.
They can be selected by size, by queue status, and by pattern matching (with wildcards) on recipient addresses and server error messages.

## Commands

Action to perform on selected entries:

**list**
Show (via ***postqueue -p***)a detailed listing of the selected entries.

**parse**
Show a listing of the selected entries in a machine readable format.

**del** Delete (via ***postsuper -d***) the selected entries.

## Options

**-e PATTERN, --email=PATTERN**
Select entries in queue with email matching PATTERN (wildcards allowed).

**-m PATTERN, --msg=PATTERN**
Select entries in queue with error message matching PATTERN (wildcards allowed).
  
**-l SIZE, --size-lower=SIZE**
Select entries in queue with size lower than SIZE bytes.
  
**-u SIZE, --size-upper=SIZE**
Select entries in queue with size upper than SIZE bytes.

**-a**
Select "active" entries in queue.

**-o**
Select "on hold" entries in queue.
 
 **--version**
 Show program's version number and exit
  
**-h, --help**
Show help message and exit

## Examples

**Example 1** : display all the entries in queue sent to an recipient address matching
"*@example.com*" with a size between 3000 and 3200 bytes in a machine readable
format:

    > pmailq -u 3000 -l 3200 -e "*@example.com" parse

    7E75214643A4|Fri Aug 31|3154|1|0|edgar@example.com
    B0BDE146B640|Thu Aug 30|3199|1|0|paul@example.com
    B587E146B675|Wed Aug 29|3065|0|0|paul@example.com
    CF3C514656E4|Wed Aug 29|3161|0|0|abuse@example.com
         /\          /\      /\   \ \
       queue id     date    size   \ \ on hold (or not)
                                      \ active (or not)

**Example 2**: remove all mails in queue not sent because of a connection timeout:

     > pmailq -m "*connection*timed*out" del

     deleting 00CF514616D3 [OK]
     deleting 12D911461924 [OK]
     deleting 269EF1461CA9 [OK]
     deleting 288DF1461CA0 [OK]
     deleting 3B3901460F62 [OK]
     deleting 3AE58147019F [OK]

## Author

[Emmanuel Bouthenot](mailto:kolter@openics.org)

## Copyright and license

Copyright 2007-2019, [Emmanuel Bouthenot](mailto:kolter@openics.org)

    DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
    Version 2, December 2004

    Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>

    Everyone is permitted to copy and distribute verbatim or modified
    copies of this license document, and changing it is allowed as long
    as the name is changed.

    DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
    TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

    0. You just DO WHAT THE FUCK YOU WANT TO.
