
data Sort : Type where
  ∗ : Sort
  □ : Sort
  △ : Sort

data Axiom : Sort -> Sort -> Type where
  StarIsABox : Axiom ∗ □
  BoxIsATriangle : Axiom □ △

-- Quantifying over an element of s2 that is indexed by s1
-- should give us somethign in s3...or
-- Πx:A.B(x)!2
data Rule : (s1 : Sort) -> (s2 : Sort) -> (s3 : Maybe Sort) -> Type where
  Ax : Axiom s1 s2 -> Rule s1 s2 Nothing
  Pi : Rule s1 s2 s3 -> (a : s1) -> (x : a) 


  






