-- n4-grammar-07 — 〜ばかり
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-07',
    'grammar',
    'N4',
    $$〜ばかり$$,
    $$bakari$$,
    $$Só / Nada além de / Sempre$$,
    $$ばかり é usado para dizer que algo se repete tanto que parece ser "só aquilo". Equivale a "só", "nada além de" ou "sempre".

Diferente de だけ, que apenas limita de forma neutra, ばかり costuma ter um tom de crítica, reclamação ou surpresa. A ideia é que a quantidade ou a repetição é excessiva.

Ele vem depois do substantivo e pode substituir を e が. Com verbos, aparece na forma てばかりいる, que significa "não faz outra coisa a não ser...".

Também pode descrever um lugar ou grupo formado quase só por um tipo de coisa ou pessoa.$$,
    $$ばかり também tem outros sentidos: depois de verbo na forma た, significa "acabou de" (たばかり); depois de números, significa "cerca de". São usos diferentes.

Na fala, ばっかり reforça o tom de reclamação.

Se a intenção é apenas dizer "só isso", sem crítica, だけ é a escolha mais neutra.$$,
    $$Substantivo + ばかり + Verbo
Substantivo + ばかり + だ / です
Substantivo + ばかり + の + Substantivo
Verbo na forma て + ばかりいる

Forma falada: ばっかり$$,
    $$ばかり$$,
    $$ばかり|ばっかり$$,
    ARRAY['ばかり']::text[],
    ARRAY['ばかり', 'ばっかり']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-07', $$弟はゲームばかりしています。$$, $$おとうとはゲームばかりしています。$$, $$Meu irmão mais novo só fica jogando videogame.$$),
    ('n4-grammar-07', $$最近、雨ばかりですね。$$, $$さいきん、あめばかりですね。$$, $$Ultimamente só chove, né?$$),
    ('n4-grammar-07', $$彼は甘い物ばかり食べる。$$, $$かれはあまいものばかりたべる。$$, $$Ele só come doce.$$),
    ('n4-grammar-07', $$文句ばかり言わないで、手伝ってよ。$$, $$もんくばかりいわないで、てつだってよ。$$, $$Pare de só reclamar e me ajude.$$),
    ('n4-grammar-07', $$このクラスは女の子ばかりだ。$$, $$このクラスはおんなのこばかりだ。$$, $$Esta turma é só de meninas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$息子は漫画____読んでいます。$$, $$Meu filho só lê mangá.$$),
        (2, $$今週は失敗____で、疲れました。$$, $$Esta semana foi só erro, estou cansado.$$),
        (3, $$彼女は肉____食べて、野菜を食べません。$$, $$Ela só come carne e não come verdura.$$),
        (4, $$毎日同じ料理____で、飽きてしまった。$$, $$Todo dia é só a mesma comida, já enjoei.$$),
        (5, $$あの店は高い物____売っている。$$, $$Aquela loja só vende coisa cara.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-07', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ばかり$$),
        (1, $$ばっかり$$),
        (2, $$ばかり$$),
        (2, $$ばっかり$$),
        (3, $$ばかり$$),
        (3, $$ばっかり$$),
        (4, $$ばかり$$),
        (4, $$ばっかり$$),
        (5, $$ばかり$$),
        (5, $$ばっかり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
