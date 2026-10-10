-- n1-grammar-155 — 〜をおいて〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-155',
    'grammar',
    'N1',
    $$〜をおいて〜ない$$,
    $$wo oite ~ nai$$,
    $$Ninguém além de / Só mesmo / Não há outro senão$$,
    $$をおいて〜ない indica que só existe uma pessoa ou coisa adequada para algo, e nenhuma outra. Equivale a "ninguém além de" ou "não há outro senão".

É usado para elogiar ou destacar algo como a única opção. Por exemplo, "para este trabalho, não há ninguém além dele".

É uma expressão formal.$$,
    $$Muitas vezes vem com ほかに, como をおいてほかにいない.

É usado principalmente para elogios.$$,
    $$Substantivo + をおいて + ほかに〜ない
Substantivo + をおいて + 〜はいない$$,
    $$をおいて〜ない$$,
    $$をおいて|を措いて$$,
    ARRAY['を', 'おいて', 'ない']::text[],
    ARRAY['をおいて〜ない', 'をおいてほかにない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-155', $$この仕事を任せられるのは、彼をおいてほかにいない。$$, $$このしごとをまかせられるのは、かれをおいてほかにいない。$$, $$Não há ninguém além dele a quem confiar este trabalho.$$),
    ('n1-grammar-155', $$次のリーダーは、彼女をおいて考えられない。$$, $$つぎのリーダーは、かのじょをおいてかんがえられない。$$, $$Para o próximo líder, não dá para pensar em outra pessoa senão ela.$$),
    ('n1-grammar-155', $$日本の伝統文化を学ぶなら、京都をおいてほかにない。$$, $$にほんのでんとうぶんかをまなぶなら、きょうとをおいてほかにない。$$, $$Para aprender a cultura tradicional japonesa, não há lugar como Kyoto.$$),
    ('n1-grammar-155', $$今をおいて、チャンスはない。$$, $$いまをおいて、チャンスはない。$$, $$Não há outra chance senão agora.$$),
    ('n1-grammar-155', $$この病気を治せる医者は、彼をおいていないだろう。$$, $$このびょうきをなおせるいしゃは、かれをおいていないだろう。$$, $$Provavelmente não há outro médico capaz de curar esta doença senão ele.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この役ができるのは、あの俳優____ほかにいない。$$, $$Ninguém além daquele ator consegue fazer este papel.$$),
        (2, $$留学するなら、今____ない。$$, $$Se for para fazer intercâmbio, não há momento melhor que agora.$$),
        (3, $$この問題を解決できるのは、専門家の彼____いない。$$, $$Não há ninguém além dele, especialista, capaz de resolver este problema.$$),
        (4, $$温泉といえば、ここ____ほかにない。$$, $$Falando de fontes termais, não há outra como esta.$$),
        (5, $$社長にふさわしい人は、彼女____考えられない。$$, $$Não dá para pensar em ninguém mais adequado para presidente senão ela.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-155', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$をおいて$$),
        (2, $$をおいて$$),
        (3, $$をおいて$$),
        (4, $$をおいて$$),
        (5, $$をおいて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
