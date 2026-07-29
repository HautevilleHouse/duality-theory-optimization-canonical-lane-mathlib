import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryOptimizationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DualityWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DualityTheoryOptimizationCanonicalLaneLean
end HautevilleHouse
