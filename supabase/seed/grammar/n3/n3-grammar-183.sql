-- n3-grammar-183 — 〜させてもらう・〜させていただく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-183',
    'grammar',
    'N3',
    $$〜させてもらう・〜させていただく$$,
    $$sasete morau / sasete itadaku$$,
    $$Receber permissão para / Permita-me / Com sua licença vou$$,
    $$させてもらう e させていただく são usados para dizer que a pessoa faz algo com a permissão de outra, de forma humilde e educada. Equivalem a "receber permissão para", "permita-me" ou "com sua licença, vou...".

Elas juntam a forma causativa (させる, "deixar fazer") com もらう / いただく (receber). A ideia literal é "recebo de você o favor de me deixar fazer".

させていただく é a forma mais humilde e muito comum em situações formais, como discursos, reuniões, atendimento ao cliente e e-mails. Por exemplo, "então, vou fazer minha apresentação".

Em perguntas, させていただけませんか é uma forma muito educada de pedir permissão: "poderia me deixar pensar um pouco?".

Na fala do dia a dia, entre colegas, させてもらう é suficiente.$$,
    $$Em japonês de negócios, させていただく às vezes é usado em excesso, mesmo quando não há permissão de ninguém envolvida. Muitos japoneses consideram esse excesso artificial.

それでは、始めさせていただきます ("então, com sua licença, vou começar") é muito comum em eventos.

Para pedidos simples, させてください também funciona, mas é menos formal.$$,
    $$Verbo causativo na forma て + もらう / いただく
Verbo causativo て + いただけませんか (pedido educado)
Verbo causativo て + いただきます (anúncio humilde)

Exemplos: 帰る → 帰らせていただく / 考える → 考えさせていただく / 発表する → 発表させていただく$$,
    $$させていただく$$,
    $$させてもら|させていただ|せてもら|せていただ$$,
    ARRAY['させて', 'もらう', 'いただく']::text[],
    ARRAY['させてもらう', 'させていただく', 'させていただけませんか', 'させていただきます']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-183', $$すみません、今日は早く帰らせてもらいます。$$, $$すみません、きょうははやくかえらせてもらいます。$$, $$Com licença, hoje vou embora mais cedo.$$),
    ('n3-grammar-183', $$少し考えさせていただけませんか。$$, $$すこしかんがえさせていただけませんか。$$, $$O senhor poderia me deixar pensar um pouco?$$),
    ('n3-grammar-183', $$先週、先生の研究室を見学させていただきました。$$, $$せんしゅう、せんせいのけんきゅうしつをけんがくさせていただきました。$$, $$Semana passada, tive a oportunidade de visitar o laboratório do professor.$$),
    ('n3-grammar-183', $$この写真を使わせてもらってもいいですか。$$, $$このしゃしんをつかわせてもらってもいいですか。$$, $$Posso usar esta foto?$$),
    ('n3-grammar-183', $$それでは、発表させていただきます。$$, $$それでは、はっぴょうさせていただきます。$$, $$Então, com sua licença, vou fazer minha apresentação.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$体調が悪いので、明日は休ま____いただきたいのですが。$$, $$Não estou bem, então gostaria de faltar amanhã, se possível.$$),
        (2, $$この資料をコピーさ____いただけますか。$$, $$Poderia me permitir copiar este documento?$$),
        (3, $$先週、工場を見学さ____。$$, $$Semana passada, tive a oportunidade de visitar a fábrica.$$),
        (4, $$それでは、一言ご挨拶さ____。$$, $$Então, com sua licença, vou dizer algumas palavras.$$),
        (5, $$旅行中、友達の家に泊まら____。$$, $$Durante a viagem, fiquei hospedado na casa de um amigo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-183', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$せて$$),
        (2, $$せて$$),
        (3, $$せていただきました$$),
        (3, $$せてもらいました$$),
        (4, $$せていただきます$$),
        (5, $$せてもらった$$),
        (5, $$せてもらいました$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
