-- n2-grammar-102 — 〜にせよ / 〜にしろ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-102',
    'grammar',
    'N2',
    $$〜にせよ / 〜にしろ$$,
    $$ni seyo / ni shiro$$,
    $$Mesmo que / Ainda que / Seja como for$$,
    $$にせよ e にしろ indicam que, mesmo aceitando uma situação, a conclusão não muda. Equivale a "mesmo que" ou "ainda que".

Por exemplo, "mesmo que esteja ocupado, devia pelo menos ligar". A pessoa reconhece a situação, mas mantém sua opinião.

Também aparecem com palavras interrogativas, como いずれにせよ ou 何にしろ, com o sentido de "seja como for".$$,
    $$São parecidos com としても e にしても, mas mais formais.

にしろ é um pouco mais comum na fala, e にせよ é mais comum na escrita.

いずれにせよ é uma expressão muito usada para encerrar uma discussão.$$,
    $$Verbo (forma simples) + にせよ / にしろ
Adjetivo い + にせよ / にしろ
Adjetivo な / Substantivo + (である) + にせよ / にしろ
Palavra interrogativa + にせよ / にしろ$$,
    $$にせよ$$,
    $$にせよ|にしろ$$,
    ARRAY['に', 'せよ']::text[],
    ARRAY['にせよ', 'にしろ', 'いずれにせよ', '何にしろ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-102', $$忙しいにせよ、電話くらいはできるだろう。$$, $$いそがしいにせよ、でんわくらいはできるだろう。$$, $$Mesmo ocupado, pelo menos um telefonema dá para fazer.$$),
    ('n2-grammar-102', $$冗談にしろ、そんなことを言うべきではない。$$, $$じょうだんにしろ、そんなことをいうべきではない。$$, $$Mesmo que seja brincadeira, não se deve dizer uma coisa dessas.$$),
    ('n2-grammar-102', $$いずれにせよ、明日までに決めなければならない。$$, $$いずれにせよ、あしたまでにきめなければならない。$$, $$Seja como for, temos que decidir até amanhã.$$),
    ('n2-grammar-102', $$どんな理由があるにせよ、暴力は許されない。$$, $$どんなりゆうがあるにせよ、ぼうりょくはゆるされない。$$, $$Seja qual for o motivo, a violência não é perdoável.$$),
    ('n2-grammar-102', $$何にしろ、無事でよかった。$$, $$なんにしろ、ぶじでよかった。$$, $$Seja como for, que bom que está tudo bem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$たとえ少額____、借りたお金は返すべきだ。$$, $$Mesmo que seja pouco, dinheiro emprestado deve ser devolvido.$$),
        (2, $$行く____行かないにせよ、早く連絡して。$$, $$Indo ou não, me avise logo.$$),
        (3, $$いずれ____、もう一度話し合いましょう。$$, $$Seja como for, vamos conversar mais uma vez.$$),
        (4, $$知らなかった____、責任は取るべきだ。$$, $$Mesmo que não soubesse, deve assumir a responsabilidade.$$),
        (5, $$誰が来る____、準備はしておこう。$$, $$Seja quem for que venha, vamos deixar tudo preparado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-102', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にせよ$$),
        (1, $$にしろ$$),
        (2, $$にせよ$$),
        (2, $$にしろ$$),
        (3, $$にせよ$$),
        (3, $$にしろ$$),
        (4, $$にせよ$$),
        (4, $$にしろ$$),
        (5, $$にせよ$$),
        (5, $$にしろ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
