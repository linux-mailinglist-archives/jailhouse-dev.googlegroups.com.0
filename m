Return-Path: <jailhouse-dev+bncBCX7HWUSSQARBAXUSCLAMGQE6JT3AUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83b.google.com (mail-qt1-x83b.google.com [IPv6:2607:f8b0:4864:20::83b])
	by mail.lfdr.de (Postfix) with ESMTPS id 385EC566F11
	for <lists+jailhouse-dev@lfdr.de>; Tue,  5 Jul 2022 15:17:56 +0200 (CEST)
Received: by mail-qt1-x83b.google.com with SMTP id cr13-20020a05622a428d00b0031d3463f241sf9183954qtb.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 05 Jul 2022 06:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=AKmclcCiOlFbtVkCO4yNMZgGeURzyUcVGl1qTvRzk2A=;
        b=LGLihUqNoE+JFxcm9od2GpalVLGufgDWYSOrzywnAtpYAFUvGIKqYG2xupUbVWdXEv
         Ry0FhkcLgGgFx0Raf4dBlTdW1huE2N9QaF9S3qfSVrKPxj3Np0CHsIfdJIiSzriqw5qz
         g7jzd0XRVYfes3yU2RYC1O56InIPbJRyFFS6YscN3hPQ3hVGBuC75SR2SWli0GbG67k9
         IKs/4vCDt+HhyQ8aRMVtv6a/ZhahJ7DsgyMtBq6ujMoNLVoFvKJpecZodJS8Aj5U8GfY
         FIw0D0l2SWMrfpYiM3aadAZJg1YiQPNVc5ul6ZP+fAwoszCPIk7xqcFKL4c3xLriUSbo
         yyJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=AKmclcCiOlFbtVkCO4yNMZgGeURzyUcVGl1qTvRzk2A=;
        b=NUIVgQItDvqUZj8CVXXCmszE4U36zdQ05apT7APIr7V3R5/kx6KPoNBgonLwEajrAm
         P9KG7VqpQ/BD2yxFwNkTiUQfSSL4GAsVEgjsUVtM1FXzD5/UTwX28GVT7S1MTFNG2JN5
         /KI+1Uu+snz+d4B65AHstQvsCrEodV2rhBeIGzGUwbz7ghO9OeLmRVjBVR223gQTQ/Sx
         QHRCCKBLRZmnsOvI0kPGfZBSPJH8Y+RxLr46Uejg2iMTRpcK6RMEzFo4nV+dNk48z32z
         oNfb8E4MWeFEFoYcMlzp4bg+voZJghe9vP5I+91N5Fz2nInrD/lfEKodwF92SiAPno//
         Ps8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=AKmclcCiOlFbtVkCO4yNMZgGeURzyUcVGl1qTvRzk2A=;
        b=wL7oqbpUU7/kmzjM7nXFJPeBFz0uS7U+M+22b6a7yyJdGxsqzep8Kr+lCwskRr8vep
         f+UCPAyaBFviemqwcRpewtll/eDHVI6kXXTbT7EOMOFttBQG8J8gbbeYGHoqyhJm9CZu
         tvdHS/ajWEt+JiZqI+xd8bQwCtOaDcVgpquqTTjiMAVW1QZ3k7jdlsptwcw1LxQ1hu19
         WGQFwNyYFu6ImwcB0xP9y4SkY7hw7b0In4x87LvWrVbiCZ8BTXIj5actJbshpSdk0ZLA
         GUUFayiElI5LPMR449eVXNkRW0QldeVgUVa5RTw7MEKhu3EbpGyeY58Yt/jTBFjtIc3v
         hPMw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora/dfQfThu2uGSwnHye3cH6743ZD6OrB9BFr1ut30gsNvw5vYwlO
	k+bP42JBAXHnOokiSpFKlOg=
X-Google-Smtp-Source: AGRyM1u0ACyRaniWz892YVWqINiWEeEnhXb0hhzhCdz1drey/wRaZESUmC8cV+JUuqMHSwzWEhmhdw==
X-Received: by 2002:a05:6214:29ca:b0:472:fa99:100 with SMTP id gh10-20020a05621429ca00b00472fa990100mr6400382qvb.87.1657027074945;
        Tue, 05 Jul 2022 06:17:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:b07:b0:472:f787:156 with SMTP id
 u7-20020a0562140b0700b00472f7870156ls2386387qvj.1.gmail; Tue, 05 Jul 2022
 06:17:54 -0700 (PDT)
