-- n3-grammar-02 — 〜あまり
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-02',
    'grammar',
    'N3',
    $$〜あまり$$,
    $$amari$$,
    $$Tanto que / De tanto / Por excesso de$$,
    $$No N3, あまり aparece com o sentido de "por excesso de", indicando que um sentimento ou estado foi tão forte que causou um resultado, geralmente inesperado ou negativo. Equivale a "tanto que", "de tanto" ou "por excesso de".

Ele vem depois de substantivos com の (como 心配のあまり, "de tanta preocupação") e depois de verbos na forma simples (como 緊張したあまり).

Também existe a forma あまりの + Substantivo + に, que significa "com tanto... que". Por exemplo, "com tanto calor, passei mal".

Os substantivos usados costumam ser sentimentos ou estados, como alegria, preocupação, tristeza, surpresa, nervosismo e cansaço.

O resultado, na segunda parte, é algo que a pessoa não conseguiu controlar, como chorar, não conseguir dormir ou não conseguir falar.$$,
    $$Esse uso é bem diferente de あまり〜ない (não muito), aprendido no N4. Aqui, あまり indica excesso.

A segunda parte não costuma ser uma ação planejada, mas uma reação involuntária.

Muitos substantivos usados aqui terminam em さ, como 嬉しさ, 悲しさ e 暑さ.$$,
    $$Substantivo + の + あまり、 + Resultado
Verbo (forma simples) + あまり、 + Resultado
あまりの + Substantivo + に、 + Resultado$$,
    $$あまり$$,
    $$あまり$$,
    ARRAY['あまり']::text[],
    ARRAY['あまり', 'のあまり', 'あまりの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-02', $$合格の知らせを聞いて、嬉しさのあまり、泣いてしまった。$$, $$ごうかくのしらせをきいて、うれしさのあまり、ないてしまった。$$, $$Ao saber da aprovação, chorei de tanta alegria.$$),
    ('n3-grammar-02', $$母は心配のあまり、夜も眠れなかった。$$, $$はははしんぱいのあまり、よるもねむれなかった。$$, $$De tanta preocupação, minha mãe não conseguiu dormir à noite.$$),
    ('n3-grammar-02', $$面接で緊張したあまり、何も話せなかった。$$, $$めんせつできんちょうしたあまり、なにもはなせなかった。$$, $$Fiquei tão nervoso na entrevista que não consegui falar nada.$$),
    ('n3-grammar-02', $$あまりの暑さに、気分が悪くなった。$$, $$あまりのあつさに、きぶんがわるくなった。$$, $$Com tanto calor, passei mal.$$),
    ('n3-grammar-02', $$彼は仕事に熱中するあまり、食事を忘れてしまった。$$, $$かれはしごとにねっちゅうするあまり、しょくじをわすれてしまった。$$, $$Ele estava tão concentrado no trabalho que se esqueceu de comer.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$驚きの____、声が出なかった。$$, $$De tanto susto, não consegui falar.$$),
        (2, $$疲れの____、電車で寝てしまった。$$, $$De tanto cansaço, acabei dormindo no trem.$$),
        (3, $$____の痛さに、思わず叫んだ。$$, $$Com tanta dor, gritei sem querer.$$),
        (4, $$合格を喜ぶ____、彼は飛び上がった。$$, $$De tanta alegria pela aprovação, ele pulou.$$),
        (5, $$恥ずかしさの____、顔が真っ赤になった。$$, $$De tanta vergonha, fiquei com o rosto vermelho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-02', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$あまり$$),
        (2, $$あまり$$),
        (3, $$あまり$$),
        (4, $$あまり$$),
        (5, $$あまり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
