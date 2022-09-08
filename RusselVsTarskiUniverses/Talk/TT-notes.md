 * Agda : Lowest level is Set_0. Built-in operations on levels, may construct levels,
          no level elimination prinicple.



# W Types
  * Introduced by Per Martin-Löf
    
     A : Type    x : A   B(x) : Type
    \-------------------------------
          W(x : A)B(x) : Type

  * Similar to PI?  Are they PI with extra structions? 
  * if c : W(x : A)B(x) then c has the form sup(a, b) for some a and b.
  * Are we introducing strict positivity violations with Hurkens' Paradox?
  * See: A General Formulation of Simultaneous Inductive-Recursive Definitions in Type Theory by Dybjer
  * See: A Finite Axiomatization of Inductive-Recursive Definitions by Dybjer
