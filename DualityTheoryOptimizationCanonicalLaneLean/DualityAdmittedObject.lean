import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace DualityTheoryOptimizationCanonicalLaneLean

structure DualityAdmittedObject where
  point : Type
  primalOptimalValue : ℝ
  dualOptimalValue : ℝ
  strongDualityHolds : primalOptimalValue = dualOptimalValue
  conclusion : strongDualityHolds

def DualityWitnessClosed (O : DualityAdmittedObject) : Prop :=
  O.strongDualityHolds

end DualityTheoryOptimizationCanonicalLaneLean
end HautevilleHouse
