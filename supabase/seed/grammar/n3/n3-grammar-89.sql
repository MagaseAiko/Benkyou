-- n3-grammar-89 — 〜によると・〜によれば
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-89',
    'grammar',
    'N3',
    $$〜によると・〜によれば$$,
    $$ni yoru to / ni yoreba$$,
    $$Segundo / De acordo com$$,
    $$によると e によれば são usados para indicar a fonte de uma informação. Equivalem a "segundo" ou "de acordo com".

A fonte vem antes, como a previsão do tempo, o jornal, uma notícia, uma pesquisa ou o que alguém disse. Depois vem a informação.

A frase costuma terminar com expressões que mostram que a informação foi ouvida ou lida, como そうだ, らしい, ということだ ou とのことだ. Isso deixa claro que quem fala está repassando uma informação, e não dando a própria opinião.

As duas formas têm o mesmo sentido. によれば soa um pouco mais formal.$$,
    $$Sem o final そうだ ou らしい, a frase pode soar incompleta ou como se quem fala estivesse afirmando algo por conta própria.

〜の話によると ("segundo o que fulano disse") é muito comum na conversa.

Em textos acadêmicos, 調査によれば ("segundo a pesquisa") aparece com frequência.$$,
    $$Fonte + によると、 + Informação + そうだ / らしい / ということだ
Fonte + によれば、 + Informação + そうだ / らしい

Fontes comuns: 天気予報 / ニュース / 新聞 / 調査 / 〜の話$$,
    $$によると$$,
    $$によると|によれば$$,
    ARRAY['に', 'よると']::text[],
    ARRAY['によると', 'によれば']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-89', $$天気予報によると、明日は雪だそうです。$$, $$てんきよほうによると、あしたはゆきだそうです。$$, $$Segundo a previsão do tempo, amanhã vai nevar.$$),
    ('n3-grammar-89', $$ニュースによると、昨日大きな地震があったらしい。$$, $$ニュースによると、きのうおおきなじしんがあったらしい。$$, $$De acordo com o noticiário, parece que houve um grande terremoto ontem.$$),
    ('n3-grammar-89', $$先生の話によれば、試験は来週だそうだ。$$, $$せんせいのはなしによれば、しけんはらいしゅうだそうだ。$$, $$Segundo o que o professor disse, a prova é na semana que vem.$$),
    ('n3-grammar-89', $$新聞によると、来月から物価が上がるそうです。$$, $$しんぶんによると、らいげつからぶっかがあがるそうです。$$, $$Segundo o jornal, os preços vão subir a partir do mês que vem.$$),
    ('n3-grammar-89', $$調査によれば、若者の読書量が減っている。$$, $$ちょうさによれば、わかもののどくしょりょうがへっている。$$, $$De acordo com a pesquisa, a quantidade de leitura entre os jovens está diminuindo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$友達の話____、あの店は安いそうだ。$$, $$Segundo o que meu amigo disse, aquela loja é barata.$$),
        (2, $$天気予報____、明日は晴れるそうです。$$, $$Segundo a previsão do tempo, amanhã vai fazer sol.$$),
        (3, $$医者____、手術は必要ないそうです。$$, $$Segundo o médico, a cirurgia não é necessária.$$),
        (4, $$新聞の記事____、事故の原因はスピードの出しすぎだったそうだ。$$, $$Segundo a matéria do jornal, a causa do acidente foi excesso de velocidade.$$),
        (5, $$噂____、二人は結婚するらしい。$$, $$Pelo que dizem por aí, os dois vão se casar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-89', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$によると$$),
        (1, $$によれば$$),
        (2, $$によると$$),
        (2, $$によれば$$),
        (3, $$によると$$),
        (3, $$によれば$$),
        (4, $$によると$$),
        (4, $$によれば$$),
        (5, $$によると$$),
        (5, $$によれば$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
