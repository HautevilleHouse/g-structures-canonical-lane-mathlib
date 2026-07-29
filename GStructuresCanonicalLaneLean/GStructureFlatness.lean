import GStructuresCanonicalLaneLean.GStructureTorsion

namespace HautevilleHouse
namespace GStructuresCanonicalLaneLean

structure FlatnessPackage {G : GStructureSpace} {C : GConnectionPackage G}
    {H : HolonomyPackage C} (T : TorsionPackage H) where
  curvatureVanishes : Prop
  localFlatness : Prop
  flatConnection : Prop

structure FlatnessEvidence {G : GStructureSpace} {C : GConnectionPackage G}
    {H : HolonomyPackage C} {T : TorsionPackage H} (F : FlatnessPackage T) where
  curvatureVanishesClosed : F.curvatureVanishes
  localFlatnessClosed : F.localFlatness
  flatConnectionClosed : F.flatConnection

def FlatnessClosed {G : GStructureSpace} {C : GConnectionPackage G}
    {H : HolonomyPackage C} {T : TorsionPackage H} (F : FlatnessPackage T) : Prop :=
  F.curvatureVanishes ∧ F.localFlatness ∧ F.flatConnection

theorem flatness_closed_from_evidence
    {G : GStructureSpace} {C : GConnectionPackage G}
    {H : HolonomyPackage C} {T : TorsionPackage H} (F : FlatnessPackage T)
    (E : FlatnessEvidence F) : FlatnessClosed F := by
  exact And.intro E.curvatureVanishesClosed
    (And.intro E.localFlatnessClosed E.flatConnectionClosed)

end GStructuresCanonicalLaneLean
end HautevilleHouse
