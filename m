Return-Path: <jailhouse-dev+bncBCDKHIWT5EIBBPMOW6RQMGQEX25H5KI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113e.google.com (mail-yw1-x113e.google.com [IPv6:2607:f8b0:4864:20::113e])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BAB70F05D
	for <lists+jailhouse-dev@lfdr.de>; Wed, 24 May 2023 10:13:50 +0200 (CEST)
Received: by mail-yw1-x113e.google.com with SMTP id 00721157ae682-56552a72cfbsf12994547b3.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 24 May 2023 01:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684916029; x=1687508029;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g5QE6pUvOmAlC6ITd5OFjnEmj5A8itMuv2h36iGwy+g=;
        b=GlGZutvt+1higeOvsvEZgSZafrbH9wkjwgK1kG+r9nmu9SLgVCkaeXNvGbzLLSBqQf
         iBA0IJHw/prR4t6pIB/15eZ0s4MZM69gx9+Vpj/ITqN9DJF2ZgXax6VHPeiHQKID1GiZ
         5HLl9LaI/mqEi3z+njz3p9O/TSEQdmLv+DoJkW6v7BcRxPI11iGkx+bU24sKNrw4bMRK
         IEsuo6wkgvJGBc2NP/Pou1S4TZ960yWuHk28WtyUT9pfe4UIkdpv19O5hAke4IRfHHmS
         hOm0xNoNdH5YAvBmX72p0MEil6O52WdD0WXYY/9JYrIJbgPOVk7aGPbr91annLoMNpRy
         WDEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684916029; x=1687508029;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5QE6pUvOmAlC6ITd5OFjnEmj5A8itMuv2h36iGwy+g=;
        b=L4kb7pRqaZZBgwwjD5eH8AH7FePzJYbZ1nGzuvEfpGNwXNrPPt09TsLAfJ+Qu6w1Ne
         kdVMQSdhqc7ODOjYRnLUpsEkI4Cs0bgIax6hGqDtN2/G6W1pYJPR/xCSVZDSQ/ofOGvc
         jue3u+/Y0smuBlCD7osOnEzQeAP/0pg6oV8mFJfMjos8VrqphL4wMC/me+zl5L4PPBXH
         weTsUmxSQzcEjyY3okl0rhmkF39K1H2diyZxlNdgaPQu3VIwzucITiyLQEp0BfOyoynG
         pBulR1wry707vIAYrXe9XX3f+JwjHyoWS8SgIVp9VKRj1Nzf4xRfP14+9rY/2XObOjff
         9hPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684916029; x=1687508029;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g5QE6pUvOmAlC6ITd5OFjnEmj5A8itMuv2h36iGwy+g=;
        b=f/f/sDpT8LMOQEHHMe955k0KcXZVaEu+pw8D/J7WjhN0MndiKey3vhdjoU8YU3k2Zv
         N8hc4rehEHeFfFClBtwDM2NoLJuutATR2tbrxzFRAp92v6+xT6qIl9Sf5rS4wpzqxN/Q
         5Q1B8Aqh4eqt/ASteVvn1kvXb4Ok/q07vpiAy068nM3I0gRMKo9OxH+Ynh7cA0pxPrgf
         LjPp1Vp2hQCy4nkrqC2vw7NGXNeAaQb0QuYWyLkjREFvE1MJEBZN5uXRpuc8jyDLBoXL
         iemRYFKEuK0eP6zUUfsNLqibAxKC/Wq1UcTdwkByTpn6/6gUQWDxUsbVGxnWQu8Trk6G
         YA6Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDw2ZFKu+avKzRQZXj9OkwsRBnIb1WjjF635XY1KTirPah6Y0R0+
	0Pz8+SXM7t+LxhPIftmUoXA=
X-Google-Smtp-Source: ACHHUZ5FI9ZD+G0J6osmcRl1B4oU7+5++vib/tNIewszQgykhBKSP6JaXGY25/Qni1aDl1J9zuNtaw==
X-Received: by 2002:a81:b717:0:b0:560:d237:43dc with SMTP id v23-20020a81b717000000b00560d23743dcmr10596255ywh.3.1684916029582;
        Wed, 24 May 2023 01:13:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:42c2:0:b0:ba8:2296:4371 with SMTP id p185-20020a2542c2000000b00ba822964371ls4722682yba.0.-pod-prod-01-us;
 Wed, 24 May 2023 01:13:48 -0700 (PDT)
