-- n3-grammar-87 — 〜につれて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-87',
    'grammar',
    'N3',
    $$〜につれて$$,
    $$ni tsurete$$,
    $$À medida que / Conforme / Com o passar de$$,
    $$につれて é usado para dizer que, à medida que uma coisa muda, outra coisa também muda gradualmente. Equivale a "à medida que", "conforme" ou "com o passar de".

Ele vem depois de verbos de mudança na forma de dicionário, como たつ (passar), 近づく (aproximar-se), 大きくなる (crescer) e 上手になる (melhorar).

A segunda parte também descreve uma mudança gradual, que acompanha a primeira. Por exemplo, "conforme o tempo passou, a tristeza foi desaparecendo".

Por isso, a segunda parte não pode ser uma ação pontual ou uma vontade. Ela precisa ser uma mudança natural e progressiva.$$,
    $$につれて e にしたがって são muito parecidos no sentido de "à medida que". につれて é um pouco mais comum na conversa.

A segunda parte costuma ter formas como てくる, ていく, ようになる ou adjetivos com なる, que indicam mudança.

É muito usado em reflexões sobre o tempo, o crescimento e o envelhecimento.$$,
    $$Verbo de mudança (forma de dicionário) + につれて、 + Mudança gradual
Substantivo de mudança + につれて (時代 / 成長)

Formal: につれ$$,
    $$につれて$$,
    $$につれて|につれ$$,
    ARRAY['に', 'つれて']::text[],
    ARRAY['につれて', 'につれ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-87', $$時間がたつにつれて、悲しみが消えていった。$$, $$じかんがたつにつれて、かなしみがきえていった。$$, $$Com o passar do tempo, a tristeza foi desaparecendo.$$),
    ('n3-grammar-87', $$年をとるにつれて、体が弱くなる。$$, $$としをとるにつれて、からだがよわくなる。$$, $$À medida que envelhecemos, o corpo fica mais fraco.$$),
    ('n3-grammar-87', $$町が大きくなるにつれて、交通が不便になった。$$, $$まちがおおきくなるにつれて、こうつうがふべんになった。$$, $$Conforme a cidade cresceu, o trânsito ficou pior.$$),
    ('n3-grammar-87', $$日本語が上手になるにつれて、友達が増えた。$$, $$にほんごがじょうずになるにつれて、ともだちがふえた。$$, $$À medida que meu japonês melhorou, fiz mais amigos.$$),
    ('n3-grammar-87', $$試験が近づくにつれて、緊張してきた。$$, $$しけんがちかづくにつれて、きんちょうしてきた。$$, $$Conforme a prova se aproximava, fui ficando nervoso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$冬が近づく____、寒くなってきた。$$, $$À medida que o inverno se aproxima, vem esfriando.$$),
        (2, $$子供が成長する____、家が狭く感じる。$$, $$Conforme as crianças crescem, a casa parece menor.$$),
        (3, $$時代が変わる____、人々の考え方も変わる。$$, $$Com a mudança dos tempos, o modo de pensar das pessoas também muda.$$),
        (4, $$山を登る____、空気が冷たくなった。$$, $$À medida que subíamos a montanha, o ar ficava mais frio.$$),
        (5, $$彼の話を聞く____、彼の気持ちがわかってきた。$$, $$Conforme ouvia o que ele dizia, fui entendendo os sentimentos dele.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-87', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$につれて$$),
        (2, $$につれて$$),
        (3, $$につれて$$),
        (4, $$につれて$$),
        (5, $$につれて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
