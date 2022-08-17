module HurkensParadoxLoop

%default total

-- Caued by Type : Type

-- Negation, (x : A) -> ⊥
¬ : Type -> Type
¬ x = x -> Void

-- Type level predicate.
-- ∀(x : Type) -> Type
P : (x : Type) -> Type
P x = x -> Type

-- consider this universe. 
-- Essentially this implies an ordering?
𝓤 : Type
𝓤 = (x : Type) -> (P (P x) -> x) -> P (P x)

τ : P (P 𝓤) -> 𝓤
τ t = \x, f, p => t (\x' => p (f (x' x f)))

σ : 𝓤 -> P (P 𝓤)
σ s = s 𝓤 (\t => τ t)

Δ : P 𝓤
Δ = \y => ¬ ((p : P 𝓤) -> σ y p -> p (τ (σ y)))

Ω : 𝓤
Ω = τ (\p => (x : 𝓤) -> σ x p -> p x)

D : Type
D = (p : P 𝓤) -> σ Ω p -> p (τ (σ Ω))

-- 
lemma1 : (p : P 𝓤) -> ((x : 𝓤) -> σ x p -> p x) -> p Ω
lemma1 p h1 = h1 Ω (\x => h1 (τ (σ x)))

lemma2 : ¬ D
lemma2 = lemma1 Δ (\x, h2, h3 => h3 Δ h2 (\p => h3 (\y => p (τ (σ y)))))

lemma3 : D
lemma3 p = lemma1 (\y => p (τ (σ y)))

-- this term runs forever, and is an inhabitant of Void which has no elements...
loop : Void
loop = lemma2 lemma3

trueIsFalse : True = False
trueIsFalse = void loop


