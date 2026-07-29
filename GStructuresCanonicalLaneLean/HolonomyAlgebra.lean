import GStructuresCanonicalLaneLean.ReductiveGroup

namespace HautevilleHouse
namespace GStructuresCanonicalLaneLean

structure HolonomyAlgebraPackage {O : GStructureAdmittedObject}
    {R : ReductiveGroupPackage O} (H : HolonomyReductionPackage R) where
  holonomyGroup : Type u
  holonomyLieAlgebra : Type v
  ambroseSingerTheorem : Prop
  reducedHolonomy : Prop
  gCompatibleConnection : Prop

structure HolonomyAlgebraEvidence {O : GStructureAdmittedObject}
    {R : ReductiveGroupPackage O} {H : HolonomyReductionPackage R}
    (A : HolonomyAlgebraPackage H) where
  ambroseSingerClosed : A.ambroseSingerTheorem
  reducedHolonomyClosed : A.reducedHolonomy
  gCompatibleConnectionClosed : A.gCompatibleConnection

def HolonomyAlgebraClosed {O : GStructureAdmittedObject}
    {R : ReductiveGroupPackage O} {H : HolonomyReductionPackage R}
    (A : HolonomyAlgebraPackage H) : Prop :=
  A.ambroseSingerTheorem ∧ A.reducedHolonomy ∧ A.gCompatibleConnection

theorem holonomy_algebra_closed_from_evidence
    {O : GStructureAdmittedObject} {R : ReductiveGroupPackage O}
    {H : HolonomyReductionPackage R} (A : HolonomyAlgebraPackage H)
    (E : HolonomyAlgebraEvidence A) : HolonomyAlgebraClosed A := by
  exact And.intro E.ambroseSingerClosed (And.intro E.reducedHolonomyClosed E.gCompatibleConnectionClosed)

end GStructuresCanonicalLaneLean
end HautevilleHouse