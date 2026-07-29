import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryOptimizationCanonicalLaneLean

structure DualPairingPackage where
  primalSpace : Type u
  dualSpace : Type v
  pairing : primalSpace → dualSpace → ℝ
  bilinear : Prop
  nondegenerate : Prop
  bilinearClosed : bilinear
  nondegenerateClosed : nondegenerate

structure DualPairingEvidence (D : DualPairingPackage) where
  bilinearClosed : D.bilinear
  nondegenerateClosed : D.nondegenerate

def DualPairingClosed (D : DualPairingPackage) : Prop :=
  D.bilinear ∧ D.nondegenerate

theorem dual_pairing_closed_from_evidence (D : DualPairingPackage) (E : DualPairingEvidence D) :
    DualPairingClosed D := by
  exact And.intro E.bilinearClosed E.nondegenerateClosed

end DualityTheoryOptimizationCanonicalLaneLean
end HautevilleHouse