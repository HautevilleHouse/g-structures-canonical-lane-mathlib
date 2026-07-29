import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GStructuresCanonicalLaneLean

structure LeviDecompositionPackage {G : Type u} [Group G] (P : ParabolicSubgroupPackage G) where
  reductiveLeviSubgroup : Subgroup G
  unipotentRadical : Subgroup G
  semidirectProductDecomposition : IsSemidirectProduct reductiveLeviSubgroup unipotentRadical P.subgroup
  conjugationAction : ∀ h ∈ reductiveLeviSubgroup, ∀ u ∈ unipotentRadical, h * u * h⁻¹ ∈ unipotentRadical

structure LeviDecompositionEvidence {G : Type u} [Group G] {P : ParabolicSubgroupPackage G}
    (L : LeviDecompositionPackage P) where
  semidirectProductDecompositionClosed : IsSemidirectProduct L.reductiveLeviSubgroup L.unipotentRadical P.subgroup
  conjugationActionClosed : ∀ h ∈ L.reductiveLeviSubgroup, ∀ u ∈ L.unipotentRadical, h * u * h⁻¹ ∈ L.unipotentRadical

def LeviDecompositionClosed {G : Type u} [Group G] {P : ParabolicSubgroupPackage G}
    (L : LeviDecompositionPackage P) : Prop :=
  IsSemidirectProduct L.reductiveLeviSubgroup L.unipotentRadical P.subgroup ∧
  (∀ h ∈ L.reductiveLeviSubgroup, ∀ u ∈ L.unipotentRadical, h * u * h⁻¹ ∈ L.unipotentRadical)

theorem levi_decomposition_closed_from_evidence {G : Type u} [Group G] {P : ParabolicSubgroupPackage G}
    (L : LeviDecompositionPackage P) (E : LeviDecompositionEvidence L) : LeviDecompositionClosed L := by
  exact And.intro E.semidirectProductDecompositionClosed E.conjugationActionClosed

end GStructuresCanonicalLaneLean
end HautevilleHouse