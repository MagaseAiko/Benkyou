-- n2-grammar-151 — 〜たまえ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-151',
    'grammar',
    'N2',
    $$〜たまえ$$,
    $$tamae$$,
    $$Faça / Vá / Ande$$,
    $$たまえ é uma forma de dar ordens de maneira suave, mas vinda de alguém em posição superior. Equivale a "faça" ou "vá".

É usado por homens mais velhos ou em posição de autoridade, como chefes ou professores, ao falar com alguém de posição inferior. Por exemplo, "sente-se aí".

Hoje em dia soa antiquado e aparece principalmente em livros, filmes e falas de personagens.$$,
    $$É mais suave que a forma imperativa simples, mas ainda mostra superioridade.

Não se usa com superiores nem em situações formais.

A forma negativa é たまうな, mas é rara.$$,
    $$Verbo (forma ます sem ます) + たまえ$$,
    $$たまえ$$,
    $$たまえ$$,
    ARRAY['たまえ']::text[],
    ARRAY['たまえ', '〜たまえ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-151', $$そこに座りたまえ。$$, $$そこにすわりたまえ。$$, $$Sente-se aí.$$),
    ('n2-grammar-151', $$君も一緒に来たまえ。$$, $$きみもいっしょにきたまえ。$$, $$Venha você também.$$),
    ('n2-grammar-151', $$遠慮しないで食べたまえ。$$, $$えんりょしないでたべたまえ。$$, $$Coma sem cerimônia.$$),
    ('n2-grammar-151', $$早く報告書を出したまえ。$$, $$はやくほうこくしょをだしたまえ。$$, $$Entregue logo o relatório.$$),
    ('n2-grammar-151', $$もっとよく考えたまえ。$$, $$もっとよくかんがえたまえ。$$, $$Pense melhor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$話を最後まで聞き____。$$, $$Ouça a história até o fim.$$),
        (2, $$こっちへ来____。$$, $$Venha cá.$$),
        (3, $$もう一度やってみ____。$$, $$Tente mais uma vez.$$),
        (4, $$自分の意見を言い____。$$, $$Diga a sua opinião.$$),
        (5, $$ゆっくり休み____。$$, $$Descanse bem.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-151', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たまえ$$),
        (2, $$たまえ$$),
        (3, $$たまえ$$),
        (4, $$たまえ$$),
        (5, $$たまえ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
