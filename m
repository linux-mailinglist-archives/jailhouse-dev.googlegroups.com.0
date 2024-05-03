Return-Path: <jailhouse-dev+bncBCP3NJOK7IORBH442SYQMGQEEVXUHLQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D40C8BB0BA
	for <lists+jailhouse-dev@lfdr.de>; Fri,  3 May 2024 18:17:37 +0200 (CEST)
Received: by mail-yb1-xb3e.google.com with SMTP id 3f1490d57ef6-dc691f1f83asf1400905276.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 03 May 2024 09:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1714753056; x=1715357856; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bUV+AztuviIJjzI+f9izZrruG/zyCM4fExvzs94XouQ=;
        b=nnGxyXlvQQ6JHUoLylQ6EXnhdMMZxOY5Gyb81N9nyIsEMTXbDebZoPjZcFb88unqsc
         7lTgKzJ7IhjVR3lvncpUc68e3HxhBRiS1OqRTm0Cw4XbX5IPBbZadge6zgQTDd78qZrq
         fyth6X/QBKNL7YMmP+nLTmqtdT64mzFdU3bit88Vv14CTfc2ykJnsymcTQrPTN7JMHSm
         XGz4TDt4X5Vdj6e/KmYhS1np40L3/dlPdcwc3pEFHZTYspEV8/2xdkkxWvMpveS1vAP8
         XkIu8Nnp3n7n3854Ccl1UtwaUslPHOFWs0B6pZAQKwxgwauCkHwcanZdg8Qt/Qw9fY9H
         3eWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714753056; x=1715357856; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bUV+AztuviIJjzI+f9izZrruG/zyCM4fExvzs94XouQ=;
        b=Jru6I92/TRkzuYP8fX4MI6C2C4KbAJWm/aq3lgta4PGyqZRbOAYpjhX69WhoYJZqgz
         GeIQE5BUBD617Hoz9mbHg6n/ZyKVIqwqP/ZELIoU3ROV4bCMMh3Fj8h8y2rnMaT3a5X+
         M0jLRRxIdABSbQuahqD1YEeGepxLL097P6QSGs4Z0Oxu9rko+63sUY9qt5x/rETJXMfp
         0kS5OPloNMOeKc3CAGC4O4+D5d49LHkHX14Uad0qLi+iwB2ZuHqmXvfHifcgnDPBEFy6
         zEabsLbX3K9gsbCisFFSc/fLIEOz78CB/9LXYZ7ObmkKsOIh7oczRroNfQiXAALzFK1L
         f4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714753056; x=1715357856;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bUV+AztuviIJjzI+f9izZrruG/zyCM4fExvzs94XouQ=;
        b=je6CKJ0lvoO5125La1HYNhsZh7cxjRhQBvxGaGG73Wl1x+UC34bgaFTIQaGNkJ/5D0
         KpideHxBxjKpSobQZeDy+TygjCZPkdT7mAbg5YWjH4Vt0rTmQr5oVrZUSlFmkZ/qFsrs
         JtgHhdEz/Hfh9PLQIQ5qbvSfIStLogRc+zvNTDG1wXFdJGZ7M34uofo0pIIrN09v7Yqg
         q4kVWexosH7SBhaFqDZfSo411OYgCuLbp/IsrAf+3LaLhdzW4BU2e4qbFnd7f0wwoy+j
         nYVY35pR49bUuXZLqG109mFanJfRw6mIG7PKWQIL5bwXEkDbLg312HF2+5FL4JaluExH
         ICHQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCXIJmK1fnhFBBgrOzL+7u9K1PmTDZqqjwh0zQgzRYYgsF/Z6UpPL9oTv9ShblpgTajICm4vJQSeh7Y4hTAOAkBFDBIFid7QSbe9wa4=
X-Gm-Message-State: AOJu0Yw+NJ6FD28OIB/jstWHkI2QBRSCDsy/GccFwapOTprnOUEuKY0a
	m9NGSBNfd3w54sSc+5ABm3ZJRQojMXqBi7xgaxOwCc/jfixY261P
