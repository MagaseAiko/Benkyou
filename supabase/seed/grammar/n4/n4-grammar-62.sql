-- n4-grammar-62 — 〜のに（逆接）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-62',
    'grammar',
    'N4',
    $$〜のに（逆接）$$,
    $$noni (gyakusetsu)$$,
    $$Mesmo / Apesar de / Embora$$,
    $$のに é usado para ligar duas ideias quando o resultado é contrário ao que se esperava. Equivale a "mesmo...", "apesar de..." ou "embora...".

O ponto principal é o sentimento. のに mostra surpresa, frustração, decepção ou reclamação de quem fala. Por exemplo, "estudei tanto e mesmo assim fui reprovado".

Por isso, ele é diferente de けど e が, que apenas indicam contraste de forma neutra. のに sempre carrega emoção.

Como a segunda parte descreve um fato que contraria a expectativa, ela não pode ser um pedido, uma ordem ou uma intenção.

Com substantivos e adjetivos な, usa-se な antes de のに.$$,
    $$No final da frase, のに sozinho expressa arrependimento ou lamento, como "se pelo menos...", "que pena que...".

A palavra せっかく combina muito com のに, reforçando a frustração por um esforço desperdiçado.

Não confunda com のに de finalidade, que significa "para fazer" e vem antes de verbos como 使う e かかる.$$,
    $$Verbo / Adjetivo い (forma simples) + のに
Substantivo / Adjetivo な + な + のに$$,
    $$のに$$,
    $$のに$$,
    ARRAY['のに']::text[],
    ARRAY['のに', 'なのに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-62', $$一生懸命勉強したのに、試験に落ちた。$$, $$いっしょうけんめいべんきょうしたのに、しけんにおちた。$$, $$Estudei muito e mesmo assim fui reprovado.$$),
    ('n4-grammar-62', $$約束したのに、彼は来なかった。$$, $$やくそくしたのに、かれはこなかった。$$, $$Ele prometeu, mas não veio.$$),
    ('n4-grammar-62', $$日曜日なのに、会社に行かなければならない。$$, $$にちようびなのに、かいしゃにいかなければならない。$$, $$Mesmo sendo domingo, tenho que ir à empresa.$$),
    ('n4-grammar-62', $$この店は高いのに、あまりおいしくない。$$, $$このみせはたかいのに、あまりおいしくない。$$, $$Este restaurante é caro e mesmo assim não é muito gostoso.$$),
    ('n4-grammar-62', $$せっかく作ったのに、誰も食べてくれない。$$, $$せっかくつくったのに、だれもたべてくれない。$$, $$Eu me dei ao trabalho de fazer, e ninguém come.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$薬を飲んだ____、熱が下がらない。$$, $$Tomei remédio, mas a febre não baixa.$$),
        (2, $$もう春な____、まだ寒いですね。$$, $$Mesmo já sendo primavera, ainda está frio, né?$$),
        (3, $$何度も説明した____、わかってくれない。$$, $$Expliquei várias vezes, mas ele não entende.$$),
        (4, $$彼はまだ若い____、何でも知っている。$$, $$Apesar de ainda ser jovem, ele sabe de tudo.$$),
        (5, $$早く起きた____、バスに遅れてしまった。$$, $$Acordei cedo e mesmo assim perdi o ônibus.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-62', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のに$$),
        (2, $$のに$$),
        (3, $$のに$$),
        (4, $$のに$$),
        (5, $$のに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
