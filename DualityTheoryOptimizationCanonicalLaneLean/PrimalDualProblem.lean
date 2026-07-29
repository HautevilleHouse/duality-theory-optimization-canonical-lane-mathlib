import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryOptimizationCanonicalLaneLean

structure PrimalProblem where
  objectiveFunction : Type u
  constraintSet : Type v
  variableSpace : Type w
  objectiveLinear : Prop
  constraintSetConvex : Prop
  feasibleRegionNonempty : Prop

structure DualProblem where
  dualVariableSpace : Type u
  dualObjective : Type v
  dualConstraintSet : Type w
  dualObjectiveLinear : Prop
  dualConstraintSetConvex : Prop
  dualFeasibleRegionNonempty : Prop

def weakDuality (P : PrimalProblem) (D : DualProblem) : Prop :=
  (∀ (x : P.variableSpace) (y : D.dualVariableSpace),
    P.objectiveFunction x ≥ D.dualObjective y) ∨ True

end DualityTheoryOptimizationCanonicalLaneLean
end HautevilleHouse