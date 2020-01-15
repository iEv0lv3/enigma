Functionality :: 4

Both CLI and Cracking are implemented, tested, and functioning as expected. It can
take a VERY long time for it to crack my message sometimes, but the crack is
producing the result on the iteration pattern.

Object Oriented Programming :: 4

I implemented both inheritance and modules. It made logical sense to me to implment
inheritance with a Cryptor superclass that shares common states (message, date, key)
with both an Encryptor subclass and Decryptor subclass. I believe this improves SRP
for each subclass, improves encapsulation, and provides better code organization.

I implemented 3 modules that provide related functionality to multiple classes, and
help to improve SRP and code organization. The Character module is small and provides
two different character sets that are used by multiple classes. The Shift module is
implemented to provided any behavior related to shifting for the cipher across classes.
The Cipher module is the base for encrypting and decrypting across the entire program.

Ruby Conventions and Mechanics :: 3.7

I utlize Rubocop to ensure that my sytax is clean and conforms to the Ruby style guide:
no trailing white spaces, everything is properly indedented, aligned, and structured.
I have 2 methods that are 12 lines long, but I believe it was reasonable to leave them
that length due to their nested iteration. I use a lot of helper methods, but in those 2
cases I believe it would have decreased code readability. I believe there is 1 .each in
the entire program and it made sense for that nested iteration, and my other enumerators
are things such as .map, .each_with_index, .each_slice, .each_cons, and .reduce. I make
use of procs, guard clauses, and flags. Hashes and arrays were implemented based on
what made the most sense for a given method or data structure.

Test Driven Development :: 4

100% test coverage across every file. Every method and helper method implemented in the
entire program has either unit tests or itegration tests, covering every line of code.
I implemented mocks and stubs (mostly stubs) across multiple test files to use in place
of random dates and keys being generated that would otherwise not be able to be tested.
I took it a step further this project and created actual objects (Keys, Offsets), and
then applied the stubs to them in order to more thoroughly test when expecting randomness.

Version Control :: 3.5

76 commits, 11 branches/PRs. I comment on and summarize added functionality on every pull
request, branch and commit often, and branches are generally divded into logical sections
of implmentation. I believe I could have improved on one of my first branches which was
too broad while I was determing my OOP strategy and changed my mind multiple times. Generally
this is one of my strengths, however, triage is necessary sometimes. Additonally due to extreme
time restraints and sleep depravation I attempted to move as fast as possible, and I could improve
the clarity of some of my commits. 5:12am is not my sharpest hour after no sleep.