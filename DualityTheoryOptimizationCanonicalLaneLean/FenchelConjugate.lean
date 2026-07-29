import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryOptimizationCanonicalLaneLean

structure FenchelConjugatePackage (D : DualPairingPackage) where
  lowerSemicontinuousProperConvex : Prop
  conjugateDefined : (D.primalSpace → ℝ) → (D.dualSpace → ℝ)
  biconjugateRecovers : Prop
  lowerSemicontinuousProperConvexClosed : lowerSemicontinuousProperConvex
  biconjugateRecoversClosed : biconjugateRecovers

structure FenchelConjugateEvidence {D : DualPairingPackage} (F : FenchelConjugatePackage D) where
  lowerSemicontinuousProperConvexClosed : F.lowerSemicontinuousProperConvex
  biconjugateRecoversClosed : F.biconjugateRecovers

def FenchelConjugateClosed {D : DualPairingPackage} (F : FenchelConjugatePackage D) : Prop :=
  F.lowerSemicontinuousProperConvex ∧ F.biconjugateRecovers

theorem fenchel_conjugate_closed_from_evidence
    {D : DualPairingPackage} (F : FenchelConjugatePackage D) (E : FenchelConjugateEvidence F) :
    FenchelConjugateClosed F := by
  exact And.intro E.lowerSemicontinuousProperConvexClosed E.biconjugateRecoversClosed

end DualityTheoryOptimizationCanonicalLaneLean
end HautevilleHouse