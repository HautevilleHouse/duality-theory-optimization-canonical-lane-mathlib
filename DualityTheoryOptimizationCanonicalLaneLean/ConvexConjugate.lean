import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryOptimizationCanonicalLaneLean

structure ConvexConjugatePackage (X : Type u) where
  originalFunction : X → ℝ
  conjugate : (X → ℝ) → (X → ℝ)
  biconjugate : (X → ℝ) → (X → ℝ)
  convexityCondition : Prop
  lowerSemicontinuity : Prop
  fenchelBiconjugateTheorem : Prop

structure ConvexConjugateEvidence {X : Type u} (C : ConvexConjugatePackage X) where
  convexityConditionClosed : C.convexityCondition
  lowerSemicontinuityClosed : C.lowerSemicontinuity
  fenchelBiconjugateTheoremClosed : C.fenchelBiconjugateTheorem

def ConvexConjugateClosed {X : Type u} (C : ConvexConjugatePackage X) : Prop :=
  C.convexityCondition ∧ C.lowerSemicontinuity ∧ C.fenchelBiconjugateTheorem

theorem convex_conjugate_closed_from_evidence {X : Type u}
    (C : ConvexConjugatePackage X) (E : ConvexConjugateEvidence C) :
    ConvexConjugateClosed C := by
  exact And.intro E.convexityConditionClosed (And.intro E.lowerSemicontinuityClosed
    E.fenchelBiconjugateTheoremClosed)

end DualityTheoryOptimizationCanonicalLaneLean
end HautevilleHouse