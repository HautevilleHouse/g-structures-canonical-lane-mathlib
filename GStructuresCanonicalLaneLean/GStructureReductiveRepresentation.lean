import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GStructuresCanonicalLaneLean

structure ReductiveRepresentationPackage (G : Type u) [Group G] where
  vectorSpace : Type v
  vectorSpaceModule : Module ℝ vectorSpace
  representationAction : G → vectorSpace → vectorSpace
  representationLinear : ∀ g, LinearMap ℝ vectorSpace vectorSpace
  representationGroupHom : ∀ g h, representationAction (g * h) = representationAction g ∘ representationAction h

structure ReductiveRepresentationEvidence {G : Type u} [Group G] (R : ReductiveRepresentationPackage G) where
  representationLinearClosed : ∀ g, LinearMap ℝ R.vectorSpace R.vectorSpace
  representationGroupHomClosed : ∀ g h, R.representationAction (g * h) = R.representationAction g ∘ R.representationAction h

def ReductiveRepresentationClosed {G : Type u} [Group G] (R : ReductiveRepresentationPackage G) : Prop :=
  (∀ g, LinearMap ℝ R.vectorSpace R.vectorSpace) ∧
  (∀ g h, R.representationAction (g * h) = R.representationAction g ∘ R.representationAction h)

theorem reductive_representation_closed_from_evidence {G : Type u} [Group G] (R : ReductiveRepresentationPackage G)
    (E : ReductiveRepresentationEvidence R) : ReductiveRepresentationClosed R := by
  exact And.intro E.representationLinearClosed E.representationGroupHomClosed

end GStructuresCanonicalLaneLean
end HautevilleHouse