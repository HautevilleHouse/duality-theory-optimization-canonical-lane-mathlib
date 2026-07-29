import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryOptimizationCanonicalLaneLean

structure SaddlePointSubdifferentialPackage (X : Type u) (Y : Type v) where
  saddleFunction : X → Y → ℝ
  primalMin : X
  dualMax : Y
  saddlePoint : Prop
  subdifferentialInclusion : Prop
  optimalityCharacterization : Prop

structure SaddlePointSubdifferentialEvidence {X : Type u} {Y : Type v}
    (S : SaddlePointSubdifferentialPackage X Y) where
  saddlePointClosed : S.saddlePoint
  subdifferentialInclusionClosed : S.subdifferentialInclusion
  optimalityCharacterizationClosed : S.optimalityCharacterization

def SaddlePointSubdifferentialClosed {X : Type u} {Y : Type v}
    (S : SaddlePointSubdifferentialPackage X Y) : Prop :=
  S.saddlePoint ∧ S.subdifferentialInclusion ∧ S.optimalityCharacterization

theorem saddle_point_subdifferential_closed_from_evidence {X : Type u} {Y : Type v}
    (S : SaddlePointSubdifferentialPackage X Y) (E : SaddlePointSubdifferentialEvidence S) :
    SaddlePointSubdifferentialClosed S := by
  exact And.intro E.saddlePointClosed (And.intro E.subdifferentialInclusionClosed
    E.optimalityCharacterizationClosed)

end DualityTheoryOptimizationCanonicalLaneLean
end HautevilleHouse