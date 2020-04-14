# Word Check InSpec Profile

This profiles take an input file and verifies that it does not have words from a restricted list and that there are no duplicate lines. The restricted word list is currently hard-coded.

## Examples

There are 3 included files for testing.


```
inspec exec . --input file=test.txt
```
produces a passing test.


```
inspec exec . --input file=duplicates.txt
```
fails with the duplicated line "has no duplicates"


```
inspec exec . --input file=forbidden.txt
```
fails with the word "covid" found
