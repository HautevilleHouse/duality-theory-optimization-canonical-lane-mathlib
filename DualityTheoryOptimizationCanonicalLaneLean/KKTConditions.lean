import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryOptimizationCanonicalLaneLean

structure KKTConditionsPackage (P : OptimizationProblem) where
  primalFeasibility : Prop
  dualFeasibility : Prop
  complimentarySlackness : Prop
  stationarity : Prop

structure KKTConditionsEvidence {P : OptimizationProblem} (K : KKTConditionsPackage P) where
  primalFeasibilityClosed : K.primalFeasibility
  dualFeasibilityClosed : K.dualFeasibility
  complimentarySlacknessClosed : K.complimentarySlackness
  stationarityClosed : K.stationarity

def KKTConditionsClosed {P : OptimizationProblem} (K : KKTConditionsPackage P) : Prop :=
  K.primalFeasibility ∧ K.dualFeasibility ∧ K.complimentarySlackness ∧ K.stationarity

theorem kkt_conditions_closed_from_evidence
    {P : OptimizationProblem} (K : KKTConditionsPackage P) (E : KKTConditionsEvidence K) :
    KKTConditionsClosed K := by
  exact And.intro E.primalFeasibilityClosed (And.intro E.dualFeasibilityClosed
    (And.intro E.complimentarySlacknessClosed E.stationarityClosed))

end DualityTheoryOptimizationCanonicalLaneLean
end HautevilleHouse