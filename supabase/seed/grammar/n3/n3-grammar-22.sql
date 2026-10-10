-- n3-grammar-22 — 〜ふりをする
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-22',
    'grammar',
    'N3',
    $$〜ふりをする$$,
    $$furi wo suru$$,
    $$Fingir / Fazer de conta$$,
    $$ふりをする é usado para dizer que alguém finge estar em certa situação, ou finge fazer algo, sem que seja verdade. Equivale a "fingir" ou "fazer de conta".

ふり significa "aparência" ou "comportamento". Assim, ふりをする é "fazer a aparência de...".

Ele vem depois da forma simples de verbos e adjetivos. Com adjetivos な, usa-se な, e com substantivos, の.

A forma do verbo antes de ふり faz diferença. Com ている ou た, a pessoa finge um estado: 寝ているふり (fingir que está dormindo), 寝たふり (fingir que dormiu). Com ない, finge que não faz algo: 聞こえないふり (fingir que não ouve).$$,
    $$Na fala casual, を costuma ser omitido: 寝たふりする.

A expressão 知らないふりをする (fingir que não sabe) é muito comum.

ふり também aparece em 見て見ぬふり, que significa "fazer vista grossa".$$,
    $$Verbo (forma simples: ている / た / ない) + ふりをする
Adjetivo い + ふりをする
Adjetivo な + な + ふりをする
Substantivo + の + ふりをする

Escrita: ふり / 振り$$,
    $$ふりをする$$,
    $$ふりをし|ふりをす|振りをし|ふりして$$,
    ARRAY['ふり', 'を', 'する']::text[],
    ARRAY['ふりをする', 'ふりをした', 'ふりをしている', 'ふりする']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-22', $$彼は聞こえないふりをした。$$, $$かれはきこえないふりをした。$$, $$Ele fingiu que não ouviu.$$),
    ('n3-grammar-22', $$弟は寝たふりをしていた。$$, $$おとうとはねたふりをしていた。$$, $$Meu irmão mais novo estava fingindo que dormia.$$),
    ('n3-grammar-22', $$知っているふりをするのはやめなさい。$$, $$しっているふりをするのはやめなさい。$$, $$Pare de fingir que sabe.$$),
    ('n3-grammar-22', $$彼女は元気なふりをしているが、本当は悲しんでいる。$$, $$かのじょはげんきなふりをしているが、ほんとうはかなしんでいる。$$, $$Ela finge estar bem, mas na verdade está triste.$$),
    ('n3-grammar-22', $$犬が死んだふりをして遊んでいる。$$, $$いぬがしんだふりをしてあそんでいる。$$, $$O cachorro está brincando de se fingir de morto.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$母に呼ばれたが、寝ている____。$$, $$Minha mãe me chamou, mas fingi que estava dormindo.$$),
        (2, $$彼は何も知らない____いる。$$, $$Ele está fingindo que não sabe de nada.$$),
        (3, $$子供は勉強している____けど、漫画を読んでいた。$$, $$A criança fingia que estudava, mas estava lendo mangá.$$),
        (4, $$彼女は平気な____が、本当は怖かった。$$, $$Ela fingiu estar tranquila, mas na verdade estava com medo.$$),
        (5, $$道で先生に会ったが、見なかった____。$$, $$Encontrei o professor na rua, mas fingi que não vi.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-22', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ふりをした$$),
        (1, $$ふりをしました$$),
        (2, $$ふりをして$$),
        (3, $$ふりをしていた$$),
        (4, $$ふりをした$$),
        (5, $$ふりをした$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
