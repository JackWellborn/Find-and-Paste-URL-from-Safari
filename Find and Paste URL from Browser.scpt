JsOsaDAS1.001.00bplist00�Vscripto,6 
 f u n c t i o n   r u n ( )   { 
 	 c o n s t   e n a b l e B B E d i t F e a t u r e s   =   t r u e ; 
 	 c o n s t   B B E d i t M a r k d o w n L i n k L o c a t i o n   =   ' E N D _ O F _ D O C U M E N T '   / /   W h e r e   t h e   l i n k   s h o u l d   b e   l o c a t e d   ( ' E N D _ O F _ D O C U M E N T ' ,   ' E N D _ O F _ P A R A G R A P H ' ,   o r   ' I N L I N E ' ) . 
 	 c o n s t   b r o w s e r C o n f i g s   =   { 
 	 	 c h r o m e :   { 
 	 	 	 n a m e :   " G o o g l e   C h r o m e " 
 	 	 } , 
 	 	 s a f a r i :   { 
 	 	 	 n a m e :   " S a f a r i " 
 	 	 } 
 	 } ; 
 
 	 l e t   b r o w s e r C o n f i g   =   b r o w s e r C o n f i g s . s a f a r i ; 
 	 / /   v a r   b r o w s e r C o n f i g   =   b r o w s e r C o n f i g s . c h r o m e ; 
 
 	 l e t   s y s t e m   =   A p p l i c a t i o n ( " S y s t e m   E v e n t s " ) ; 
 	 s y s t e m . i n c l u d e S t a n d a r d A d d i t i o n s   =   t r u e ; 
 
 	 / / F o r   w h a t e v e r   r e a s o n   t h i s   w o r k s   w h e r e s   c u r r e n t A p p l i c a t i o n   d o e s   n o t . 
 	 l e t   a p p   =   A p p l i c a t i o n ( s y s t e m . p r o c e s s e s . w h e r e ( { f r o n t m o s t : t r u e } ) [ 0 ] . d i s p l a y e d N a m e ( ) ) ; 
 	 a p p . i n c l u d e S t a n d a r d A d d i t i o n s   =   t r u e ; 
 
 	 l e t   p r o c e s s e s   =   s y s t e m . p r o c e s s e s . w h o s e ( {   _ a n d : [ { n a m e : { _ b e g i n s W i t h :   b r o w s e r C o n f i g . n a m e } } ,   { v i s i b l e : t r u e } ] } ) ; 
 
 	 i f   (   ! p r o c e s s e s   | |   ! p r o c e s s e s . l e n g t h   )   { 
 	 	 a l e r t E r r o r ( ` $ { b r o w s e r C o n f i g . n a m e }   i s n ' t   r u n n i n g . ` ,   ` T h e r e ' s   a n   o l d   s a y i n g   t h a t   y o u   c a n ' t   p a s t e   a   U R L   f r o m   a   b r o w s e r   t h a t   d o e s n ' t   e x i s t . ` ) ; 
 	 } 
 
 	 l e t   p r o c e s s   =   p r o c e s s e s [ 0 ] ; 
 	 l e t   b r o w s e r   =   A p p l i c a t i o n ( p r o c e s s . n a m e ( ) ) ; 
 
 	 i f   (   b r o w s e r . w i n d o w s ( ) . l e n g t h   = = =   0   )   { 
 	 	 a l e r t E r r o r ( ` $ { b r o w s e r C o n f i g . n a m e }   h a s   n o   o p e n   w i n d o w s . ` ,   ` M y   g r a n d f a t h e r   o n c e   t a u g h t   m e   t h a t   y o u   c a n ' t   p a s t e   a   U R L   w i t h o u t   t a b   a n d   y o u   c a n ' t   h a v e   a   t a b   w i t h o u t   a   w i n d o w . 
 	 
 	 T r u e   s t o r y . ` ) ; 
 	 } 
 
 
 	 b r o w s e r . i n c l u d e S t a n d a r d A d d i t i o n s   =   t r u e ; 
 
 	 c o n s t   g e t T a b B y A b s o l u t e I n d e x   =   ( q u e r y )   = >   { 
 	 	 l e t   i n d e x ,   u r l s = [ ] ; 
 	 	 b r o w s e r . w i n d o w s ( ) . f o r E a c h ( ( w i n d o w )   = >   { 
 	 	 	 i f   ( q u e r y   < =   w i n d o w . t a b s . l e n g t h )   { 
 	 	 	 	 i f   (   q u e r y   <   0   )   { 
 	 	 	 	 	 i n d e x   =   w i n d o w . t a b s ( ) . l e n g t h   +   q u e r y ; 
 	 	 	 	 }   e l s e   { 
 	 	 	 	 	 i n d e x   =   q u e r y   -   1 ; 
 	 	 	 	 } 
 	 	 	 	 u r l s . p u s h ( w i n d o w . t a b s [ i n d e x ] . u r l ( ) ) ; 
 	 	 	 } 
 	 	 } ) ; 
 	 	 r e t u r n   u r l s ; 
 	 } 
 
 	 c o n s t   g e t T a b B y R e l a t i v e I n d e x   =   ( q u e r y )   = >   { 
 	 	 l e t   c u r r e n t T a b I n d e x   =   b r o w s e r C o n f i g   = = =   b r o w s e r C o n f i g s . s a f a r i   ?   
 	 	 	 b r o w s e r . w i n d o w s [ 0 ] . c u r r e n t T a b ( ) . i n d e x ( )   :   
 	 	 	 b r o w s e r . w i n d o w s [ 0 ] . a c t i v e T a b I n d e x ( ) ; 
 	 	 l e t   r e l a t i v e T a b I n d e x   =   c u r r e n t T a b I n d e x - 1   +   q u e r y ; 
 	 	 i f   ( r e l a t i v e T a b I n d e x   > =   b r o w s e r . w i n d o w s [ 0 ] . t a b s ( ) . l e n g t h )   { 
 	 	 	 r e l a t i v e T a b I n d e x   =   r e l a t i v e T a b I n d e x   -   b r o w s e r . w i n d o w s [ 0 ] . t a b s ( ) . l e n g t h ; 
 	 	 } 
 	 	 r e t u r n   [ b r o w s e r . w i n d o w s [ 0 ] . t a b s [ r e l a t i v e T a b I n d e x ] . u r l ( ) ] ; 
 	 } 
 
 	 c o n s t   g e t T a b s W i t h U r l s T h a t C o n t a i n   =   ( q u e r y )   = >   { 
 	 	 l e t   u r l s   =   [ ] ; 
 	 	 b r o w s e r . w i n d o w s ( ) . f o r E a c h ( ( w i n d o w )   = >   { 
 	 	 	 l e t   t a b s   =   w i n d o w . t a b s . w h o s e ( {   u r l : {   _ c o n t a i n s :   q u e r y   } } ) ; 
 	 	 	 t a b s ( ) . f o r E a c h ( f u n c t i o n ( t a b )   { 
 	 	 	 	 u r l s . p u s h ( t a b . u r l ( ) ) ; 
 	 	 	 } ) ; 
 	 	 } ) ; 
 	 	 r e t u r n   u r l s ; 
 	 } 
 
 	 c o n s t   g e t T a b s W i t h T i t l e s T h a t C o n t a i n   =   ( q u e r y )   = >   { 
 	 	 l e t   t i t l e s   =   [ ] ; 
 	 	 b r o w s e r . w i n d o w s ( ) . f o r E a c h ( ( w i n d o w )   = >   { 
 	 	 	 l e t   t a b s   =   w i n d o w . t a b s . w h o s e ( {   n a m e : {   _ c o n t a i n s :   q u e r y   } } ) ; 
 	 	 	 t a b s ( ) . f o r E a c h ( f u n c t i o n ( t a b )   { 
 	 	 	 	 t i t l e s . p u s h ( t a b . u r l ( ) ) ; 
 	 	 	 } ) ; 
 	 	 } ) ; 
 	 	 r e t u r n   t i t l e s ; 
 	 } 
 	 
 	 v a r   g e t T i t l e F r o m U r l   =   ( u r l )   = >   { 
 	 	 l e t   t a b s W i t h M a t c h i n g U r l s   =   [ ] ; 
 	 	 b r o w s e r . w i n d o w s ( ) . f o r E a c h ( ( w i n d o w )   = >   { 
 	 	 	 l e t   t a b s   =   w i n d o w . t a b s . w h o s e ( {   u r l : u r l   } ) ; 
 	 	 	 i f   ( t a b s . l e n g t h   >   0 )   { 
 	 	 	 	 t a b s W i t h M a t c h i n g U r l s   =   t a b s W i t h M a t c h i n g U r l s . c o n c a t ( t a b s ) ; 
 	 	 	 } 
 	 	 } ) ; 
 	 	 r e t u r n   t a b s W i t h M a t c h i n g U r l s [ 0 ] . n a m e ( ) ; 
 	 } 
 	 
 	 l e t   f o r m a t C o d e   =   ' n o n e ' ; 
 	 l e t   f o r m a t S i g n i f i e r   =   '   . ' ; 
 	 l e t   f o r m a t T e m p l a t e s   =   [ 
 	 	 {   n a m e :   ' m a r k d o w n ' ,   c o d e :   ' m ' ,   t e m p l a t e :   ' [ { T E X T } ] ( { U R L } ) '   } , 
 	 	 {   n a m e :   ' j i r a ' ,   c o d e :   ' j ' ,   t e m p l a t e :   ' [ { T E X T } | { U R L } ] '   } , 
 	 	 {   n a m e :   ' h t m l ' ,   c o d e :   ' h ' ,   t e m p l a t e :   ' < a   h r e f = " { U R L } " > { T E X T } < / a > '   } , 
 	 	 {   n a m e :   ' r e v e a l ' ,   c o d e :   ' r ' ,   t e m p l a t e :   ' ' ,   a c t i o n :   ( u r l )   = >   { 
 	 	 	 b r o w s e r . w i n d o w s ( ) . f o r E a c h ( ( w i n ,   w )   = >   { 
 	 	 	 	 f o r ( l e t   t = 0 ;   t   <   w i n . t a b s ( ) . l e n g t h ;   t + + ) { 
 	 	 	 	 	 i f   ( w i n . t a b s [ t ] . u r l ( )   = = =   u r l )   { 
 	 	 	 	 	 	 m a t c h i n g T a b   =   w i n . t a b s [ t ] ; 
 	 	 	 	 	 	 m a t c h i n g T a b I n d e x   =   t ; 
 	 	 	 	 	 	 i f   (   b r o w s e r C o n f i g . n a m e   = = =   ' S a f a r i '   )   { 
 	 	 	 	 	 	 	 l e t   t a b   =   w i n . t a b s . w h o s e ( {   u r l :   u r l   } ) [ 0 ] ; 
 	 	 	 	 	 	 	 w i n . c u r r e n t T a b   =   t a b ; 
 	 	 	 	 	 	 }   e l s e   { 	 	 
 	 	 	 	 	 	 	 w i n . a c t i v e T a b I n d e x   =   m a t c h i n g T a b I n d e x + 1 ; 
 	 	 	 	 	 	 } 
 	 	 	 	 	 	 b r o w s e r . a c t i v a t e ( ) ; 
 	 	 	 	 	 	 p r o c e s s . w i n d o w s [ w ] . a c t i o n s [ ' A X R a i s e ' ] . p e r f o r m ( ) ; 
 	 	 	 	 	 	 b r e a k ; 
 	 	 	 	 	 } 
 	 	 	 	 } 
 	 	 	 } ) ; 
 	 	 } } 
 	 ] ; 
 
 	 c o n s t   r u n Q u e r y   =   ( i n p u t )   = >   { 
 	 	 i n p u t   =   i n p u t . t o S t r i n g ( ) ; 
 	 
 	 	 f o r m a t T e m p l a t e s . f o r E a c h ( ( f o r m a t )   = >   { 
 	 	 	 i n p u t   =   i n p u t [ 0 ]   = = =   ' . '   ?   '   '   +   i n p u t   :   i n p u t ; 
 	 	 	 l e t   f o r m a t R e g E x p   =   n e w   R e g E x p ( f o r m a t S i g n i f i e r   +   f o r m a t . c o d e   +   ' $ ' ) ; 
 	 	 	 i f   ( f o r m a t R e g E x p . t e s t ( i n p u t ) )   { 
 	 	 	 	 l e t   i n p u t A r r   =   i n p u t . s p l i t ( f o r m a t S i g n i f i e r ) ; 
 	 	 	 	 c o n s o l e . l o g ( i n p u t A r r ) ; 
 	 	 	 	 f o r m a t C o d e   =   i n p u t A r r . p o p ( ) ; 
 	 	 	 	 c o n s o l e . l o g ( i n p u t A r r . l e n g t h ) ; 
 	 	 	 	 i n p u t   =   i n p u t A r r . j o i n ( f o r m a t S i g n i f i e r ) ; 
 	 	 	 } 
 	 	 } ) ; 
 	 
 	 	 l e t   f u l l Q u e r y   =   i n p u t ; 
 	 	 l e t   q u e r y C h a r a c t e r   =   f u l l Q u e r y . c h a r A t ( 0 ) ; 
 	 	 l e t 	 q u e r y P a r a m e t e r   =     f u l l Q u e r y . s u b s t r i n g ( 1 ) ; 
 	 	 c o n s t   q u e r y C h a r a c t e r s   =   [ ' = ' ] ; 
 	 
 	 	 l e t   u r l ,   u r l s   =   [ ] ; 
 	 
 	 	 i f   ( ! i s N a N ( f u l l Q u e r y )   & &   f u l l Q u e r y   ! = =   " " )   { 
 	 	 	 u r l s   =   g e t T a b B y R e l a t i v e I n d e x ( p a r s e I n t ( f u l l Q u e r y ,   1 0 ) ) ; 
 	 	 }   e l s e   i f   ( q u e r y C h a r a c t e r s . i n d e x O f ( q u e r y C h a r a c t e r )   > =   0 )   { 
 	 	 	 s w i t c h ( q u e r y C h a r a c t e r )   { 
 	 	 	 	 c a s e   " = " : 
 	 	 	 	 	 u r l s   =   g e t T a b B y A b s o l u t e I n d e x ( p a r s e I n t ( q u e r y P a r a m e t e r ,   1 0 ) ) ; 
 	 	 	 	 	 b r e a k ; 
 	 	 	 } 
 	 	 }   e l s e   i f   ( / ^ ( ( ? ! - ) ) ( x n - - ) ? [ a - z 0 - 9 ] [ a - z 0 - 9 - _ ] { 0 , 6 1 } [ a - z 0 - 9 ] { 0 , 1 } \ . ( x n - - ) ? ( [ a - z 0 - 9 \ - ] { 1 , 6 1 } | [ a - z 0 - 9 - ] { 1 , 3 0 } \ . [ a - z ] { 2 , } ) $ / . t e s t ( f u l l Q u e r y ) )   { 
 	 	 	 u r l s   =   g e t T a b s W i t h U r l s T h a t C o n t a i n ( f u l l Q u e r y ) ; 
 	 	 }   e l s e   i f   ( f u l l Q u e r y . l e n g t h   >   0 )   { 
 	 	 	 u r l s   =   g e t T a b s W i t h T i t l e s T h a t C o n t a i n ( f u l l Q u e r y ) ; 
 	 	 }   e l s e   { 
 	 	 	 u r l s   =   g e t T a b B y R e l a t i v e I n d e x ( 0 ) ; 
 	 	 } 
 	 
 	 	 i f ( u r l s . l e n g t h   >   1 )   { 
 	 	 	 l e t   c h o i c e   =   a p p . c h o o s e F r o m L i s t ( u r l s ,   { 
 	 	 	 	 w i t h T i t l e : " M u l t i p l e   M a t c h i n g   U R L s   F o u n d " , 
 	 	 	 	 w i t h P r o m p t : " S e l e c t   t h e   d e s i r e d   m a t c h i n g   U R L " , 
 	 	 	 	 o k B u t t o n N a m e : " P a s t e   U R L " , 
 	 	 	 	 c a n c e l B u t t o n : " C a n c e l " } ) ; 
 	 	 	 
 	 	 	 i f ( c h o i c e ) { 
 	 	 	 	 u r l   =   c h o i c e . t o S t r i n g ( ) ; 
 	 	 	 }   
 	 	 }   e l s e   { 
 	 	 	 u r l   =   u r l s [ 0 ] ; 
 	 	 } 
 	 	 r e t u r n   u r l ; 
 	 } 
 
 	 f u n c t i o n   p a s t e U R L ( u r l ) { 
 	 	 l e t   s a v e d C l i p b o a r d   =   a p p . t h e C l i p b o a r d ( ) ; 
 	 	 a p p . s e t T h e C l i p b o a r d T o ( u r l ) ; 
 	 	 s y s t e m . k e y s t r o k e ( ' v ' , { u s i n g : [ " c o m m a n d   d o w n " ] } ) ; 
 	 	 d e l a y ( . 5 ) ; 
 	 	 a p p . s e t T h e C l i p b o a r d T o ( s a v e d C l i p b o a r d ) ; 
 	 } 
 
   
 	 c o n s t   a l e r t E r r o r   =   ( h e a d e r ,   m e s s a g e ,   o p t i o n a l B u t t o n ,   s y n t a x = ' ' )   = >   { 
 	 	 c o n s t   b u t t o n s   =   [ ' C a n c e l ' ] ; 
 	 	 i f   ( o p t i o n a l B u t t o n )   { 
 	 	 	 b u t t o n s . p u s h ( o p t i o n a l B u t t o n ) ; 
 	 	 } 
 	 	 l e t   a l e r t   =   a p p . d i s p l a y A l e r t ( h e a d e r ,   { 
 	 	 	 m e s s a g e :   m e s s a g e , 
 	 	 	 b u t t o n s :   b u t t o n s , 
 	 	 	 d e f a u l t B u t t o n :   b u t t o n s [ b u t t o n s . l e n g t h - 1 ] , 
 	 	 	 c a n c e l B u t t o n :   ' C a n c e l ' , 
 	 	 	 a s :   b u t t o n s . l e n g t h   ?   " i n f o r m a t i o n a l "   :   " c r i t i c a l " 
 	 	 } ) ; 
 	 	 i f   ( a l e r t . b u t t o n R e t u r n e d   ! = =   " C a n c e l " )   { 
 	 	 	 o p e n D i a l o g ( s y n t a x ) ; 	 
 	 	 } 
 	 } 
 
 	 c o n s t   o p e n D i a l o g   =   ( s y n t a x = ' ' )   = >   { 
 	 	 l e t   d i a l o g   =   a p p . d i s p l a y D i a l o g ( ` F i n d   a n d   P a s t e   U R L   f r o m   $ { b r o w s e r C o n f i g . n a m e } ` ,   { 
 	 	 	 / /   w i t h T i t l e : ` F i n d   a n d   P a s t e   U R L   f r o m   $ { b r o w s e r C o n f i g . n a m e } ` , 
 	 	 	 d e f a u l t A n s w e r :   s y n t a x , 
 	 	 	 b u t t o n s :   [ " H e l p & " ,   " C a n c e l " ,   " P a s t e   U R L " ] , 
 	 	 	 c a n c e l B u t t o n :   " C a n c e l " , 
 	 	 	 d e f a u l t B u t t o n :   " P a s t e   U R L " 
 	 	 } ) ; 
 	 	 i f   ( d i a l o g . b u t t o n R e t u r n e d   = = =   " H e l p & " )   { 
 	 	 	 c o n s t   e x a m p l e s   =   [ 
 	 	 	 	 {   l a b e l :   ' & t h e   c u r r e n t   t a b   i n   f r o n t m o s t   w i n d o w   ( e m p t y ) ' ,   s y n t a x :   ' '   } , 
 	 	 	 	 {   l a b e l :   ' & t h e   t a b   l e f t   o f   t h a t   c u r r e n t   t a b   f o r m a t t e d   i n   M a r k d o w n ' ,   s y n t a x :   ' - 1   . m '   } , 
 	 	 	 	 {   l a b e l :   ' & t h e   t a b   t w o   t o   t h e   r i g h t   o f   t h e   c u r r e n t   t a b   f o r m a t t e d   i n   H T M L ' ,   s y n t a x :   ' 2   . h '   } , 
 	 	 	 	 {   l a b e l :   ' & a   f i r s t   t a b   f o r m m a t t e d   i n   J I R A ' ,   s y n t a x :   ' = 1   . j '   } , 
 	 	 	 	 {   l a b e l :   ' & a   s e c o n d   t o   l a s t   t a b ,   b u t   r e v e a l   i n s t e a d   o f   p a s t e ' ,   s y n t a x :   ' = - 2   . r '   } , 
 	 	 	 	 {   l a b e l :   ' & a   t a b   w i t h   t h e   w o r d   " N e w s "   i n   i t s   t i t l e ' ,   s y n t a x :   ' N e w s '   } , 
 	 	 	 	 {   l a b e l :   ' & a   t a b   w i t h   a n   a d d r e s s   c o n t a i n i n g   " d u c k d u c k g o . c o m " ' ,   s y n t a x :   ' d u c k d u c k g o . c o m '   } , 
 	 	 	 	 {   l a b e l :   ' J u s t   s h o w   m e   t h e   f u l l   d o c u m e n t a t i o n ' ,   s y n t a x :   ' '   } 
 	 	 	 ] ; 
 	 	 	 l e t   e x a m p l e s L i s t   =   [ ] ; 
 	 	 	 e x a m p l e s . f o r E a c h ( e x a m p l e   = >   e x a m p l e s L i s t . p u s h ( e x a m p l e . l a b e l ) ) ; 
 	 	 	 l e t   s h o w M e   =   a p p . c h o o s e F r o m L i s t ( e x a m p l e s L i s t ,   { 
 	 	 	 	 w i t h T i t l e :   ' H e l p ' , 
 	 	 	 	 w i t h P r o m p t :   ' S h o w   m e   t h e   s y n t a x   t o   p a s t e   t h e   U R L   f r o m & ' , 
 	 	 	 	 d e f a u l t I t e m s :   [ ' & t h e   c u r r e n t   t a b   i n   f r o n t m o s t   w i n d o w ' ] , 
 	 	 	 } ) ; 
 	 	 	 l e t   s e l e c t e d S y n t a x   =   ' ' ; 
 	 	 	 i f   ( s h o w M e )   { 
 	 	 	 	 i f   (   s h o w M e [ 0 ]   = = =   ' J u s t   s h o w   m e   t h e   f u l l   d o c u m e n t a t i o n '   )   { 
 	 	 	 	 	 b r o w s e r . o p e n L o c a t i o n ( ' h t t p s : / / g i t h u b . c o m / J a c k W e l l b o r n / F i n d - a n d - P a s t e - U R L - f r o m - B r o w s e r / b l o b / m a s t e r / R E A D M E . m d ' ) ; 
 	 	 	 	 }   e l s e   { 
 	 	 	 	 	 s e l e c t e d S y n t a x   =   e x a m p l e s . f i n d ( e x a m p l e   = >   e x a m p l e . l a b e l   = = =   s h o w M e [ 0 ] ) . s y n t a x ; 
 	 	 	 	 	 o p e n D i a l o g ( s e l e c t e d S y n t a x ) ; 
 	 	 	 	 } 
 	 	 	 }   e l s e   { 
 	 	 	 	 o p e n D i a l o g ( s e l e c t e d S y n t a x ) ; 
 	 	 	 } 
 	 	 }   e l s e   i f   ( d i a l o g . b u t t o n R e t u r n e d   = = =   " P a s t e   U R L " )   {   
 	 	 	 l e t   u r l   =   r u n Q u e r y ( d i a l o g . t e x t R e t u r n e d ) ;   
 	 	 	 i f   ( t y p e o f   u r l   = = =   " u n d e f i n e d "   | |   ! u r l )   { 
 	 	 	 	 a l e r t E r r o r ( ` N o   U R L   f o u n d . ` ,   ` W e l l &   t h e y   c a n ' t   a l l   b e   g e m s . ` ,   ` T r y   A g a i n ` ,   d i a l o g . t e x t R e t u r n e d ) ; 
 
 	 	 	 } 
 	 	 	 i f   ( e n a b l e B B E d i t F e a t u r e s   & &   a p p . n a m e ( )   = = =   " B B E d i t "   & &   ( f o r m a t C o d e   = = =   ' m '   | |   a p p . t e x t W i n d o w s . a t ( 0 ) . s o u r c e L a n g u a g e ( )   = = =   ' M a r k d o w n ' ) )   {   
 	 	 	 	 l e t   r e f e r e n c e I d R e g E x p   =   / \ n \ [ [ 0 - 9 ] + \ ] \ : / g ; 
 	 	 	 	 l e t   w i n d o w   =   a p p . w i n d o w s ( ) [ 0 ] ; 
 	 	 	 	 l e t   p a g e T i t l e   =   g e t T i t l e F r o m U r l ( u r l ) ; 
 	 	 	 	 
 	 	 	 	 l e t   s e l e c t e d T e x t ,   m a r k d o w n L i n k T e x t ,   o r i g i n a l O f f s e t ,   n e w O f f s e t ; 
 	 	 	 	 s e l e c t e d T e x t   =   m a r k d o w n L i n k T e x t   =   w i n d o w . s e l e c t i o n . c o n t e n t s ( ) . t o S t r i n g ( ) ; 
 	 	 	 	 o r i g i n a l O f f s e t   =   n e w O f f s e t   =   w i n d o w . s e l e c t i o n . c h a r a c t e r o f f s e t ( ) ; 
 	 	 	 	 
 	 	 	 	 i f   ( B B E d i t M a r k d o w n L i n k L o c a t i o n   = = =   ' I N L I N E ' )   { 
 	 	 	 	 	 m a r k d o w n L i n k T e x t   =   s e l e c t e d T e x t . l e n g t h   ?   s e l e c t e d T e x t . r e p l a c e ( / ( . + ) / g ,   ' [ $ 1 ] ( '   +   u r l   +   ' ) ' )   :   ' [ ] ( '   +   u r l   +   ' ) ' ; 
 	 	 	 	 	 n e w O f f s e t   =   s e l e c t e d T e x t . l e n g t h   ?   o r i g i n a l O f f s e t   +   m a r k d o w n L i n k T e x t . l e n g t h - 1   :   o r i g i n a l O f f s e t ; 
 	 	 	 	 	 w i n d o w . s e l e c t i o n . c o n t e n t s   =   m a r k d o w n L i n k T e x t ; 
 	 	 	 	 }   e l s e   { 
 	 	 	 	 	 l e t   n u m e r i c R e f e r e n c e I D C o u n t   =   0 ; 
 	 	 	 	 	 l e t   n u m e r i c R e f e r e n c e I D s   =   w i n d o w . t e x t ( ) . m a t c h ( r e f e r e n c e I d R e g E x p ) ; 
 	 	 	 	 	 i f   ( n u m e r i c R e f e r e n c e I D s )   { 
 	 	 	 	 	 	 n u m e r i c R e f e r e n c e I D C o u n t   =   w i n d o w . t e x t ( ) . m a t c h ( r e f e r e n c e I d R e g E x p ) . l e n g t h ; 
 	 	 	 	 	 } 
 	 	 	 	 	 l e t   i d D i a l o g   =   a p p . d i s p l a y D i a l o g ( ` W h a t   r e f e r e n c e   I D   w o u l d   y o u   l i k e   t o   u s e   f o r   " $ { p a g e T i t l e } " ? ` ,   { 
 	 	 	 	 	 	 / /   w i t h T i t l e : ` W h a t   r e f e r e n c e   I D   w o u l d   y o u   l i k e   t o   u s e   f o r   " $ { p a g e T i t l e } " ? ` , 
 	 	 	 	 	 	 d e f a u l t A n s w e r :   ( n u m e r i c R e f e r e n c e I D C o u n t   +   1 ) , 
 	 	 	 	 	 	 b u t t o n s :   [ " C a n c e l " ,   " U s e   R e f e r e n c e   I D " ] , 
 	 	 	 	 	 	 c a n c e l B u t t o n :   " C a n c e l " , 
 	 	 	 	 	 	 d e f a u l t B u t t o n :   " U s e   R e f e r e n c e   I D " 
 	 	 	 	 	 } ) ; 
 	 	 	 	 	 l e t   r e f e r e n c e I D   =   i d D i a l o g . t e x t R e t u r n e d ; 
 	 	 	 	 	 m a r k d o w n L i n k T e x t   =   s e l e c t e d T e x t . l e n g t h   ?   s e l e c t e d T e x t . r e p l a c e ( / ( . + ) / g ,   ' [ $ 1 ] [ '   +   r e f e r e n c e I D   +   ' ] ' )   :   ' [ ] [ '   +   r e f e r e n c e I D   +   ' ] ' ; 
 	 	 	 	 	 n e w O f f s e t   =   s e l e c t e d T e x t . l e n g t h   ?   o r i g i n a l O f f s e t   +   m a r k d o w n L i n k T e x t . l e n g t h - 1   :   o r i g i n a l O f f s e t ; 
 	 	 	 	 	 w i n d o w . s e l e c t i o n . c o n t e n t s   =   m a r k d o w n L i n k T e x t ; 
 	 	 	 	 	 i f   ( B B E d i t M a r k d o w n L i n k L o c a t i o n   = = =   ' E N D _ O F _ P A R A G R A P H ' )   { 
 	 	 	 	 	 	 l e t   p a r a g r a p h B r e a k R e g e x p   =   / \ n \ n + / g ; 
 	 	 	 	 	 	 l e t   p a r a g r a p h B r e a k R e g e x p R e s u l t ; 
 	 	 	 	 	 	 w h i l e   ( ( p a r a g r a p h B r e a k R e g e x p R e s u l t   =   p a r a g r a p h B r e a k R e g e x p . e x e c ( w i n d o w . t e x t ( ) ) )   ! = =   n u l l )   { 
 	 	 	 	 	 	 	 i f   ( p a r a g r a p h B r e a k R e g e x p . l a s t I n d e x   > =   o r i g i n a l O f f s e t )   { 
 	 	 	 	 	 	 	 	 l e t   u p d a t e d T e x t   =   w i n d o w . t e x t ( ) . s l i c e ( 0 ,   p a r a g r a p h B r e a k R e g e x p R e s u l t . i n d e x )   +   ' \ n [ '   +   r e f e r e n c e I D   +   ' ] :   '   +   u r l   +   p a r a g r a p h B r e a k R e g e x p R e s u l t [ 0 ]   +   w i n d o w . t e x t ( ) . s l i c e ( p a r a g r a p h B r e a k R e g e x p . l a s t I n d e x ) ; 
 	 	 	 	 	 	 	 	 w i n d o w . t e x t   =   u p d a t e d T e x t ; 
 	 	 	 	 	 	 	 	 b r e a k ; 
 	 	 	     	 	 	 	 } 
 	 	 	 	 	 	 } 
 	 	 	 	 	 }   e l s e   { 
 	 	 	 	 	 	 w i n d o w . t e x t   =   w i n d o w . t e x t ( )   +   ' \ n [ '   +   r e f e r e n c e I D   +   ' ] :   '   +   u r l ; 
 	 	 	 	 	 } 
 	 	 	 	 } 
 	 	 	 	 a p p . s e l e c t ( w i n d o w . c h a r a c t e r s . a t ( n e w O f f s e t ) . i n s e r t i o n P o i n t s . a t ( 0 ) ) ; 
 	 	 	 }   e l s e   i f   ( f o r m a t C o d e   ! = =   ' n o n e ' )   { 
 	 	 	 	 l e t   f o r m a t t i n g   =   f o r m a t T e m p l a t e s . f i n d ( f o r m a t T e m p l a t e   = >   f o r m a t T e m p l a t e . c o d e   = = =   f o r m a t C o d e ) ; 
 	 	 	 	 i f   ( f o r m a t t i n g . t e m p l a t e . i n d e x O f ( ' { U R L } ' )   > =   0 )   { 
 	 	 	 	 	 l e t   f o r m a t t e d U r l   =   f o r m a t t i n g . t e m p l a t e . r e p l a c e ( ' { U R L } ' ,   u r l ) ; 
 	 	 	 	 	 l e t   c h a r s T o T e x t I n s e r t i o n   =   f o r m a t t e d U r l . s p l i t ( ' ' ) . r e v e r s e ( ) . j o i n ( ' ' ) . i n d e x O f ( ' } T X E T { ' ) ; 
 	 	 	 	 	 f o r m a t t e d U r l   =   f o r m a t t e d U r l . r e p l a c e ( ' { T E X T } ' ,   u r l ) ; 
 	 	 	 	 	 p a s t e U R L ( f o r m a t t e d U r l ) ; 
 	 	 	 	 	 f o r   ( l e t   i   =   0 ;   i   <   c h a r s T o T e x t I n s e r t i o n ;   i + + )   { 
 	 	 	 	 	 	 s y s t e m . k e y C o d e ( 1 2 3 ) ; 
 	 	 	 	 	 } 
 	 	 	 	 	 f o r   ( l e t   j   =   0 ;   j   <   u r l . l e n g t h ;   j + + )   { 
 	 	 	 	 	 	 s y s t e m . k e y C o d e ( 1 2 3 ,   { u s i n g : ' s h i f t   d o w n ' } ) ; 
 	 	 	 	 	 } 
 	 	 	 	 }   e l s e   i f   ( f o r m a t t i n g . a c t i o n   & &   t y p e o f   f o r m a t t i n g . a c t i o n   = = =   ' f u n c t i o n ' )   { 
 	 	 	 	 	 f o r m a t t i n g . a c t i o n ( u r l ) ; 
 	 	 	 	 } 
 	 	 	 }   e l s e   { 
 	 	 	 	 p a s t e U R L ( u r l ) ; 
 	 	 	 } 
 	 	 } 
 	 } ; 
 	 o p e n D i a l o g ( ) ; 
 } 
                              X�jscr  ��ޭ