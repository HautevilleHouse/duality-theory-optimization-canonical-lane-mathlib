import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryOptimizationCanonicalLaneLean

structure FenchelRockafellarDualityPackage (X : Type u) (Y : Type v) where
  primalFunction : X → ℝ
  dualFunction : Y → ℝ
  conjugate : (X → ℝ) → (X → ℝ)
  fenchelYoungInequality : Prop
  strongDualityCondition : Prop

structure FenchelRockafellarDualityEvidence {X : Type u} {Y : Type v}
    (P : FenchelRockafellarDualityPackage X Y) where
  fenchelYoungInequalityClosed : P.fenchelYoungInequality
  strongDualityConditionClosed : P.strongDualityCondition

def FenchelRockafellarDualityClosed {X : Type u} {Y : Type v}
    (P : FenchelRockafellarDualityPackage X Y) : Prop :=
  P.fenchelYoungInequality ∧ P.strongDualityCondition

theorem fenchel_rockafellar_duality_closed_from_evidence {X : Type u} {Y : Type v}
    (P : FenchelRockafellarDualityPackage X Y) (E : FenchelRockafellarDualityEvidence P) :
    FenchelRockafellarDualityClosed P := by
  exact And.intro E.fenchelYoungInequalityClosed E.strongDualityConditionClosed

end DualityTheoryOptimizationCanonicalLaneLean
end HautevilleHouse