-- n3-grammar-48 — 〜こと（指示・感嘆）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-48',
    'grammar',
    'N3',
    $$〜こと（指示・感嘆）$$,
    $$koto (shiji / kantan)$$,
    $$Deve-se (fazer) / É proibido... / Que...! (exclamação)$$,
    $$No N3, こと aparece no final da frase com dois usos especiais.

O primeiro, e mais importante, é dar instruções ou regras. Uma frase terminada em こと funciona como uma ordem escrita: "deve-se fazer" ou, com ない, "é proibido fazer". Esse uso é muito comum em regulamentos de escolas, avisos, provas, manuais e listas de regras.

Ele vem depois do verbo na forma de dicionário (para obrigação) ou na forma ない (para proibição).

O segundo uso, menos comum, é exclamativo: expressa admiração ou surpresa, como "que bebê fofo!". Esse uso soa feminino ou antiquado e aparece mais em ficção.$$,
    $$Esse uso de こと aparece quase sempre na escrita, como em instruções de provas e regras de dormitórios.

Na fala, esse tipo de ordem soa rígido, como de um professor ou chefe dando instruções.

O uso exclamativo, como まあ、きれいだこと, é típico da fala de mulheres mais velhas ou de personagens elegantes.$$,
    $$Verbo na forma de dicionário + こと (fim de frase: deve-se fazer)
Verbo na forma ない + こと (fim de frase: é proibido)
Adjetivo / Substantivo + だ + こと (exclamação, uso antigo / feminino)$$,
    $$こと$$,
    $$こと。|こと！|ことね$$,
    ARRAY['こと']::text[],
    ARRAY['こと']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-48', $$学校のルール：廊下を走らないこと。$$, $$がっこうのルール：ろうかをはしらないこと。$$, $$Regra da escola: é proibido correr no corredor.$$),
    ('n3-grammar-48', $$レポートは金曜日までに提出すること。$$, $$レポートはきんようびまでにていしゅつすること。$$, $$O relatório deve ser entregue até sexta-feira.$$),
    ('n3-grammar-48', $$図書館では静かにすること。$$, $$としょかんではしずかにすること。$$, $$Na biblioteca, deve-se fazer silêncio.$$),
    ('n3-grammar-48', $$試験中は、携帯電話の電源を切ること。$$, $$しけんちゅうは、けいたいでんわのでんげんをきること。$$, $$Durante a prova, os celulares devem ser desligados.$$),
    ('n3-grammar-48', $$まあ、かわいい赤ちゃんだこと。$$, $$まあ、かわいいあかちゃんだこと。$$, $$Ah, mas que bebê fofinho!$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$クラスの約束：毎日宿題を出す____。$$, $$Combinado da turma: entregar a lição todos os dias.$$),
        (2, $$ゴミは分別して捨てる____。$$, $$O lixo deve ser separado antes de ser descartado.$$),
        (3, $$寮のルール：授業に遅れない____。$$, $$Regra do dormitório: não chegar atrasado às aulas.$$),
        (4, $$使った物は元の場所に戻す____。$$, $$Os objetos usados devem ser devolvidos ao lugar original.$$),
        (5, $$夜十時以降は大きな音を出さない____。$$, $$Depois das dez da noite, é proibido fazer barulho alto.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-48', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$こと$$),
        (2, $$こと$$),
        (3, $$こと$$),
        (4, $$こと$$),
        (5, $$こと$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