X-Google-Smtp-Source: AGHT+IElk0rpucpME41pYaBZ2wNqfCysk5mfe7x/GpgV8AedAYo7Xgu+wWEFok1buylTygNzXdCNvw==
X-Received: by 2002:a25:250:0:b0:de8:a446:b35c with SMTP id 77-20020a250250000000b00de8a446b35cmr2332518ybc.16.1714753055982;
        Fri, 03 May 2024 09:17:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:c742:0:b0:de5:a004:beb with SMTP id 3f1490d57ef6-de8b54a7fcbls138777276.1.-pod-prod-01-us;
 Fri, 03 May 2024 09:17:34 -0700 (PDT)
X-Received: by 2002:a25:ce4b:0:b0:de5:5304:3206 with SMTP id x72-20020a25ce4b000000b00de553043206mr383747ybe.11.1714753054359;
        Fri, 03 May 2024 09:17:34 -0700 (PDT)
Date: Fri, 3 May 2024 09:17:33 -0700 (PDT)
From: Maxwell Tyler <mt8067953@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <0a720ed1-6623-462c-ad4c-0b57cabe7c29n@googlegroups.com>
In-Reply-To: <aeb5c4c3-f9da-438d-a0fa-02974b4397ean@googlegroups.com>
References: <aeb5c4c3-f9da-438d-a0fa-02974b4397ean@googlegroups.com>
Subject: Re: BUY PSILOCYBE GOLDEN TEACHER MAGIC MUSHROOMS ONLINE IN USA
 TODAY SAFELY
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_68090_556565979.1714753053530"
X-Original-Sender: mt8067953@gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

------=_Part_68090_556565979.1714753053530
Content-Type: multipart/alternative; 
	boundary="----=_Part_68091_317096651.1714753053530"

------=_Part_68091_317096651.1714753053530
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://t.me/Mushies_12 https://t.me/Mushies_12
Golden teachers are one of the best-known strains of the magic mushroom=20
species Psilocybe cubensis. They are renowned for producing huge fruits,=20
even in suboptimal growing conditions. Therefore, they have become a=20
favorite among cultivators and are a mainstay of spore suppliers worldwide.

https://t.me/Mushies_12

https://t.me/Mushies_12

Read on for our complete guide to golden teacher magic mushrooms, including=
=20
their effects, potency, and potential benefits. We will also provide a=20
brief overview of the growing process and explain why they are many=20
mushroom lovers=E2=80=99 go-to strain.

https://t.me/Mushies_12

Golden Teacher Mushrooms https://t.me/Mushies_12
http://t.me/Mushies_12
Golden teachers are one of the best-known strains of the magic mushroom=20
species Psilocybe cubensis. They are renowned for producing huge fruits,=20
even in suboptimal growing conditions. Therefore, they have become a=20
favorite among cultivators and are a mainstay of spore suppliers worldwide.

https://t.me/Mushies_12

Read on for our complete guide to golden teacher magic mushrooms, including=
=20
their effects, potency, and potential benefits. We will also provide a=20
brief overview of the growing process and explain why they are many=20
mushroom lovers=E2=80=99 go-to strain.

https://t.me/Mushies_12

Golden Teacher Effects
Like other cubensis strains, golden teachers=E2=80=99 primary active ingred=
ient is=20
psilocybin. The body breaks this chemical down into psilocin, which acts on=
=20
serotonin receptors to produce its psychedelic effects. It usually takes=20
around 30=E2=80=9360 minutes for the effects to begin, although they can st=
art=20
after as little as 10=E2=80=9320 minutes

https://t.me/Mushies_12

In general, these effects include alterations in mood, sensations, and=20
perception. Some people experience visual effects, such as enhanced colors=
=20
or shifting geometric patterns. However, visual effects are reported less=
=20
frequently with golden teachers than with some other mushroom varieties.=20
Most users describe an insightful and spiritual journey, which aligns with=
=20
the =E2=80=9Cteacher=E2=80=9D part of their name.

https://t.me/Mushies_12