X-Received: by 2002:ad4:5b8a:0:b0:470:9844:82eb with SMTP id 10-20020ad45b8a000000b00470984482ebmr30901093qvp.80.1657027073274;
        Tue, 05 Jul 2022 06:17:53 -0700 (PDT)
Date: Tue, 5 Jul 2022 06:17:52 -0700 (PDT)
From: Jean de Bonfils <jdebonfils5@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <97293a19-3b6c-45f2-a37d-e138daaa2a27n@googlegroups.com>
In-Reply-To: <DU0PR04MB94176E4803FA6CA0EACC848588BE9@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <AQHYgh74nANUY7FPQk6OjUBxiJJzjq1t3YzQ>
 <1c3da06c-f3f6-479b-a3d4-4e4aa18ca3d7n@googlegroups.com>
 <DU0PR04MB94176E4803FA6CA0EACC848588BE9@DU0PR04MB9417.eurprd04.prod.outlook.com>
Subject: Re: jailhouse inter-cluster operations
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2860_1302075217.1657027072803"
X-Original-Sender: jdebonfils5@gmail.com
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

------=_Part_2860_1302075217.1657027072803
Content-Type: multipart/alternative; 
	boundary="----=_Part_2861_994652850.1657027072803"

------=_Part_2861_994652850.1657027072803
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
Sorry, I am a novice on this subject. I am just not getting how MMU works=
=20
with two differents A core groups (4 A53 and 2 A72) and how Jailhouse=20
manages it...
Nevertheless, thank you for your reply

Kind regards,

Jean

Le lundi 4 juillet 2022 =C3=A0 08:42:03 UTC+2, Peng Fan a =C3=A9crit :