X-Received: by 2002:a81:ae68:0:b0:561:94a8:29c5 with SMTP id g40-20020a81ae68000000b0056194a829c5mr10078516ywk.4.1684916028476;
        Wed, 24 May 2023 01:13:48 -0700 (PDT)
Date: Wed, 24 May 2023 01:13:47 -0700 (PDT)
From: chiaming chang <j.jyaming@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <844e14ae-7561-4ecb-83f1-df315dbd2e06n@googlegroups.com>
In-Reply-To: <2fa70dc0-b445-4176-b19f-3dace98358a1n@googlegroups.com>
References: <10331404-4fab-410c-ba3f-77f4ed6ccbebn@googlegroups.com>
 <a185b8ff-0b39-4864-bbf2-ca937835ac70n@googlegroups.com>
 <2fa70dc0-b445-4176-b19f-3dace98358a1n@googlegroups.com>
Subject: Re: install and run jailhouse on rpi4 board
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1524_1327761439.1684916027658"
X-Original-Sender: j.jyaming@gmail.com
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

------=_Part_1524_1327761439.1684916027658
Content-Type: multipart/alternative; 
	boundary="----=_Part_1525_1021500278.1684916027658"

------=_Part_1525_1021500278.1684916027658
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, meiyan xiao,=20

I created a Chinese community about Jailhouse, which provides a detailed=20
tutorial on building Jailhouse on Raspberry Pi 4B, welcome to join!

Raspberrypi 4B =E8=BF=90=E8=A1=8C Jailhouse-CSDN=E7=A4=BE=E5=8C=BA <https:/=
/bbs.csdn.net/topics/615205697>

If you have any questions you can ask me.

Jia ming

=E5=9C=A82023=E5=B9=B45=E6=9C=8824=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC+=
8 15:06:27<meiyan xiao> =E5=86=99=E9=81=93=EF=BC=9A

