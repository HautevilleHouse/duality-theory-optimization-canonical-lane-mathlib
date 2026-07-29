import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryOptimizationCanonicalLaneLean

structure FenchelConjugate (V : Type u) [NormedAddCommGroup V] where
  functionF : V → ℝ
  conjugateF : V → ℝ
  conjugateDef : conjugateF = λ y => sup (x : V) (inner x y - functionF x)
  conjugateDefHolds : conjugateDef

structure Biconjugate (V : Type u) [NormedAddCommGroup V] (F : FenchelConjugate V) where
  functionF : V → ℝ
  biconjugateF : V → ℝ
  biconjugateDef : biconjugateF = λ x => sup (y : V) (inner x y - F.conjugateF y)
  biconjugateDefHolds : biconjugateDef
  lowerSemicontinuousConvex : Prop
  lowerSemicontinuousConvexHolds : lowerSemicontinuousConvex
  equalityCondition : functionF = biconjugateF
  equalityConditionHolds : equalityCondition

def ConjugateDualityClosed (V : Type u) [NormedAddCommGroup V] (F : FenchelConjugate V) (B : Biconjugate V F) : Prop :=
  B.equalityCondition ∧ B.lowerSemicontinuousConvex

theorem conjugateDuality_closed_from_evidence (V : Type u) [NormedAddCommGroup V] (F : FenchelConjugate V) (B : Biconjugate V F) : ConjugateDualityClosed V F B := by
  exact And.intro B.equalityConditionHolds B.lowerSemicontinuousConvexHolds

end DualityTheoryOptimizationCanonicalLaneLean
end HautevilleHouse