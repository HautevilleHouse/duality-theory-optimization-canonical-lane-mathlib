import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryOptimizationCanonicalLaneLean

structure LagrangianDualityPackage (P : PrimalProblem) (D : DualProblem) where
  primalOptimalValue : ℝ
  dualOptimalValue : ℝ
  weakDualityHolds : primalOptimalValue ≥ dualOptimalValue
  strongDualityConditions : Prop
  constraintQualification : Prop

structure LagrangianDualityEvidence {P : PrimalProblem} {D : DualProblem} (L : LagrangianDualityPackage P D) where
  weakDualityClosed : L.weakDualityHolds
  strongDualityConditionsClosed : L.strongDualityConditions
  constraintQualificationClosed : L.constraintQualification

def LagrangianDualityClosed {P : PrimalProblem} {D : DualProblem} (L : LagrangianDualityPackage P D) : Prop :=
  L.weakDualityHolds ∧ L.strongDualityConditions ∧ L.constraintQualification

theorem lagrangian_duality_closed_from_evidence 
    {P : PrimalProblem} {D : DualProblem} (L : LagrangianDualityPackage P D)
    (E : LagrangianDualityEvidence L) : LagrangianDualityClosed L := by
  exact And.intro E.weakDualityClosed (And.intro E.strongDualityConditionsClosed E.constraintQualificationClosed)

end DualityTheoryOptimizationCanonicalLaneLean
end HautevilleHouse