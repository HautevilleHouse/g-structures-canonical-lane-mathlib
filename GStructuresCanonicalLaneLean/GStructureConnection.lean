import GStructuresCanonicalLaneLean.GStructureAdmissibleClass

namespace HautevilleHouse
namespace GStructuresCanonicalLaneLean

structure GConnectionPackage (G : GStructureSpace) where
  connection : Type
  compatibleWithStructure : Prop
  torsionFree : Prop
  curvatureTwoForm : Prop

structure GConnectionEvidence {G : GStructureSpace} (C : GConnectionPackage G) where
  compatibleClosed : C.compatibleWithStructure
  torsionFreeClosed : C.torsionFree
  curvatureClosed : C.curvatureTwoForm

def GConnectionClosed {G : GStructureSpace} (C : GConnectionPackage G) : Prop :=
  C.compatibleWithStructure ∧ C.torsionFree ∧ C.curvatureTwoForm

theorem g_connection_closed_from_evidence
    {G : GStructureSpace} (C : GConnectionPackage G)
    (E : GConnectionEvidence C) : GConnectionClosed C := by
  exact And.intro E.compatibleClosed (And.intro E.torsionFreeClosed E.curvatureClosed)

end GStructuresCanonicalLaneLean
end HautevilleHouse
