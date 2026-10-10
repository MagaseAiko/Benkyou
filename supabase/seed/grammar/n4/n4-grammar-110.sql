-- n4-grammar-110 — 〜ということ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-110',
    'grammar',
    'N4',
    $$〜ということ$$,
    $$to iu koto$$,
    $$O fato de que / Que / Quer dizer que$$,
    $$ということ é usado para transformar uma frase inteira em um substantivo, como "o fato de que...". Ele junta という (que diz que) com こと (fato, coisa).

O primeiro uso é falar de uma informação ou fato como um todo, como ouvir que alguém se casou ou esquecer que amanhã era folga.

O segundo uso é explicar ou definir o sentido de algo. Por exemplo, "o mais importante é continuar todo dia".

O terceiro uso é confirmar uma conclusão, com ということですか: "então quer dizer que...?".

Comparado a こと sozinho, ということ deixa mais claro que se trata de um conteúdo, uma informação ou uma ideia.$$,
    $$Com substantivos e adjetivos な, coloca-se だ antes de ということ: 休みだということ.

A expressão つまり〜ということですか é muito útil para confirmar se você entendeu o que alguém disse.

Em níveis seguintes, ということだ também aparece com o sentido de "dizem que".$$,
    $$Frase (forma simples) + ということ + を / が / は
Frase + ということです (explicação / definição)
つまり + … + ということですか (confirmação)

Fala casual: ってこと$$,
    $$ということ$$,
    $$ということ|ってこと$$,
    ARRAY['という', 'こと']::text[],
    ARRAY['ということ', 'ということです', 'ってこと']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-110', $$彼が結婚したということを聞いて、驚いた。$$, $$かれがけっこんしたということをきいて、おどろいた。$$, $$Fiquei surpreso ao saber que ele se casou.$$),
    ('n4-grammar-110', $$明日は休みだということを忘れていた。$$, $$あしたはやすみだということをわすれていた。$$, $$Eu tinha esquecido que amanhã era folga.$$),
    ('n4-grammar-110', $$大切なのは、毎日続けるということです。$$, $$たいせつなのは、まいにちつづけるということです。$$, $$O importante é continuar todo dia.$$),
    ('n4-grammar-110', $$つまり、行けないということですか。$$, $$つまり、いけないということですか。$$, $$Então quer dizer que você não pode ir?$$),
    ('n4-grammar-110', $$日本語が難しいということは、よくわかっています。$$, $$にほんごがむずかしいということは、よくわかっています。$$, $$Eu sei muito bem que o japonês é difícil.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$会議が中止になった____を、誰から聞きましたか。$$, $$De quem você ouviu que a reunião foi cancelada?$$),
        (2, $$健康が一番大切だ____が、病気になってわかった。$$, $$Quando fiquei doente, entendi que a saúde é o mais importante.$$),
        (3, $$「明日は雨です。」「じゃあ、ピクニックは中止____ですね。」$$, $$"Amanhã vai chover." "Então quer dizer que o piquenique está cancelado, né?"$$),
        (4, $$彼が来ない____は、もう知っています。$$, $$Já sei que ele não vem.$$),
        (5, $$一番大切なのは、あきらめない____だ。$$, $$O mais importante é não desistir.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-110', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ということ$$),
        (2, $$ということ$$),
        (3, $$ということ$$),
        (4, $$ということ$$),
        (5, $$ということ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
