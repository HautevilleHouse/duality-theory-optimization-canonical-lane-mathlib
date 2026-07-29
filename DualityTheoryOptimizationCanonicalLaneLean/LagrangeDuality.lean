import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryOptimizationCanonicalLaneLean

structure LagrangeDualityPackage (D : DualPairingPackage) where
  primalFunction : D.primalSpace → ℝ
  dualFunction : D.dualSpace → ℝ
  weakDuality : Prop
  strongDuality : Prop
  constraintQualification : Prop
  weakDualityClosed : weakDuality
  strongDualityClosed : strongDuality
  constraintQualificationClosed : constraintQualification

structure LagrangeDualityEvidence {D : DualPairingPackage} (L : LagrangeDualityPackage D) where
  weakDualityClosed : L.weakDuality
  strongDualityClosed : L.strongDuality
  constraintQualificationClosed : L.constraintQualification

def LagrangeDualityClosed {D : DualPairingPackage} (L : LagrangeDualityPackage D) : Prop :=
  L.weakDuality ∧ L.strongDuality ∧ L.constraintQualification

theorem lagrange_duality_closed_from_evidence
    {D : DualPairingPackage} (L : LagrangeDualityPackage D) (E : LagrangeDualityEvidence L) :
    LagrangeDualityClosed L := by
  exact And.intro E.weakDualityClosed
    (And.intro E.strongDualityClosed E.constraintQualificationClosed)

end DualityTheoryOptimizationCanonicalLaneLean
end HautevilleHouse