-- n2-grammar-57 — 〜ことか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-57',
    'grammar',
    'N2',
    $$〜ことか$$,
    $$koto ka$$,
    $$Quanto! / Como! / Quantas vezes!$$,
    $$ことか é usado no fim de uma frase para expressar um sentimento muito forte, com o sentido de exclamação. Equivale a "quanto...!", "como...!" ou "quantas vezes...!".

Ele aparece quase sempre junto com palavras de grau ou quantidade, como どんなに, どれほど, どれだけ e 何度. A ideia é que o sentimento ou a quantidade foi tão grande que não dá nem para medir.

Por exemplo, "como fiquei feliz ao saber que passei!" ou "quantas vezes eu te avisei!".

Apesar de terminar com か, não é uma pergunta. É uma exclamação emocional.

A forma ことだろう tem o mesmo sentido e soa um pouco mais suave.$$,
    $$ことか é típico de textos escritos e de falas emocionadas.

Sem palavras como どんなに ou 何度, a frase com ことか fica estranha.

É comum em cartas, discursos e relatos de emoções intensas, como saudade e alívio.$$,
    $$どんなに / どれほど / どれだけ / 何度 + … + ことか
… + ことだろう (mais suave)$$,
    $$ことか$$,
    $$ことか|ことだろう$$,
    ARRAY['こと', 'か']::text[],
    ARRAY['ことか', 'ことだろう']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-57', $$合格したと聞いて、どんなにうれしかったことか。$$, $$ごうかくしたときいて、どんなにうれしかったことか。$$, $$Como fiquei feliz ao saber que passei!$$),
    ('n2-grammar-57', $$この日をどれほど待ったことか。$$, $$このひをどれほどまったことか。$$, $$Quanto eu esperei por este dia!$$),
    ('n2-grammar-57', $$同じことを何度注意したことか。$$, $$おなじことをなんどちゅういしたことか。$$, $$Quantas vezes eu avisei sobre a mesma coisa!$$),
    ('n2-grammar-57', $$一人暮らしは、どんなに寂しいことか。$$, $$ひとりぐらしは、どんなにさびしいことか。$$, $$Como é solitário morar sozinho!$$),
    ('n2-grammar-57', $$家族に会えて、どれだけ安心したことだろう。$$, $$かぞくにあえて、どれだけあんしんしたことだろう。$$, $$Quanto alívio eu senti ao ver minha família!$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$あなたに会えて、どんなにうれしい____。$$, $$Como estou feliz por te ver!$$),
        (2, $$子供のころ、何度この川で遊んだ____。$$, $$Quantas vezes brinquei neste rio quando era criança!$$),
        (3, $$彼の言葉に、どれだけ救われた____。$$, $$Quanto as palavras dele me salvaram!$$),
        (4, $$試験の結果を、どれほど心配した____。$$, $$Como me preocupei com o resultado da prova!$$),
        (5, $$留学中、母の料理がどんなに恋しかった____。$$, $$Como senti falta da comida da minha mãe durante o intercâmbio!$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-57', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことか$$),
        (2, $$ことか$$),
        (3, $$ことか$$),
        (4, $$ことか$$),
        (5, $$ことか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
