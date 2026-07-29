import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityTheoryOptimizationCanonicalLaneLean

structure SlaterConditionPackage (P : ConstrainedProblem) where
  inequalityConstraints : List (ℝⁿ → ℝ)
  equalityConstraints : List (ℝⁿ → ℝ)
  slaterPointExists : ∃ x : ℝⁿ, (∀ g ∈ inequalityConstraints, g x < 0) ∧ (∀ h ∈ equalityConstraints, h x = 0)
  interiorNonempty : Prop

structure SlaterConditionEvidence (S : SlaterConditionPackage P) where
  slaterPointExistsClosed : S.slaterPointExists
  interiorNonemptyClosed : S.interiorNonempty

def SlaterConditionClosed (S : SlaterConditionPackage P) : Prop :=
  S.slaterPointExists ∧ S.interiorNonempty

theorem slater_condition_closed_from_evidence (S : SlaterConditionPackage P) (E : SlaterConditionEvidence S) :
    SlaterConditionClosed S := by
  exact And.intro E.slaterPointExistsClosed E.interiorNonemptyClosed

end DualityTheoryOptimizationCanonicalLaneLean
end HautevilleHouse