import GStructuresCanonicalLaneLean.GStructureConnection

namespace HautevilleHouse
namespace GStructuresCanonicalLaneLean

structure HolonomyPackage {G : GStructureSpace} (C : GConnectionPackage G) where
  holonomyGroup : Type
  reducedHolonomy : Prop
  ambroiseSingersTheorem : Prop

structure HolonomyEvidence {G : GStructureSpace} {C : GConnectionPackage G}
    (H : HolonomyPackage C) where
  reducedHolonomyClosed : H.reducedHolonomy
  ambroiseSingersClosed : H.ambroiseSingersTheorem

def HolonomyClosed {G : GStructureSpace} {C : GConnectionPackage G}
    (H : HolonomyPackage C) : Prop :=
  H.reducedHolonomy ∧ H.ambroiseSingersTheorem

theorem holonomy_closed_from_evidence
    {G : GStructureSpace} {C : GConnectionPackage G}
    (H : HolonomyPackage C) (E : HolonomyEvidence H) :
    HolonomyClosed H := by
  exact And.intro E.reducedHolonomyClosed E.ambroiseSingersClosed

end GStructuresCanonicalLaneLean
end HautevilleHouse
