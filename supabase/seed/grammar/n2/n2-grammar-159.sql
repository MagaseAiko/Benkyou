-- n2-grammar-159 — 〜てたまらない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-159',
    'grammar',
    'N2',
    $$〜てたまらない$$,
    $$te tamaranai$$,
    $$Muito / Insuportavelmente / Não aguento de tanto$$,
    $$てたまらない indica que um sentimento ou sensação é tão forte que a pessoa quase não consegue suportar. Equivale a "muito", "insuportavelmente" ou "não aguento de tanto...".

Costuma vir com adjetivos de sentimento ou sensação física, como quente, frio, dolorido, feliz, triste ou com vontade. Por exemplo, "está quente demais, não aguento" ou "estou morrendo de vontade de te ver".

É uma expressão emotiva, comum na fala.$$,
    $$É usado com sentimentos da primeira pessoa. Para outras pessoas, acrescenta-se ようだ ou らしい.

É parecido com てしょうがない e てしかたがない, que são mais coloquiais.$$,
    $$Adjetivo い (sem い) + くてたまらない
Adjetivo な + でたまらない
Verbo (forma たい sem い) + くてたまらない
Verbo (forma て) + たまらない$$,
    $$てたまらない$$,
    $$てたまらない|でたまらない|てたまりません|でたまりません|てたまらなかった|でたまらなかった$$,
    ARRAY['て', 'たまらない']::text[],
    ARRAY['てたまらない', 'でたまらない', 'てたまりません', 'てたまらなかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-159', $$今日は暑くてたまらない。$$, $$きょうはあつくてたまらない。$$, $$Hoje está quente demais, não aguento.$$),
    ('n2-grammar-159', $$彼女に会いたくてたまらない。$$, $$かのじょにあいたくてたまらない。$$, $$Estou morrendo de vontade de vê-la.$$),
    ('n2-grammar-159', $$歯が痛くてたまらない。$$, $$はがいたくてたまらない。$$, $$Meu dente dói insuportavelmente.$$),
    ('n2-grammar-159', $$合格の知らせを聞いて、うれしくてたまらなかった。$$, $$ごうかくのしらせをきいて、うれしくてたまらなかった。$$, $$Ouvindo a notícia da aprovação, fiquei felicíssimo.$$),
    ('n2-grammar-159', $$一人で留守番をするのが不安でたまらない。$$, $$ひとりでるすばんをするのがふあんでたまらない。$$, $$Ficar sozinho em casa me deixa extremamente ansioso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$朝から何も食べていないので、お腹がすい____。$$, $$Não comi nada desde a manhã, estou morrendo de fome.$$),
        (2, $$この部屋は寒く____。$$, $$Este quarto está frio demais, não aguento.$$),
        (3, $$試験の結果が心配____。$$, $$Estou extremamente preocupado com o resultado da prova.$$),
        (4, $$あの映画が見たく____。$$, $$Estou morrendo de vontade de ver aquele filme.$$),
        (5, $$子供が生まれて、うれしく____。$$, $$Meu filho nasceu e estou felicíssimo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-159', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てたまらない$$),
        (1, $$てたまりません$$),
        (2, $$てたまらない$$),
        (2, $$てたまりません$$),
        (3, $$でたまらない$$),
        (3, $$でたまりません$$),
        (4, $$てたまらない$$),
        (4, $$てたまりません$$),
        (5, $$てたまらない$$),
        (5, $$てたまりません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
