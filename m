Return-Path: <jailhouse-dev+bncBDHL5ROYQ4LRBIP6SWZQMGQEGKWDC4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3f.google.com (mail-yb1-xb3f.google.com [IPv6:2607:f8b0:4864:20::b3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CB690157D
	for <lists+jailhouse-dev@lfdr.de>; Sun,  9 Jun 2024 12:08:35 +0200 (CEST)
Received: by mail-yb1-xb3f.google.com with SMTP id 3f1490d57ef6-dfb0aee1e18sf2413097276.3
        for <lists+jailhouse-dev@lfdr.de>; Sun, 09 Jun 2024 03:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717927714; x=1718532514; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uL9b2gbO7xVl8rPa8xgrjqx1+NNFFp8UOUo0s/NCpOw=;
        b=dWOTsqYmwOIClAFRypHvnjFBXFPdLPtEk9LLIYeq+fquOWTV7cbpJ0WNNJ0An8xQb+
         oDb/Slxpr/zygZpujZXda9OAznaGh3EHAL/O3f94ONCeWvaBCsNOfq7Xx4DDhNEmV5Zf
         F1zd1Cukb1BFGYA18y5q8ldPdJamD1Nhe1JkyixmNJds7gqWqPgswVUtuYays19o0Emj
         XEHCEmxcuSGEGe7rHTDYa8r+bwfs4LhI7vAjJSeFp1TxFMMdQ0heN6WXJr1XZnEh6WOf
         T9EBOFLN6ydbyCXfgYjOj1s/7fjR0Kdxld+fIYH4FolkTCq0ZkCJvQR0KpdKIEMW0ut3
         I+wA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717927714; x=1718532514; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uL9b2gbO7xVl8rPa8xgrjqx1+NNFFp8UOUo0s/NCpOw=;
        b=Lv4Oiqj710u34NVCuJihjAqS3tM1vGOf5Q9r5c8K82KP2OzGWKsb06wusoiLJTMjXb
         nZXsikyjPcOYY5mcM0/ZJmP8FIG8ZxM9/j9jx3d9kc5vJjoyR6QoymzepvMDJ1dK6Ab+
         byIqM3PC2Mt0gIy0/Nt2wCogVHNoeqeAO6ia0dyMXAkGO4uCPrcoiWiQXpg3Z1JA1KFe
         ghFuTUdcdbxOvXwh0wHaT6JWn0oxHmzVBF90GeiN/95oC0meXinUu4XJ68x+Kq/G2mHA
         z7APjLd3SqYU1pbiyJoou6LLNpYiwcpWwizbEce8DwnOqTu4hM1zTxAPqsyqkoMWFT32
         uBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717927714; x=1718532514;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uL9b2gbO7xVl8rPa8xgrjqx1+NNFFp8UOUo0s/NCpOw=;
        b=It5C5EoqRgLtWkgmzs2To0rAIcoz+7IPNLcRGiPZVTSxKC2QCDR9jp8LiVSJU5jyQh
         X5V2RIF0NuQ0jK9skayKI4qYiCwEVOI3lGUOdBBMP3PXzE7R1oEC9oqNZfKszQNEx6bZ
         Bwi86UKHr6265v0tHbnJhBEDZtu9CzCaGIW6g0aiI6Ya0om8s7H5NfPy0IO3jRY7Tujd
         sXb7Ca+kPk/j3pEXgOUMkp+iGxSXS66wFvyos6II7uR28dxDbsxX6NbwNsMtZDsXbxsQ
         lQn3afg79R0o8MC+xXtqcJ/RnRM5ftoorXHSkQ1mI80pllbk8d13/OK71sHHQJY96R2B
         HkeQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCXU2xynruA38uYjfJaM/NBKtAZfn6G2UEtuYDuA4BShJpT8oh7AorzL4qLqUFX0BXJztbzing8E5voxnZ/U2TLBhPbTS5lEoy8vIjk=
X-Gm-Message-State: AOJu0Yyh+SfE9O8iOaH+zNu4vnJUF/3w0V0yRd4qbAKq8DBM8CV8dQ58
	Z9GIR+uEIkN0Aw9XKhI3N/sNUZlfD0kL6EiJPcv3sPFEjndINy28
X-Google-Smtp-Source: AGHT+IE1zH8WVZBgXn5Aapg1/Khnmq+xDXVw/1gXsD9z/AcH8nyDNLGY7mMp5qeJanm/tK7YOCtc5A==
X-Received: by 2002:a25:db90:0:b0:df4:d7e2:aa2f with SMTP id 3f1490d57ef6-dfaf667ed0fmr6402437276.59.1717927714306;
        Sun, 09 Jun 2024 03:08:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:2f4a:0:b0:dfb:3d7:1f4c with SMTP id 3f1490d57ef6-dfb03d722edls2344672276.1.-pod-prod-04-us;
 Sun, 09 Jun 2024 03:08:33 -0700 (PDT)
X-Received: by 2002:a05:6902:729:b0:dfb:1147:cbb3 with SMTP id 3f1490d57ef6-dfb1147ced0mr317369276.1.1717927712609;
        Sun, 09 Jun 2024 03:08:32 -0700 (PDT)
Date: Sun, 9 Jun 2024 03:08:31 -0700 (PDT)
From: Hassan Mefire <mefirehassan00@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <1c7591d4-e97a-49c3-bc11-538c2b3d1719n@googlegroups.com>
In-Reply-To: <35e3e9a1-c599-4570-b9a7-a97b9fd74813n@googlegroups.com>
References: <00efaad9-c84e-4a0f-b16e-512d1351ca2c@googlegroups.com>
 <b233e3c5-c126-4ff1-a109-8d2862e939ee@googlegroups.com>
 <aa79214c-06f5-482d-9b3a-18cdfd9a1909n@googlegroups.com>
 <5ac62ff7-670a-40a2-9271-700b1f8d7f86n@googlegroups.com>
 <59e205f7-8706-442a-a5ba-65dba773eabfn@googlegroups.com>
 <cfa7782b-6db4-4434-9d24-aadbee870488n@googlegroups.com>
 <35e3e9a1-c599-4570-b9a7-a97b9fd74813n@googlegroups.com>
Subject: Re: Buy Psilocybin Gummies - Mushroom Gummy Cubes 3.5g online | Buy
 Psilocybin Gummies 100% Fast And Discreet Shipping Worldwide
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_173956_1715884879.1717927711471"
X-Original-Sender: mefirehassan00@gmail.com
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

------=_Part_173956_1715884879.1717927711471
Content-Type: multipart/alternative; 
	boundary="----=_Part_173957_1867715213.1717927711471"

------=_Part_173957_1867715213.1717927711471
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://t.me/psystoreoeg
https://t.me/psystoreoeg
Golden teachers are one of the best-known strains of the magic mushroom=20
species Psilocybe cubensis. They are renowned for producing huge fruits,=20
even in suboptimal growing conditions. Therefore, they have become a=20
favorite among cultivators and are a mainstay of spore suppliers worldwide.

https://t.me/psystoreoeg

https://t.me/psystoreoeg

Read on for our complete guide to golden teacher magic mushrooms, including=
=20
their effects, potency, and potential benefits. We will also provide a=20
brief overview of the growing process and explain why they are many=20
mushroom lovers=E2=80=99 go-to strain.

https://t.me/psystoreoeg

Golden Teacher Mushrooms https://t.me/psystoreoeg
https://t.me/psystoreoeg
Golden teachers are one of the best-known strains of the magic mushroom=20
species Psilocybe cubensis. They are renowned for producing huge fruits,=20
even in suboptimal growing conditions. Therefore, they have become a=20
favorite among cultivators and are a mainstay of spore suppliers worldwide.

https://t.me/psystoreoeg

Read on for our complete guide to golden teacher magic mushrooms, including=
=20
their effects, potency, and potential benefits. We will also provide a=20
brief overview of the growing process and explain why they are many=20
mushroom lovers=E2=80=99 go-to strain.

https://t.me/psystoreoeg

Golden Teacher Effects
Like other cubensis strains, golden teachers=E2=80=99 primary active ingred=
ient is=20
psilocybin. The body breaks this chemical down into psilocin, which acts on=
=20
serotonin receptors to produce its psychedelic effects. It usually takes=20
around 30=E2=80=9360 minutes for the effects to begin, although they can st=
art=20
after as little as 10=E2=80=9320 minutes

https://t.me/psystoreoeg

In general, these effects include alterations in mood, sensations, and=20
perception. Some people experience visual effects, such as enhanced colors=
=20
or shifting geometric patterns. However, visual effects are reported less=
=20
frequently with golden teachers than with some other mushroom varieties.=20
Most users describe an insightful and spiritual journey, which aligns with=
=20
the =E2=80=9Cteacher=E2=80=9D part of their name.

https://t.me/psystoreoeg

Anecdotal reports suggest that side effects such as anxiety and paranoia=20
rarely occur with golden teachers. Furthermore, some state that the overall=
=20
experience is shorter than average, sometimes lasting just 2=E2=80=934 hour=
s. For=20
these reasons, golden teachers are sometimes considered an ideal choice for=
=20
those new to the world of psychedelics.

https://t.me/psystoreoeg

Of course, other factors also play a crucial role, such as one=E2=80=99s mi=
ndset,=20
expectations, and environment. Dosage also has a significant impact on the=
=20
overall experience. Therefore, it is essential to understand golden=20
teachers=E2=80=99 potency and prepare adequately before ingestion.

https://t.me/psystoreoeg

Golden Teacher Mushrooms Potency
Mushrooms are a natural product and can vary significantly in potency from=
=20
one specimen to the next. Therefore, it isn=E2=80=99t easy to give an accur=
ate=20
figure.

https://t.me/psystoreoeg

However, golden teacher mushrooms=E2=80=99 potency is generally considered =
moderate=20
compared to other cubensis strains. For example, strains like penis envy=20
and tidal wave are known for being much stronge

https://t.me/psystoreoeg

In terms of psilocybin content, a 2021 review estimated that 1 gram of=20
dried mushrooms contains approximately 10mg of psilocybin. However, the=20
publication did not specify whether this figure applies to Psilocybe=20
cubensis or another species.

https://t.me/psystoreoeg

Golden Teacher Mushrooms Dosage
There is no standard golden teacher mushrooms dosage because everybody=20
responds differently. Also, as we mentioned, there can be significant=20
variations in potency from one mushroom to the next. Myriad factors can=20
also affect the experience, with dosage being just one part of the equation=
.

https://t.me/psystoreoeg


Anyone inexperienced with psychedelics should start at the lower end of the=
=20
scale to see how golden teacher mushrooms affect them before increasing in=
=20
dosage

Le dimanche 9 juin 2024 =C3=A0 01:12:10 UTC+1, Asah Randy a =C3=A9crit :

>
> https://t.me/motionking_caliweed_psychedelics
> Recommended dosage: 3 =E2=80=93 4 g. dried mushrooms =E2=80=93 Strong hal=
lucinations take=20
> over: a psychedelic flood of shapes, contours and colors will blend=20
> together and hit the shores of your consciousness. There=E2=80=99s no sto=
pping the=20
> waves in Level 4. There will be some moments when you will lose touch=20
> reality. Random, non-existent objects will appear and the concept of time=
=20
> will fade away to the background. Intriguing to some, scary to others, th=
is=20
> is the level where psychedelics can really be powerful, life-altering and=
=20
> mind expanding. Keep in mind that this dosage is only recommend for=20
> experience users.
> Level 5
>
> https://t.me/motionking_caliweed_psychedelics
> https://t.me/motionking_caliweed_psychedelics
> https://t.me/motionking_caliweed_psychedelics
> On Sunday, June 9, 2024 at 1:10:20=E2=80=AFAM UTC+1 Asah Randy wrote:
>
>> https://t.me/motionking_caliweed_psychedelics
>>
>> https://t.me/motionking_caliweed_psychedelics
>> Penis Envy magic mushrooms are three times more potent than other=20
>> mushrooms. The effects of Penis Envy magic mushrooms may come on quickly=
=20
>> due to higher levels of psilocin than psilocybin.
>> About Penis Envy
>> Penis Envy magic mushrooms can impact you differently based upon a=20
>> variety of factors, like your size, weight, your state of health, whethe=
r=20
>> you have taken them before, the amount you take, and more. The setting i=
n=20
>> which you are taking them and who you are with are critical factors. Bei=
ng=20
>> in nature, in a safe, calm and tranquil setting, with no pending pressur=
es=20
>> or obligations is ideal for the user.=20
>>
>> Trip Level 0: Microdosing
>> Recommended dosage: 0.2 =E2=80=93 0.5 g. dried mushrooms =E2=80=93 A mic=
ro-dose is a=20
>> sub-perceptual amount of mushrooms. Take this every 2-3 days to boost=20
>> creativity or feel less anxious. Microdosing trip levels capsules. Added=
 as=20
>> level 0, it=E2=80=99s meant to be taken along with your day-to-day routi=
ne.
>> Trip Level 1: Happy go lucky
>> Recommended dosage: 0.8 =E2=80=93 1 g. dried mushrooms =E2=80=93 The eff=
ects are mild and=20
>> similar to being high on weed. Music starts to feel better, strangers se=
em=20
>> more friendly and the mind is able to lose some control. You could have=
=20
>> mild visual enhancements or some sound distortion, but these will be sub=
tle.
>> Trip Level 2: Beginner=E2=80=99s paradise
>> Recommended dosage: 1 =E2=80=93 1.5 g. dried mushrooms =E2=80=93 Consist=
ent sensorial=20
>> accentuation, colors becoming brighter and a light body high. Level 2 ca=
n=20
>> be a more intense form of Trip Level 1, but with the right dosage it can=
 be=20
>> something more. Be prepared for the beginnings of visual and auditory=20
>> hallucinations: objects moving and coming to life along with geometrical=
=20
>> forms when you close your eyes. It will be harder to concentrate and=20
>> communicate and you will notice an increase in creativity along with an=
=20
>> enhanced sensation, lightness and euphoria.
>> Trip Level 3: Classic psychedelic trip
>> Recommended dosage: 1.5 =E2=80=93 3 g. dried mushrooms =E2=80=93 Trip Le=
vel 3 is great=20
>> for beginners who want to jump in the =E2=80=9Creal=E2=80=9D psychedelic=
 experience,=20
>> without overdoing the dosage. This level is where visual hallucinations=
=20
>> along with the appearance of patterns and fractals will be evident. No m=
ore=20
>> hinting or subtle flashes of visuals, it=E2=80=99s happening for real. T=
he surface=20
>> of the object you=E2=80=99re observing will become shiny and moving, as =
your field=20
>> of depth is altered. Distortions in the aptitude to measure the passage =
of=20
>> time, might cause an 1 hour to feel like an eternity.
>> Level 4: Flying with the stars https:
>> https://t.me/motionking_caliweed_psychedelics
>>
>> https://t.me/motionking_caliweed_psychedelics
>> On Monday, June 3, 2024 at 4:10:23=E2=80=AFAM UTC+1 Asah Randy wrote:
>>
>>> https://t.me/motionking_caliweed_psychedelics
>>>
>>> Penis Envy magic mushrooms are three times more potent than other=20
>>> mushrooms. The effects of Penis Envy magic mushrooms may come on quickl=
y=20
>>> due to higher levels of psilocin than psilocybin.
>>> About Penis Envy
>>> Penis Envy magic mushrooms can impact you differently based upon a=20
>>> variety of factors, like your size, weight, your state of health, wheth=
er=20
>>> you have taken them before, the amount you take, and more. The setting =
in=20
>>> which you are taking them and who you are with are critical factors. Be=
ing=20
>>> in nature, in a safe, calm and tranquil setting, with no pending pressu=
res=20
>>> or obligations is ideal for the user.=20
>>>
>>> Trip Level 0: Microdosing
>>> Recommended dosage: 0.2 =E2=80=93 0.5 g. dried mushrooms =E2=80=93 A mi=
cro-dose is a=20
>>> sub-perceptual amount of mushrooms. Take this every 2-3 days to boost=
=20
>>> creativity or feel less anxious. Microdosing trip levels capsules. Adde=
d as=20
>>> level 0, it=E2=80=99s meant to be taken along with your day-to-day rout=
ine.
>>> Trip Level 1: Happy go lucky
>>> Recommended dosage: 0.8 =E2=80=93 1 g. dried mushrooms =E2=80=93 The ef=
fects are mild=20
>>> and similar to being high on weed. Music starts to feel better, strange=
rs=20
>>> seem more friendly and the mind is able to lose some control. You could=
=20
>>> have mild visual enhancements or some sound distortion, but these will =
be=20
>>> subtle.
>>> Trip Level 2: Beginner=E2=80=99s paradise
>>> Recommended dosage: 1 =E2=80=93 1.5 g. dried mushrooms =E2=80=93 Consis=
tent sensorial=20
>>> accentuation, colors becoming brighter and a light body high. Level 2 c=
an=20
>>> be a more intense form of Trip Level 1, but with the right dosage it ca=
n be=20
>>> something more. Be prepared for the beginnings of visual and auditory=
=20
>>> hallucinations: objects moving and coming to life along with geometrica=
l=20
>>> forms when you close your eyes. It will be harder to concentrate and=20
>>> communicate and you will notice an increase in creativity along with an=
=20
>>> enhanced sensation, lightness and euphoria.
>>> Trip Level 3: Classic psychedelic trip
>>> Recommended dosage: 1.5 =E2=80=93 3 g. dried mushrooms =E2=80=93 Trip L=
evel 3 is great=20
>>> for beginners who want to jump in the =E2=80=9Creal=E2=80=9D psychedeli=
c experience,=20
>>> without overdoing the dosage. This level is where visual hallucinations=
=20
>>> along with the appearance of patterns and fractals will be evident. No =
more=20
>>> hinting or subtle flashes of visuals, it=E2=80=99s happening for real. =
The surface=20
>>> of the object you=E2=80=99re observing will become shiny and moving, as=
 your field=20
>>> of depth is altered. Distortions in the aptitude to measure the passage=
 of=20
>>> time, might cause an 1 hour to feel like an eternity.
>>> Level 4: Flying with the stars https:
>>> https://t.me/motionking_caliweed_psychedelics
>>>
>>> Recommended dosage: 3 =E2=80=93 4 g. dried mushrooms =E2=80=93 Strong h=
allucinations=20
>>> take over: a psychedelic flood of shapes, contours and colors will blen=
d=20
>>> together and hit the shores of your consciousness. There=E2=80=99s no s=
topping the=20
>>> waves in Level 4. There will be some moments when you will lose touch=
=20
>>> reality. Random, non-existent objects will appear and the concept of ti=
me=20
>>> will fade away to the background. Intriguing to some, scary to others, =
this=20
>>> is the level where psychedelics can really be powerful, life-altering a=
nd=20
>>> mind expanding. Keep in mind that this dosage is only recommend for=20
>>> experience users.
>>> Level 5
>>>
>>> https://t.me/motionking_caliweed_psychedelics
>>>
>>> On Monday, June 3, 2024 at 4:06:43=E2=80=AFAM UTC+1 Asah Randy wrote:
>>>
>>>>
>>>>
>>>> =EE=A2=99
>>>> 17 of 3504
>>>> =EE=90=88
>>>> =EE=90=89
>>>> 4
>>>>
>>>> Skip to first unread message
>>>> =EE=A5=84
>>>> unread,
>>>> Jun 27, 2018, 5:33:04=E2=80=AFPM=EE=97=94
>>>> https://t.me/motionking_caliweed_psychedelics
>>>>
>>>> i'm trying to make jailhouse work on my ZCU102 v1.0 (production)
>>>> using petalinux 2017.4 following this documentation :
>>>>
>>>> https://t.me/motionking_caliweed_psychedelics
>>>>
>>>>
>>>> the second uart doesn't work. After a question on the Xilinx forum
>>>>
>>>> https://t.me/motionking_caliweed_psychedelics
>>>>
>>>> i can activate /dev/ttyPS1 on the zcu102 and verify it using
>>>>
>>>> echo hello > /dev/ttyPS1
>>>>
>>>> but i still can't use it with jailhouse.
>>>>
>>>>
>>>> i have checked with the gic-demo and linux-demo without any success.
>>>> i can use the debug console with gic-demo, but that's all.
>>>>
>>>> this command should work, but it doesn't :
>>>>
>>>> jailhouse cell linux zynqmp-zcu102-linux-demo.cell Image -d=20
>>>> inmate-zynqmp-zcu102.dtb -i rootfs.cpio -c "console=3DttyPS1,115200"
>>>>
>>>>
>>>> in the zynqmp-zcu102-linux-demo.c file, the uart address is correct :
>>>>
>>>> .mem_regions =3D {
>>>> /* UART */ {
>>>> .phys_start =3D 0xff010000,
>>>> .virt_start =3D 0xff010000,
>>>> .size =3D 0x1000,
>>>> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>>> JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED
>>>> https://t.me/motionking_caliweed_psychedelics
>>>> On Saturday, June 1, 2024 at 9:26:29=E2=80=AFAM UTC+1 Dwayne Mickey wr=
ote:
>>>>
>>>>> Penis Envy magic mushrooms are three times more potent than other=20
>>>>> mushrooms. The effects of Penis Envy magic mushrooms may come on quic=
kly=20
>>>>> due to higher levels of psilocin than psilocybin.
>>>>> About Penis Envy
>>>>> Penis Envy magic mushrooms can impact you differently based upon a=20
>>>>> variety of factors, like your size, weight, your state of health, whe=
ther=20
>>>>> you have taken them before, the amount you take, and more. The settin=
g in=20
>>>>> which you are taking them and who you are with are critical factors. =
Being=20
>>>>> in nature, in a safe, calm and tranquil setting, with no pending pres=
sures=20
>>>>> or obligations is ideal for the user.=20
>>>>>
>>>>> Trip Level 0: Microdosing
>>>>> Recommended dosage: 0.2 =E2=80=93 0.5 g. dried mushrooms =E2=80=93 A =
micro-dose is a=20
>>>>> sub-perceptual amount of mushrooms. Take this every 2-3 days to boost=
=20
>>>>> creativity or feel less anxious. Microdosing trip levels capsules. Ad=
ded as=20
>>>>> level 0, it=E2=80=99s meant to be taken along with your day-to-day ro=
utine.
>>>>> Trip Level 1: Happy go lucky
>>>>> Recommended dosage: 0.8 =E2=80=93 1 g. dried mushrooms =E2=80=93 The =
effects are mild=20
>>>>> and similar to being high on weed. Music starts to feel better, stran=
gers=20
>>>>> seem more friendly and the mind is able to lose some control. You cou=
ld=20
>>>>> have mild visual enhancements or some sound distortion, but these wil=
l be=20
>>>>> subtle.
>>>>> Trip Level 2: Beginner=E2=80=99s paradise
>>>>> Recommended dosage: 1 =E2=80=93 1.5 g. dried mushrooms =E2=80=93 Cons=
istent sensorial=20
>>>>> accentuation, colors becoming brighter and a light body high. Level 2=
 can=20
>>>>> be a more intense form of Trip Level 1, but with the right dosage it =
can be=20
>>>>> something more. Be prepared for the beginnings of visual and auditory=
=20
>>>>> hallucinations: objects moving and coming to life along with geometri=
cal=20
>>>>> forms when you close your eyes. It will be harder to concentrate and=
=20
>>>>> communicate and you will notice an increase in creativity along with =
an=20
>>>>> enhanced sensation, lightness and euphoria.
>>>>> Trip Level 3: Classic psychedelic trip
>>>>> Recommended dosage: 1.5 =E2=80=93 3 g. dried mushrooms =E2=80=93 Trip=
 Level 3 is great=20
>>>>> for beginners who want to jump in the =E2=80=9Creal=E2=80=9D psychede=
lic experience,=20
>>>>> without overdoing the dosage. This level is where visual hallucinatio=
ns=20
>>>>> along with the appearance of patterns and fractals will be evident. N=
o more=20
>>>>> hinting or subtle flashes of visuals, it=E2=80=99s happening for real=
. The surface=20
>>>>> of the object you=E2=80=99re observing will become shiny and moving, =
as your field=20
>>>>> of depth is altered. Distortions in the aptitude to measure the passa=
ge of=20
>>>>> time, might cause an 1 hour to feel like an eternity.
>>>>> Level 4: Flying with the stars https:t.me/Ricko_swavy8
>>>>> Recommended dosage: 3 =E2=80=93 4 g. dried mushrooms =E2=80=93 Strong=
 hallucinations=20
>>>>> take over: a psychedelic flood of shapes, contours and colors will bl=
end=20
>>>>> together and hit the shores of your consciousness. There=E2=80=99s no=
 stopping the=20
>>>>> waves in Level 4. There will be some moments when you will lose touch=
=20
>>>>> reality. Random, non-existent objects will appear and the concept of =
time=20
>>>>> will fade away to the background. Intriguing to some, scary to others=
, this=20
>>>>> is the level where psychedelics can really be powerful, life-altering=
 and=20
>>>>> mind expanding. Keep in mind that this dosage is only recommend for=
=20
>>>>> experience users.
>>>>> Level 5
>>>>> :https:t.me/Ricko_swavy8
>>>>>
>>>>> On Thursday, June 28, 2018 at 12:49:45=E2=80=AFPM UTC+1=20
>>>>> christophe...@gmail.com wrote:
>>>>>
>>>>>> hi all,
>>>>>>
>>>>>> now i can see the output of the console and monitor the linux boot.
>>>>>> And of course, linux doesn't boot and stop with a kernel panic :=20
>>>>>>
>>>>>> [ 9.148409] NET: Registered protocol family 1
>>>>>> [ 9.200596] RPC: Registered named UNIX socket transport module.
>>>>>> [ 9.271265] RPC: Registered udp transport module.
>>>>>> [ 9.327501] RPC: Registered tcp transport module.
>>>>>> [ 9.383752] RPC: Registered tcp NFSv4.1 backchannel transport module=
.
>>>>>> [ 9.814860] Kernel panic - not syncing: write error
>>>>>> [ 9.872207] CPU: 0 PID: 1 Comm: swapper/0 Not tainted=20
>>>>>> 4.9.0-xilinx-v2017.4 #2
>>>>>> [ 9.957622] Hardware name: Jailhouse cell on ZynqMP ZCU102 (DT)
>>>>>> [ 10.028458] Call trace:
>>>>>> [ 10.057635] [<ffffff8008088138>] dump_backtrace+0x0/0x198
>>>>>> [ 10.122215] [<ffffff80080882e4>] show_stack+0x14/0x20
>>>>>> [ 10.182634] [<ffffff80083de594>] dump_stack+0x94/0xb8
>>>>>> [ 10.243054] [<ffffff800812e9f8>] panic+0x114/0x25c
>>>>>> [ 10.300347] [<ffffff8008cc2d8c>] populate_rootfs+0x40/0x110
>>>>>> [ 10.367014] [<ffffff80080830b8>] do_one_initcall+0x38/0x128
>>>>>> [ 10.433683] [<ffffff8008cc0c94>] kernel_init_freeable+0x140/0x1e0
>>>>>> [ 10.506604] [<ffffff80089494e0>] kernel_init+0x10/0x100
>>>>>> [ 10.569104] [<ffffff8008082e80>] ret_from_fork+0x10/0x50
>>>>>> [ 10.632647] SMP: stopping secondary CPUs
>>>>>> [ 10.679537] ---[ end Kernel panic - not syncing: write error
>>>>>>
>>>>>> i can see a write error, but i don't know why.
>>>>>> i have attached the boot log file.
>>>>>>
>>>>>> Any hints ?
>>>>>>
>>>>>> Regards=20
>>>>>> C.Alexandre=20
>>>>>>
>>>>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1c7591d4-e97a-49c3-bc11-538c2b3d1719n%40googlegroups.com.

------=_Part_173957_1867715213.1717927711471
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://t.me/psystoreoeg<div>https://t.me/psystoreoeg</div><div>Golden teac=
hers are one of the best-known strains of the magic mushroom species Psiloc=
ybe cubensis. They are renowned for producing huge fruits, even in suboptim=
al growing conditions. Therefore, they have become a favorite among cultiva=
tors and are a mainstay of spore suppliers worldwide.</div><div><br /></div=
><div>https://t.me/psystoreoeg</div><div><br /></div><div>https://t.me/psys=
toreoeg</div><div><br /></div><div>Read on for our complete guide to golden=
 teacher magic mushrooms, including their effects, potency, and potential b=
enefits. We will also provide a brief overview of the growing process and e=
xplain why they are many mushroom lovers=E2=80=99 go-to strain.</div><div><=
br /></div><div>https://t.me/psystoreoeg</div><div><br /></div><div>Golden =
Teacher Mushrooms https://t.me/psystoreoeg</div><div>https://t.me/psystoreo=
eg</div><div>Golden teachers are one of the best-known strains of the magic=
 mushroom species Psilocybe cubensis. They are renowned for producing huge =
fruits, even in suboptimal growing conditions. Therefore, they have become =
a favorite among cultivators and are a mainstay of spore suppliers worldwid=
e.</div><div><br /></div><div>https://t.me/psystoreoeg</div><div><br /></di=
v><div>Read on for our complete guide to golden teacher magic mushrooms, in=
cluding their effects, potency, and potential benefits. We will also provid=
e a brief overview of the growing process and explain why they are many mus=
hroom lovers=E2=80=99 go-to strain.</div><div><br /></div><div>https://t.me=
/psystoreoeg</div><div><br /></div><div>Golden Teacher Effects</div><div>Li=
ke other cubensis strains, golden teachers=E2=80=99 primary active ingredie=
nt is psilocybin. The body breaks this chemical down into psilocin, which a=
cts on serotonin receptors to produce its psychedelic effects. It usually t=
akes around 30=E2=80=9360 minutes for the effects to begin, although they c=
an start after as little as 10=E2=80=9320 minutes</div><div><br /></div><di=
v>https://t.me/psystoreoeg</div><div><br /></div><div>In general, these eff=
ects include alterations in mood, sensations, and perception. Some people e=
xperience visual effects, such as enhanced colors or shifting geometric pat=
terns. However, visual effects are reported less frequently with golden tea=
chers than with some other mushroom varieties. Most users describe an insig=
htful and spiritual journey, which aligns with the =E2=80=9Cteacher=E2=80=
=9D part of their name.</div><div><br /></div><div>https://t.me/psystoreoeg=
</div><div><br /></div><div>Anecdotal reports suggest that side effects suc=
h as anxiety and paranoia rarely occur with golden teachers. Furthermore, s=
ome state that the overall experience is shorter than average, sometimes la=
sting just 2=E2=80=934 hours. For these reasons, golden teachers are someti=
mes considered an ideal choice for those new to the world of psychedelics.<=
/div><div><br /></div><div>https://t.me/psystoreoeg</div><div><br /></div><=
div>Of course, other factors also play a crucial role, such as one=E2=80=99=
s mindset, expectations, and environment. Dosage also has a significant imp=
act on the overall experience. Therefore, it is essential to understand gol=
den teachers=E2=80=99 potency and prepare adequately before ingestion.</div=
><div><br /></div><div>https://t.me/psystoreoeg</div><div><br /></div><div>=
Golden Teacher Mushrooms Potency</div><div>Mushrooms are a natural product =
and can vary significantly in potency from one specimen to the next. Theref=
ore, it isn=E2=80=99t easy to give an accurate figure.</div><div><br /></di=
v><div>https://t.me/psystoreoeg</div><div><br /></div><div>However, golden =
teacher mushrooms=E2=80=99 potency is generally considered moderate compare=
d to other cubensis strains. For example, strains like penis envy and tidal=
 wave are known for being much stronge</div><div><br /></div><div>https://t=
.me/psystoreoeg</div><div><br /></div><div>In terms of psilocybin content, =
a 2021 review estimated that 1 gram of dried mushrooms contains approximate=
ly 10mg of psilocybin. However, the publication did not specify whether thi=
s figure applies to Psilocybe cubensis or another species.</div><div><br />=
</div><div>https://t.me/psystoreoeg</div><div><br /></div><div>Golden Teach=
er Mushrooms Dosage</div><div>There is no standard golden teacher mushrooms=
 dosage because everybody responds differently. Also, as we mentioned, ther=
e can be significant variations in potency from one mushroom to the next. M=
yriad factors can also affect the experience, with dosage being just one pa=
rt of the equation.</div><div><br /></div><div>https://t.me/psystoreoeg</di=
v><div><br /></div><div><br /></div><div>Anyone inexperienced with psychede=
lics should start at the lower end of the scale to see how golden teacher m=
ushrooms affect them before increasing in dosage<br /><br /></div><div clas=
s=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">Le dimanche 9 juin=
 2024 =C3=A0 01:12:10 UTC+1, Asah Randy a =C3=A9crit=C2=A0:<br/></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px=
 solid rgb(204, 204, 204); padding-left: 1ex;"><div><br></div><div><a href=
=3D"https://t.me/motionking_caliweed_psychedelics" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dfr&amp;q=
=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=
=3D1718013993353000&amp;usg=3DAOvVaw26obZya2sum2RJ34eEuw7a">https://t.me/mo=
tionking_caliweed_psychedelics</a><br></div><span role=3D"listitem" aria-ex=
panded=3D"true" style=3D"border-bottom:1px solid rgb(232,234,237);padding-t=
op:8px;padding-left:0px;border-left:2px solid rgb(77,144,240)"><div style=
=3D"outline:none"><div style=3D"display:flex"><div style=3D"min-width:0px">=
<div role=3D"region" aria-labelledby=3D"c2473" style=3D"margin:12px 0px;ove=
rflow:auto;padding-right:20px"><div style=3D"color:rgb(80,0,80)"><div>Recom=
mended dosage: 3 =E2=80=93 4 g. dried mushrooms =E2=80=93 Strong hallucinat=
ions take over: a psychedelic flood of shapes, contours and colors will ble=
nd together and hit the shores of your consciousness. There=E2=80=99s no st=
opping the waves in Level 4. There will be some moments when you will lose =
touch reality. Random, non-existent objects will appear and the concept of =
time will fade away to the background. Intriguing to some, scary to others,=
 this is the level where psychedelics can really be powerful, life-altering=
 and mind expanding. Keep in mind that this dosage is only recommend for ex=
perience users.</div><div>Level 5</div><div><br></div></div><div><a href=3D=
"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" style=3D"c=
olor:rgb(26,115,232)" target=3D"_blank" data-saferedirecturl=3D"https://www=
.google.com/url?hl=3Dfr&amp;q=3Dhttps://t.me/motionking_caliweed_psychedeli=
cs&amp;source=3Dgmail&amp;ust=3D1718013993353000&amp;usg=3DAOvVaw26obZya2su=
m2RJ34eEuw7a">https://t.me/motionking_caliweed_psychedelics</a></div></div>=
</div></div><div><div></div></div></div></span><span role=3D"listitem" aria=
-expanded=3D"true" style=3D"border-bottom:none;padding-top:8px;padding-left=
:2px"><div style=3D"outline:none"><div style=3D"display:flex"><div aria-hid=
den=3D"true" style=3D"padding:16px"><div><a href=3D"https://t.me/motionking=
_caliweed_psychedelics" target=3D"_blank" rel=3D"nofollow" data-saferedirec=
turl=3D"https://www.google.com/url?hl=3Dfr&amp;q=3Dhttps://t.me/motionking_=
caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1718013993353000&amp;usg=
=3DAOvVaw26obZya2sum2RJ34eEuw7a">https://t.me/motionking_caliweed_psychedel=
ics</a><br></div></div></div></div></span><a href=3D"https://t.me/motionkin=
g_caliweed_psychedelics" target=3D"_blank" rel=3D"nofollow" data-saferedire=
cturl=3D"https://www.google.com/url?hl=3Dfr&amp;q=3Dhttps://t.me/motionking=
_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1718013993353000&amp;us=
g=3DAOvVaw26obZya2sum2RJ34eEuw7a">https://t.me/motionking_caliweed_psychede=
lics</a><br><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_att=
r">On Sunday, June 9, 2024 at 1:10:20=E2=80=AFAM UTC+1 Asah Randy wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div><a href=3D"https://=
t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" style=3D"color:rgb(=
26,115,232)" target=3D"_blank" data-saferedirecturl=3D"https://www.google.c=
om/url?hl=3Dfr&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;so=
urce=3Dgmail&amp;ust=3D1718013993353000&amp;usg=3DAOvVaw26obZya2sum2RJ34eEu=
w7a">https://t.me/motionking_caliweed_psychedelics</a><br></div><div><br></=
div><div><a href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"n=
ofollow" style=3D"color:rgb(26,115,232)" target=3D"_blank" data-saferedirec=
turl=3D"https://www.google.com/url?hl=3Dfr&amp;q=3Dhttps://t.me/motionking_=
caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1718013993353000&amp;usg=
=3DAOvVaw26obZya2sum2RJ34eEuw7a">https://t.me/motionking_caliweed_psychedel=
ics</a><br></div><div style=3D"color:rgb(80,0,80)">Penis Envy magic mushroo=
ms are three times more potent than other mushrooms. The effects of Penis E=
nvy magic mushrooms may come on quickly due to higher levels of psilocin th=
an psilocybin.<div>About Penis Envy</div><div>Penis Envy magic mushrooms ca=
n impact you differently based upon a variety of factors, like your size, w=
eight, your state of health, whether you have taken them before, the amount=
 you take, and more. The setting in which you are taking them and who you a=
re with are critical factors. Being in nature, in a safe, calm and tranquil=
 setting, with no pending pressures or obligations is ideal for the user.=
=C2=A0</div><div><br></div><div>Trip Level 0: Microdosing</div><div>Recomme=
nded dosage: 0.2 =E2=80=93 0.5 g. dried mushrooms =E2=80=93 A micro-dose is=
 a sub-perceptual amount of mushrooms. Take this every 2-3 days to boost cr=
eativity or feel less anxious. Microdosing trip levels capsules. Added as l=
evel 0, it=E2=80=99s meant to be taken along with your day-to-day routine.<=
/div><div>Trip Level 1: Happy go lucky</div><div>Recommended dosage: 0.8 =
=E2=80=93 1 g. dried mushrooms =E2=80=93 The effects are mild and similar t=
o being high on weed. Music starts to feel better, strangers seem more frie=
ndly and the mind is able to lose some control. You could have mild visual =
enhancements or some sound distortion, but these will be subtle.</div><div>=
Trip Level 2: Beginner=E2=80=99s paradise</div><div>Recommended dosage: 1 =
=E2=80=93 1.5 g. dried mushrooms =E2=80=93 Consistent sensorial accentuatio=
n, colors becoming brighter and a light body high. Level 2 can be a more in=
tense form of Trip Level 1, but with the right dosage it can be something m=
ore. Be prepared for the beginnings of visual and auditory hallucinations: =
objects moving and coming to life along with geometrical forms when you clo=
se your eyes. It will be harder to concentrate and communicate and you will=
 notice an increase in creativity along with an enhanced sensation, lightne=
ss and euphoria.</div><div>Trip Level 3: Classic psychedelic trip</div><div=
>Recommended dosage: 1.5 =E2=80=93 3 g. dried mushrooms =E2=80=93 Trip Leve=
l 3 is great for beginners who want to jump in the =E2=80=9Creal=E2=80=9D p=
sychedelic experience, without overdoing the dosage. This level is where vi=
sual hallucinations along with the appearance of patterns and fractals will=
 be evident. No more hinting or subtle flashes of visuals, it=E2=80=99s hap=
pening for real. The surface of the object you=E2=80=99re observing will be=
come shiny and moving, as your field of depth is altered. Distortions in th=
e aptitude to measure the passage of time, might cause an 1 hour to feel li=
ke an eternity.</div></div><div>Level 4: Flying with the stars https:<a hre=
f=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" style=
=3D"color:rgb(26,115,232)" target=3D"_blank" data-saferedirecturl=3D"https:=
//www.google.com/url?hl=3Dfr&amp;q=3Dhttps://t.me/motionking_caliweed_psych=
edelics&amp;source=3Dgmail&amp;ust=3D1718013993353000&amp;usg=3DAOvVaw26obZ=
ya2sum2RJ34eEuw7a">https://t.me/motionking_caliweed_psychedelics</a></div><=
div style=3D"color:rgb(80,0,80)"><div><br></div></div><a href=3D"https://t.=
me/motionking_caliweed_psychedelics" rel=3D"nofollow" style=3D"color:rgb(26=
,115,232)" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com=
/url?hl=3Dfr&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;sour=
ce=3Dgmail&amp;ust=3D1718013993353000&amp;usg=3DAOvVaw26obZya2sum2RJ34eEuw7=
a">https://t.me/motionking_caliweed_psychedelics</a><br><div class=3D"gmail=
_quote"><div dir=3D"auto" class=3D"gmail_attr">On Monday, June 3, 2024 at 4=
:10:23=E2=80=AFAM UTC+1 Asah Randy wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div><a href=3D"https://t.me/motionking_caliweed_psyche=
delics" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://=
www.google.com/url?hl=3Dfr&amp;q=3Dhttps://t.me/motionking_caliweed_psyched=
elics&amp;source=3Dgmail&amp;ust=3D1718013993353000&amp;usg=3DAOvVaw26obZya=
2sum2RJ34eEuw7a">https://t.me/motionking_caliweed_psychedelics</a><br></div=
><div><br></div>Penis Envy magic mushrooms are three times more potent than=
 other mushrooms. The effects of Penis Envy magic mushrooms may come on qui=
ckly due to higher levels of psilocin than psilocybin.<div>About Penis Envy=
</div><div>Penis Envy magic mushrooms can impact you differently based upon=
 a variety of factors, like your size, weight, your state of health, whethe=
r you have taken them before, the amount you take, and more. The setting in=
 which you are taking them and who you are with are critical factors. Being=
 in nature, in a safe, calm and tranquil setting, with no pending pressures=
 or obligations is ideal for the user.=C2=A0</div><div><br></div><div>Trip =
Level 0: Microdosing</div><div>Recommended dosage: 0.2 =E2=80=93 0.5 g. dri=
ed mushrooms =E2=80=93 A micro-dose is a sub-perceptual amount of mushrooms=
. Take this every 2-3 days to boost creativity or feel less anxious. Microd=
osing trip levels capsules. Added as level 0, it=E2=80=99s meant to be take=
n along with your day-to-day routine.</div><div>Trip Level 1: Happy go luck=
y</div><div>Recommended dosage: 0.8 =E2=80=93 1 g. dried mushrooms =E2=80=
=93 The effects are mild and similar to being high on weed. Music starts to=
 feel better, strangers seem more friendly and the mind is able to lose som=
e control. You could have mild visual enhancements or some sound distortion=
, but these will be subtle.</div><div>Trip Level 2: Beginner=E2=80=99s para=
dise</div><div>Recommended dosage: 1 =E2=80=93 1.5 g. dried mushrooms =E2=
=80=93 Consistent sensorial accentuation, colors becoming brighter and a li=
ght body high. Level 2 can be a more intense form of Trip Level 1, but with=
 the right dosage it can be something more. Be prepared for the beginnings =
of visual and auditory hallucinations: objects moving and coming to life al=
ong with geometrical forms when you close your eyes. It will be harder to c=
oncentrate and communicate and you will notice an increase in creativity al=
ong with an enhanced sensation, lightness and euphoria.</div><div>Trip Leve=
l 3: Classic psychedelic trip</div><div>Recommended dosage: 1.5 =E2=80=93 3=
 g. dried mushrooms =E2=80=93 Trip Level 3 is great for beginners who want =
to jump in the =E2=80=9Creal=E2=80=9D psychedelic experience, without overd=
oing the dosage. This level is where visual hallucinations along with the a=
ppearance of patterns and fractals will be evident. No more hinting or subt=
le flashes of visuals, it=E2=80=99s happening for real. The surface of the =
object you=E2=80=99re observing will become shiny and moving, as your field=
 of depth is altered. Distortions in the aptitude to measure the passage of=
 time, might cause an 1 hour to feel like an eternity.</div><div>Level 4: F=
lying with the stars https:<a href=3D"https://t.me/motionking_caliweed_psyc=
hedelics" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https:=
//www.google.com/url?hl=3Dfr&amp;q=3Dhttps://t.me/motionking_caliweed_psych=
edelics&amp;source=3Dgmail&amp;ust=3D1718013993353000&amp;usg=3DAOvVaw26obZ=
ya2sum2RJ34eEuw7a">https://t.me/motionking_caliweed_psychedelics</a></div><=
div><br></div><div>Recommended dosage: 3 =E2=80=93 4 g. dried mushrooms =E2=
=80=93 Strong hallucinations take over: a psychedelic flood of shapes, cont=
ours and colors will blend together and hit the shores of your consciousnes=
s. There=E2=80=99s no stopping the waves in Level 4. There will be some mom=
ents when you will lose touch reality. Random, non-existent objects will ap=
pear and the concept of time will fade away to the background. Intriguing t=
o some, scary to others, this is the level where psychedelics can really be=
 powerful, life-altering and mind expanding. Keep in mind that this dosage =
is only recommend for experience users.</div><div>Level 5</div><div><br></d=
iv><div><a href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"no=
follow" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/ur=
l?hl=3Dfr&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=
=3Dgmail&amp;ust=3D1718013993353000&amp;usg=3DAOvVaw26obZya2sum2RJ34eEuw7a"=
>https://t.me/motionking_caliweed_psychedelics</a><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Monday, June 3, =
2024 at 4:06:43=E2=80=AFAM UTC+1 Asah Randy wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div><br></div><div style=3D"border-bottom:1px=
 solid rgb(232,234,237);display:flex;min-height:51px"><div style=3D"display=
:flex;margin-left:auto"><br><div style=3D"border-left:1px solid rgb(221,221=
,221);display:inline-block;min-height:20px;margin:12px"></div><div role=3D"=
button" aria-label=3D"You need the content moderator permission to delete c=
onversations" aria-disabled=3D"true" style=3D"border:0px;border-radius:50%;=
display:inline-block;min-height:40px;outline:none;overflow:hidden;text-alig=
n:center;width:40px;color:rgb(154,160,166)"><div style=3D"background-size:c=
over;opacity:0;background-image:radial-gradient(circle farthest-side,rgba(9=
5,99,104,0.16),rgba(95,99,104,0.16) 80%,rgba(95,99,104,0) 100%)"></div><spa=
n style=3D"display:flex;min-height:40px;width:40px"><span style=3D"display:=
flex"></span></span></div><div role=3D"button" aria-label=3D"You need the c=
ontent moderator permission to lock conversations" aria-disabled=3D"true" s=
tyle=3D"border:0px;border-radius:50%;display:inline-block;min-height:40px;o=
utline:none;overflow:hidden;text-align:center;width:40px;color:rgb(154,160,=
166)"><div style=3D"background-size:cover;opacity:0;background-image:radial=
-gradient(circle farthest-side,rgba(95,99,104,0.16),rgba(95,99,104,0.16) 80=
%,rgba(95,99,104,0) 100%)"></div><span style=3D"display:flex;min-height:40p=
x;width:40px"><span style=3D"display:flex"><span aria-hidden=3D"true" style=
=3D"font-family:&quot;Material Icons Extended&quot;;font-size:20px;line-hei=
ght:1;display:inline-block;direction:ltr;font-feature-settings:&quot;liga&q=
uot;">=EE=A2=99</span></span></span></div><div style=3D"border-left:1px sol=
id rgb(221,221,221);display:inline-block;min-height:20px;margin:12px"></div=
><div style=3D"display:flex;margin-left:8px"><div><div style=3D"display:fle=
x;color:rgb(95,99,104);min-height:32px"><div style=3D"font-family:Roboto,Ar=
ial,sans-serif;letter-spacing:0.2px;line-height:20px;display:flex">17 of 35=
04</div><div role=3D"button" aria-label=3D"Previous" style=3D"border:0px;bo=
rder-radius:50%;display:inline-block;min-height:48px;outline:none;overflow:=
hidden;text-align:center;width:48px"><div style=3D"background-size:cover;op=
acity:0;background-image:radial-gradient(circle farthest-side,rgba(95,99,10=
4,0.16),rgba(95,99,104,0.16) 80%,rgba(95,99,104,0) 100%)"></div><span style=
=3D"display:flex;min-height:48px;width:48px"><span style=3D"display:flex"><=
span aria-hidden=3D"true" style=3D"font-family:&quot;Material Icons Extende=
d&quot;;font-size:24px;line-height:1;display:inline-block;direction:ltr;fon=
t-feature-settings:&quot;liga&quot;">=EE=90=88</span></span></span></div><d=
iv role=3D"button" aria-label=3D"Next" style=3D"border:0px;border-radius:50=
%;display:inline-block;min-height:48px;outline:none;overflow:hidden;text-al=
ign:center;width:48px"><div style=3D"background-size:cover;opacity:0;backgr=
ound-image:radial-gradient(circle farthest-side,rgba(95,99,104,0.16),rgba(9=
5,99,104,0.16) 80%,rgba(95,99,104,0) 100%)"></div><span style=3D"display:fl=
ex;min-height:48px;width:48px"><span style=3D"display:flex"><span aria-hidd=
en=3D"true" style=3D"font-family:&quot;Material Icons Extended&quot;;font-s=
ize:24px;line-height:1;display:inline-block;direction:ltr;font-feature-sett=
ings:&quot;liga&quot;">=EE=90=89</span></span></span></div></div></div></di=
v></div></div><div style=3D"overflow-y:auto;outline:none"><div style=3D"dis=
play:flex"><div style=3D"display:flex;min-width:0px"><div style=3D"display:=
flex;padding:16px 16px 16px 0px"><span style=3D"display:inline-block;paddin=
g:0px;font-family:&quot;Google Sans&quot;,Roboto,Arial,sans-serif;font-size=
:22px;line-height:28px;color:rgb(32,33,36);margin:0px;outline:none;word-bre=
ak:break-word">4</span></div><div style=3D"color:rgb(95,99,104);display:inl=
ine-block"><br></div></div><div style=3D"display:flex"><div role=3D"button"=
 style=3D"border:0px;border-radius:4px;color:rgb(95,99,104);display:inline-=
block;font-family:&quot;Google Sans&quot;,Roboto,Arial,sans-serif;letter-sp=
acing:0.25px;line-height:36px;min-width:auto;outline:none;overflow:hidden;t=
ext-align:center;min-height:1px"><div style=3D"background-size:cover;opacit=
y:0;background-image:radial-gradient(circle farthest-side,rgba(0,0,0,0.12),=
rgba(0,0,0,0.12) 80%,rgba(0,0,0,0) 100%)"></div><div style=3D"background-co=
lor:rgb(95,99,104);opacity:0"></div><span style=3D"display:flex;padding:0px=
 8px"><span style=3D"display:inline-block;margin:0px">Skip to first unread =
message</span></span></div><div><div role=3D"button" aria-label=3D"Collapse=
 all" style=3D"border:0px;border-radius:50%;display:inline-block;min-height=
:48px;outline:none;overflow:hidden;text-align:center;width:48px;color:rgb(9=
5,99,104)"><div style=3D"background-size:cover;opacity:0;background-image:r=
adial-gradient(circle farthest-side,rgba(95,99,104,0.16),rgba(95,99,104,0.1=
6) 80%,rgba(95,99,104,0) 100%)"></div><span style=3D"display:flex;min-heigh=
t:48px;width:48px"><span style=3D"display:flex"><span aria-hidden=3D"true" =
style=3D"font-family:&quot;Material Icons Extended&quot;;font-size:20px;lin=
e-height:1;display:inline-block;direction:ltr;font-feature-settings:&quot;l=
iga&quot;">=EE=A5=84</span></span></span></div></div></div></div><div role=
=3D"list" aria-label=3D"jailhouse + ZCU102 V1.0 + second UART problem + pet=
alinux 2017.4"><span role=3D"listitem" aria-expanded=3D"true" style=3D"bord=
er-bottom:1px solid rgb(232,234,237);padding-top:8px;padding-left:0px;borde=
r-left:2px solid rgb(77,144,240)"><div style=3D"outline:none"><div style=3D=
"display:flex"><div style=3D"min-width:0px"><div><div style=3D"color:rgb(95=
,99,104);display:flex;min-height:48px"><span style=3D"min-height:1px;margin=
:0px;overflow:hidden;padding:0px;white-space:nowrap;width:1px">unread,</spa=
n><div style=3D"font-family:Roboto,Arial,sans-serif;font-size:12px;letter-s=
pacing:0.3px;line-height:16px;display:flex">Jun 27, 2018, 5:33:04=E2=80=AFP=
M<span style=3D"font-family:&quot;Material Icons Extended&quot;;font-size:2=
0px;letter-spacing:normal;text-align:center">=EE=97=94</span></div></div></=
div><div role=3D"region" aria-labelledby=3D"c14597" style=3D"margin:12px 0p=
x;overflow:auto;padding-right:20px"><a href=3D"https://t.me/motionking_cali=
weed_psychedelics" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Dfr&amp;q=3Dhttps://t.me/motionking_cali=
weed_psychedelics&amp;source=3Dgmail&amp;ust=3D1718013993353000&amp;usg=3DA=
OvVaw26obZya2sum2RJ34eEuw7a">https://t.me/motionking_caliweed_psychedelics<=
/a></div></div></div></div></span></div></div><div style=3D"overflow-y:auto=
;outline:none"><div role=3D"list" aria-label=3D"jailhouse + ZCU102 V1.0 + s=
econd UART problem + petalinux 2017.4"><span role=3D"listitem" aria-expande=
d=3D"true" style=3D"border-bottom:1px solid rgb(232,234,237);padding-top:8p=
x;padding-left:0px;border-left:2px solid rgb(77,144,240)"><div style=3D"out=
line:none"><div style=3D"display:flex"><div style=3D"min-width:0px"><div ro=
le=3D"region" aria-labelledby=3D"c14597" style=3D"margin:12px 0px;overflow:=
auto;padding-right:20px"><br><p>i&#39;m trying to make jailhouse work on my=
 ZCU102 v1.0 (production)<br>using petalinux 2017.4 following this document=
ation :</p></div></div></div></div></span></div></div><div style=3D"overflo=
w-y:auto;outline:none"><div role=3D"list" aria-label=3D"jailhouse + ZCU102 =
V1.0 + second UART problem + petalinux 2017.4"><span role=3D"listitem" aria=
-expanded=3D"true" style=3D"border-bottom:1px solid rgb(232,234,237);paddin=
g-top:8px;padding-left:0px;border-left:2px solid rgb(77,144,240)"><div styl=
e=3D"outline:none"><div style=3D"display:flex"><div style=3D"min-width:0px"=
><div role=3D"region" aria-labelledby=3D"c14597" style=3D"margin:12px 0px;o=
verflow:auto;padding-right:20px"><p><a href=3D"https://t.me/motionking_cali=
weed_psychedelics" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Dfr&amp;q=3Dhttps://t.me/motionking_cali=
weed_psychedelics&amp;source=3Dgmail&amp;ust=3D1718013993353000&amp;usg=3DA=
OvVaw26obZya2sum2RJ34eEuw7a">https://t.me/motionking_caliweed_psychedelics<=
/a><br></p></div></div></div></div></span></div></div><div style=3D"overflo=
w-y:auto;outline:none"><div role=3D"list" aria-label=3D"jailhouse + ZCU102 =
V1.0 + second UART problem + petalinux 2017.4"><span role=3D"listitem" aria=
-expanded=3D"true" style=3D"border-bottom:1px solid rgb(232,234,237);paddin=
g-top:8px;padding-left:0px;border-left:2px solid rgb(77,144,240)"><div styl=
e=3D"outline:none"><div style=3D"display:flex"><div style=3D"min-width:0px"=
><div role=3D"region" aria-labelledby=3D"c14597" style=3D"margin:12px 0px;o=
verflow:auto;padding-right:20px"><p><br>the second uart doesn&#39;t work. A=
fter a question on the Xilinx forum</p></div></div></div></div></span></div=
></div><div style=3D"overflow-y:auto;outline:none"><div role=3D"list" aria-=
label=3D"jailhouse + ZCU102 V1.0 + second UART problem + petalinux 2017.4">=
<span role=3D"listitem" aria-expanded=3D"true" style=3D"border-bottom:1px s=
olid rgb(232,234,237);padding-top:8px;padding-left:0px;border-left:2px soli=
d rgb(77,144,240)"><div style=3D"outline:none"><div style=3D"display:flex">=
<div style=3D"min-width:0px"><div role=3D"region" aria-labelledby=3D"c14597=
" style=3D"margin:12px 0px;overflow:auto;padding-right:20px"><p><a href=3D"=
https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" target=3D"_=
blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dfr&amp;q=3Dh=
ttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1=
718013993353000&amp;usg=3DAOvVaw26obZya2sum2RJ34eEuw7a">https://t.me/motion=
king_caliweed_psychedelics</a><br></p></div></div></div></div></span></div>=
</div><div style=3D"overflow-y:auto;outline:none"><div role=3D"list" aria-l=
abel=3D"jailhouse + ZCU102 V1.0 + second UART problem + petalinux 2017.4"><=
span role=3D"listitem" aria-expanded=3D"true" style=3D"border-bottom:1px so=
lid rgb(232,234,237);padding-top:8px;padding-left:0px;border-left:2px solid=
 rgb(77,144,240)"><div style=3D"outline:none"><div style=3D"display:flex"><=
div style=3D"min-width:0px"><div role=3D"region" aria-labelledby=3D"c14597"=
 style=3D"margin:12px 0px;overflow:auto;padding-right:20px"><p>i can activa=
te /dev/ttyPS1 on the zcu102 and verify it using</p><p>echo hello &gt; /dev=
/ttyPS1</p><p>but i still can&#39;t use it with jailhouse.</p><p><br>i have=
 checked with the gic-demo and linux-demo without any success.<br>i can use=
 the debug console with gic-demo, but that&#39;s all.</p><p>this command sh=
ould work, but it doesn&#39;t :</p><p>jailhouse cell linux zynqmp-zcu102-li=
nux-demo.cell Image -d inmate-zynqmp-zcu102.dtb -i rootfs.cpio -c &quot;con=
sole=3DttyPS1,115200&quot;</p><p><br>in the zynqmp-zcu102-linux-demo.c file=
, the uart address is correct :</p><p>.mem_regions =3D {<br>/* UART */ {<br=
>.phys_start =3D 0xff010000,<br>.virt_start =3D 0xff010000,<br>.size =3D 0x=
1000,<br>.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>JAILHOUSE=
_MEM_IO | JAILHOUSE_MEM_ROOTSHARED</p></div></div></div></div></span></div>=
</div><div style=3D"overflow-y:auto;outline:none"><div role=3D"list" aria-l=
abel=3D"jailhouse + ZCU102 V1.0 + second UART problem + petalinux 2017.4"><=
span role=3D"listitem" aria-expanded=3D"true" style=3D"border-bottom:1px so=
lid rgb(232,234,237);padding-top:8px;padding-left:0px;border-left:2px solid=
 rgb(77,144,240)"><div style=3D"outline:none"><div style=3D"display:flex"><=
div style=3D"min-width:0px"><div role=3D"region" aria-labelledby=3D"c14597"=
 style=3D"margin:12px 0px;overflow:auto;padding-right:20px"></div></div></d=
iv></div></span></div></div><a href=3D"https://t.me/motionking_caliweed_psy=
chedelics" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https=
://www.google.com/url?hl=3Dfr&amp;q=3Dhttps://t.me/motionking_caliweed_psyc=
hedelics&amp;source=3Dgmail&amp;ust=3D1718013993353000&amp;usg=3DAOvVaw26ob=
Zya2sum2RJ34eEuw7a">https://t.me/motionking_caliweed_psychedelics</a><br><d=
iv class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Saturday=
, June 1, 2024 at 9:26:29=E2=80=AFAM UTC+1 Dwayne Mickey wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Penis Envy magic mushrooms are th=
ree times more potent than other mushrooms.  The effects of Penis Envy magi=
c mushrooms may come on quickly due to higher levels of psilocin than psilo=
cybin.<div>About Penis Envy</div><div>Penis Envy magic mushrooms can impact=
 you differently based upon a variety of factors, like your size, weight, y=
our state of health, whether you have taken them before, the amount you tak=
e, and more.  The setting in which you are taking them and who you are with=
 are critical factors.  Being in nature, in a safe, calm and tranquil setti=
ng, with no pending pressures or obligations is ideal for the user.=C2=A0</=
div><div><br></div><div>Trip Level 0: Microdosing</div><div>Recommended dos=
age: 0.2 =E2=80=93 0.5 g. dried mushrooms =E2=80=93 A micro-dose is a sub-p=
erceptual amount of mushrooms. Take this every 2-3 days to boost creativity=
 or feel less anxious. Microdosing trip levels capsules. Added as level 0, =
it=E2=80=99s meant to be taken along with your day-to-day routine.</div><di=
v>Trip Level 1: Happy go lucky</div><div>Recommended dosage: 0.8 =E2=80=93 =
1 g. dried mushrooms =E2=80=93 The effects are mild and similar to being hi=
gh on weed. Music starts to feel better, strangers seem more friendly and t=
he mind is able to lose some control. You could have mild visual enhancemen=
ts or some sound distortion, but these will be subtle.</div><div>Trip Level=
 2: Beginner=E2=80=99s paradise</div><div>Recommended dosage: 1 =E2=80=93 1=
.5 g. dried mushrooms =E2=80=93 Consistent sensorial accentuation, colors b=
ecoming brighter and a light body high. Level 2 can be a more intense form =
of Trip Level 1, but with the right dosage it can be something more. Be pre=
pared for the beginnings of visual and auditory hallucinations: objects mov=
ing and coming to life along with geometrical forms when you close your eye=
s. It will be harder to concentrate and communicate and you will notice an =
increase in creativity along with an enhanced sensation, lightness and euph=
oria.</div><div>Trip Level 3: Classic psychedelic trip</div><div>Recommende=
d dosage: 1.5 =E2=80=93 3 g. dried mushrooms =E2=80=93 Trip Level 3 is grea=
t for beginners who want to jump in the =E2=80=9Creal=E2=80=9D psychedelic =
experience, without overdoing the dosage. This level is where visual halluc=
inations along with the appearance of patterns and fractals will be evident=
. No more hinting or subtle flashes of visuals, it=E2=80=99s happening for =
real. The surface of the object you=E2=80=99re observing will become shiny =
and moving, as your field of depth is altered. Distortions in the aptitude =
to measure the passage of time, might cause an 1 hour to feel like an etern=
ity.</div><div>Level 4: Flying with the stars https:<a href=3D"http://t.me/=
Ricko_swavy8" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"ht=
tps://www.google.com/url?hl=3Dfr&amp;q=3Dhttp://t.me/Ricko_swavy8&amp;sourc=
e=3Dgmail&amp;ust=3D1718013993353000&amp;usg=3DAOvVaw3xWaZqRWcFDNdrzC62urZu=
">t.me/Ricko_swavy8</a></div><div>Recommended dosage: 3 =E2=80=93 4 g. drie=
d mushrooms =E2=80=93 Strong hallucinations take over: a psychedelic flood =
of shapes, contours and colors will blend together and hit the shores of yo=
ur consciousness. There=E2=80=99s no stopping the waves in Level 4. There w=
ill be some moments when you will lose touch reality. Random, non-existent =
objects will appear and the concept of time will fade away to the backgroun=
d. Intriguing to some, scary to others, this is the level where psychedelic=
s can really be powerful, life-altering and mind expanding. Keep in mind th=
at this dosage is only recommend for experience users.</div><div>Level 5</d=
iv><div>:https:<a href=3D"http://t.me/Ricko_swavy8" rel=3D"nofollow" target=
=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dfr&amp;=
q=3Dhttp://t.me/Ricko_swavy8&amp;source=3Dgmail&amp;ust=3D1718013993353000&=
amp;usg=3DAOvVaw3xWaZqRWcFDNdrzC62urZu">t.me/Ricko_swavy8</a><br><br></div>=
<div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Thursd=
ay, June 28, 2018 at 12:49:45=E2=80=AFPM UTC+1 <a rel=3D"nofollow">christop=
he...@gmail.com</a> wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">hi all,<p>now i can see the output of the console and monitor the linu=
x boot.<br>And of course, linux doesn&#39;t boot and stop with a kernel pan=
ic : <p>[    9.148409] NET: Registered protocol family 1<br>[    9.200596] =
RPC: Registered named UNIX socket transport module.<br>[    9.271265] RPC: =
Registered udp transport module.<br>[    9.327501] RPC: Registered tcp tran=
sport module.<br>[    9.383752] RPC: Registered tcp NFSv4.1 backchannel tra=
nsport module.<br>[    9.814860] Kernel panic - not syncing: write error<br=
>[    9.872207] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.9.0-xilinx-v201=
7.4 #2<br>[    9.957622] Hardware name: Jailhouse cell on ZynqMP ZCU102 (DT=
)<br>[   10.028458] Call trace:<br>[   10.057635] [&lt;ffffff8008088138&gt;=
] dump_backtrace+0x0/0x198<br>[   10.122215] [&lt;ffffff80080882e4&gt;] sho=
w_stack+0x14/0x20<br>[   10.182634] [&lt;ffffff80083de594&gt;] dump_stack+0=
x94/0xb8<br>[   10.243054] [&lt;ffffff800812e9f8&gt;] panic+0x114/0x25c<br>=
[   10.300347] [&lt;ffffff8008cc2d8c&gt;] populate_rootfs+0x40/0x110<br>[  =
 10.367014] [&lt;ffffff80080830b8&gt;] do_one_initcall+0x38/0x128<br>[   10=
.433683] [&lt;ffffff8008cc0c94&gt;] kernel_init_freeable+0x140/0x1e0<br>[  =
 10.506604] [&lt;ffffff80089494e0&gt;] kernel_init+0x10/0x100<br>[   10.569=
104] [&lt;ffffff8008082e80&gt;] ret_from_fork+0x10/0x50<br>[   10.632647] S=
MP: stopping secondary CPUs<br>[   10.679537] ---[ end Kernel panic - not s=
yncing: write error<p>i can see a write error, but i don&#39;t know why.<br=
>i have attached the boot log file.<p>Any hints ?<p>Regards <br>C.Alexandre=
 </p></p></p></p></p></blockquote></div></blockquote></div></blockquote></d=
iv></blockquote></div></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/1c7591d4-e97a-49c3-bc11-538c2b3d1719n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/1c7591d4-e97a-49c3-bc11-538c2b3d1719n%40googlegroups.co=
m</a>.<br />

------=_Part_173957_1867715213.1717927711471--

------=_Part_173956_1715884879.1717927711471--
