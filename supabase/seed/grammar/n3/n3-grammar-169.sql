-- n3-grammar-169 — 〜わけにはいかない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-169',
    'grammar',
    'N3',
    $$〜わけにはいかない$$,
    $$wake ni wa ikanai$$,
    $$Não posso / Não dá para / Não seria certo$$,
    $$わけにはいかない é usado para dizer que, por razões morais, sociais ou de responsabilidade, a pessoa não pode fazer algo, mesmo que queira ou que seja fisicamente possível. Equivale a "não posso", "não dá para" ou "não seria certo".

A diferença em relação a できない é o motivo. できない indica incapacidade. わけにはいかない indica que fazer aquilo seria errado ou inadequado na situação, por causa de compromissos, regras ou o que os outros esperam.

Por exemplo, "amanhã tem prova, então não dá para ir passear" ou "vim de carro, então não posso beber".

Com a forma ない, ないわけにはいかない significa "não tenho como não fazer", ou seja, "sou obrigado a fazer".$$,
    $$わけにもいかない, com も, mostra que a pessoa está num dilema: não pode fazer nem uma coisa nem outra.

É muito comum no trabalho, para explicar por que não se pode faltar, recusar ou desistir.

ないわけにはいかない aparece separadamente como gramática do N3 e expressa uma obrigação social.$$,
    $$Verbo na forma de dicionário + わけにはいかない
Verbo na forma ない + わけにはいかない (não tenho como não fazer)

Educado: わけにはいきません
Variação: わけにもいかない (também não dá para...)$$,
    $$わけにはいかない$$,
    $$わけにはいかない|わけにはいきません|わけにもいかない$$,
    ARRAY['わけ', 'には', 'いかない']::text[],
    ARRAY['わけにはいかない', 'わけにはいきません', 'わけにもいかない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-169', $$明日は試験だから、遊びに行くわけにはいかない。$$, $$あしたはしけんだから、あそびにいくわけにはいかない。$$, $$Amanhã tem prova, então não dá para ir passear.$$),
    ('n3-grammar-169', $$約束したので、行かないわけにはいかない。$$, $$やくそくしたので、いかないわけにはいかない。$$, $$Eu prometi, então não tenho como não ir.$$),
    ('n3-grammar-169', $$大切な会議なので、休むわけにはいきません。$$, $$たいせつなかいぎなので、やすむわけにはいきません。$$, $$É uma reunião importante, então não posso faltar.$$),
    ('n3-grammar-169', $$車で来たから、お酒を飲むわけにはいかない。$$, $$くるまできたから、おさけをのむわけにはいかない。$$, $$Vim de carro, então não posso beber.$$),
    ('n3-grammar-169', $$先輩に頼まれたら、断るわけにもいかない。$$, $$せんぱいにたのまれたら、ことわるわけにもいかない。$$, $$Se o veterano me pede, também não dá para recusar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$熱があるが、今日は大事な仕事があるから休む____。$$, $$Estou com febre, mas hoje tenho um trabalho importante, então não posso faltar.$$),
        (2, $$これは友達に借りた物だから、捨てる____。$$, $$Isto é emprestado de um amigo, então não dá para jogar fora.$$),
        (3, $$みんなが待っているので、一人で先に帰る____。$$, $$Todos estão esperando, então não posso ir embora sozinho antes.$$),
        (4, $$一度約束したことを破る____。$$, $$Não seria certo quebrar algo que prometi.$$),
        (5, $$子供が見ているから、親の私が泣く____。$$, $$Meu filho está olhando, então eu, como mãe, não posso chorar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-169', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$わけにはいかない$$),
        (1, $$わけにはいきません$$),
        (2, $$わけにはいかない$$),
        (2, $$わけにはいきません$$),
        (3, $$わけにはいかない$$),
        (3, $$わけにはいきません$$),
        (4, $$わけにはいかない$$),
        (4, $$わけにはいきません$$),
        (5, $$わけにはいかない$$),
        (5, $$わけにはいきません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
