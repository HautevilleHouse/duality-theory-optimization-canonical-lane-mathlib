import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryOptimizationCanonicalLaneLean

structure LagrangianDualPackage where
  primalProblem : Prop
  lagrangianFormulation : Prop
  dualFunction : Prop
  weakDuality : Prop

structure LagrangianDualEvidence (P : LagrangianDualPackage) where
  primalProblemClosed : P.primalProblem
  lagrangianFormulationClosed : P.lagrangianFormulation
  dualFunctionClosed : P.dualFunction
  weakDualityClosed : P.weakDuality

def LagrangianDualClosed (P : LagrangianDualPackage) : Prop :=
  P.primalProblem ∧ P.lagrangianFormulation ∧ P.dualFunction ∧ P.weakDuality

theorem lagrangian_dual_closed_from_evidence (P : LagrangianDualPackage) (E : LagrangianDualEvidence P) :
    LagrangianDualClosed P := by
  exact And.intro E.primalProblemClosed (And.intro E.lagrangianFormulationClosed (And.intro E.dualFunctionClosed E.weakDualityClosed))

end DualityTheoryOptimizationCanonicalLaneLean
end HautevilleHouse
