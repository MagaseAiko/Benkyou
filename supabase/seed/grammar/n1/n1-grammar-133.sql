-- n1-grammar-133 — 〜に〜を重ねて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-133',
    'grammar',
    'N1',
    $$〜に〜を重ねて$$,
    $$ni ~ wo kasanete$$,
    $$Repetidamente / Após muito / Sobre$$,
    $$に〜を重ねて indica que uma ação é repetida muitas vezes, uma sobre a outra. Equivale a "repetidamente" ou "após muito...".

A estrutura repete o mesmo substantivo, como 努力に努力を重ねて, "esforço sobre esforço", ou 改良に改良を重ねて, "melhoria sobre melhoria".

Mostra que houve muito empenho e persistência para alcançar um resultado.$$,
    $$Combinações comuns são 努力に努力を重ねて, 改良に改良を重ねて, 研究に研究を重ねて e 失敗に失敗を重ねて.

É uma expressão formal e enfática.$$,
    $$Substantivo + に + Mesmo substantivo + を重ねて$$,
    $$に〜を重ねて$$,
    $$を重ねて|を重ね$$,
    ARRAY['に', 'を', '重ねて']::text[],
    ARRAY['に〜を重ねて', 'に〜を重ね']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-133', $$努力に努力を重ねて、ついに夢をかなえた。$$, $$どりょくにどりょくをかさねて、ついにゆめをかなえた。$$, $$Com esforço sobre esforço, finalmente realizou o sonho.$$),
    ('n1-grammar-133', $$改良に改良を重ねて、この商品が完成した。$$, $$かいりょうにかいりょうをかさねて、このしょうひんがかんせいした。$$, $$Após muitas melhorias, este produto ficou pronto.$$),
    ('n1-grammar-133', $$研究に研究を重ね、新しい薬が開発された。$$, $$けんきゅうにけんきゅうをかさね、あたらしいくすりがかいはつされた。$$, $$Após muita pesquisa, foi desenvolvido um novo remédio.$$),
    ('n1-grammar-133', $$失敗に失敗を重ねて、やっと成功した。$$, $$しっぱいにしっぱいをかさねて、やっとせいこうした。$$, $$Depois de fracasso sobre fracasso, finalmente deu certo.$$),
    ('n1-grammar-133', $$練習に練習を重ねて、大会に臨んだ。$$, $$れんしゅうにれんしゅうをかさねて、たいかいにのぞんだ。$$, $$Treinei repetidamente e enfrentei o campeonato.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$工夫に工夫____、新しい料理を作った。$$, $$Com muita criatividade, criei um novo prato.$$),
        (2, $$苦労に苦労____、店を大きくした。$$, $$Após muito sofrimento, fiz a loja crescer.$$),
        (3, $$検討に検討____、結論を出した。$$, $$Após muita análise, chegamos a uma conclusão.$$),
        (4, $$実験に実験____、ついに成功した。$$, $$Após muitos experimentos, finalmente tivemos sucesso.$$),
        (5, $$議論に議論____、計画がまとまった。$$, $$Após muita discussão, o plano tomou forma.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-133', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を重ねて$$),
        (1, $$を重ね$$),
        (2, $$を重ねて$$),
        (2, $$を重ね$$),
        (3, $$を重ねて$$),
        (3, $$を重ね$$),
        (4, $$を重ねて$$),
        (4, $$を重ね$$),
        (5, $$を重ねて$$),
        (5, $$を重ね$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
