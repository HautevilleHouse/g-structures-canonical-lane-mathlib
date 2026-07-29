import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GStructuresCanonicalLaneLean

structure BruhatDecompositionPackage {G : Type u} [Group G] (P : ParabolicSubgroupPackage G) where
  weylGroup : Type v
  weylGroupGroup : Group weylGroup
  representatives : weylGroup → G
  doubleCosetDecomposition : ∀ g : G, ∃ (w : weylGroup) (p1 p2 : P.subgroup), g = representatives w * p1 * p2
  uniquenessCondition : ∀ (w1 w2 : weylGroup) (p1 p2 q1 q2 : P.subgroup),
    representatives w1 * p1 * p2 = representatives w2 * q1 * q2 → w1 = w2

structure BruhatDecompositionEvidence {G : Type u} [Group G] {P : ParabolicSubgroupPackage G}
    (B : BruhatDecompositionPackage P) where
  doubleCosetDecompositionClosed : ∀ g : G, ∃ (w : B.weylGroup) (p1 p2 : P.subgroup), g = B.representatives w * p1 * p2
  uniquenessConditionClosed : ∀ (w1 w2 : B.weylGroup) (p1 p2 q1 q2 : P.subgroup),
    B.representatives w1 * p1 * p2 = B.representatives w2 * q1 * q2 → w1 = w2

def BruhatDecompositionClosed {G : Type u} [Group G] {P : ParabolicSubgroupPackage G}
    (B : BruhatDecompositionPackage P) : Prop :=
  (∀ g : G, ∃ (w : B.weylGroup) (p1 p2 : P.subgroup), g = B.representatives w * p1 * p2) ∧
  (∀ (w1 w2 : B.weylGroup) (p1 p2 q1 q2 : P.subgroup),
    B.representatives w1 * p1 * p2 = B.representatives w2 * q1 * q2 → w1 = w2)

theorem bruhat_decomposition_closed_from_evidence {G : Type u} [Group G] {P : ParabolicSubgroupPackage G}
    (B : BruhatDecompositionPackage P) (E : BruhatDecompositionEvidence B) : BruhatDecompositionClosed B := by
  exact And.intro E.doubleCosetDecompositionClosed E.uniquenessConditionClosed

end GStructuresCanonicalLaneLean
end HautevilleHouse