Anecdotal reports suggest that side effects such as anxiety and paranoia=20
rarely occur with golden teachers. Furthermore, some state that the overall=
=20
experience is shorter than average, sometimes lasting just 2=E2=80=934 hour=
s. For=20
these reasons, golden teachers are sometimes considered an ideal choice for=
=20
those new to the world of psychedelics.

https://t.me/Mushies_12

Of course, other factors also play a crucial role, such as one=E2=80=99s mi=
ndset,=20
expectations, and environment. Dosage also has a significant impact on the=
=20
overall experience. Therefore, it is essential to understand golden=20
teachers=E2=80=99 potency and prepare adequately before ingestion.

https://t.me/Mushies_12

Golden Teacher Mushrooms Potency
Mushrooms are a natural product and can vary significantly in potency from=
=20
one specimen to the next. Therefore, it isn=E2=80=99t easy to give an accur=
ate=20
figure.

https://t.me/Mushies_12

However, golden teacher mushrooms=E2=80=99 potency is generally considered =
moderate=20
compared to other cubensis strains. For example, strains like penis envy=20
and tidal wave are known for being much stronge

https://t.me/Mushies_12

In terms of psilocybin content, a 2021 review estimated that 1 gram of=20
dried mushrooms contains approximately 10mg of psilocybin. However, the=20
publication did not specify whether this figure applies to Psilocybe=20
cubensis or another species.

https://t.me/Mushies_12

Golden Teacher Mushrooms Dosage
There is no standard golden teacher mushrooms dosage because everybody=20
responds differently. Also, as we mentioned, there can be significant=20
variations in potency from one mushroom to the next. Myriad factors can=20
also affect the experience, with dosage being just one part of the equation=
.

https://t.me/Mushies_12

Anyone inexperienced with psychedelics should start at the lower end of the=
=20
scale to see how golden teacher mushrooms affect them before increasing in=
=20
dosage

On Thursday, May 2, 2024 at 1:24:11=E2=80=AFAM UTC+1 Justin Baker wrote:

> Golden Teacher mushrooms have a distinct appearance, with a long and=20
> winding, hollow stipe that is quite thicker towards the base. As one woul=
d=20
> expect, they often have a more elegant appearance compared to their
>
> The fruiting bodies have a golden or yellowish-colored center and a=20
> partially covered cap which is often larger=E2=80=94around 3 inches in di=
ameter.=20
> This particular strain also has gills that may vary between white and=20
> purplish brown, making it distinctive.
>
> https://t.me/dannyw23official
>
>
>
> https://t.me/dannyw23official
>
>
>
> https://t.me/dannyw23official
>
>
>
> As with any mushroom, it=E2=80=99s essential to correctly identify a stra=
in before=20
> attempting to collect spores, keep, or consume! When misidentified, they=
=20
> could be mistaken for poisonous fungi. Golden Teacher mushrooms fruit les=
s=20
> compared to other strains, but they also easily grow under optimal=20
> conditions.
>
>
>
> https://t.me/dannyw23official
>
>
>
> According to a Golden Teacher mushrooms strain review, the distinctive=20
> feature of a yellow or gold cap is what=E2=80=99s propelled its identific=
ation=20
> throughout the years. This species was first described in 1906 by Frankli=
n,=20
> found in Cuba, and named Stropharia Cubensis. Almost one year later,=20
> Narcisse Theophile identified it as Naematoloma in Tonkin, Saskatchewan
>
>
>
> https://t.me/dannyw23official
>
>
>
> https://t.me/dannyw23official
>
>
>
> https://t.me/dannyw23official
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0a720ed1-6623-462c-ad4c-0b57cabe7c29n%40googlegroups.com.

------=_Part_68091_317096651.1714753053530
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://t.me/Mushies_12 https://t.me/Mushies_12<br />Golden teachers are on=
e of the best-known strains of the magic mushroom species Psilocybe cubensi=
s. They are renowned for producing huge fruits, even in suboptimal growing =
conditions. Therefore, they have become a favorite among cultivators and ar=
e a mainstay of spore suppliers worldwide.<br /><br />https://t.me/Mushies_=
12<br /><br />https://t.me/Mushies_12<br /><br />Read on for our complete g=
uide to golden teacher magic mushrooms, including their effects, potency, a=
nd potential benefits. We will also provide a brief overview of the growing=
 process and explain why they are many mushroom lovers=E2=80=99 go-to strai=
