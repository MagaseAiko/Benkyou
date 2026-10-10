-- n1-grammar-83 — 〜ものとする
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-83',
    'grammar',
    'N1',
    $$〜ものとする$$,
    $$mono to suru$$,
    $$Fica estabelecido que / Considera-se que / Deve-se$$,
    $$ものとする é usado para estabelecer uma regra, uma condição ou uma interpretação oficial. Equivale a "fica estabelecido que" ou "considera-se que".

É uma expressão típica de contratos, leis, regulamentos e documentos formais. Por exemplo, "o contrato será considerado válido a partir da assinatura" ou "o pagamento deve ser feito até o fim do mês".$$,
    $$Quase não é usado na fala do dia a dia.

Também aparece como ものとします, na forma educada, e ものとみなす, "considera-se como".$$,
    $$Verbo (forma dicionário) + ものとする
Verbo (forma ない) + ものとする$$,
    $$ものとする$$,
    $$ものとする|ものとします$$,
    ARRAY['もの', 'と', 'する']::text[],
    ARRAY['ものとする', 'ものとします']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-83', $$契約は署名した日から有効になるものとする。$$, $$けいやくはしょめいしたひからゆうこうになるものとする。$$, $$Fica estabelecido que o contrato é válido a partir da data da assinatura.$$),
    ('n1-grammar-83', $$家賃は毎月末日までに支払うものとする。$$, $$やちんはまいげつまつじつまでにしはらうものとする。$$, $$O aluguel deve ser pago até o último dia de cada mês.$$),
    ('n1-grammar-83', $$連絡がない場合は、欠席したものとします。$$, $$れんらくがないばあいは、けっせきしたものとします。$$, $$Em caso de falta de aviso, considera-se ausência.$$),
    ('n1-grammar-83', $$この規則は来月から適用するものとする。$$, $$このきそくはらいげつからてきようするものとする。$$, $$Fica estabelecido que esta regra será aplicada a partir do mês que vem.$$),
    ('n1-grammar-83', $$期限を過ぎた申し込みは受け付けないものとする。$$, $$きげんをすぎたもうしこみはうけつけないものとする。$$, $$Fica estabelecido que inscrições fora do prazo não serão aceitas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$会員は年会費を前払いする____。$$, $$Os sócios devem pagar a anuidade adiantado.$$),
        (2, $$返事がない場合は、賛成した____。$$, $$Em caso de não haver resposta, considera-se que concorda.$$),
        (3, $$会議は月に一回開く____。$$, $$Fica estabelecido que a reunião será realizada uma vez por mês.$$),
        (4, $$本契約は一年間有効な____。$$, $$Fica estabelecido que este contrato é válido por um ano.$$),
        (5, $$違反した場合は、罰金を支払う____。$$, $$Em caso de infração, deve-se pagar uma multa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-83', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ものとする$$),
        (1, $$ものとします$$),
        (2, $$ものとする$$),
        (2, $$ものとします$$),
        (3, $$ものとする$$),
        (3, $$ものとします$$),
        (4, $$ものとする$$),
        (4, $$ものとします$$),
        (5, $$ものとする$$),
        (5, $$ものとします$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
