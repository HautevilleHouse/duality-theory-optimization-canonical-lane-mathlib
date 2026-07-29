import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryOptimizationCanonicalLaneLean

structure PrimalDualPair where
  primal : Type u
  dual : Type v
  objective : primal → ℝ
  constraints : primal → Prop
  dualObjective : dual → ℝ
  dualConstraints : dual → Prop
  lagrangian : primal → dual → ℝ
  saddlePointProperty : Prop

structure PrimalDualEvidence (P : PrimalDualPair) where
  primalFeasibleNonempty : ∃ x : P.primal, P.constraints x
  dualFeasibleNonempty : ∃ y : P.dual, P.dualConstraints y
  strongDualityHolds : P.saddlePointProperty

def PrimalDualClosed (P : PrimalDualPair) : Prop :=
  P.saddlePointProperty

theorem primal_dual_closed_from_evidence (P : PrimalDualPair) (E : PrimalDualEvidence P) : PrimalDualClosed P := by
  exact E.strongDualityHolds

end DualityTheoryOptimizationCanonicalLaneLean
end HautevilleHouse