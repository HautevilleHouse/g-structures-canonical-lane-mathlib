import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GStructuresCanonicalLaneLean

open scoped Manifold

/-! Smooth structure on flag varieties -/

structure FlagVarietyPackage {G : Type u} [Group G] [TopologicalSpace G] [LieGroup G] (P : ParabolicSubgroupPackage G) where
  flagVariety : Type v
  flagTopology : TopologicalSpace flagVariety
  flagSmoothManifold : SmoothManifold flagVariety
  projectionMap : G → flagVariety
  surjectivity : Function.Surjective projectionMap
  fiberDescription : ∀ x : flagVariety, ∃ (g : G), projectionMap g = x ∧ (Subgroup.map (λ h : P.subgroup => g * h) P.subgroup = stabilizerSubgroup x)

structure FlagVarietyEvidence {G : Type u} [Group G] [TopologicalSpace G] [LieGroup G] {P : ParabolicSubgroupPackage G}
    (F : FlagVarietyPackage P) where
  surjectivityClosed : Function.Surjective F.projectionMap
  fiberDescriptionClosed : ∀ x : F.flagVariety, ∃ (g : G), F.projectionMap g = x ∧ (Subgroup.map (λ h : P.subgroup => g * h) P.subgroup = stabilizerSubgroup x)

def FlagVarietyClosed {G : Type u} [Group G] [TopologicalSpace G] [LieGroup G] {P : ParabolicSubgroupPackage G}
    (F : FlagVarietyPackage P) : Prop :=
  Function.Surjective F.projectionMap ∧
  (∀ x : F.flagVariety, ∃ (g : G), F.projectionMap g = x ∧ (Subgroup.map (λ h : P.subgroup => g * h) P.subgroup = stabilizerSubgroup x))

theorem flag_variety_closed_from_evidence {G : Type u} [Group G] [TopologicalSpace G] [LieGroup G] {P : ParabolicSubgroupPackage G}
    (F : FlagVarietyPackage P) (E : FlagVarietyEvidence F) : FlagVarietyClosed F := by
  exact And.intro E.surjectivityClosed E.fiberDescriptionClosed

end GStructuresCanonicalLaneLean
end HautevilleHouse