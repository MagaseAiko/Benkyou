-- n1-grammar-172 — 〜術がない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-172',
    'grammar',
    'N1',
    $$〜術がない$$,
    $$sube ga nai$$,
    $$Não há como / Não há meio de / Não tem jeito de$$,
    $$術がない indica que não existe nenhum meio ou método para fazer algo. Equivale a "não há como" ou "não há meio de".

A pessoa se sente impotente diante da situação. Por exemplo, "não havia como ajudá-lo" ou "não tenho meio de contatá-lo".

É uma expressão formal e literária.$$,
    $$Também é escrito すべがない.

Expressões comuns são なす術がない, 知る術がない e 連絡する術がない.

なす術もなく significa "sem poder fazer nada".$$,
    $$Verbo (forma dicionário) + 術がない
Verbo (forma dicionário) + 術もない$$,
    $$術がない$$,
    $$術がない|術もない|術もなく|術がなかった|術もなかった|すべがない|すべもなく$$,
    ARRAY['術', 'が', 'ない']::text[],
    ARRAY['術がない', '術もない', '術もなく', 'すべがない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-172', $$大きな災害の前に、人々はなす術がなかった。$$, $$おおきなさいがいのまえに、ひとびとはなすすべがなかった。$$, $$Diante do grande desastre, as pessoas não tinham o que fazer.$$),
    ('n1-grammar-172', $$彼の居場所を知る術がない。$$, $$かれのいばしょをしるすべがない。$$, $$Não há como saber onde ele está.$$),
    ('n1-grammar-172', $$電話もメールも通じず、連絡する術がない。$$, $$でんわもメールもつうじず、れんらくするすべがない。$$, $$Nem telefone nem e-mail funcionam, não há meio de entrar em contato.$$),
    ('n1-grammar-172', $$強い相手に、なす術もなく負けた。$$, $$つよいあいてに、なすすべもなくまけた。$$, $$Perdemos para o adversário forte sem poder fazer nada.$$),
    ('n1-grammar-172', $$今となっては、確かめる術もない。$$, $$いまとなっては、たしかめるすべもない。$$, $$A esta altura, não há mais como confirmar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$火の勢いが強く、消防士もなす____。$$, $$O fogo estava tão forte que nem os bombeiros tinham o que fazer.$$),
        (2, $$昔のことなので、真実を知る____。$$, $$Como é coisa antiga, não há como saber a verdade.$$),
        (3, $$彼の気持ちを変える____。$$, $$Não há meio de mudar o sentimento dele.$$),
        (4, $$病気が進んで、医者もなす____。$$, $$A doença avançou e nem o médico tinha o que fazer.$$),
        (5, $$チームは相手の攻撃に、なす____敗れた。$$, $$O time perdeu para o ataque do adversário sem poder fazer nada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-172', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$術がなかった$$),
        (1, $$術もなかった$$),
        (2, $$術がない$$),
        (2, $$術もない$$),
        (2, $$すべがない$$),
        (3, $$術がない$$),
        (3, $$術もない$$),
        (3, $$すべがない$$),
        (4, $$術がなかった$$),
        (4, $$術もなかった$$),
        (5, $$術もなく$$),
        (5, $$すべもなく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
