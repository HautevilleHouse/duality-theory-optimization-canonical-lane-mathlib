import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryOptimizationCanonicalLaneLean

structure StrongDualityConditionsPackage where
  constraintQualification : Prop
  dualOptimality : Prop
  primalAttainment : Prop
  zeroDualityGap : Prop

structure StrongDualityConditionsEvidence (S : StrongDualityConditionsPackage) where
  constraintQualificationClosed : S.constraintQualification
  dualOptimalityClosed : S.dualOptimality
  primalAttainmentClosed : S.primalAttainment
  zeroDualityGapClosed : S.zeroDualityGap

def StrongDualityConditionsClosed (S : StrongDualityConditionsPackage) : Prop :=
  S.constraintQualification ∧ S.dualOptimality ∧ S.primalAttainment ∧ S.zeroDualityGap

theorem strong_duality_conditions_closed_from_evidence (S : StrongDualityConditionsPackage) (E : StrongDualityConditionsEvidence S) :
    StrongDualityConditionsClosed S := by
  exact And.intro E.constraintQualificationClosed (And.intro E.dualOptimalityClosed (And.intro E.primalAttainmentClosed E.zeroDualityGapClosed))

end DualityTheoryOptimizationCanonicalLaneLean
end HautevilleHouse
