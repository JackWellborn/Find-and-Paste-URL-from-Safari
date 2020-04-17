JsOsaDAS1.001.00bplist00�Vscriptoi v a r   b r o w s e r C o n f i g s   =   { 
 	 c h r o m e :   { 
 	 	 n a m e :   " G o o g l e   C h r o m e " 
 	 } , 
 	 s a f a r i :   { 
 	 	 n a m e :   " S a f a r i " 
 	 } 
 } ; 
 
 v a r   b r o w s e r C o n f i g   =   b r o w s e r C o n f i g s . s a f a r i ; 
 / /   v a r   b r o w s e r C o n f i g   =   b r o w s e r C o n f i g s . c h r o m e ; 
 
 v a r   s y s t e m   =   A p p l i c a t i o n ( " S y s t e m   E v e n t s " ) ; 
 s y s t e m . i n c l u d e S t a n d a r d A d d i t i o n s   =   t r u e ; 
 v a r   p r o c e s s   =   s y s t e m . p r o c e s s e s . w h o s e ( {   _ a n d : [ { n a m e : { _ b e g i n s W i t h :   b r o w s e r C o n f i g . n a m e } } ,   { v i s i b l e : t r u e } ] } ) [ 0 ] ; 
 v a r   b r o w s e r   =   A p p l i c a t i o n ( p r o c e s s . n a m e ( ) ) ; 
 b r o w s e r . i n c l u d e S t a n d a r d A d d i t i o n s   =   t r u e ; 
 
 / / F o r   w h a t e v e r   r e a s o n   t h i s   w o r k s   w h e r e s   c u r r e n t A p p l i c a t i o n   d o e s   n o t . 
 v a r   a p p   =   A p p l i c a t i o n ( s y s t e m . p r o c e s s e s . w h e r e ( { f r o n t m o s t : t r u e } ) [ 0 ] . d i s p l a y e d N a m e ( ) ) ; 
 a p p . i n c l u d e S t a n d a r d A d d i t i o n s   =   t r u e ; 
 
 f u n c t i o n   g e t T a b B y A b s o l u t e I n d e x ( q u e r y )   { 
 	 v a r   i n d e x ,   u r l s = [ ] ; 
 	 b r o w s e r . w i n d o w s ( ) . f o r E a c h ( ( w i n d o w )   = >   { 
 	 	 i f   ( q u e r y   < =   w i n d o w . t a b s . l e n g t h )   { 
 	 	 	 i f   (   q u e r y   <   0   )   { 
 	 	 	 	 i n d e x   =   w i n d o w . t a b s ( ) . l e n g t h   +   q u e r y ; 
 	 	 	 }   e l s e   { 
 	 	 	 	 i n d e x   =   q u e r y   -   1 ; 
 	 	 	 } 
 	 	 	 u r l s . p u s h ( w i n d o w . t a b s [ i n d e x ] . u r l ( ) ) ; 
 	 	 } 
 	 } ) ; 
 	 r e t u r n   u r l s ; 
 } 
 
 f u n c t i o n   g e t T a b B y R e l a t i v e I n d e x ( q u e r y )   { 
 	 v a r   c u r r e n t T a b I n d e x   =   b r o w s e r C o n f i g   = = =   b r o w s e r C o n f i g s . s a f a r i   ?   
 	 	 b r o w s e r . w i n d o w s [ 0 ] . c u r r e n t T a b ( ) . i n d e x ( )   :   
 	 	 b r o w s e r . w i n d o w s [ 0 ] . a c t i v e T a b I n d e x ( ) ; 
 	 v a r   r e l a t i v e T a b I n d e x   =   c u r r e n t T a b I n d e x - 1   +   q u e r y ; 
 	 i f   ( r e l a t i v e T a b I n d e x   > =   b r o w s e r . w i n d o w s [ 0 ] . t a b s ( ) . l e n g t h )   { 
 	 	 r e l a t i v e T a b I n d e x   =   r e l a t i v e T a b I n d e x   -   b r o w s e r . w i n d o w s [ 0 ] . t a b s ( ) . l e n g t h ; 
 	 } 
 	 r e t u r n   [ b r o w s e r . w i n d o w s [ 0 ] . t a b s [ r e l a t i v e T a b I n d e x ] . u r l ( ) ] ; 
 } 
 
 f u n c t i o n   g e t T a b s W i t h U r l s T h a t C o n t a i n ( q u e r y )   { 
 	 v a r   u r l s   =   [ ] ; 
 	 b r o w s e r . w i n d o w s ( ) . f o r E a c h ( ( w i n d o w )   = >   { 
 	 	 v a r   t a b s   =   w i n d o w . t a b s . w h o s e ( {   u r l : {   _ c o n t a i n s :   q u e r y   } } ) ; 
 	 	 t a b s ( ) . f o r E a c h ( f u n c t i o n ( t a b )   { 
 	 	 	 u r l s . p u s h ( t a b . u r l ( ) ) ; 
 	 	 } ) ; 
 	 } ) ; 
 	 r e t u r n   u r l s ; 
 } 
 
 f u n c t i o n   g e t T a b s W i t h T i t l e s T h a t C o n t a i n ( q u e r y )   { 
 	 v a r   t i t l e s   =   [ ] ; 
 	 b r o w s e r . w i n d o w s ( ) . f o r E a c h ( ( w i n d o w )   = >   { 
 	 	 v a r   t a b s   =   w i n d o w . t a b s . w h o s e ( {   n a m e : {   _ c o n t a i n s :   q u e r y   } } ) ; 
 	 	 t a b s ( ) . f o r E a c h ( f u n c t i o n ( t a b )   { 
 	 	 	 t i t l e s . p u s h ( t a b . u r l ( ) ) ; 
 	 	 } ) ; 
 	 } ) ; 
 	 r e t u r n   t i t l e s ; 
 } 
 v a r   f o r m a t C o d e   =   ' n o n e ' ; 
 v a r   f o r m a t S i g n i f i e r   =   '   . ' ; 
 v a r   f o r m a t T e m p l a t e s   =   [ 
 	 {   n a m e :   ' m a r k d o w n ' ,   c o d e :   ' m ' ,   t e m p l a t e :   ' [ { T E X T } ] ( { U R L } ) '   } , 
 	 {   n a m e :   ' j i r a ' ,   c o d e :   ' j ' ,   t e m p l a t e :   ' [ { T E X T } | { U R L } ] '   } , 
 	 {   n a m e :   ' h t m l ' ,   c o d e :   ' h ' ,   t e m p l a t e :   ' < a   h r e f = " { U R L } " > { T E X T } < / a > ) '   } , 
 	 {   n a m e :   ' r e v e a l ' ,   c o d e :   ' r ' ,   t e m p l a t e :   ' ' ,   a c t i o n :   ( u r l )   = >   { 
 	 	 b r o w s e r . w i n d o w s ( ) . f o r E a c h ( ( w i n ,   w )   = >   { 
 	 	 	 f o r ( l e t   t = 0 ;   t   <   w i n . t a b s ( ) . l e n g t h ;   t + + ) { 
 	 	 	 	 i f   ( w i n . t a b s [ t ] . u r l ( )   = = =   u r l )   { 
 	 	 	 	 	 m a t c h i n g T a b   =   w i n . t a b s [ t ] ; 
 	 	 	 	 	 m a t c h i n g T a b I n d e x   =   t ; 
 	 	 	 	 	 i f   (   b r o w s e r C o n f i g . n a m e   = = =   ' S a f a r i '   )   { 
 	 	 	 	 	 	 v a r   t a b   =   w i n . t a b s . w h o s e ( {   u r l :   u r l   } ) [ 0 ] ; 
 	 	 	 	 	 	 w i n . c u r r e n t T a b   =   t a b ; 
 	 	 	 	 	 }   e l s e   { 	 	 
 	 	 	 	 	 	 w i n . a c t i v e T a b I n d e x   =   m a t c h i n g T a b I n d e x + 1 ; 
 	 	 	 	 	 } 
 	 	 	 	 	 b r o w s e r . a c t i v a t e ( ) ; 
 	 	 	 	 	 p r o c e s s . w i n d o w s [ w ] . a c t i o n s [ ' A X R a i s e ' ] . p e r f o r m ( ) ; 
 	 	 	 	 	 b r e a k ; 
 	 	 	 	 } 
 	 	 	 } 
 	 	 } ) ; 
 	 } } 
 ] ; 
 
 f u n c t i o n   r u n Q u e r y ( i n p u t )   { 
 	 v a r   i n p u t   =   i n p u t . t o S t r i n g ( ) ; 
 	 f o r m a t T e m p l a t e s . f o r E a c h ( ( f o r m a t )   = >   { 
 	 	 v a r   f o r m a t R e g E x p   =   n e w   R e g E x p ( f o r m a t S i g n i f i e r   +   f o r m a t . c o d e   +   ' $ ' ) ; 
 	 	 i f   ( f o r m a t R e g E x p . t e s t ( i n p u t ) )   { 
 	 	 	 v a r   i n p u t A r r   =   i n p u t . s p l i t ( f o r m a t S i g n i f i e r ) ; 
 	 	 	 f o r m a t C o d e   =   i n p u t A r r . p o p ( ) ; 
 	 	 	 i n p u t   =   i n p u t A r r . j o i n ( f o r m a t S i g n i f i e r ) ; 
 	 	 } 
 	 } ) ; 
 	 v a r   f u l l Q u e r y   =   i n p u t ; 
 	 v a r   q u e r y C h a r a c t e r   =   f u l l Q u e r y . c h a r A t ( 0 ) ; 
 	 v a r 	 q u e r y P a r a m e t e r   =     f u l l Q u e r y . s u b s t r i n g ( 1 ) ; 
 	 v a r   q u e r y C h a r a c t e r s   =   [ ' = ' ] ; 
 	 v a r   u r l ; 
 	 v a r   u r l s   =   [ ] ; 
 	 i f   ( ! i s N a N ( f u l l Q u e r y )   & &   f u l l Q u e r y   ! = =   " " )   { 
 	 	 u r l s   =   g e t T a b B y R e l a t i v e I n d e x ( p a r s e I n t ( f u l l Q u e r y ,   1 0 ) ) ; 
 	 }   e l s e   i f   ( q u e r y C h a r a c t e r s . i n d e x O f ( q u e r y C h a r a c t e r )   > =   0 )   { 
 	 	 s w i t c h ( q u e r y C h a r a c t e r )   { 
 	 	 	 c a s e   " = " : 
 	 	 	 	 u r l s   =   g e t T a b B y A b s o l u t e I n d e x ( p a r s e I n t ( q u e r y P a r a m e t e r ,   1 0 ) ) ; 
 	 	 	 	 b r e a k ; 
 	 	 } 
 	 }   e l s e   i f   ( / ^ ( ( ? ! - ) ) ( x n - - ) ? [ a - z 0 - 9 ] [ a - z 0 - 9 - _ ] { 0 , 6 1 } [ a - z 0 - 9 ] { 0 , 1 } \ . ( x n - - ) ? ( [ a - z 0 - 9 \ - ] { 1 , 6 1 } | [ a - z 0 - 9 - ] { 1 , 3 0 } \ . [ a - z ] { 2 , } ) $ / . t e s t ( f u l l Q u e r y ) )   { 
 	 	 u r l s   =   g e t T a b s W i t h U r l s T h a t C o n t a i n ( f u l l Q u e r y ) ; 
 	 }   e l s e   i f   ( f u l l Q u e r y . l e n g t h   >   0 )   { 
 	 	 u r l s   =   g e t T a b s W i t h T i t l e s T h a t C o n t a i n ( f u l l Q u e r y ) ; 
 	 }   e l s e   { 
 	 	 u r l s   =   g e t T a b B y R e l a t i v e I n d e x ( 0 ) ; 
 	 } 
 	 
 	 i f ( u r l s . l e n g t h   >   1 )   { 
 	 	 v a r   c h o i c e   =   a p p . c h o o s e F r o m L i s t ( u r l s ,   { 
 	 	 	 w i t h T i t l e : " M u l t i p l e   M a t c h i n g   U R L s   F o u n d " , 
 	 	 	 w i t h P r o m p t : " S e l e c t   t h e   d e s i r e d   m a t c h i n g   U R L " , 
 	 	 	 o k B u t t o n N a m e : " P a s t e   U R L " , 
 	 	 	 c a n c e l B u t t o n : " C a n c e l " } ) ; 
 	 	 	 
 	 	 	 i f ( c h o i c e ) { 
 	 	 	 	 u r l   =   c h o i c e . t o S t r i n g ( ) ; 
 	 	 	 }   
 	 }   e l s e   { 
 	 	 u r l   =   u r l s [ 0 ] ; 
 	 } 
 	 r e t u r n   u r l ; 
 	 
 } 
 f u n c t i o n   p a s t e U R L ( u r l ) { 
 	 v a r   s a v e d C l i p b o a r d   =   a p p . t h e C l i p b o a r d ( ) ; 
 	 a p p . s e t T h e C l i p b o a r d T o ( u r l ) ; 
 	 s y s t e m . k e y s t r o k e ( ' v ' , { u s i n g : [ " c o m m a n d   d o w n " ] } ) ; 
 	 d e l a y ( . 5 ) ; 
 	 a p p . s e t T h e C l i p b o a r d T o ( s a v e d C l i p b o a r d ) ; 
 } 
 f u n c t i o n   o p e n D i a l o g ( )   { 
 	 v a r   d i a l o g   =   a p p . d i s p l a y D i a l o g ( ` F i n d   a n d   P a s t e   U R L   f r o m   $ { b r o w s e r C o n f i g . n a m e } ` ,   { 
 	 	 / /   w i t h T i t l e : ` F i n d   a n d   P a s t e   U R L   f r o m   $ { b r o w s e r C o n f i g . n a m e } ` , 
 	 	 d e f a u l t A n s w e r : " " , 
 	 	 b u t t o n s : [ " H e l p " ,   " C a n c e l " ,   " P a s t e   U R L " ] , 
 	 	 c a n c e l B u t t o n :   " C a n c e l " , 
 	 	 d e f a u l t B u t t o n : " P a s t e   U R L " 
 	 } ) ; 
 	 i f   ( d i a l o g . b u t t o n R e t u r n e d   = = =   " H e l p " )   { 
 	 	 v a r   d i a l o g   =   a p p . d i s p l a y D i a l o g ( ` T h i s   s c r i p t   f i n d s   a n d   p a s t e s   U R L s   f r o m   o p e n   t a b s   i n   $ { b r o w s e r C o n f i g . n a m e }   b a s e d   o n   p r o v i d e d   i n p u t   b e l o w : 
 	 	 	 	 
   "   N o   i n p u t   w i l l   p a s t e   t h e   U R L   f r o m   t h e   c u r r e n t   t a b   i n   f r o n t m o s t   w i n d o w . 
 
   "   A   n u m b e r   w i l l   p a s t e   t h e   U R L   f r o m   a   t a b   r e l a t i v e   t o   t h e   c u r r e n t   t a b   i n   f r o n t m o s t   w i n d o w .   ( e . g .   1   o r   - 1 ) 
 
   "   A   n u m b e r   p r e c e d e d   b y   " = "   w i l l   g e t   U R L s   f r o m   t a b s   b y   i n d e x   i n   a l l   w i n d o w s .   ( e . g .   = 1   o r   = - 1 ) 
 
   "   T e x t   w i l l   g e t   U R L s   f r o m   t a b s   b y   t i t l e   i n   a l l   w i n d o w s . 
 
   "   D o m a i n s   w i l l   g e t   U R L s   f r o m   t a b s   b y   l o c a t i o n   i n   a l l   w i n d o w s . 
 
 A d d t i o n a l l y   b y   a p p e n d i n g   '   . '   f o l l o w e d   b y   a   c o d e   b e l o w ,   t h i s   s c r i p t   c a n   a l s o   p a s t e   U R L s   f o r m a t t e d   i n   p r e d e f i n e d   t e m p l a t e s &   
 
   "     . m   -   M a r k d o w n   l i n k 
   "     . h   -   H T M L   a n c h o r   t a g 
   "     . j   -   J i r a   l i n k 
   
 . . . o r   s i m p l y   r e v e a l   t h e   t a b   c o n t a i n i n g   t h e   U R L 
 
   "     . r   -   R e v e a l 
 ` ,   { 
 	 	 	 w i t h T i t l e : ` F i n d   a n d   P a s t e   U R L   f r o m   $ { b r o w s e r C o n f i g . n a m e }   -   H e l p ` , 
 	 	 	 b u t t o n s : [ " C l o s e " ] , 
 	 	 	 d e f a u l t B u t t o n : " C l o s e " 
 	 	 } ) ; 
 	 	 o p e n D i a l o g ( ) ; 
 	 }   e l s e   i f   ( d i a l o g . b u t t o n R e t u r n e d   = = =   " P a s t e   U R L " )   {   
 	 	 v a r   u r l   =   r u n Q u e r y ( d i a l o g . t e x t R e t u r n e d ) ;   
 	 	 i f   ( f o r m a t C o d e   ! = =   ' n o n e ' )   { 
 	 	 	 v a r   f o r m a t t i n g   =   f o r m a t T e m p l a t e s . f i n d ( f o r m a t T e m p l a t e   = >   f o r m a t T e m p l a t e . c o d e   = = =   f o r m a t C o d e ) ; 
 	 	 	 i f   ( f o r m a t t i n g . t e m p l a t e . i n d e x O f ( ' { U R L } ' )   > =   0 )   { 
 	 	 	 	 v a r   f o r m a t t e d U r l   =   f o r m a t t i n g . t e m p l a t e . r e p l a c e ( ' { U R L } ' ,   u r l ) ; 
 	 	 	 	 v a r   c h a r s T o T e x t I n s e r t i o n   =   f o r m a t t e d U r l . s p l i t ( ' ' ) . r e v e r s e ( ) . j o i n ( ' ' ) . i n d e x O f ( ' } T X E T { ' ) ; 
 	 	 	 	 f o r m a t t e d U r l   =   f o r m a t t e d U r l . r e p l a c e ( ' { T E X T } ' ,   u r l ) ; 
 	 	 	 	 p a s t e U R L ( f o r m a t t e d U r l ) ; 
 	 	 	 	 f o r   ( l e t   i   =   0 ;   i   <   c h a r s T o T e x t I n s e r t i o n ;   i + + )   { 
 	 	 	 	 	 s y s t e m . k e y C o d e ( 1 2 3 ) ; 
 	 	 	 	 } 
 	 	 	 	 f o r   ( l e t   j   =   0 ;   j   <   u r l . l e n g t h ;   j + + )   { 
 	 	 	 	 	 s y s t e m . k e y C o d e ( 1 2 3 ,   { u s i n g : ' s h i f t   d o w n ' } ) ; 
 	 	 	 	 } 
 	 	 	 }   e l s e   i f   ( f o r m a t t i n g . a c t i o n   & &   t y p e o f   f o r m a t t i n g . a c t i o n   = = =   ' f u n c t i o n ' )   { 
 	 	 	 	 f o r m a t t i n g . a c t i o n ( u r l ) ; 
 	 	 	 } 
 	 	 }   e l s e   { 
 	 	 	 p a s t e U R L ( u r l ) ; 
 	 	 } 
 	 } 
 } ; 
 o p e n D i a l o g ( ) ; 
 / /                                2�jscr  ��ޭ