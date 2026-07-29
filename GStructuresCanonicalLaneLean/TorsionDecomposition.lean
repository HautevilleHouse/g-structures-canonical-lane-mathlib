import GStructuresCanonicalLaneLean.HolonomyAlgebra

namespace HautevilleHouse
namespace GStructuresCanonicalLaneLean

structure TorsionDecompositionPackage {O : GStructureAdmittedObject}
    {R : ReductiveGroupPackage O} {H : HolonomyReductionPackage R}
    {A : HolonomyAlgebraPackage H} (T : TorsionTensorPackage A) where
  torsionTensor : Type u
  intrinsicTorsion : Prop
  decompositionIrreducible : Prop
  vanishingCondition : Prop

structure TorsionDecompositionEvidence {O : GStructureAdmittedObject}
    {R : ReductiveGroupPackage O} {H : HolonomyReductionPackage R}
    {A : HolonomyAlgebraPackage H} {T : TorsionTensorPackage A}
    (D : TorsionDecompositionPackage T) where
  intrinsicTorsionClosed : D.intrinsicTorsion
  decompositionIrreducibleClosed : D.decompositionIrreducible
  vanishingConditionClosed : D.vanishingCondition

def TorsionDecompositionClosed {O : GStructureAdmittedObject}
    {R : ReductiveGroupPackage O} {H : HolonomyReductionPackage R}
    {A : HolonomyAlgebraPackage H} {T : TorsionTensorPackage A}
    (D : TorsionDecompositionPackage T) : Prop :=
  D.intrinsicTorsion ∧ D.decompositionIrreducible ∧ D.vanishingCondition

theorem torsion_decomposition_closed_from_evidence
    {O : GStructureAdmittedObject} {R : ReductiveGroupPackage O}
    {H : HolonomyReductionPackage R} {A : HolonomyAlgebraPackage H}
    {T : TorsionTensorPackage A} (D : TorsionDecompositionPackage T)
    (E : TorsionDecompositionEvidence D) : TorsionDecompositionClosed D := by
  exact And.intro E.intrinsicTorsionClosed (And.intro E.decompositionIrreducibleClosed E.vanishingConditionClosed)

end GStructuresCanonicalLaneLean
end HautevilleHouse