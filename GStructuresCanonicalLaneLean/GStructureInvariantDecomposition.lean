import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GStructuresCanonicalLaneLean

structure InvariantDecompositionPackage {G : Type u} [Group G] (R : ReductiveRepresentationPackage G) where
  invariantSubspace : Submodule ℝ R.vectorSpace
  complementSubspace : Submodule ℝ R.vectorSpace
  directSumDecomposition : IsInternal (fun i : Fin 2 => match i with | 0 => invariantSubspace | 1 => complementSubspace) R.vectorSpace
  invariantUnderG : ∀ g, ∀ x ∈ invariantSubspace, R.representationAction g x ∈ invariantSubspace
  complementInvariantUnderG : ∀ g, ∀ x ∈ complementSubspace, R.representationAction g x ∈ complementSubspace

structure InvariantDecompositionEvidence {G : Type u} [Group G] {R : ReductiveRepresentationPackage G}
    (I : InvariantDecompositionPackage R) where
  invariantUnderGClosed : ∀ g, ∀ x ∈ I.invariantSubspace, R.representationAction g x ∈ I.invariantSubspace
  complementInvariantUnderGClosed : ∀ g, ∀ x ∈ I.complementSubspace, R.representationAction g x ∈ I.complementSubspace

def InvariantDecompositionClosed {G : Type u} [Group G] {R : ReductiveRepresentationPackage G}
    (I : InvariantDecompositionPackage R) : Prop :=
  (∀ g, ∀ x ∈ I.invariantSubspace, R.representationAction g x ∈ I.invariantSubspace) ∧
  (∀ g, ∀ x ∈ I.complementSubspace, R.representationAction g x ∈ I.complementSubspace)

theorem invariant_decomposition_closed_from_evidence {G : Type u} [Group G] {R : ReductiveRepresentationPackage G}
    (I : InvariantDecompositionPackage R) (E : InvariantDecompositionEvidence I) : InvariantDecompositionClosed I := by
  exact And.intro E.invariantUnderGClosed E.complementInvariantUnderGClosed

end GStructuresCanonicalLaneLean
end HautevilleHouse