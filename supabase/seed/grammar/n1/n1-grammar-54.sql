-- n1-grammar-54 — 〜嫌いがある
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-54',
    'grammar',
    'N1',
    $$〜嫌いがある$$,
    $$kirai ga aru$$,
    $$Ter tendência a / Costumar / Ter o mau hábito de$$,
    $$嫌いがある indica que alguém tem uma tendência negativa, um mau hábito ou um defeito no jeito de agir. Equivale a "ter tendência a" ou "ter o mau hábito de".

É usado para criticar de forma indireta. Por exemplo, "ele tem tendência a exagerar" ou "os jovens costumam evitar o esforço".

É uma expressão formal, mais comum na escrita.$$,
    $$Também é escrito きらいがある.

Só é usado para tendências negativas.

É parecido com 傾向がある e がちだ, mas 嫌いがある é mais formal e crítico.$$,
    $$Verbo (forma dicionário / forma ない) + 嫌いがある
Substantivo + の + 嫌いがある$$,
    $$嫌いがある$$,
    $$嫌いがある|きらいがある|嫌いがあります|きらいがあります$$,
    ARRAY['嫌い', 'が', 'ある']::text[],
    ARRAY['嫌いがある', 'きらいがある']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-54', $$彼は物事を大げさに言う嫌いがある。$$, $$かれはものごとをおおげさにいうきらいがある。$$, $$Ele tem tendência a exagerar as coisas.$$),
    ('n1-grammar-54', $$最近の若者は、苦労を避ける嫌いがある。$$, $$さいきんのわかものは、くろうをさけるきらいがある。$$, $$Os jovens de hoje têm tendência a evitar dificuldades.$$),
    ('n1-grammar-54', $$彼女は人の話を最後まで聞かない嫌いがある。$$, $$かのじょはひとのはなしをさいごまできかないきらいがある。$$, $$Ela tem o mau hábito de não ouvir os outros até o fim.$$),
    ('n1-grammar-54', $$この会社は、新しいことを嫌う嫌いがある。$$, $$このかいしゃは、あたらしいことをきらうきらいがある。$$, $$Esta empresa tem tendência a rejeitar novidades.$$),
    ('n1-grammar-54', $$父は何でも一人で決めてしまう嫌いがある。$$, $$ちちはなんでもひとりできめてしまうきらいがある。$$, $$Meu pai tem o mau hábito de decidir tudo sozinho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は自分の意見を押し付ける____。$$, $$Ele tem tendência a impor a própria opinião.$$),
        (2, $$この子は飽きっぽい____。$$, $$Esta criança tem tendência a enjoar rápido das coisas.$$),
        (3, $$彼は物事を悪い方に考える____。$$, $$Ele tem tendência a pensar o pior das coisas.$$),
        (4, $$日本人は自分の意見を言わない____と言われる。$$, $$Dizem que os japoneses têm tendência a não dar a própria opinião.$$),
        (5, $$あの先生は生徒を厳しく叱りすぎる____。$$, $$Aquele professor tem o mau hábito de repreender os alunos com rigor demais.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-54', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$嫌いがある$$),
        (1, $$きらいがある$$),
        (2, $$嫌いがある$$),
        (2, $$きらいがある$$),
        (3, $$嫌いがある$$),
        (3, $$きらいがある$$),
        (4, $$嫌いがある$$),
        (4, $$きらいがある$$),
        (5, $$嫌いがある$$),
        (5, $$きらいがある$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
