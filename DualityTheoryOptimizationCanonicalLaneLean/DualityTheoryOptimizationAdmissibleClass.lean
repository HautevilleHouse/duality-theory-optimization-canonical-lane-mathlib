import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryOptimizationCanonicalLaneLean

structure DualityTheoryOptimizationAdmissibleObject where
  primalSpace : Type u
  dualSpace : Type v
  lagrangian : primalSpace → dualSpace → ℝ
  dualityGap : ℝ
  strongDualityHolds : Prop

structure DualityTheoryOptimizationAdmissibleClass where
  object : DualityTheoryOptimizationAdmissibleObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def dualityTheoryOptimizationWitnessClosed (A : DualityTheoryOptimizationAdmissibleClass) : Prop :=
  A.object.strongDualityHolds

def dualityTheoryOptimizationAdmittedClosure (A : DualityTheoryOptimizationAdmissibleClass) : Prop :=
  dualityTheoryOptimizationWitnessClosed A ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DualityTheoryOptimizationCanonicalLaneLean
end HautevilleHouse