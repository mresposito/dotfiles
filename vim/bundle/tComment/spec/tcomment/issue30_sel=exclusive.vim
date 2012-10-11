" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    8

SpecBegin 'title': 'issue30 - bug 2 exclusive'
            \, 'options': [{'&selection': 'exclusive'}]
            \, 'scratch': 'issue30_test.c'

It should comment last character with gc.
Should yield Buffer ':norm 3gg$v$gc', 'issue30_test_2.c'

It should not comment last character with gc.
Should yield Buffer ':norm 3gg$vgc', 'issue30_test_3.c'

