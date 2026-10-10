-- n4-grammar-130 — 全然〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-130',
    'grammar',
    'N4',
    $$全然〜ない$$,
    $$zenzen ~ nai$$,
    $$Nada / Nem um pouco / De jeito nenhum$$,
    $$全然〜ない é usado para negar algo completamente. Equivale a "nada", "nem um pouco" ou "de jeito nenhum".

全然 vem antes do verbo ou do adjetivo, e a frase fica na forma negativa. A ideia é de negação total, a mais forte entre os advérbios de frequência e intensidade.

Por exemplo, "não entendo nada de japonês", "não é nem um pouco apimentado" ou "não dormi nada".

Comparando: あまり〜ない significa "não muito", e 全然〜ない significa "nada". É uma diferença de intensidade.$$,
    $$Na fala jovem, 全然 também aparece em frases afirmativas, como 全然大丈夫 ("está tudo bem, sem problema nenhum"). Esse uso é coloquial e muitas pessoas consideram informal, mas é muito comum.

Em provas e textos formais, use 全然 sempre com negativa.

Outras expressões de negação total são 少しも〜ない e ちっとも〜ない, que têm sentido parecido.$$,
    $$全然 + Verbo na forma negativa
全然 + Adjetivo い sem い + くない
全然 + Adjetivo な / Substantivo + じゃない

Escrita: 全然 / ぜんぜん$$,
    $$全然$$,
    $$全然|ぜんぜん$$,
    ARRAY['全然', 'ない']::text[],
    ARRAY['全然', 'ぜんぜん']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-130', $$すみません、日本語が全然わかりません。$$, $$すみません、にほんごがぜんぜんわかりません。$$, $$Desculpe, não entendo nada de japonês.$$),
    ('n4-grammar-130', $$昨日は全然寝られなかった。$$, $$きのうはぜんぜんねられなかった。$$, $$Ontem não consegui dormir nada.$$),
    ('n4-grammar-130', $$この料理は全然辛くない。$$, $$このりょうりはぜんぜんからくない。$$, $$Esta comida não é nem um pouco apimentada.$$),
    ('n4-grammar-130', $$最近、全然運動していない。$$, $$さいきん、ぜんぜんうんどうしていない。$$, $$Ultimamente, não tenho feito nenhum exercício.$$),
    ('n4-grammar-130', $$彼の話は全然おもしろくなかった。$$, $$かれのはなしはぜんぜんおもしろくなかった。$$, $$A história dele não teve graça nenhuma.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お酒は____飲みません。$$, $$Não bebo nada de álcool.$$),
        (2, $$この問題は____難しくない。$$, $$Esta questão não é nem um pouco difícil.$$),
        (3, $$彼女のことは____知りません。$$, $$Não sei nada sobre ela.$$),
        (4, $$もう夜なのに、宿題が____終わっていない。$$, $$Já é noite e a lição não está nem perto de terminar.$$),
        (5, $$昨日の試験は____できなかった。$$, $$Não consegui fazer nada na prova de ontem.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-130', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$全然$$),
        (1, $$ぜんぜん$$),
        (2, $$全然$$),
        (2, $$ぜんぜん$$),
        (3, $$全然$$),
        (3, $$ぜんぜん$$),
        (4, $$全然$$),
        (4, $$ぜんぜん$$),
        (5, $$全然$$),
        (5, $$ぜんぜん$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