n.<br /><br />https://t.me/Mushies_12<br /><br />Golden Teacher Mushrooms h=
ttps://t.me/Mushies_12<br />http://t.me/Mushies_12<br />Golden teachers are=
 one of the best-known strains of the magic mushroom species Psilocybe cube=
nsis. They are renowned for producing huge fruits, even in suboptimal growi=
ng conditions. Therefore, they have become a favorite among cultivators and=
 are a mainstay of spore suppliers worldwide.<br /><br />https://t.me/Mushi=
es_12<br /><br />Read on for our complete guide to golden teacher magic mus=
hrooms, including their effects, potency, and potential benefits. We will a=
lso provide a brief overview of the growing process and explain why they ar=
e many mushroom lovers=E2=80=99 go-to strain.<br /><br />https://t.me/Mushi=
es_12<br /><br />Golden Teacher Effects<br />Like other cubensis strains, g=
olden teachers=E2=80=99 primary active ingredient is psilocybin. The body b=
reaks this chemical down into psilocin, which acts on serotonin receptors t=
o produce its psychedelic effects. It usually takes around 30=E2=80=9360 mi=
nutes for the effects to begin, although they can start after as little as =
10=E2=80=9320 minutes<br /><br />https://t.me/Mushies_12<br /><br />In gene=
ral, these effects include alterations in mood, sensations, and perception.=
 Some people experience visual effects, such as enhanced colors or shifting=
 geometric patterns. However, visual effects are reported less frequently w=
ith golden teachers than with some other mushroom varieties. Most users des=
cribe an insightful and spiritual journey, which aligns with the =E2=80=9Ct=
eacher=E2=80=9D part of their name.<br /><br />https://t.me/Mushies_12<br /=
><br />Anecdotal reports suggest that side effects such as anxiety and para=
noia rarely occur with golden teachers. Furthermore, some state that the ov=
erall experience is shorter than average, sometimes lasting just 2=E2=80=93=
4 hours. For these reasons, golden teachers are sometimes considered an ide=
al choice for those new to the world of psychedelics.<br /><br />https://t.=
me/Mushies_12<br /><br />Of course, other factors also play a crucial role,=
 such as one=E2=80=99s mindset, expectations, and environment. Dosage also =
has a significant impact on the overall experience. Therefore, it is essent=
ial to understand golden teachers=E2=80=99 potency and prepare adequately b=
efore ingestion.<br /><br />https://t.me/Mushies_12<br /><br />Golden Teach=
er Mushrooms Potency<br />Mushrooms are a natural product and can vary sign=
ificantly in potency from one specimen to the next. Therefore, it isn=E2=80=
=99t easy to give an accurate figure.<br /><br />https://t.me/Mushies_12<br=
 /><br />However, golden teacher mushrooms=E2=80=99 potency is generally co=
nsidered moderate compared to other cubensis strains. For example, strains =
like penis envy and tidal wave are known for being much stronge<br /><br />=
https://t.me/Mushies_12<br /><br />In terms of psilocybin content, a 2021 r=
eview estimated that 1 gram of dried mushrooms contains approximately 10mg =
of psilocybin. However, the publication did not specify whether this figure=
 applies to Psilocybe cubensis or another species.<br /><br />https://t.me/=
Mushies_12<br /><br />Golden Teacher Mushrooms Dosage<br />There is no stan=
dard golden teacher mushrooms dosage because everybody responds differently=
. Also, as we mentioned, there can be significant variations in potency fro=
m one mushroom to the next. Myriad factors can also affect the experience, =
with dosage being just one part of the equation.<br /><br />https://t.me/Mu=
shies_12<br /><br />Anyone inexperienced with psychedelics should start at =
the lower end of the scale to see how golden teacher mushrooms affect them =
before increasing in dosage<br /><br /><div class=3D"gmail_quote"><div dir=
=3D"auto" class=3D"gmail_attr">On Thursday, May 2, 2024 at 1:24:11=E2=80=AF=
AM UTC+1 Justin Baker wrote:<br/></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padd=
ing-left: 1ex;">Golden Teacher mushrooms have a distinct appearance, with a=
 long and winding, hollow stipe that is quite thicker towards the base. As =
