import GStructuresCanonicalLaneLean.GStructureHolonomy

namespace HautevilleHouse
namespace GStructuresCanonicalLaneLean

structure TorsionPackage {G : GStructureSpace} {C : GConnectionPackage G}
    (H : HolonomyPackage C) where
  intrinsicTorsion : Prop
  eliminationTheorem : Prop
  vanishingCondition : Prop

structure TorsionEvidence {G : GStructureSpace} {C : GConnectionPackage G}
    {H : HolonomyPackage C} (T : TorsionPackage H) where
  intrinsicTorsionClosed : T.intrinsicTorsion
  eliminationTheoremClosed : T.eliminationTheorem
  vanishingConditionClosed : T.vanishingCondition

def TorsionClosed {G : GStructureSpace} {C : GConnectionPackage G}
    {H : HolonomyPackage C} (T : TorsionPackage H) : Prop :=
  T.intrinsicTorsion ∧ T.eliminationTheorem ∧ T.vanishingCondition

theorem torsion_closed_from_evidence
    {G : GStructureSpace} {C : GConnectionPackage G}
    {H : HolonomyPackage C} (T : TorsionPackage H)
    (E : TorsionEvidence T) : TorsionClosed T := by
  exact And.intro E.intrinsicTorsionClosed
    (And.intro E.eliminationTheoremClosed E.vanishingConditionClosed)

end GStructuresCanonicalLaneLean
end HautevilleHouse
