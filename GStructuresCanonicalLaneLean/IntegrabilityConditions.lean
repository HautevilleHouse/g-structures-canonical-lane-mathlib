import GStructuresCanonicalLaneLean.TorsionDecomposition

namespace HautevilleHouse
namespace GStructuresCanonicalLaneLean

structure IntegrabilityConditionsPackage {O : GStructureAdmittedObject}
    {R : ReductiveGroupPackage O} {H : HolonomyReductionPackage R}
    {A : HolonomyAlgebraPackage H} {T : TorsionTensorPackage A}
    {D : TorsionDecompositionPackage T} (I : IntegrabilityReductionPackage D) where
  frobeniusTheorem : Prop
  closedUnderLieBracket : Prop
  localExistenceOfGStructure : Prop
  integrabilityCriterion : Prop

structure IntegrabilityConditionsEvidence {O : GStructureAdmittedObject}
    {R : ReductiveGroupPackage O} {H : HolonomyReductionPackage R}
    {A : HolonomyAlgebraPackage H} {T : TorsionTensorPackage A}
    {D : TorsionDecompositionPackage T} {I : IntegrabilityReductionPackage D}
    (C : IntegrabilityConditionsPackage I) where
  frobeniusTheoremClosed : C.frobeniusTheorem
  closedUnderLieBracketClosed : C.closedUnderLieBracket
  localExistenceOfGStructureClosed : C.localExistenceOfGStructure
  integrabilityCriterionClosed : C.integrabilityCriterion

def IntegrabilityConditionsClosed {O : GStructureAdmittedObject}
    {R : ReductiveGroupPackage O} {H : HolonomyReductionPackage R}
    {A : HolonomyAlgebraPackage H} {T : TorsionTensorPackage A}
    {D : TorsionDecompositionPackage T} {I : IntegrabilityReductionPackage D}
    (C : IntegrabilityConditionsPackage I) : Prop :=
  C.frobeniusTheorem ∧ C.closedUnderLieBracket ∧ C.localExistenceOfGStructure ∧ C.integrabilityCriterion

theorem integrability_conditions_closed_from_evidence
    {O : GStructureAdmittedObject} {R : ReductiveGroupPackage O}
    {H : HolonomyReductionPackage R} {A : HolonomyAlgebraPackage H}
    {T : TorsionTensorPackage A} {D : TorsionDecompositionPackage T}
    {I : IntegrabilityReductionPackage D} (C : IntegrabilityConditionsPackage I)
    (E : IntegrabilityConditionsEvidence C) : IntegrabilityConditionsClosed C := by
  exact And.intro E.frobeniusTheoremClosed
    (And.intro E.closedUnderLieBracketClosed
      (And.intro E.localExistenceOfGStructureClosed E.integrabilityCriterionClosed))

end GStructuresCanonicalLaneLean
end HautevilleHouse