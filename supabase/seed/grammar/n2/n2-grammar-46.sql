-- n2-grammar-46 — 〜かねる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-46',
    'grammar',
    'N2',
    $$〜かねる$$,
    $$kaneru$$,
    $$Não poder / Ser difícil de / Não estar em condições de$$,
    $$かねる é usado para dizer, de forma educada e indireta, que não é possível fazer algo. Equivale a "não poder", "ser difícil de" ou "não estar em condições de".

Ele vem depois do verbo na forma ます sem ます. Por exemplo, お答えしかねます (não posso responder), 応じかねます (não podemos atender).

O ponto principal é a educação. Em vez de dizer diretamente できません, que pode soar frio, かねます mostra que a pessoa gostaria de fazer, mas, por regras ou circunstâncias, não pode.

Por isso, é muito usado no atendimento ao cliente, em empresas e em e-mails formais.

Apesar da forma afirmativa, o sentido é negativo: "não posso".$$,
    $$Não confunda かねる (não posso, educado) com かねない (pode acabar acontecendo algo ruim).

A forma わかりかねます ("não sei informar") é muito usada por atendentes.

Em contextos formais, かねる soa muito mais suave do que できない.$$,
    $$Verbo na forma ます sem ます + かねる
Verbo sem ます + かねます (educado, mais comum)
お / ご + Verbo + しかねます (muito educado)

Escrita: かねる / 兼ねる$$,
    $$かねる$$,
    $$かねる|かねます|兼ねる|兼ねます$$,
    ARRAY['かねる']::text[],
    ARRAY['かねる', 'かねます']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-46', $$申し訳ありませんが、その質問にはお答えしかねます。$$, $$もうしわけありませんが、そのしつもんにはおこたえしかねます。$$, $$Desculpe, mas não posso responder a essa pergunta.$$),
    ('n2-grammar-46', $$申し訳ありませんが、ご要望には応じかねます。$$, $$もうしわけありませんが、ごようぼうにはおうじかねます。$$, $$Lamentamos, mas não podemos atender a esse pedido.$$),
    ('n2-grammar-46', $$彼の意見には賛成しかねる。$$, $$かれのいけんにはさんせいしかねる。$$, $$Não posso concordar com a opinião dele.$$),
    ('n2-grammar-46', $$個人情報はお教えしかねます。$$, $$こじんじょうほうはおおしえしかねます。$$, $$Não podemos fornecer informações pessoais.$$),
    ('n2-grammar-46', $$この件については、私には判断しかねます。$$, $$このけんについては、わたしにははんだんしかねます。$$, $$Sobre este assunto, não estou em condições de decidir.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$恐れ入りますが、セール品の返品はお受けし____。$$, $$Lamentamos, mas não aceitamos devolução de itens em promoção.$$),
        (2, $$その条件では、契約し____。$$, $$Com essas condições, não podemos fechar o contrato.$$),
        (3, $$彼の行動は理解し____。$$, $$O comportamento dele é difícil de entender.$$),
        (4, $$申し訳ございませんが、そのご質問にはお答えし____。$$, $$Pedimos desculpas, mas não podemos responder a essa pergunta.$$),
        (5, $$私一人では決め____ので、上司に相談します。$$, $$Não posso decidir sozinho, então vou consultar meu chefe.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-46', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かねます$$),
        (2, $$かねます$$),
        (3, $$かねる$$),
        (3, $$かねます$$),
        (4, $$かねます$$),
        (5, $$かねます$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
