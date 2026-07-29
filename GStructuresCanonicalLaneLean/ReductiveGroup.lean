import GStructuresCanonicalLaneLean.GStructureAdmissibleClass

namespace HautevilleHouse
namespace GStructuresCanonicalLaneLean

structure ReductiveGroupPackage (O : GStructureAdmittedObject) where
  groupType : Type u
  representation : Type v
  semisimple : Prop
  reductive : Prop
  killingFormNondegenerate : Prop

structure ReductiveGroupEvidence {O : GStructureAdmittedObject} (R : ReductiveGroupPackage O) where
  semisimpleClosed : R.semisimple
  reductiveClosed : R.reductive
  killingFormNondegenerateClosed : R.killingFormNondegenerate

def ReductiveGroupClosed {O : GStructureAdmittedObject} (R : ReductiveGroupPackage O) : Prop :=
  R.semisimple ∧ R.reductive ∧ R.killingFormNondegenerate

theorem reductive_group_closed_from_evidence
    {O : GStructureAdmittedObject} (R : ReductiveGroupPackage O) (E : ReductiveGroupEvidence R) :
    ReductiveGroupClosed R := by
  exact And.intro E.semisimpleClosed (And.intro E.reductiveClosed E.killingFormNondegenerateClosed)

end GStructuresCanonicalLaneLean
end HautevilleHouse