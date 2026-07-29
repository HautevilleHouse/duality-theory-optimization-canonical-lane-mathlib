import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryOptimizationCanonicalLaneLean

structure DualityGapPackage (P : PrimalProblem) (D : DualProblem) where
  primalValue : ℝ
  dualValue : ℝ
  gapFormula : primalValue - dualValue ≥ 0
  gapClosureCondition : primalValue = dualValue → strongDuality

structure DualityGapEvidence {P : PrimalProblem} {D : DualProblem} (G : DualityGapPackage P D) where
  gapFormulaClosed : G.gapFormula
  gapClosureConditionClosed : G.gapClosureCondition

def DualityGapClosed {P : PrimalProblem} {D : DualProblem} (G : DualityGapPackage P D) : Prop :=
  G.gapFormula ∧ G.gapClosureCondition

theorem duality_gap_closed_from_evidence
    {P : PrimalProblem} {D : DualProblem} (G : DualityGapPackage P D) (E : DualityGapEvidence G) :
    DualityGapClosed G := by
  exact And.intro E.gapFormulaClosed E.gapClosureConditionClosed

end DualityTheoryOptimizationCanonicalLaneLean
end HautevilleHouse