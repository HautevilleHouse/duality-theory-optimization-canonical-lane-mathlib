import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryOptimizationCanonicalLaneLean

structure SubgradientMethodPackage (f : ℝⁿ → ℝ) where
  subgradientSet : ℝⁿ → Set (ℝⁿ)
  lipschitzConstant : ℝ
  stepSizeRule : ℕ → ℝ
  convergenceGuarantee : Prop

structure SubgradientMethodEvidence {f : ℝⁿ → ℝ} (S : SubgradientMethodPackage f) where
  convergenceGuaranteeClosed : S.convergenceGuarantee

def SubgradientMethodClosed {f : ℝⁿ → ℝ} (S : SubgradientMethodPackage f) : Prop :=
  S.convergenceGuarantee

theorem subgradient_method_closed_from_evidence
    {f : ℝⁿ → ℝ} (S : SubgradientMethodPackage f) (E : SubgradientMethodEvidence S) :
    SubgradientMethodClosed S := by
  exact E.convergenceGuaranteeClosed

end DualityTheoryOptimizationCanonicalLaneLean
end HautevilleHouse