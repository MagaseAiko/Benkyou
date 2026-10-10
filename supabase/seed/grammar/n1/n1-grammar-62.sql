-- n1-grammar-62 — 〜ことこの上ない / この上ない / この上なく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-62',
    'grammar',
    'N1',
    $$〜ことこの上ない / この上ない / この上なく$$,
    $$koto kono ue nai / kono ue nai / kono ue naku$$,
    $$Extremamente / Como nada mais / Ao máximo$$,
    $$ことこの上ない e この上ない indicam que algo chegou ao grau máximo, sem nada acima. Equivalem a "extremamente" ou "como nada mais".

この上ない vem antes de substantivos, como "uma felicidade sem igual". この上なく funciona como advérbio, como "extremamente feliz". ことこの上ない vem depois de adjetivos, como "extremamente incômodo".

É uma expressão formal, usada tanto com coisas boas quanto ruins.$$,
    $$Expressões comuns são この上ない喜び, この上ない幸せ e 失礼なことこの上ない.

É parecido com 極まりない, mas この上ない pode ser usado com coisas boas.$$,
    $$この上ない + Substantivo
この上なく + Adjetivo
Adjetivo い / Adjetivo な + な + ことこの上ない$$,
    $$この上ない$$,
    $$この上ない|この上なく|このうえない|このうえなく$$,
    ARRAY['この', '上', 'ない']::text[],
    ARRAY['この上ない', 'この上なく', 'ことこの上ない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-62', $$皆様にお会いできて、この上ない喜びです。$$, $$みなさまにおあいできて、このうえないよろこびです。$$, $$É uma alegria sem igual poder encontrá-los.$$),
    ('n1-grammar-62', $$彼の態度は失礼なことこの上ない。$$, $$かれのたいどはしつれいなことこのうえない。$$, $$A atitude dele é extremamente rude.$$),
    ('n1-grammar-62', $$この上なく美しい景色だった。$$, $$このうえなくうつくしいけしきだった。$$, $$Era uma paisagem bela como nada mais.$$),
    ('n1-grammar-62', $$一人で山道を歩くのは、心細いことこの上ない。$$, $$ひとりでやまみちをあるくのは、こころぼそいことこのうえない。$$, $$Andar sozinho pela trilha da montanha dá uma insegurança enorme.$$),
    ('n1-grammar-62', $$家族と過ごす時間は、この上ない幸せだ。$$, $$かぞくとすごすじかんは、このうえないしあわせだ。$$, $$O tempo com a família é a maior felicidade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この賞をいただけるのは、____光栄です。$$, $$Receber este prêmio é uma honra sem igual.$$),
        (2, $$毎日同じ作業をするのは、退屈なこと____。$$, $$Fazer o mesmo trabalho todo dia é extremamente entediante.$$),
        (3, $$彼女は____優しい人だ。$$, $$Ela é uma pessoa gentil como nada mais.$$),
        (4, $$こんな夜中に騒ぐなんて、迷惑なこと____。$$, $$Fazer barulho no meio da noite é extremamente incômodo.$$),
        (5, $$合格の知らせは、____うれしい知らせだった。$$, $$A notícia da aprovação foi a mais feliz das notícias.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-62', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$この上ない$$),
        (1, $$このうえない$$),
        (2, $$この上ない$$),
        (2, $$このうえない$$),
        (3, $$この上なく$$),
        (3, $$このうえなく$$),
        (4, $$この上ない$$),
        (4, $$このうえない$$),
        (5, $$この上なく$$),
        (5, $$このうえなく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