one would expect, they often have a more elegant appearance compared to the=
ir<br><br>The fruiting bodies have a golden or yellowish-colored center and=
 a partially covered cap which is often larger=E2=80=94around 3 inches in d=
iameter. This particular strain also has gills that may vary between white =
and purplish brown, making it distinctive.<br><br><a href=3D"https://t.me/d=
annyw23official" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D=
"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/dannyw23official&a=
mp;source=3Dgmail&amp;ust=3D1714839433215000&amp;usg=3DAOvVaw0qi9RKPks5JraQ=
xpAwc7jU">https://t.me/dannyw23official</a><br><br><br><br><a href=3D"https=
://t.me/dannyw23official" target=3D"_blank" rel=3D"nofollow" data-saferedir=
ecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/dannyw23o=
fficial&amp;source=3Dgmail&amp;ust=3D1714839433215000&amp;usg=3DAOvVaw0qi9R=
KPks5JraQxpAwc7jU">https://t.me/dannyw23official</a><br><br><br><br><a href=
=3D"https://t.me/dannyw23official" target=3D"_blank" rel=3D"nofollow" data-=
saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/=
dannyw23official&amp;source=3Dgmail&amp;ust=3D1714839433215000&amp;usg=3DAO=
vVaw0qi9RKPks5JraQxpAwc7jU">https://t.me/dannyw23official</a><br><br><br><b=
r>As with any mushroom, it=E2=80=99s essential to correctly identify a stra=
in before attempting to collect spores, keep, or consume! When misidentifie=
d, they could be mistaken for poisonous fungi. Golden Teacher mushrooms fru=
it less compared to other strains, but they also easily grow under optimal =
conditions.<br><br><br><br><a href=3D"https://t.me/dannyw23official" target=
=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com=
/url?hl=3Den&amp;q=3Dhttps://t.me/dannyw23official&amp;source=3Dgmail&amp;u=
st=3D1714839433215000&amp;usg=3DAOvVaw0qi9RKPks5JraQxpAwc7jU">https://t.me/=
dannyw23official</a><br><br><br><br>According to a Golden Teacher mushrooms=
 strain review, the distinctive feature of a yellow or gold cap is what=E2=
=80=99s propelled its identification throughout the years. This species was=
 first described in 1906 by Franklin, found in Cuba, and named Stropharia C=
ubensis. Almost one year later, Narcisse Theophile identified it as Naemato=
loma in Tonkin, Saskatchewan<br><br><br><br><a href=3D"https://t.me/dannyw2=
3official" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https=
://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/dannyw23official&amp;sou=
rce=3Dgmail&amp;ust=3D1714839433215000&amp;usg=3DAOvVaw0qi9RKPks5JraQxpAwc7=
jU">https://t.me/dannyw23official</a><br><br><br><br><a href=3D"https://t.m=
e/dannyw23official" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/dannyw23officia=
l&amp;source=3Dgmail&amp;ust=3D1714839433215000&amp;usg=3DAOvVaw0qi9RKPks5J=
raQxpAwc7jU">https://t.me/dannyw23official</a><br><br><br><br><a href=3D"ht=
tps://t.me/dannyw23official" target=3D"_blank" rel=3D"nofollow" data-safere=
directurl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/dannyw=
23official&amp;source=3Dgmail&amp;ust=3D1714839433215000&amp;usg=3DAOvVaw0q=
i9RKPks5JraQxpAwc7jU">https://t.me/dannyw23official</a><br></blockquote></d=
iv>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0a720ed1-6623-462c-ad4c-0b57cabe7c29n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/0a720ed1-6623-462c-ad4c-0b57cabe7c29n%40googlegroups.co=
m</a>.<br />

------=_Part_68091_317096651.1714753053530--

------=_Part_68090_556565979.1714753053530--
