-- n2-grammar-194 — 〜ざるを得ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-194',
    'grammar',
    'N2',
    $$〜ざるを得ない$$,
    $$zaru wo enai$$,
    $$Ser obrigado a / Não ter escolha senão / Ter que$$,
    $$ざるを得ない indica que a pessoa é obrigada a fazer algo, mesmo sem querer, porque não há outra opção. Equivale a "ser obrigado a" ou "não ter escolha senão".

Muitas vezes há resignação ou pressão da situação. Por exemplo, "com a chuva forte, fomos obrigados a cancelar o evento".

É uma expressão formal, comum na escrita e em falas sérias.$$,
    $$Atenção à forma de する, que vira せざるを得ない.

É parecido com しかない e よりほかない, mas ざるを得ない é mais formal.

Também é escrito ざるをえない.$$,
    $$Verbo (forma ない sem ない) + ざるを得ない
する → せざるを得ない
来る → 来ざるを得ない$$,
    $$ざるを得ない$$,
    $$ざるを得ない|ざるをえない|ざるを得ません|ざるを得なかった|ざるをえなかった$$,
    ARRAY['ざる', 'を', '得ない']::text[],
    ARRAY['ざるを得ない', 'ざるをえない', 'ざるを得ません', 'せざるを得ない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-194', $$大雨のため、イベントを中止せざるを得なかった。$$, $$おおあめのため、イベントをちゅうしせざるをえなかった。$$, $$Por causa da chuva forte, fomos obrigados a cancelar o evento.$$),
    ('n2-grammar-194', $$上司の命令なので、従わざるを得ない。$$, $$じょうしのめいれいなので、したがわざるをえない。$$, $$Como é ordem do chefe, não tenho escolha senão obedecer.$$),
    ('n2-grammar-194', $$お金がないので、旅行をあきらめざるを得ない。$$, $$おかねがないので、りょこうをあきらめざるをえない。$$, $$Como não tenho dinheiro, sou obrigado a desistir da viagem.$$),
    ('n2-grammar-194', $$これだけ証拠があれば、認めざるを得ません。$$, $$これだけしょうこがあれば、みとめざるをえません。$$, $$Com tantas provas assim, não tenho escolha senão admitir.$$),
    ('n2-grammar-194', $$体調が悪いので、仕事を休まざるをえない。$$, $$たいちょうがわるいので、しごとをやすまざるをえない。$$, $$Como não estou bem de saúde, tenho que faltar ao trabalho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$電車が止まったので、歩いて行か____。$$, $$O trem parou, então sou obrigado a ir a pé.$$),
        (2, $$社長に頼まれたら、引き受け____。$$, $$Se o presidente pedir, não tenho escolha senão aceitar.$$),
        (3, $$台風で、旅行を延期せ____。$$, $$Por causa do tufão, fomos obrigados a adiar a viagem.$$),
        (4, $$彼の才能は認め____。$$, $$Não tenho escolha senão reconhecer o talento dele.$$),
        (5, $$締め切りが明日なので、徹夜せ____。$$, $$Como o prazo é amanhã, sou obrigado a virar a noite.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-194', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ざるを得ない$$),
        (1, $$ざるをえない$$),
        (1, $$ざるを得ません$$),
        (2, $$ざるを得ない$$),
        (2, $$ざるをえない$$),
        (2, $$ざるを得ません$$),
        (3, $$ざるを得なかった$$),
        (3, $$ざるをえなかった$$),
        (4, $$ざるを得ない$$),
        (4, $$ざるをえない$$),
        (4, $$ざるを得ません$$),
        (5, $$ざるを得ない$$),
        (5, $$ざるをえない$$),
        (5, $$ざるを得ません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