> hello, I want to build the jailhouse in RPI4, but I meet some errors.=20
> Could you please give me some guidances, it could be better if you could=
=20
> give me your document in Chinese.?
> I am waiting your positive reply, thanks a lot.
>
> =E5=9C=A82021=E5=B9=B46=E6=9C=889=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC=
+8 13:47:34<=E6=9C=B1=E8=8B=A5=E5=87=A1> =E5=86=99=E9=81=93=EF=BC=9A
>
>> hello, I have an document for rpi4b board to install jailhouse with its=
=20
>> own kernel, where I can change some code of jailhouse .  I try a lot and=
=20
>> finally install it. But I only use deconfig of rpi4.cell for no auto too=
ls=20
>> to build root cell config . What's more, unfortunately the document is i=
n=20
>> chinese .  If you need it , mail me.
>>
>> =E5=9C=A82021=E5=B9=B46=E6=9C=884=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94 UT=
C+8 =E4=B8=8B=E5=8D=886:24:49<nmiliak...@gmail.com> =E5=86=99=E9=81=93=EF=
=BC=9A
>>
>>> Dear all,=20
>>>
>>> I am student in ECE NTUA and I am studying Jailhouse for my diploma=20
>>> thesis. So far I managed to install and run jailhouse in virtual=20
>>> environment (QEMU) in x86 and use ready-to-use jailhouse images for vir=
t=20
>>> environment for both x86 and arm architecture. Now I am assigned to ins=
tall=20
>>> it on rpi4 board.=20
>>>
>>> I know there is this repo https://github.com/siemens/jailhouse-images=
=20
>>> with ready to use image for rpi4, but I would like to install it manual=
ly=20
>>> to explore better all the options provided, write some code on my own a=
nd=20
>>> test it.=20
>>>
>>> I have already explored the internet and this google group for further=
=20
>>> information, and apart from some general guidance, I didnt find anythin=
g=20
>>> specific/(or maybe I coudn't understand some key points).=20
>>>
>>>
>>> I would really appreciate it if someone could give me some=20
>>> advice/guidance on this subject.
>>>
>>> Thank you all in advance.=20
>>>
>>> Nikoleta Iliakopoulou
>>>
>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/844e14ae-7561-4ecb-83f1-df315dbd2e06n%40googlegroups.com.

------=_Part_1525_1021500278.1684916027658
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, meiyan xiao,=C2=A0<div><br /></div><div>I created a Chinese communit=
y about Jailhouse, which provides a detailed tutorial on building Jailhouse=
 on Raspberry Pi 4B, welcome to join!</div><div><br /></div><div><a href=3D=
"https://bbs.csdn.net/topics/615205697">Raspberrypi 4B =E8=BF=90=E8=A1=8C J=
ailhouse-CSDN=E7=A4=BE=E5=8C=BA</a><br /><br /></div><div>If you have any q=
uestions you can ask me.<br /></div><div><br /></div><div>Jia ming</div><di=
v><br /></div><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_a=
ttr">=E5=9C=A82023=E5=B9=B45=E6=9C=8824=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89=
 UTC+8 15:06:27&lt;meiyan xiao> =E5=86=99=E9=81=93=EF=BC=9A<br/></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px=
 solid rgb(204, 204, 204); padding-left: 1ex;">hello, I want to build the j=
ailhouse in RPI4, but I meet some errors. Could you please give me some gui=
dances, it could be better if you could give me your document in Chinese.?<=
br>I am waiting your positive reply, thanks a lot.<br><br><div class=3D"gma=
il_quote"><div dir=3D"auto" class=3D"gmail_attr">=E5=9C=A82021=E5=B9=B46=E6=
=9C=889=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC+8 13:47:34&lt;=E6=9C=B1=E8=
=8B=A5=E5=87=A1&gt; =E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">hello, I have an document for rpi4b board to ins=
tall jailhouse with its own kernel, where I can change some code of jailhou=
se .=C2=A0 I try a lot and finally install it. But I only use deconfig of r=
pi4.cell for no auto tools to build root cell config . What&#39;s more, unf=
ortunately the document is in chinese .=C2=A0 If you need it , mail me.<br>=
<br><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">=E5=
=9C=A82021=E5=B9=B46=E6=9C=884=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94 UTC+8 =
=E4=B8=8B=E5=8D=886:24:49&lt;<a rel=3D"nofollow">nmiliak...@gmail.com</a>&g=
t; =E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);padding-l=
eft:1ex">Dear all,=C2=A0<div><br></div><div>I am student in ECE NTUA and I =
am studying Jailhouse for my diploma thesis. So far I managed to install an=
d run jailhouse in virtual environment (QEMU) in x86 and use ready-to-use j=
ailhouse images for virt environment for both x86 and arm architecture. Now=
 I am assigned to install it on rpi4 board.=C2=A0</div><div><br></div><div>=
I know there is this repo=C2=A0<a href=3D"https://github.com/siemens/jailho=
use-images" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"http=
s://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://github.com/siemens/jailho=
use-images&amp;source=3Dgmail&amp;ust=3D1685002078173000&amp;usg=3DAOvVaw1Y=
yU_jPw0zwbeDkFC3WcVJ">https://github.com/siemens/jailhouse-images</a> with =
ready to use image for rpi4, but I would like to install it manually to exp=
lore better all the options provided, write some code on my own and test it=
.=C2=A0</div><div><br></div><div>I have already explored the internet and t=
his google group for further information, and apart from some general guida=
nce, I didnt find anything specific/(or maybe I coudn&#39;t understand some=
 key points).=C2=A0</div><div><br></div><div><br></div><div>I would really =
appreciate it if someone could give me some advice/guidance on this subject=
.</div><div><br></div><div>Thank you all in advance.=C2=A0</div><div><br></=
div><div>Nikoleta Iliakopoulou</div></blockquote></div></blockquote></div><=
/blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/844e14ae-7561-4ecb-83f1-df315dbd2e06n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/844e14ae-7561-4ecb-83f1-df315dbd2e06n%40googlegroups.co=
m</a>.<br />

------=_Part_1525_1021500278.1684916027658--

------=_Part_1524_1327761439.1684916027658--