> i.MX8QM could support jailhouse, with 4 A53 in a cell, 2 A72 in a cell.
>
> =20
>
> I not get you about inter-cluster MMU operations (:
>
> =20
>
> Regards,
>
> Peng.
>
> =20
>
> *From:* jailho...@googlegroups.com <jailho...@googlegroups.com> *On=20
> Behalf Of *Jean de Bonfils
> *Sent:* 2022=E5=B9=B46=E6=9C=8817=E6=97=A5 15:51
> *To:* Jailhouse <jailho...@googlegroups.com>
> *Subject:* jailhouse inter-cluster operations
>
> =20
>
> Hi everyone,
>
> I would like to know if jailhouse is able to run on multiple core=20
> clusters.=20
>
> For example, Imx8 Quad Max has one cluster of 4x Cortex A-53 and another=
=20
> cluster of 4x Cortex-A72.=20
>
> If so, do you know how Jailhouse manages inter-cluster MMU operations ?
>
> =20
>
> Thank you in advance and have a nice day.
>
> =20
>
> Jean de Bonfils Lavernelle
>
> --=20
> You received this message because you are subscribed to the Google Groups=
=20
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
=20
> email to jailhouse-de...@googlegroups.com.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/1c3da06c-f3f6-479b-a3d4-4=
e4aa18ca3d7n%40googlegroups.com=20
> <https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgrou=
ps.google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2F1c3da06c-f3f6-479b-a3d4-4e4aa18=
ca3d7n%2540googlegroups.com%3Futm_medium%3Demail%26utm_source%3Dfooter&data=
=3D05%7C01%7Cpeng.fan%40nxp.com%7Ce39b3ff2f0e44e156ca208da50361a4c%7C686ea1=
d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637910490541656854%7CUnknown%7CTWFpbGZ=
sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3=
000%7C%7C%7C&sdata=3D6rbs5y8qRlYwzWOpcQxTNM81F11xBz%2BAZyeV0ujTkwI%3D&reser=
ved=3D0>
> .
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/97293a19-3b6c-45f2-a37d-e138daaa2a27n%40googlegroups.com.

------=_Part_2861_994652850.1657027072803
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<div>Sorry,&nbsp;I am a novice on this subject. I am just not getting ho=
w MMU works with two differents A core groups (4 A53 and 2 A72) and how Jai=
lhouse manages it...</div><div>Nevertheless, thank you for your reply<br></=
div><div><br></div><div>Kind regards,</div><div><br></div><div>Jean</div><b=
r><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">Le lund=
i 4 juillet 2022 =C3=A0 08:42:03 UTC+2, Peng Fan a =C3=A9crit=C2=A0:<br/></=
div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-=
left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:break=
-word">
<div>
<p class=3D"MsoNormal">i.MX8QM could support jailhouse, with 4 A53 in a cel=
l, 2 A72 in a cell.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I not get you about inter-cluster MMU operations (:<=
u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Regards,<u></u><u></u></p>
<p class=3D"MsoNormal">Peng.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt"></div></div></div><div lang=3D"EN-US" link=3D"blue" vlink=3D"purple"=
 style=3D"word-wrap:break-word"><div><div style=3D"border:none;border-left:=
solid blue 1.5pt;padding:0cm 0cm 0cm 4.0pt">
<div>
<div style=3D"border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b>From:</b> <a href data-email-masked rel=3D"nofoll=
ow">jailho...@googlegroups.com</a> &lt;<a href data-email-masked rel=3D"nof=
ollow">jailho...@googlegroups.com</a>&gt;
<b>On Behalf Of </b>Jean de Bonfils<br>
<b>Sent:</b> 2022<span lang=3D"ZH-CN" style=3D"font-family:SimSun">=E5=B9=
=B4</span>6<span lang=3D"ZH-CN" style=3D"font-family:SimSun">=E6=9C=88</spa=
n>17<span lang=3D"ZH-CN" style=3D"font-family:SimSun">=E6=97=A5</span> 15:5=
1<br>
<b>To:</b> Jailhouse &lt;<a href data-email-masked rel=3D"nofollow">jailho.=
..@googlegroups.com</a>&gt;<br>
<b>Subject:</b> jailhouse inter-cluster operations<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Hi everyone,<u></u><u></u></p>
<div>
<p class=3D"MsoNormal">I would like to know if jailhouse is able to run on =
multiple core clusters.=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">For example, Imx8 Quad Max has one cluster of 4x Cor=
tex A-53 and another cluster of 4x Cortex-A72.=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">If so, do you know=C2=A0how Jailhouse manages inter-=
cluster MMU operations ?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thank you in advance and have a nice day.<u></u><u><=
/u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Jean de Bonfils Lavernelle<u></u><u></u></p>
</div>
</div></div></div><div lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=
=3D"word-wrap:break-word"><div><div style=3D"border:none;border-left:solid =
blue 1.5pt;padding:0cm 0cm 0cm 4.0pt"><p class=3D"MsoNormal">-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to
<a href data-email-masked rel=3D"nofollow">jailhouse-de...@googlegroups.com=
</a>.<br>
To view this discussion on the web visit <a href=3D"https://eur01.safelinks=
.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgroups.google.com%2Fd%2Fmsgid%=
2Fjailhouse-dev%2F1c3da06c-f3f6-479b-a3d4-4e4aa18ca3d7n%2540googlegroups.co=
m%3Futm_medium%3Demail%26utm_source%3Dfooter&amp;data=3D05%7C01%7Cpeng.fan%=
40nxp.com%7Ce39b3ff2f0e44e156ca208da50361a4c%7C686ea1d3bc2b4c6fa92cd99c5c30=
1635%7C0%7C1%7C637910490541656854%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3D6rbs5y8qRlYwzWOpcQxTNM81F11xBz%2BAZyeV0ujTkwI%3D&amp;reserved=3D0" targe=
t=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.co=
m/url?hl=3Dfr&amp;q=3Dhttps://eur01.safelinks.protection.outlook.com/?url%3=
Dhttps%253A%252F%252Fgroups.google.com%252Fd%252Fmsgid%252Fjailhouse-dev%25=
2F1c3da06c-f3f6-479b-a3d4-4e4aa18ca3d7n%252540googlegroups.com%253Futm_medi=
um%253Demail%2526utm_source%253Dfooter%26data%3D05%257C01%257Cpeng.fan%2540=
nxp.com%257Ce39b3ff2f0e44e156ca208da50361a4c%257C686ea1d3bc2b4c6fa92cd99c5c=
301635%257C0%257C1%257C637910490541656854%257CUnknown%257CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%253D%257C3000%25=
7C%257C%257C%26sdata%3D6rbs5y8qRlYwzWOpcQxTNM81F11xBz%252BAZyeV0ujTkwI%253D=
%26reserved%3D0&amp;source=3Dgmail&amp;ust=3D1657113462069000&amp;usg=3DAOv=
Vaw0o3S8uqK6eirc2EKuyw6dq">
https://groups.google.com/d/msgid/jailhouse-dev/1c3da06c-f3f6-479b-a3d4-4e4=
aa18ca3d7n%40googlegroups.com</a>.<u></u><u></u></p>
</div>
</div>
</div>

</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/97293a19-3b6c-45f2-a37d-e138daaa2a27n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/97293a19-3b6c-45f2-a37d-e138daaa2a27n%40googlegroups.co=
m</a>.<br />

------=_Part_2861_994652850.1657027072803--

------=_Part_2860_1302075217.1657027072803--
