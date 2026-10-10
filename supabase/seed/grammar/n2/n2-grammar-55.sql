-- n2-grammar-55 — 〜ことだ（忠告）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-55',
    'grammar',
    'N2',
    $$〜ことだ（忠告）$$,
    $$koto da (chuukoku)$$,
    $$O melhor é / O certo é / O importante é$$,
    $$Nesse uso, ことだ é usado para dar um conselho ou uma recomendação forte, dizendo qual é a melhor coisa a fazer em uma situação. Equivale a "o melhor é", "o certo é" ou "o importante é".

Ele vem depois do verbo na forma de dicionário ou na forma ない. Muitas vezes, a primeira parte apresenta um objetivo com たいなら, たければ ou ば: "se quer melhorar o japonês, o melhor é falar todo dia".

O tom é de quem tem experiência ou autoridade para aconselhar, como um professor, um pai ou um superior. Por isso, não é usado para aconselhar pessoas mais velhas ou de posição superior.

Na forma educada, usa-se ことです.$$,
    $$ことだ é diferente de ほうがいい: ことだ soa mais firme e assertivo, como uma recomendação decisiva.

Com superiores, ことだ pode soar arrogante. Prefira ほうがいいと思います.

Não confunda com outros usos de ことだ, como "é algo que..." em frases explicativas.$$,
    $$(〜たいなら / 〜たければ、) + Verbo na forma de dicionário + ことだ
Verbo na forma ない + ことだ (o melhor é não...)

Educado: ことです$$,
    $$ことだ$$,
    $$ことだ|ことです$$,
    ARRAY['こと', 'だ']::text[],
    ARRAY['ことだ', 'ことです', 'ないことだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-55', $$日本語が上手になりたいなら、毎日話すことだ。$$, $$にほんごがじょうずになりたいなら、まいにちはなすことだ。$$, $$Se quer melhorar o japonês, o melhor é falar todo dia.$$),
    ('n2-grammar-55', $$健康になりたければ、よく寝ることです。$$, $$けんこうになりたければ、よくねることです。$$, $$Se quer ficar saudável, o importante é dormir bem.$$),
    ('n2-grammar-55', $$風邪を早く治したいなら、無理をしないことだ。$$, $$かぜをはやくなおしたいなら、むりをしないことだ。$$, $$Se quer se curar logo do resfriado, o melhor é não exagerar.$$),
    ('n2-grammar-55', $$わからないことがあれば、先生に聞くことだ。$$, $$わからないことがあれば、せんせいにきくことだ。$$, $$Se tiver alguma dúvida, o certo é perguntar ao professor.$$),
    ('n2-grammar-55', $$合格したければ、もっと勉強することだ。$$, $$ごうかくしたければ、もっとべんきょうすることだ。$$, $$Se quer passar, o melhor é estudar mais.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$痩せたいなら、甘い物を食べない____。$$, $$Se quer emagrecer, o melhor é não comer doces.$$),
        (2, $$試験に受かりたければ、過去問を解く____。$$, $$Se quer passar na prova, o melhor é resolver provas anteriores.$$),
        (3, $$友達を作りたいなら、自分から話しかける____。$$, $$Se quer fazer amigos, o melhor é puxar conversa você mesmo.$$),
        (4, $$疲れているなら、ゆっくり休む____。$$, $$Se está cansado, o melhor é descansar bem.$$),
        (5, $$成功したければ、あきらめない____。$$, $$Se quer ter sucesso, o importante é não desistir.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-55', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことだ$$),
        (1, $$ことです$$),
        (2, $$ことだ$$),
        (2, $$ことです$$),
        (3, $$ことだ$$),
        (3, $$ことです$$),
        (4, $$ことだ$$),
        (4, $$ことです$$),
        (5, $$ことだ$$),
        (5, $$ことです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
