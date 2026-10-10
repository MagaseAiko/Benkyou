-- n2-grammar-145 — そう言えば
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-145',
    'grammar',
    'N2',
    $$そう言えば$$,
    $$sou ieba$$,
    $$Falando nisso / Por falar nisso / Agora que mencionou$$,
    $$そう言えば é usado quando algo dito na conversa faz a pessoa lembrar de outra coisa. Equivale a "falando nisso" ou "por falar nisso".

Também é usado quando a pessoa se lembra de repente de algo, mesmo sem ligação direta com o assunto. Por exemplo, "falando nisso, você devolveu aquele livro?".

É uma expressão muito comum na fala do dia a dia.$$,
    $$Também é escrito そういえば, em hiragana.

É parecido com ところで, mas そう言えば indica que a lembrança surgiu da conversa ou de repente.$$,
    $$そう言えば、 + Frase (lembrança)$$,
    $$そう言えば$$,
    $$そう言えば|そういえば$$,
    ARRAY['そう', '言えば']::text[],
    ARRAY['そう言えば', 'そういえば']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-145', $$そう言えば、明日は田中さんの誕生日だ。$$, $$そういえば、あしたはたなかさんのたんじょうびだ。$$, $$Falando nisso, amanhã é aniversário do Tanaka.$$),
    ('n2-grammar-145', $$「京都に行ったよ。」「そう言えば、私も来月行くんだ。」$$, $$「きょうとにいったよ。」「そういえば、わたしもらいげついくんだ。」$$, $$Fui a Kyoto. Por falar nisso, eu também vou no mês que vem.$$),
    ('n2-grammar-145', $$そういえば、最近彼に会っていない。$$, $$そういえば、さいきんかれにあっていない。$$, $$Agora que penso nisso, faz tempo que não o vejo.$$),
    ('n2-grammar-145', $$そう言えば、あの本はもう読んだ？$$, $$そういえば、あのほんはもうよんだ？$$, $$Falando nisso, você já leu aquele livro?$$),
    ('n2-grammar-145', $$「雨が多いね。」「そう言えば、もう梅雨だね。」$$, $$「あめがおおいね。」「そういえば、もうつゆだね。」$$, $$Tem chovido muito, né? Por falar nisso, já é época de chuvas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____、昨日のテストはどうだった？$$, $$Falando nisso, como foi a prova de ontem?$$),
        (2, $$____、駅前に新しい店ができたよ。$$, $$Por falar nisso, abriu uma loja nova em frente à estação.$$),
        (3, $$「最近寒いね。」「____、もう十二月だね。」$$, $$Ultimamente está frio, né? Agora que mencionou, já é dezembro.$$),
        (4, $$____、鍵を閉めたかな。$$, $$Falando nisso, será que eu tranquei a porta?$$),
        (5, $$____、山田さんが結婚するらしいよ。$$, $$Por falar nisso, parece que o Yamada vai se casar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-145', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$そう言えば$$),
        (1, $$そういえば$$),
        (2, $$そう言えば$$),
        (2, $$そういえば$$),
        (3, $$そう言えば$$),
        (3, $$そういえば$$),
        (4, $$そう言えば$$),
        (4, $$そういえば$$),
        (5, $$そう言えば$$),
        (5, $$そういえば$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
