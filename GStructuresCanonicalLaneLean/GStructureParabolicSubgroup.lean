import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GStructuresCanonicalLaneLean

structure ParabolicSubgroupPackage (G : Type u) [Group G] where
  subgroup : Subgroup G
  flagOfSubspaces : List (Submodule ℝ (VectorSpaceOver ℝ))
  stabilizerCondition : ∀ g ∈ subgroup, ∀ V ∈ flagOfSubspaces, LinearMap.range (g • V.subtype) = V
  connectednessProperty : Prop

structure ParabolicSubgroupEvidence {G : Type u} [Group G] (P : ParabolicSubgroupPackage G) where
  stabilizerConditionClosed : ∀ g ∈ P.subgroup, ∀ V ∈ P.flagOfSubspaces, LinearMap.range (g • V.subtype) = V
  connectednessPropertyClosed : P.connectednessProperty

def ParabolicSubgroupClosed {G : Type u} [Group G] (P : ParabolicSubgroupPackage G) : Prop :=
  (∀ g ∈ P.subgroup, ∀ V ∈ P.flagOfSubspaces, LinearMap.range (g • V.subtype) = V) ∧
  P.connectednessProperty

theorem parabolic_subgroup_closed_from_evidence {G : Type u} [Group G] (P : ParabolicSubgroupPackage G)
    (E : ParabolicSubgroupEvidence P) : ParabolicSubgroupClosed P := by
  exact And.intro E.stabilizerConditionClosed E.connectednessPropertyClosed

end GStructuresCanonicalLaneLean
end HautevilleHouse