-- n3-grammar-167 — 〜わけではない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-167',
    'grammar',
    'N3',
    $$〜わけではない$$,
    $$wake de wa nai$$,
    $$Não é que / Não significa que / Não necessariamente$$,
    $$わけではない é usado para negar parcialmente uma ideia, corrigindo uma conclusão que o outro poderia tirar. Equivale a "não é que...", "não significa que..." ou "não necessariamente".

A ideia é: "não é exatamente assim". Por exemplo, "não é que eu não goste de carne, mas não como muito" ou "não é que eu cozinhe todos os dias".

Ela é muito útil para evitar mal-entendidos e para suavizar opiniões. Também é comum com palavras como いつも, みんな, 全部 e 必ず, negando uma generalização.

Ela vem depois da forma simples de verbos e adjetivos, de adjetivos な com な, e de substantivos com という ou の.

Na fala, わけではない costuma virar わけじゃない.$$,
    $$わけではない é diferente de わけがない. わけではない nega parcialmente ("não é que..."); わけがない nega totalmente ("não tem como").

É muito usada para recusar convites com delicadeza: 行きたくないわけではないけど….

Em debates, ajuda a mostrar que você não está dizendo algo extremo.$$,
    $$Verbo / Adjetivo い (forma simples) + わけではない
Adjetivo な + な + わけではない
Substantivo + という + わけではない
いつも / みんな / 全部 + … + わけではない (negação parcial)

Educado: わけではありません
Fala: わけじゃない$$,
    $$わけではない$$,
    $$わけではない|わけじゃない|わけではありません|訳ではない$$,
    ARRAY['わけ', 'では', 'ない']::text[],
    ARRAY['わけではない', 'わけじゃない', 'わけではありません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-167', $$肉が嫌いなわけではないが、あまり食べない。$$, $$にくがきらいなわけではないが、あまりたべない。$$, $$Não é que eu não goste de carne, mas não como muito.$$),
    ('n3-grammar-167', $$毎日料理をするわけではない。$$, $$まいにちりょうりをするわけではない。$$, $$Não é que eu cozinhe todos os dias.$$),
    ('n3-grammar-167', $$高い物がいつもいいわけではない。$$, $$たかいものがいつもいいわけではない。$$, $$Coisa cara não é necessariamente sempre boa.$$),
    ('n3-grammar-167', $$彼のことが嫌いなわけじゃない。$$, $$かれのことがきらいなわけじゃない。$$, $$Não é que eu não goste dele.$$),
    ('n3-grammar-167', $$日本人がみんな寿司が好きなわけではありません。$$, $$にほんじんがみんなすしがすきなわけではありません。$$, $$Não é que todos os japoneses gostem de sushi.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$行きたくない____が、今日は忙しい。$$, $$Não é que eu não queira ir, mas hoje estou ocupado.$$),
        (2, $$説明を聞いたが、全部わかった____。$$, $$Ouvi a explicação, mas não é que eu tenha entendido tudo.$$),
        (3, $$この件は、彼だけが悪い____。$$, $$Neste caso, não é que só ele tenha culpa.$$),
        (4, $$お金があれば幸せになれる____。$$, $$Ter dinheiro não significa necessariamente ser feliz.$$),
        (5, $$フリーランスだが、いつも暇な____。$$, $$Sou freelancer, mas não é que eu esteja sempre livre.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-167', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$わけではない$$),
        (1, $$わけじゃない$$),
        (2, $$わけではない$$),
        (2, $$わけじゃない$$),
        (3, $$わけではない$$),
        (3, $$わけじゃない$$),
        (4, $$わけではない$$),
        (4, $$わけじゃない$$),
        (5, $$わけではない$$),
        (5, $$わけじゃない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
