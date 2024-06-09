Return-Path: <jailhouse-dev+bncBD37PS7EWQCRBXHGSOZQMGQECLGVFXI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3a.google.com (mail-yb1-xb3a.google.com [IPv6:2607:f8b0:4864:20::b3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B41490140D
	for <lists+jailhouse-dev@lfdr.de>; Sun,  9 Jun 2024 02:12:14 +0200 (CEST)
Received: by mail-yb1-xb3a.google.com with SMTP id 3f1490d57ef6-dfab38b7f6bsf5216560276.0
        for <lists+jailhouse-dev@lfdr.de>; Sat, 08 Jun 2024 17:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717891933; x=1718496733; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z4bBlOB3HVyXqXsXKJr3KoO7ZXr8anptK5xUKfzF9q4=;
        b=tlEb1BdCwgRc/gn1VUliMSKo26EFgKlIDRfCIefaElp7TM0jEyEqo35Dw2ZCy1B1KG
         FlEAcrTC8aJsq9ySeas2SpQr4RGwyxg6QqVyJz0CL6HNH21T8hQ2nSPzCn5LLtCuiq0q
         B+y6n3Aw5OgVq5mtgB8YTnQsqiEM7NR3xArsO5ciaS/GCp5Y8RMK3ao0GTSO9d8iscIA
         G1yADZ1oxmnrAkSEsm0p6YsPcfb4tv8vuUTw+GuxU5huMMn6Qvq0ZyR9lDIJxEq+gxqn
         drc80S1n0nuCqBbn3oPAX4gCPdEAVYPNcKrRsA7xpmiXVPi2I+9J7OGvSswbG1cHZHHv
         41jA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717891933; x=1718496733; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z4bBlOB3HVyXqXsXKJr3KoO7ZXr8anptK5xUKfzF9q4=;
        b=PhRuJ5+QNYMl6xFX6u/kXdTmhiqPgRlSpB2Qs4fJO57lqBZeoNgKi6sfOz4uUjOQOG
         fM8gQzrRPpZ+5wlg7FqFkBLwO355FF2Qr6M0BeDWy8rxa4nEQsUfH6gzMelj73SvoxJq
         dFHpfyQIT8yxZm2WBbThR6vCNfJUfWkY5HVaEeJI07lQKABq7hGBHuQkHWFnnNQy5L+E
         ClutH1/mtvZCdYQceQczVlkc1dYobmfZSfXYEDyI9gl6eI6aldHg4SO7FtWhv+E0HRtj
         BW3nCr0egLO30ibE0MQnODPcPaJwVf+7bvPeVTuFnzWEMmLSIVRtbB0KPjrjRfS6JrNr
         Relw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717891933; x=1718496733;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z4bBlOB3HVyXqXsXKJr3KoO7ZXr8anptK5xUKfzF9q4=;
        b=oVdiLvndOHRD8PkFNefdKQPsKCadlICUpkyOZxTEBzRlPxZzO+hDzLcYCXv5cjRzQU
         g7kk/v0Yu/hUDjEClmbHHVhaCoqlKKsO1k6Zf8Jm9Xo+NO1s8QwMAFG9T6zkVvwN4azK
         BaqDdgu2tLdnvKCMFId/55HNT1RiNp32QeFZJuQyP6ZnadUEEG8JnDOhGWygn6uGtdMO
         l42doLJVc8FHE3P1TdZiBC+30QmJlj2qe5PjV4fycEGLeGrhP/aJ419+Qmpvzgqtchmj
         brkpcVmF9+Ws5A5ZmeAaJ1u76azyUvEwyXN+pvDPftReDcCYVV25Quh5VptJjZS9cOv/
         HtxQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWTeyCJWiY/b05H6AbJqrM2mBu+v73R4IqiScdTFSqs35JaANKQZmwkoPkJQ+KdRBcSRPTowRrkkZ5YYcTlE+iXyoUz4H6WUI3kMhM=
X-Gm-Message-State: AOJu0YyoFJlkazlX78cAMx3+rv19jmieJcWZIsRIIglhxKyzDCp9DdCD
	q9AyAf0fSeMDNm5GX44IZ5xVakflSIyvM6+1xfRNH7aCSySYTdEC
X-Google-Smtp-Source: AGHT+IF6JF671eMbxKLfKjsqkwn+MQBPwbqHj7fM4am8dptt0lo4p5Sxh1RVvB9dH7ZDLZiz0/A2Jw==
X-Received: by 2002:a25:8203:0:b0:dfb:149d:7593 with SMTP id 3f1490d57ef6-dfb149d7911mr1601258276.44.1717891932682;
        Sat, 08 Jun 2024 17:12:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:9745:0:b0:dfa:8028:8bc9 with SMTP id 3f1490d57ef6-dfaf15f6c00ls3256226276.1.-pod-prod-06-us;
 Sat, 08 Jun 2024 17:12:11 -0700 (PDT)
X-Received: by 2002:a05:690c:10d:b0:61a:bfc8:64ce with SMTP id 00721157ae682-62cd5665b76mr15416767b3.8.1717891930691;
        Sat, 08 Jun 2024 17:12:10 -0700 (PDT)
Date: Sat, 8 Jun 2024 17:12:09 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <35e3e9a1-c599-4570-b9a7-a97b9fd74813n@googlegroups.com>
In-Reply-To: <cfa7782b-6db4-4434-9d24-aadbee870488n@googlegroups.com>
References: <00efaad9-c84e-4a0f-b16e-512d1351ca2c@googlegroups.com>
 <b233e3c5-c126-4ff1-a109-8d2862e939ee@googlegroups.com>
 <aa79214c-06f5-482d-9b3a-18cdfd9a1909n@googlegroups.com>
 <5ac62ff7-670a-40a2-9271-700b1f8d7f86n@googlegroups.com>
 <59e205f7-8706-442a-a5ba-65dba773eabfn@googlegroups.com>
 <cfa7782b-6db4-4434-9d24-aadbee870488n@googlegroups.com>
Subject: Re: jailhouse + ZCU102 V1.0 + second UART problem + petalinux
 2017.4
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_142477_1253963868.1717891929909"
X-Original-Sender: asahrandy54@gmail.com
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

------=_Part_142477_1253963868.1717891929909
Content-Type: multipart/alternative; 
	boundary="----=_Part_142478_1670895431.1717891929909"

------=_Part_142478_1670895431.1717891929909
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


https://t.me/motionking_caliweed_psychedelics
Recommended dosage: 3 =E2=80=93 4 g. dried mushrooms =E2=80=93 Strong hallu=
cinations take=20
over: a psychedelic flood of shapes, contours and colors will blend=20
together and hit the shores of your consciousness. There=E2=80=99s no stopp=
ing the=20
waves in Level 4. There will be some moments when you will lose touch=20
reality. Random, non-existent objects will appear and the concept of time=
=20
will fade away to the background. Intriguing to some, scary to others, this=
=20
is the level where psychedelics can really be powerful, life-altering and=
=20
mind expanding. Keep in mind that this dosage is only recommend for=20
experience users.
Level 5

https://t.me/motionking_caliweed_psychedelics
https://t.me/motionking_caliweed_psychedelics
https://t.me/motionking_caliweed_psychedelics
On Sunday, June 9, 2024 at 1:10:20=E2=80=AFAM UTC+1 Asah Randy wrote:

> https://t.me/motionking_caliweed_psychedelics
>
> https://t.me/motionking_caliweed_psychedelics
> Penis Envy magic mushrooms are three times more potent than other=20
> mushrooms. The effects of Penis Envy magic mushrooms may come on quickly=
=20
> due to higher levels of psilocin than psilocybin.
> About Penis Envy
> Penis Envy magic mushrooms can impact you differently based upon a variet=
y=20
> of factors, like your size, weight, your state of health, whether you hav=
e=20
> taken them before, the amount you take, and more. The setting in which yo=
u=20
> are taking them and who you are with are critical factors. Being in natur=
e,=20
> in a safe, calm and tranquil setting, with no pending pressures or=20
> obligations is ideal for the user.=20
>
> Trip Level 0: Microdosing
> Recommended dosage: 0.2 =E2=80=93 0.5 g. dried mushrooms =E2=80=93 A micr=
o-dose is a=20
> sub-perceptual amount of mushrooms. Take this every 2-3 days to boost=20
> creativity or feel less anxious. Microdosing trip levels capsules. Added =
as=20
> level 0, it=E2=80=99s meant to be taken along with your day-to-day routin=
e.
> Trip Level 1: Happy go lucky
> Recommended dosage: 0.8 =E2=80=93 1 g. dried mushrooms =E2=80=93 The effe=
cts are mild and=20
> similar to being high on weed. Music starts to feel better, strangers see=
m=20
> more friendly and the mind is able to lose some control. You could have=
=20
> mild visual enhancements or some sound distortion, but these will be subt=
le.
> Trip Level 2: Beginner=E2=80=99s paradise
> Recommended dosage: 1 =E2=80=93 1.5 g. dried mushrooms =E2=80=93 Consiste=
nt sensorial=20
> accentuation, colors becoming brighter and a light body high. Level 2 can=
=20
> be a more intense form of Trip Level 1, but with the right dosage it can =
be=20
> something more. Be prepared for the beginnings of visual and auditory=20
> hallucinations: objects moving and coming to life along with geometrical=
=20
> forms when you close your eyes. It will be harder to concentrate and=20
> communicate and you will notice an increase in creativity along with an=
=20
> enhanced sensation, lightness and euphoria.
> Trip Level 3: Classic psychedelic trip
> Recommended dosage: 1.5 =E2=80=93 3 g. dried mushrooms =E2=80=93 Trip Lev=
el 3 is great for=20
> beginners who want to jump in the =E2=80=9Creal=E2=80=9D psychedelic expe=
rience, without=20
> overdoing the dosage. This level is where visual hallucinations along wit=
h=20
> the appearance of patterns and fractals will be evident. No more hinting =
or=20
> subtle flashes of visuals, it=E2=80=99s happening for real. The surface o=
f the=20
> object you=E2=80=99re observing will become shiny and moving, as your fie=
ld of=20
> depth is altered. Distortions in the aptitude to measure the passage of=
=20
> time, might cause an 1 hour to feel like an eternity.
> Level 4: Flying with the stars https:
> https://t.me/motionking_caliweed_psychedelics
>
> https://t.me/motionking_caliweed_psychedelics
> On Monday, June 3, 2024 at 4:10:23=E2=80=AFAM UTC+1 Asah Randy wrote:
>
>> https://t.me/motionking_caliweed_psychedelics
>>
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
>> Recommended dosage: 3 =E2=80=93 4 g. dried mushrooms =E2=80=93 Strong ha=
llucinations take=20
>> over: a psychedelic flood of shapes, contours and colors will blend=20
>> together and hit the shores of your consciousness. There=E2=80=99s no st=
opping the=20
>> waves in Level 4. There will be some moments when you will lose touch=20
>> reality. Random, non-existent objects will appear and the concept of tim=
e=20
>> will fade away to the background. Intriguing to some, scary to others, t=
his=20
>> is the level where psychedelics can really be powerful, life-altering an=
d=20
>> mind expanding. Keep in mind that this dosage is only recommend for=20
>> experience users.
>> Level 5
>>
>> https://t.me/motionking_caliweed_psychedelics
>>
>> On Monday, June 3, 2024 at 4:06:43=E2=80=AFAM UTC+1 Asah Randy wrote:
>>
>>>
>>>
>>> =EE=A2=99
>>> 17 of 3504
>>> =EE=90=88
>>> =EE=90=89
>>> 4
>>>
>>> Skip to first unread message
>>> =EE=A5=84
>>> unread,
>>> Jun 27, 2018, 5:33:04=E2=80=AFPM=EE=97=94
>>> https://t.me/motionking_caliweed_psychedelics
>>>
>>> i'm trying to make jailhouse work on my ZCU102 v1.0 (production)
>>> using petalinux 2017.4 following this documentation :
>>>
>>> https://t.me/motionking_caliweed_psychedelics
>>>
>>>
>>> the second uart doesn't work. After a question on the Xilinx forum
>>>
>>> https://t.me/motionking_caliweed_psychedelics
>>>
>>> i can activate /dev/ttyPS1 on the zcu102 and verify it using
>>>
>>> echo hello > /dev/ttyPS1
>>>
>>> but i still can't use it with jailhouse.
>>>
>>>
>>> i have checked with the gic-demo and linux-demo without any success.
>>> i can use the debug console with gic-demo, but that's all.
>>>
>>> this command should work, but it doesn't :
>>>
>>> jailhouse cell linux zynqmp-zcu102-linux-demo.cell Image -d=20
>>> inmate-zynqmp-zcu102.dtb -i rootfs.cpio -c "console=3DttyPS1,115200"
>>>
>>>
>>> in the zynqmp-zcu102-linux-demo.c file, the uart address is correct :
>>>
>>> .mem_regions =3D {
>>> /* UART */ {
>>> .phys_start =3D 0xff010000,
>>> .virt_start =3D 0xff010000,
>>> .size =3D 0x1000,
>>> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>> JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED
>>> https://t.me/motionking_caliweed_psychedelics
>>> On Saturday, June 1, 2024 at 9:26:29=E2=80=AFAM UTC+1 Dwayne Mickey wro=
te:
>>>
>>>> Penis Envy magic mushrooms are three times more potent than other=20
>>>> mushrooms. The effects of Penis Envy magic mushrooms may come on quick=
ly=20
>>>> due to higher levels of psilocin than psilocybin.
>>>> About Penis Envy
>>>> Penis Envy magic mushrooms can impact you differently based upon a=20
>>>> variety of factors, like your size, weight, your state of health, whet=
her=20
>>>> you have taken them before, the amount you take, and more. The setting=
 in=20
>>>> which you are taking them and who you are with are critical factors. B=
eing=20
>>>> in nature, in a safe, calm and tranquil setting, with no pending press=
ures=20
>>>> or obligations is ideal for the user.=20
>>>>
>>>> Trip Level 0: Microdosing
>>>> Recommended dosage: 0.2 =E2=80=93 0.5 g. dried mushrooms =E2=80=93 A m=
icro-dose is a=20
>>>> sub-perceptual amount of mushrooms. Take this every 2-3 days to boost=
=20
>>>> creativity or feel less anxious. Microdosing trip levels capsules. Add=
ed as=20
>>>> level 0, it=E2=80=99s meant to be taken along with your day-to-day rou=
tine.
>>>> Trip Level 1: Happy go lucky
>>>> Recommended dosage: 0.8 =E2=80=93 1 g. dried mushrooms =E2=80=93 The e=
ffects are mild=20
>>>> and similar to being high on weed. Music starts to feel better, strang=
ers=20
>>>> seem more friendly and the mind is able to lose some control. You coul=
d=20
>>>> have mild visual enhancements or some sound distortion, but these will=
 be=20
>>>> subtle.
>>>> Trip Level 2: Beginner=E2=80=99s paradise
>>>> Recommended dosage: 1 =E2=80=93 1.5 g. dried mushrooms =E2=80=93 Consi=
stent sensorial=20
>>>> accentuation, colors becoming brighter and a light body high. Level 2 =
can=20
>>>> be a more intense form of Trip Level 1, but with the right dosage it c=
an be=20
>>>> something more. Be prepared for the beginnings of visual and auditory=
=20
>>>> hallucinations: objects moving and coming to life along with geometric=
al=20
>>>> forms when you close your eyes. It will be harder to concentrate and=
=20
>>>> communicate and you will notice an increase in creativity along with a=
n=20
>>>> enhanced sensation, lightness and euphoria.
>>>> Trip Level 3: Classic psychedelic trip
>>>> Recommended dosage: 1.5 =E2=80=93 3 g. dried mushrooms =E2=80=93 Trip =
Level 3 is great=20
>>>> for beginners who want to jump in the =E2=80=9Creal=E2=80=9D psychedel=
ic experience,=20
>>>> without overdoing the dosage. This level is where visual hallucination=
s=20
>>>> along with the appearance of patterns and fractals will be evident. No=
 more=20
>>>> hinting or subtle flashes of visuals, it=E2=80=99s happening for real.=
 The surface=20
>>>> of the object you=E2=80=99re observing will become shiny and moving, a=
s your field=20
>>>> of depth is altered. Distortions in the aptitude to measure the passag=
e of=20
>>>> time, might cause an 1 hour to feel like an eternity.
>>>> Level 4: Flying with the stars https:t.me/Ricko_swavy8
>>>> Recommended dosage: 3 =E2=80=93 4 g. dried mushrooms =E2=80=93 Strong =
hallucinations=20
>>>> take over: a psychedelic flood of shapes, contours and colors will ble=
nd=20
>>>> together and hit the shores of your consciousness. There=E2=80=99s no =
stopping the=20
>>>> waves in Level 4. There will be some moments when you will lose touch=
=20
>>>> reality. Random, non-existent objects will appear and the concept of t=
ime=20
>>>> will fade away to the background. Intriguing to some, scary to others,=
 this=20
>>>> is the level where psychedelics can really be powerful, life-altering =
and=20
>>>> mind expanding. Keep in mind that this dosage is only recommend for=20
>>>> experience users.
>>>> Level 5
>>>> :https:t.me/Ricko_swavy8
>>>>
>>>> On Thursday, June 28, 2018 at 12:49:45=E2=80=AFPM UTC+1 christophe...@=
gmail.com=20
>>>> wrote:
>>>>
>>>>> hi all,
>>>>>
>>>>> now i can see the output of the console and monitor the linux boot.
>>>>> And of course, linux doesn't boot and stop with a kernel panic :=20
>>>>>
>>>>> [ 9.148409] NET: Registered protocol family 1
>>>>> [ 9.200596] RPC: Registered named UNIX socket transport module.
>>>>> [ 9.271265] RPC: Registered udp transport module.
>>>>> [ 9.327501] RPC: Registered tcp transport module.
>>>>> [ 9.383752] RPC: Registered tcp NFSv4.1 backchannel transport module.
>>>>> [ 9.814860] Kernel panic - not syncing: write error
>>>>> [ 9.872207] CPU: 0 PID: 1 Comm: swapper/0 Not tainted=20
>>>>> 4.9.0-xilinx-v2017.4 #2
>>>>> [ 9.957622] Hardware name: Jailhouse cell on ZynqMP ZCU102 (DT)
>>>>> [ 10.028458] Call trace:
>>>>> [ 10.057635] [<ffffff8008088138>] dump_backtrace+0x0/0x198
>>>>> [ 10.122215] [<ffffff80080882e4>] show_stack+0x14/0x20
>>>>> [ 10.182634] [<ffffff80083de594>] dump_stack+0x94/0xb8
>>>>> [ 10.243054] [<ffffff800812e9f8>] panic+0x114/0x25c
>>>>> [ 10.300347] [<ffffff8008cc2d8c>] populate_rootfs+0x40/0x110
>>>>> [ 10.367014] [<ffffff80080830b8>] do_one_initcall+0x38/0x128
>>>>> [ 10.433683] [<ffffff8008cc0c94>] kernel_init_freeable+0x140/0x1e0
>>>>> [ 10.506604] [<ffffff80089494e0>] kernel_init+0x10/0x100
>>>>> [ 10.569104] [<ffffff8008082e80>] ret_from_fork+0x10/0x50
>>>>> [ 10.632647] SMP: stopping secondary CPUs
>>>>> [ 10.679537] ---[ end Kernel panic - not syncing: write error
>>>>>
>>>>> i can see a write error, but i don't know why.
>>>>> i have attached the boot log file.
>>>>>
>>>>> Any hints ?
>>>>>
>>>>> Regards=20
>>>>> C.Alexandre=20
>>>>>
>>>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/35e3e9a1-c599-4570-b9a7-a97b9fd74813n%40googlegroups.com.

------=_Part_142478_1670895431.1717891929909
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br /></div><div>https://t.me/motionking_caliweed_psychedelics<br /></=
div><span tabindex=3D"0" role=3D"listitem" aria-expanded=3D"true" style=3D"=
border-bottom: 1px solid rgb(232, 234, 237); padding-top: 8px; padding-left=
: 0px; border-left: 2px solid rgb(77, 144, 240);"><div tabindex=3D"-1" styl=
e=3D"outline: none;"><div style=3D"display: flex;"><div style=3D"flex-grow:=
 1; min-width: 0px;"><div role=3D"region" aria-labelledby=3D"c2473" style=
=3D"margin: 12px 0px; overflow: auto; padding-right: 20px;"><div style=3D"c=
olor: rgb(80, 0, 80);"><div>Recommended dosage: 3 =E2=80=93 4 g. dried mush=
rooms =E2=80=93 Strong hallucinations take over: a psychedelic flood of sha=
pes, contours and colors will blend together and hit the shores of your con=
sciousness. There=E2=80=99s no stopping the waves in Level 4. There will be=
 some moments when you will lose touch reality. Random, non-existent object=
s will appear and the concept of time will fade away to the background. Int=
riguing to some, scary to others, this is the level where psychedelics can =
really be powerful, life-altering and mind expanding. Keep in mind that thi=
s dosage is only recommend for experience users.</div><div>Level 5</div><di=
v><br /></div></div><div><a href=3D"https://t.me/motionking_caliweed_psyche=
delics" target=3D"_blank" rel=3D"nofollow" style=3D"color: rgb(26, 115, 232=
);">https://t.me/motionking_caliweed_psychedelics</a></div></div></div></di=
v><div><div></div></div></div></span><span tabindex=3D"0" role=3D"listitem"=
 aria-expanded=3D"true" style=3D"border-bottom: none; padding-top: 8px; pad=
ding-left: 2px;"><div tabindex=3D"-1" style=3D"outline: none;"><div style=
=3D"display: flex;"><div aria-hidden=3D"true" style=3D"padding: 16px;"><div=
 style=3D"position: relative;">https://t.me/motionking_caliweed_psychedelic=
s<br /></div></div></div></div></span>https://t.me/motionking_caliweed_psyc=
hedelics<br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_a=
ttr">On Sunday, June 9, 2024 at 1:10:20=E2=80=AFAM UTC+1 Asah Randy wrote:<=
br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; b=
order-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><div><a href=
=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" style=
=3D"color:rgb(26,115,232)" target=3D"_blank" data-saferedirecturl=3D"https:=
//www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_caliweed_psych=
edelics&amp;source=3Dgmail&amp;ust=3D1717978222173000&amp;usg=3DAOvVaw1nLYY=
5CON7noQuSpUtFcts">https://t.me/motionking_caliweed_psychedelics</a><br></d=
iv><div><br></div><div><a href=3D"https://t.me/motionking_caliweed_psychede=
lics" rel=3D"nofollow" style=3D"color:rgb(26,115,232)" target=3D"_blank" da=
ta-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.=
me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1717978222=
173000&amp;usg=3DAOvVaw1nLYY5CON7noQuSpUtFcts">https://t.me/motionking_cali=
weed_psychedelics</a><br></div><div style=3D"color:rgb(80,0,80)">Penis Envy=
 magic mushrooms are three times more potent than other mushrooms. The effe=
cts of Penis Envy magic mushrooms may come on quickly due to higher levels =
of psilocin than psilocybin.<div>About Penis Envy</div><div>Penis Envy magi=
c mushrooms can impact you differently based upon a variety of factors, lik=
e your size, weight, your state of health, whether you have taken them befo=
re, the amount you take, and more. The setting in which you are taking them=
 and who you are with are critical factors. Being in nature, in a safe, cal=
m and tranquil setting, with no pending pressures or obligations is ideal f=
or the user.=C2=A0</div><div><br></div><div>Trip Level 0: Microdosing</div>=
<div>Recommended dosage: 0.2 =E2=80=93 0.5 g. dried mushrooms =E2=80=93 A m=
icro-dose is a sub-perceptual amount of mushrooms. Take this every 2-3 days=
 to boost creativity or feel less anxious. Microdosing trip levels capsules=
. Added as level 0, it=E2=80=99s meant to be taken along with your day-to-d=
ay routine.</div><div>Trip Level 1: Happy go lucky</div><div>Recommended do=
sage: 0.8 =E2=80=93 1 g. dried mushrooms =E2=80=93 The effects are mild and=
 similar to being high on weed. Music starts to feel better, strangers seem=
 more friendly and the mind is able to lose some control. You could have mi=
ld visual enhancements or some sound distortion, but these will be subtle.<=
/div><div>Trip Level 2: Beginner=E2=80=99s paradise</div><div>Recommended d=
osage: 1 =E2=80=93 1.5 g. dried mushrooms =E2=80=93 Consistent sensorial ac=
centuation, colors becoming brighter and a light body high. Level 2 can be =
a more intense form of Trip Level 1, but with the right dosage it can be so=
mething more. Be prepared for the beginnings of visual and auditory halluci=
nations: objects moving and coming to life along with geometrical forms whe=
n you close your eyes. It will be harder to concentrate and communicate and=
 you will notice an increase in creativity along with an enhanced sensation=
, lightness and euphoria.</div><div>Trip Level 3: Classic psychedelic trip<=
/div><div>Recommended dosage: 1.5 =E2=80=93 3 g. dried mushrooms =E2=80=93 =
Trip Level 3 is great for beginners who want to jump in the =E2=80=9Creal=
=E2=80=9D psychedelic experience, without overdoing the dosage. This level =
is where visual hallucinations along with the appearance of patterns and fr=
actals will be evident. No more hinting or subtle flashes of visuals, it=E2=
=80=99s happening for real. The surface of the object you=E2=80=99re observ=
ing will become shiny and moving, as your field of depth is altered. Distor=
tions in the aptitude to measure the passage of time, might cause an 1 hour=
 to feel like an eternity.</div></div><div>Level 4: Flying with the stars h=
ttps:<a href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofol=
low" style=3D"color:rgb(26,115,232)" target=3D"_blank" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_cali=
weed_psychedelics&amp;source=3Dgmail&amp;ust=3D1717978222173000&amp;usg=3DA=
OvVaw1nLYY5CON7noQuSpUtFcts">https://t.me/motionking_caliweed_psychedelics<=
/a></div><div style=3D"color:rgb(80,0,80)"><div><br></div></div><a href=3D"=
https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" style=3D"co=
lor:rgb(26,115,232)" target=3D"_blank" data-saferedirecturl=3D"https://www.=
google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelic=
s&amp;source=3Dgmail&amp;ust=3D1717978222173000&amp;usg=3DAOvVaw1nLYY5CON7n=
oQuSpUtFcts">https://t.me/motionking_caliweed_psychedelics</a><br><div clas=
s=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Monday, June 3,=
 2024 at 4:10:23=E2=80=AFAM UTC+1 Asah Randy wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div><a href=3D"https://t.me/motionking_caliw=
eed_psychedelics" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_cali=
weed_psychedelics&amp;source=3Dgmail&amp;ust=3D1717978222173000&amp;usg=3DA=
OvVaw1nLYY5CON7noQuSpUtFcts">https://t.me/motionking_caliweed_psychedelics<=
/a><br></div><div><br></div>Penis Envy magic mushrooms are three times more=
 potent than other mushrooms. The effects of Penis Envy magic mushrooms may=
 come on quickly due to higher levels of psilocin than psilocybin.<div>Abou=
t Penis Envy</div><div>Penis Envy magic mushrooms can impact you differentl=
y based upon a variety of factors, like your size, weight, your state of he=
alth, whether you have taken them before, the amount you take, and more. Th=
e setting in which you are taking them and who you are with are critical fa=
ctors. Being in nature, in a safe, calm and tranquil setting, with no pendi=
ng pressures or obligations is ideal for the user.=C2=A0</div><div><br></di=
v><div>Trip Level 0: Microdosing</div><div>Recommended dosage: 0.2 =E2=80=
=93 0.5 g. dried mushrooms =E2=80=93 A micro-dose is a sub-perceptual amoun=
t of mushrooms. Take this every 2-3 days to boost creativity or feel less a=
nxious. Microdosing trip levels capsules. Added as level 0, it=E2=80=99s me=
ant to be taken along with your day-to-day routine.</div><div>Trip Level 1:=
 Happy go lucky</div><div>Recommended dosage: 0.8 =E2=80=93 1 g. dried mush=
rooms =E2=80=93 The effects are mild and similar to being high on weed. Mus=
ic starts to feel better, strangers seem more friendly and the mind is able=
 to lose some control. You could have mild visual enhancements or some soun=
d distortion, but these will be subtle.</div><div>Trip Level 2: Beginner=E2=
=80=99s paradise</div><div>Recommended dosage: 1 =E2=80=93 1.5 g. dried mus=
hrooms =E2=80=93 Consistent sensorial accentuation, colors becoming brighte=
r and a light body high. Level 2 can be a more intense form of Trip Level 1=
, but with the right dosage it can be something more. Be prepared for the b=
eginnings of visual and auditory hallucinations: objects moving and coming =
to life along with geometrical forms when you close your eyes. It will be h=
arder to concentrate and communicate and you will notice an increase in cre=
ativity along with an enhanced sensation, lightness and euphoria.</div><div=
>Trip Level 3: Classic psychedelic trip</div><div>Recommended dosage: 1.5 =
=E2=80=93 3 g. dried mushrooms =E2=80=93 Trip Level 3 is great for beginner=
s who want to jump in the =E2=80=9Creal=E2=80=9D psychedelic experience, wi=
thout overdoing the dosage. This level is where visual hallucinations along=
 with the appearance of patterns and fractals will be evident. No more hint=
ing or subtle flashes of visuals, it=E2=80=99s happening for real. The surf=
ace of the object you=E2=80=99re observing will become shiny and moving, as=
 your field of depth is altered. Distortions in the aptitude to measure the=
 passage of time, might cause an 1 hour to feel like an eternity.</div><div=
>Level 4: Flying with the stars https:<a href=3D"https://t.me/motionking_ca=
liweed_psychedelics" rel=3D"nofollow" target=3D"_blank" data-saferedirectur=
l=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_cal=
iweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1717978222173000&amp;usg=3D=
AOvVaw1nLYY5CON7noQuSpUtFcts">https://t.me/motionking_caliweed_psychedelics=
</a></div><div><br></div><div>Recommended dosage: 3 =E2=80=93 4 g. dried mu=
shrooms =E2=80=93 Strong hallucinations take over: a psychedelic flood of s=
hapes, contours and colors will blend together and hit the shores of your c=
onsciousness. There=E2=80=99s no stopping the waves in Level 4. There will =
be some moments when you will lose touch reality. Random, non-existent obje=
cts will appear and the concept of time will fade away to the background. I=
ntriguing to some, scary to others, this is the level where psychedelics ca=
n really be powerful, life-altering and mind expanding. Keep in mind that t=
his dosage is only recommend for experience users.</div><div>Level 5</div><=
div><br></div><div><a href=3D"https://t.me/motionking_caliweed_psychedelics=
" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www.go=
ogle.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&=
amp;source=3Dgmail&amp;ust=3D1717978222173000&amp;usg=3DAOvVaw1nLYY5CON7noQ=
uSpUtFcts">https://t.me/motionking_caliweed_psychedelics</a><br></div><br><=
div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Monday,=
 June 3, 2024 at 4:06:43=E2=80=AFAM UTC+1 Asah Randy wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div><br></div><div style=3D"border-b=
ottom:1px solid rgb(232,234,237);display:flex;min-height:51px"><div style=
=3D"display:flex;margin-left:auto"><br><div style=3D"border-left:1px solid =
rgb(221,221,221);display:inline-block;min-height:20px;margin:12px"></div><d=
iv role=3D"button" aria-label=3D"You need the content moderator permission =
to delete conversations" aria-disabled=3D"true" style=3D"border:0px;border-=
radius:50%;display:inline-block;min-height:40px;outline:none;overflow:hidde=
n;text-align:center;width:40px;color:rgb(154,160,166)"><div style=3D"backgr=
ound-size:cover;opacity:0;background-image:radial-gradient(circle farthest-=
side,rgba(95,99,104,0.16),rgba(95,99,104,0.16) 80%,rgba(95,99,104,0) 100%)"=
></div><span style=3D"display:flex;min-height:40px;width:40px"><span style=
=3D"display:flex"></span></span></div><div role=3D"button" aria-label=3D"Yo=
u need the content moderator permission to lock conversations" aria-disable=
d=3D"true" style=3D"border:0px;border-radius:50%;display:inline-block;min-h=
eight:40px;outline:none;overflow:hidden;text-align:center;width:40px;color:=
rgb(154,160,166)"><div style=3D"background-size:cover;opacity:0;background-=
image:radial-gradient(circle farthest-side,rgba(95,99,104,0.16),rgba(95,99,=
104,0.16) 80%,rgba(95,99,104,0) 100%)"></div><span style=3D"display:flex;mi=
n-height:40px;width:40px"><span style=3D"display:flex"><span aria-hidden=3D=
"true" style=3D"font-family:&quot;Material Icons Extended&quot;;font-size:2=
0px;line-height:1;display:inline-block;direction:ltr;font-feature-settings:=
&quot;liga&quot;">=EE=A2=99</span></span></span></div><div style=3D"border-=
left:1px solid rgb(221,221,221);display:inline-block;min-height:20px;margin=
:12px"></div><div style=3D"display:flex;margin-left:8px"><div><div style=3D=
"display:flex;color:rgb(95,99,104);min-height:32px"><div style=3D"font-fami=
ly:Roboto,Arial,sans-serif;letter-spacing:0.2px;line-height:20px;display:fl=
ex">17 of 3504</div><div role=3D"button" aria-label=3D"Previous" style=3D"b=
order:0px;border-radius:50%;display:inline-block;min-height:48px;outline:no=
ne;overflow:hidden;text-align:center;width:48px"><div style=3D"background-s=
ize:cover;opacity:0;background-image:radial-gradient(circle farthest-side,r=
gba(95,99,104,0.16),rgba(95,99,104,0.16) 80%,rgba(95,99,104,0) 100%)"></div=
><span style=3D"display:flex;min-height:48px;width:48px"><span style=3D"dis=
play:flex"><span aria-hidden=3D"true" style=3D"font-family:&quot;Material I=
cons Extended&quot;;font-size:24px;line-height:1;display:inline-block;direc=
tion:ltr;font-feature-settings:&quot;liga&quot;">=EE=90=88</span></span></s=
pan></div><div role=3D"button" aria-label=3D"Next" style=3D"border:0px;bord=
er-radius:50%;display:inline-block;min-height:48px;outline:none;overflow:hi=
dden;text-align:center;width:48px"><div style=3D"background-size:cover;opac=
ity:0;background-image:radial-gradient(circle farthest-side,rgba(95,99,104,=
0.16),rgba(95,99,104,0.16) 80%,rgba(95,99,104,0) 100%)"></div><span style=
=3D"display:flex;min-height:48px;width:48px"><span style=3D"display:flex"><=
span aria-hidden=3D"true" style=3D"font-family:&quot;Material Icons Extende=
d&quot;;font-size:24px;line-height:1;display:inline-block;direction:ltr;fon=
t-feature-settings:&quot;liga&quot;">=EE=90=89</span></span></span></div></=
div></div></div></div></div><div style=3D"overflow-y:auto;outline:none"><di=
v style=3D"display:flex"><div style=3D"display:flex;min-width:0px"><div sty=
le=3D"display:flex;padding:16px 16px 16px 0px"><span style=3D"display:inlin=
e-block;padding:0px;font-family:&quot;Google Sans&quot;,Roboto,Arial,sans-s=
erif;font-size:22px;line-height:28px;color:rgb(32,33,36);margin:0px;outline=
:none;word-break:break-word">4</span></div><div style=3D"color:rgb(95,99,10=
4);display:inline-block"><br></div></div><div style=3D"display:flex"><div r=
ole=3D"button" style=3D"border:0px;border-radius:4px;color:rgb(95,99,104);d=
isplay:inline-block;font-family:&quot;Google Sans&quot;,Roboto,Arial,sans-s=
erif;letter-spacing:0.25px;line-height:36px;min-width:auto;outline:none;ove=
rflow:hidden;text-align:center;min-height:1px"><div style=3D"background-siz=
e:cover;opacity:0;background-image:radial-gradient(circle farthest-side,rgb=
a(0,0,0,0.12),rgba(0,0,0,0.12) 80%,rgba(0,0,0,0) 100%)"></div><div style=3D=
"background-color:rgb(95,99,104);opacity:0"></div><span style=3D"display:fl=
ex;padding:0px 8px"><span style=3D"display:inline-block;margin:0px">Skip to=
 first unread message</span></span></div><div><div role=3D"button" aria-lab=
el=3D"Collapse all" style=3D"border:0px;border-radius:50%;display:inline-bl=
ock;min-height:48px;outline:none;overflow:hidden;text-align:center;width:48=
px;color:rgb(95,99,104)"><div style=3D"background-size:cover;opacity:0;back=
ground-image:radial-gradient(circle farthest-side,rgba(95,99,104,0.16),rgba=
(95,99,104,0.16) 80%,rgba(95,99,104,0) 100%)"></div><span style=3D"display:=
flex;min-height:48px;width:48px"><span style=3D"display:flex"><span aria-hi=
dden=3D"true" style=3D"font-family:&quot;Material Icons Extended&quot;;font=
-size:20px;line-height:1;display:inline-block;direction:ltr;font-feature-se=
ttings:&quot;liga&quot;">=EE=A5=84</span></span></span></div></div></div></=
div><div role=3D"list" aria-label=3D"jailhouse + ZCU102 V1.0 + second UART =
problem + petalinux 2017.4"><span role=3D"listitem" aria-expanded=3D"true" =
style=3D"border-bottom:1px solid rgb(232,234,237);padding-top:8px;padding-l=
eft:0px;border-left:2px solid rgb(77,144,240)"><div style=3D"outline:none">=
<div style=3D"display:flex"><div style=3D"min-width:0px"><div><div style=3D=
"color:rgb(95,99,104);display:flex;min-height:48px"><span style=3D"min-heig=
ht:1px;margin:0px;overflow:hidden;padding:0px;white-space:nowrap;width:1px"=
>unread,</span><div style=3D"font-family:Roboto,Arial,sans-serif;font-size:=
12px;letter-spacing:0.3px;line-height:16px;display:flex">Jun 27, 2018, 5:33=
:04=E2=80=AFPM<span style=3D"font-family:&quot;Material Icons Extended&quot=
;;font-size:20px;letter-spacing:normal;text-align:center">=EE=97=94</span><=
/div></div></div><div role=3D"region" aria-labelledby=3D"c14597" style=3D"m=
argin:12px 0px;overflow:auto;padding-right:20px"><a href=3D"https://t.me/mo=
tionking_caliweed_psychedelics" rel=3D"nofollow" target=3D"_blank" data-saf=
eredirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/mot=
ionking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1717978222173000=
&amp;usg=3DAOvVaw1nLYY5CON7noQuSpUtFcts">https://t.me/motionking_caliweed_p=
sychedelics</a></div></div></div></div></span></div></div><div style=3D"ove=
rflow-y:auto;outline:none"><div role=3D"list" aria-label=3D"jailhouse + ZCU=
102 V1.0 + second UART problem + petalinux 2017.4"><span role=3D"listitem" =
aria-expanded=3D"true" style=3D"border-bottom:1px solid rgb(232,234,237);pa=
dding-top:8px;padding-left:0px;border-left:2px solid rgb(77,144,240)"><div =
style=3D"outline:none"><div style=3D"display:flex"><div style=3D"min-width:=
0px"><div role=3D"region" aria-labelledby=3D"c14597" style=3D"margin:12px 0=
px;overflow:auto;padding-right:20px"><br><p>i&#39;m trying to make jailhous=
e work on my ZCU102 v1.0 (production)<br>using petalinux 2017.4 following t=
his documentation :</p></div></div></div></div></span></div></div><div styl=
e=3D"overflow-y:auto;outline:none"><div role=3D"list" aria-label=3D"jailhou=
se + ZCU102 V1.0 + second UART problem + petalinux 2017.4"><span role=3D"li=
stitem" aria-expanded=3D"true" style=3D"border-bottom:1px solid rgb(232,234=
,237);padding-top:8px;padding-left:0px;border-left:2px solid rgb(77,144,240=
)"><div style=3D"outline:none"><div style=3D"display:flex"><div style=3D"mi=
n-width:0px"><div role=3D"region" aria-labelledby=3D"c14597" style=3D"margi=
n:12px 0px;overflow:auto;padding-right:20px"><p><a href=3D"https://t.me/mot=
ionking_caliweed_psychedelics" rel=3D"nofollow" target=3D"_blank" data-safe=
redirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/moti=
onking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1717978222173000&=
amp;usg=3DAOvVaw1nLYY5CON7noQuSpUtFcts">https://t.me/motionking_caliweed_ps=
ychedelics</a><br></p></div></div></div></div></span></div></div><div style=
=3D"overflow-y:auto;outline:none"><div role=3D"list" aria-label=3D"jailhous=
e + ZCU102 V1.0 + second UART problem + petalinux 2017.4"><span role=3D"lis=
titem" aria-expanded=3D"true" style=3D"border-bottom:1px solid rgb(232,234,=
237);padding-top:8px;padding-left:0px;border-left:2px solid rgb(77,144,240)=
"><div style=3D"outline:none"><div style=3D"display:flex"><div style=3D"min=
-width:0px"><div role=3D"region" aria-labelledby=3D"c14597" style=3D"margin=
:12px 0px;overflow:auto;padding-right:20px"><p><br>the second uart doesn&#3=
9;t work. After a question on the Xilinx forum</p></div></div></div></div><=
/span></div></div><div style=3D"overflow-y:auto;outline:none"><div role=3D"=
list" aria-label=3D"jailhouse + ZCU102 V1.0 + second UART problem + petalin=
ux 2017.4"><span role=3D"listitem" aria-expanded=3D"true" style=3D"border-b=
ottom:1px solid rgb(232,234,237);padding-top:8px;padding-left:0px;border-le=
ft:2px solid rgb(77,144,240)"><div style=3D"outline:none"><div style=3D"dis=
play:flex"><div style=3D"min-width:0px"><div role=3D"region" aria-labelledb=
y=3D"c14597" style=3D"margin:12px 0px;overflow:auto;padding-right:20px"><p>=
<a href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" =
target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3De=
n&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&=
amp;ust=3D1717978222173000&amp;usg=3DAOvVaw1nLYY5CON7noQuSpUtFcts">https://=
t.me/motionking_caliweed_psychedelics</a><br></p></div></div></div></div></=
span></div></div><div style=3D"overflow-y:auto;outline:none"><div role=3D"l=
ist" aria-label=3D"jailhouse + ZCU102 V1.0 + second UART problem + petalinu=
x 2017.4"><span role=3D"listitem" aria-expanded=3D"true" style=3D"border-bo=
ttom:1px solid rgb(232,234,237);padding-top:8px;padding-left:0px;border-lef=
t:2px solid rgb(77,144,240)"><div style=3D"outline:none"><div style=3D"disp=
lay:flex"><div style=3D"min-width:0px"><div role=3D"region" aria-labelledby=
=3D"c14597" style=3D"margin:12px 0px;overflow:auto;padding-right:20px"><p>i=
 can activate /dev/ttyPS1 on the zcu102 and verify it using</p><p>echo hell=
o &gt; /dev/ttyPS1</p><p>but i still can&#39;t use it with jailhouse.</p><p=
><br>i have checked with the gic-demo and linux-demo without any success.<b=
r>i can use the debug console with gic-demo, but that&#39;s all.</p><p>this=
 command should work, but it doesn&#39;t :</p><p>jailhouse cell linux zynqm=
p-zcu102-linux-demo.cell Image -d inmate-zynqmp-zcu102.dtb -i rootfs.cpio -=
c &quot;console=3DttyPS1,115200&quot;</p><p><br>in the zynqmp-zcu102-linux-=
demo.c file, the uart address is correct :</p><p>.mem_regions =3D {<br>/* U=
ART */ {<br>.phys_start =3D 0xff010000,<br>.virt_start =3D 0xff010000,<br>.=
size =3D 0x1000,<br>.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<b=
r>JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED</p></div></div></div></div></=
span></div></div><div style=3D"overflow-y:auto;outline:none"><div role=3D"l=
ist" aria-label=3D"jailhouse + ZCU102 V1.0 + second UART problem + petalinu=
x 2017.4"><span role=3D"listitem" aria-expanded=3D"true" style=3D"border-bo=
ttom:1px solid rgb(232,234,237);padding-top:8px;padding-left:0px;border-lef=
t:2px solid rgb(77,144,240)"><div style=3D"outline:none"><div style=3D"disp=
lay:flex"><div style=3D"min-width:0px"><div role=3D"region" aria-labelledby=
=3D"c14597" style=3D"margin:12px 0px;overflow:auto;padding-right:20px"></di=
v></div></div></div></span></div></div><a href=3D"https://t.me/motionking_c=
aliweed_psychedelics" rel=3D"nofollow" target=3D"_blank" data-saferedirectu=
rl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_ca=
liweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1717978222173000&amp;usg=
=3DAOvVaw1nLYY5CON7noQuSpUtFcts">https://t.me/motionking_caliweed_psychedel=
ics</a><br><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr=
">On Saturday, June 1, 2024 at 9:26:29=E2=80=AFAM UTC+1 Dwayne Mickey wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Penis Envy magic mus=
hrooms are three times more potent than other mushrooms.  The effects of Pe=
nis Envy magic mushrooms may come on quickly due to higher levels of psiloc=
in than psilocybin.<div>About Penis Envy</div><div>Penis Envy magic mushroo=
ms can impact you differently based upon a variety of factors, like your si=
ze, weight, your state of health, whether you have taken them before, the a=
mount you take, and more.  The setting in which you are taking them and who=
 you are with are critical factors.  Being in nature, in a safe, calm and t=
ranquil setting, with no pending pressures or obligations is ideal for the =
user.=C2=A0</div><div><br></div><div>Trip Level 0: Microdosing</div><div>Re=
commended dosage: 0.2 =E2=80=93 0.5 g. dried mushrooms =E2=80=93 A micro-do=
se is a sub-perceptual amount of mushrooms. Take this every 2-3 days to boo=
st creativity or feel less anxious. Microdosing trip levels capsules. Added=
 as level 0, it=E2=80=99s meant to be taken along with your day-to-day rout=
ine.</div><div>Trip Level 1: Happy go lucky</div><div>Recommended dosage: 0=
.8 =E2=80=93 1 g. dried mushrooms =E2=80=93 The effects are mild and simila=
r to being high on weed. Music starts to feel better, strangers seem more f=
riendly and the mind is able to lose some control. You could have mild visu=
al enhancements or some sound distortion, but these will be subtle.</div><d=
iv>Trip Level 2: Beginner=E2=80=99s paradise</div><div>Recommended dosage: =
1 =E2=80=93 1.5 g. dried mushrooms =E2=80=93 Consistent sensorial accentuat=
ion, colors becoming brighter and a light body high. Level 2 can be a more =
intense form of Trip Level 1, but with the right dosage it can be something=
 more. Be prepared for the beginnings of visual and auditory hallucinations=
: objects moving and coming to life along with geometrical forms when you c=
lose your eyes. It will be harder to concentrate and communicate and you wi=
ll notice an increase in creativity along with an enhanced sensation, light=
ness and euphoria.</div><div>Trip Level 3: Classic psychedelic trip</div><d=
iv>Recommended dosage: 1.5 =E2=80=93 3 g. dried mushrooms =E2=80=93 Trip Le=
vel 3 is great for beginners who want to jump in the =E2=80=9Creal=E2=80=9D=
 psychedelic experience, without overdoing the dosage. This level is where =
visual hallucinations along with the appearance of patterns and fractals wi=
ll be evident. No more hinting or subtle flashes of visuals, it=E2=80=99s h=
appening for real. The surface of the object you=E2=80=99re observing will =
become shiny and moving, as your field of depth is altered. Distortions in =
the aptitude to measure the passage of time, might cause an 1 hour to feel =
like an eternity.</div><div>Level 4: Flying with the stars https:<a href=3D=
"http://t.me/Ricko_swavy8" rel=3D"nofollow" target=3D"_blank" data-saferedi=
recturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttp://t.me/Ricko_swa=
vy8&amp;source=3Dgmail&amp;ust=3D1717978222173000&amp;usg=3DAOvVaw0HsTLDDvi=
qYWHGzqvH9RGo">t.me/Ricko_swavy8</a></div><div>Recommended dosage: 3 =E2=80=
=93 4 g. dried mushrooms =E2=80=93 Strong hallucinations take over: a psych=
edelic flood of shapes, contours and colors will blend together and hit the=
 shores of your consciousness. There=E2=80=99s no stopping the waves in Lev=
el 4. There will be some moments when you will lose touch reality. Random, =
non-existent objects will appear and the concept of time will fade away to =
the background. Intriguing to some, scary to others, this is the level wher=
e psychedelics can really be powerful, life-altering and mind expanding. Ke=
ep in mind that this dosage is only recommend for experience users.</div><d=
iv>Level 5</div><div>:https:<a href=3D"http://t.me/Ricko_swavy8" rel=3D"nof=
ollow" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url=
?hl=3Den&amp;q=3Dhttp://t.me/Ricko_swavy8&amp;source=3Dgmail&amp;ust=3D1717=
978222173000&amp;usg=3DAOvVaw0HsTLDDviqYWHGzqvH9RGo">t.me/Ricko_swavy8</a><=
br><br></div><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_at=
tr">On Thursday, June 28, 2018 at 12:49:45=E2=80=AFPM UTC+1 <a rel=3D"nofol=
low">christophe...@gmail.com</a> wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">hi all,<p>now i can see the output of the console and mon=
itor the linux boot.<br>And of course, linux doesn&#39;t boot and stop with=
 a kernel panic : <p>[    9.148409] NET: Registered protocol family 1<br>[ =
   9.200596] RPC: Registered named UNIX socket transport module.<br>[    9.=
271265] RPC: Registered udp transport module.<br>[    9.327501] RPC: Regist=
ered tcp transport module.<br>[    9.383752] RPC: Registered tcp NFSv4.1 ba=
ckchannel transport module.<br>[    9.814860] Kernel panic - not syncing: w=
rite error<br>[    9.872207] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.9.=
0-xilinx-v2017.4 #2<br>[    9.957622] Hardware name: Jailhouse cell on Zynq=
MP ZCU102 (DT)<br>[   10.028458] Call trace:<br>[   10.057635] [&lt;ffffff8=
008088138&gt;] dump_backtrace+0x0/0x198<br>[   10.122215] [&lt;ffffff800808=
82e4&gt;] show_stack+0x14/0x20<br>[   10.182634] [&lt;ffffff80083de594&gt;]=
 dump_stack+0x94/0xb8<br>[   10.243054] [&lt;ffffff800812e9f8&gt;] panic+0x=
114/0x25c<br>[   10.300347] [&lt;ffffff8008cc2d8c&gt;] populate_rootfs+0x40=
/0x110<br>[   10.367014] [&lt;ffffff80080830b8&gt;] do_one_initcall+0x38/0x=
128<br>[   10.433683] [&lt;ffffff8008cc0c94&gt;] kernel_init_freeable+0x140=
/0x1e0<br>[   10.506604] [&lt;ffffff80089494e0&gt;] kernel_init+0x10/0x100<=
br>[   10.569104] [&lt;ffffff8008082e80&gt;] ret_from_fork+0x10/0x50<br>[  =
 10.632647] SMP: stopping secondary CPUs<br>[   10.679537] ---[ end Kernel =
panic - not syncing: write error<p>i can see a write error, but i don&#39;t=
 know why.<br>i have attached the boot log file.<p>Any hints ?<p>Regards <b=
r>C.Alexandre </p></p></p></p></p></blockquote></div></blockquote></div></b=
lockquote></div></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/35e3e9a1-c599-4570-b9a7-a97b9fd74813n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/35e3e9a1-c599-4570-b9a7-a97b9fd74813n%40googlegroups.co=
m</a>.<br />

------=_Part_142478_1670895431.1717891929909--

------=_Part_142477_1253963868.1717891929909--
