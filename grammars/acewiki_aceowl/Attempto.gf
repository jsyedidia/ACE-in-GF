abstract Attempto =
  Numeral, Symbols ** {

-- Use Text to get only single-sentence texts.
flags startcat = ACEText ;

cat CN ; cat VarCN ;
cat NP ; cat ThereNP ;
cat Card ;
---cat Numeral ;
cat PN ;
cat A ;
cat A2 ;
cat AP ;
cat RS ;
cat Pron ; cat IndefPron ;
cat Prep ;
cat S ;
cat VP ;
cat V ;
cat VS ;
cat V2 ;
cat V3 ;
cat Adv ;
cat Conj ;
cat IP ;
cat IAdv ;
cat IDet ;
cat QS ;
cat Text ;
cat RP ;
cat Unit ;
cat MCN ;
cat PP ;
cat VPS ;
cat [VPS] {2} ;


fun aNP : VarCN -> ThereNP ;
fun theNP : VarCN -> NP ;
fun cardNP : Card -> VarCN -> ThereNP ;
-- TODO: in full ACE this must be ThereNP [KK]
fun noNP : VarCN -> NP ;
fun everyNP : VarCN -> NP ;

fun pnNP : PN -> NP ;

-- [JJC]
fun somebody_IPron : IndefPron ;
fun something_IPron : IndefPron ;
fun everybody_IPron : IndefPron ;
fun everything_IPron : IndefPron ;
fun nobody_IPron : IndefPron ;
fun nothing_IPron : IndefPron ;

-- [JJC]
-- [KK] TODO: Currently indefinite pronouns can be used with 'there is/are' but
-- the reality is more complex:
-- - ACE and AceWiki do not allow 'there is every-'
-- - AceWiki does not allow 'there is no-' (but ACE does)
-- - ACE and AceWiki allow 'there is some-'
fun indefPronNP : IndefPron -> ThereNP ;
fun indefPronVarNP : IndefPron -> Var -> ThereNP ;

fun at_leastNP : Card -> VarCN -> ThereNP ;
fun at_mostNP : Card -> VarCN -> ThereNP ;
fun more_thanNP : Card -> VarCN -> ThereNP ;
fun less_thanNP : Card -> VarCN -> ThereNP ;
fun exactlyNP : Card -> VarCN -> ThereNP ;

fun nothing_butNP : VarCN -> NP ;

fun apposVarCN : CN -> Var -> VarCN ;  -- a man X

fun cn_as_VarCN : CN -> VarCN ;

-- TODO: in full ACE this must be ThereNP [KK]
fun termNP : Term -> NP ;

-- 2.2.2

-- Relative clause can be attached to both CNs and NPs.
-- relCN provides relative clauses in constructs like
-- `which woman who ...` and `for every woman who ...`
fun relCN : VarCN -> RS -> VarCN ;
fun relNP : NP -> RS -> NP ;
fun relThereNP : ThereNP -> RS -> ThereNP ;

fun andRS : RS -> RS -> RS ;
fun orRS : RS -> RS -> RS ;

fun predRS : RP -> VP -> RS ;
fun neg_predRS : RP -> VP -> RS ;
fun slashRS : RP -> NP -> V2 -> RS ;
fun neg_slashRS : RP -> NP -> V2 -> RS ;

fun which_RP : RP ;

-- 2.2.4

fun ofCN : VarCN -> NP -> VarCN ; -- dog of John and Mary

-- 2.3.1

fun vpS : NP -> VP -> S ;
fun neg_vpS : NP -> VP -> S ;

fun v2VP : V2 -> NP -> VP ;

-- 2.3.2 [JJC]

fun a2VP : A2 -> NP -> VP ; -- is mad-about NP

-- 3.2

fun thereNP : ThereNP -> S ;  -- there is/are

fun thereNP_as_NP : ThereNP -> NP ;

-- 3.4.1

fun coordS : Conj -> S -> S -> S ;

fun and_Conj : Conj ;
fun or_Conj : Conj ;

-- In order to implement VP coordination, we
-- (1) convert VP into VPS,
-- (2) use VPS coordination producing VPS,
-- (3) map VPS into S (and QS?) (but definitely not into RS).
fun vp_as_posVPS : VP -> VPS ;
fun vp_as_negVPS : VP -> VPS ;
fun np_coord_VPS : NP -> Conj -> [VPS] -> S ;

-- 3.4.3

fun for_everyS : VarCN -> S -> S ;

-- 3.4.4

fun if_thenS : S -> S -> S ;
fun falseS : S -> S ; -- it is false that

-- 3.5

-- who likes Mary?
fun ipQS : IP -> VP -> QS ;

-- who does not like Mary?
fun neg_ipQS : IP -> VP -> QS ;

-- WH-word in object position.
-- Note that AceWiki only supports `Mary likes who?' but because
-- it is DRS-equivalent to `who does Mary like?' in (full) ACE,
-- supporting just the latter in the GF implementation can be considered enough.

-- who does Mary like?
fun slash_ipQS : IP -> NP -> V2 -> QS ;

-- who does Mary not like?
fun neg_slash_ipQS : IP -> NP -> V2 -> QS ;

fun whoSg_IP : IP ;
fun whatSg_IP : IP ;

fun whichIP : IDet -> VarCN -> IP ;
fun which_IDet : IDet ;
fun whichPl_IDet : IDet ;

-- 4

cat ACEText ;
fun consText : Text -> ACEText -> ACEText ;

fun baseText : Text -> ACEText ;

fun sText : S -> Text ;
fun qsText : QS -> Text ;

-- more

fun npVP  : NP -> VP ;              -- is a bank
fun digitsCard : Digits -> Card ;   -- 8 banks
fun v2_byVP : V2 -> NP -> VP ;      -- is bought by a customer

}
