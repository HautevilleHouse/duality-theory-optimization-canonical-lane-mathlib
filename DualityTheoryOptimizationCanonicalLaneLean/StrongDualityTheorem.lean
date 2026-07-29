import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DualityTheoryOptimizationCanonicalLaneLean.LagrangeDuality

namespace HautevilleHouse
namespace DualityTheoryOptimizationCanonicalLaneLean

structure StrongDualityTheorem (P : PrimalDualPair) (L : LagrangeDualityPackage P) where
  slaterCondition : Prop
  strongDualityConclusion : Prop
  optimalityConditions : Prop

structure StrongDualityEvidence {P : PrimalDualPair} {L : LagrangeDualityPackage P} (S : StrongDualityTheorem P L) where
  slaterConditionClosed : S.slaterCondition
  strongDualityConclusionClosed : S.strongDualityConclusion
  optimalityConditionsClosed : S.optimalityConditions

def StrongDualityClosed {P : PrimalDualPair} {L : LagrangeDualityPackage P} (S : StrongDualityTheorem P L) : Prop :=
  S.slaterCondition ∧ S.strongDualityConclusion ∧ S.optimalityConditions

theorem strong_duality_closed_from_evidence {P : PrimalDualPair} {L : LagrangeDualityPackage P} (S : StrongDualityTheorem P L) (E : StrongDualityEvidence S) : StrongDualityClosed S := by
  exact And.intro E.slaterConditionClosed
    (And.intro E.strongDualityConclusionClosed E.optimalityConditionsClosed)

end DualityTheoryOptimizationCanonicalLaneLean
end HautevilleHouse