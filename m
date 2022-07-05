Return-Path: <jailhouse-dev+bncBCX7HWUSSQARBW7TSCLAMGQEQSCMFMI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73d.google.com (mail-qk1-x73d.google.com [IPv6:2607:f8b0:4864:20::73d])
	by mail.lfdr.de (Postfix) with ESMTPS id 233BE566F10
	for <lists+jailhouse-dev@lfdr.de>; Tue,  5 Jul 2022 15:17:17 +0200 (CEST)
Received: by mail-qk1-x73d.google.com with SMTP id 194-20020a3704cb000000b006af069d1e0asf11399194qke.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 05 Jul 2022 06:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=v5EAvYVwYn8eENRkVadTkX//6HL5yk0KpZeOvqvziLo=;
        b=Ola1zjSzb6w7xJ5eknNai+qKzuGCjjqNUOV7oE3GFbPUjKekcUmTPQlZj1nAK9T1iD
         WjswXX9gw6RoiRIAd399k6C23avHAaFXs/gOvP1y2+kEdZWDwmK/UgNjrWgIu6y2dszZ
         VmRK3oUBv/WnLZOG6qW43ih2j048YGeI8KI0v7Q2FJrqJj4RGC3Z/lwzEcMvNac/Lvit
         HAGsZyU/fYgTpi5l7qefQ+wbA5Ug315XqF1u0kLuQVauu8Hy8r8DD9TV/cIjoCfsWSs/
         ah5x4FkIdHo34j36EkDhMMhqekIOwMWkYZHxFdMVQ1w4+TX4IjbscoSmyC25RxFzV3ta
         YDpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=v5EAvYVwYn8eENRkVadTkX//6HL5yk0KpZeOvqvziLo=;
        b=RER4Mzqe9f3RC+ODC/+q1U3aSKP1eGIp/Xk7ithDF8QlIGrsT2tSrgPjyxo+cyNoqp
         xNoguPPNdAKg6dqD5NcTdj3ahIc0o3XafaL3jxsewfT7fw0Wva81WagXdGDNLPkopxia
         If8K+A/bZt1HCREN0FgXj6PhXAhBkVASiugNNVudFGPU/u2eJi2xvqkBExCkSzspOvVq
         +xBjxMeIbBfyssXApJ+co9a9ZziWd/xIkceQoQ5FKMbMt9/gPOQKibPJtvBbvmWCpYQK
         qFpTrss/d3pLYKHYMTJkx4hG2SbVGz8X0QU9dgrk9g3YHr702OVs6YS56Dzvy2UGvJcp
         HfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=v5EAvYVwYn8eENRkVadTkX//6HL5yk0KpZeOvqvziLo=;
        b=OvDT2LQu2XAMX9LbKRDIsCxpzsjjRIFZ/K3clPAji068nMKW85ucmdqW9dX0sSzFGF
         9hovCxiTDLqZtGaBiFQm9lhL15dyqaNQmvdY6XvxO2e13sA38txm15itr23YtdCNRtiE
         Yljkii9DKyh0xAMu8lPMxIEt2m+gSDvbALU0/VFE1ovXXehWhvUDEoe/fpjl2NPlB/QV
         qkfOKPmDK3LKtz+w4n7VgOdC+lIUzNIIfcpDB+QJ2Tur/Ij7Vl7eXxOMs/RELxwv3g3Q
         /a3HcqYLW0aHwyrT1kaIN4RA1ZjhQ+6ySlScOCPcthAKr8BgizYsnvgvbbjLAI4sSK1a
         JYtw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora+xXo7OBNjtziBdnDMdjrpzTvI7+cxnpdr/kfEhoTXhbd8hakCW
	pQOjsCWk0ybh87Phf6cZyOI=
X-Google-Smtp-Source: AGRyM1vhxdgYKvuHb1Y2p/qEZyGa5a5LPaIQoopid+48KJDbHhNqIrKTvGr+dPcLml9IK90SoOZxPw==
X-Received: by 2002:a05:6214:c6e:b0:43d:684c:f538 with SMTP id t14-20020a0562140c6e00b0043d684cf538mr11880500qvj.58.1657027035630;
        Tue, 05 Jul 2022 06:17:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:4496:b0:6b1:5134:adee with SMTP id
 x22-20020a05620a449600b006b15134adeels10010600qkp.8.gmail; Tue, 05 Jul 2022
 06:17:14 -0700 (PDT)
X-Received: by 2002:a37:a0c3:0:b0:6b2:70dc:56a3 with SMTP id j186-20020a37a0c3000000b006b270dc56a3mr10649989qke.563.1657027034538;
        Tue, 05 Jul 2022 06:17:14 -0700 (PDT)
Date: Tue, 5 Jul 2022 06:17:13 -0700 (PDT)
From: Jean de Bonfils <jdebonfils5@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <d892634a-d2ee-4b41-bbc3-43b67936108en@googlegroups.com>
In-Reply-To: <DU0PR04MB94176E4803FA6CA0EACC848588BE9@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <AQHYgh74nANUY7FPQk6OjUBxiJJzjq1t3YzQ>
 <1c3da06c-f3f6-479b-a3d4-4e4aa18ca3d7n@googlegroups.com>
 <DU0PR04MB94176E4803FA6CA0EACC848588BE9@DU0PR04MB9417.eurprd04.prod.outlook.com>
Subject: Re: jailhouse inter-cluster operations
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_6750_293064670.1657027033934"
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

------=_Part_6750_293064670.1657027033934
Content-Type: multipart/alternative; 
	boundary="----=_Part_6751_976630158.1657027033934"

------=_Part_6751_976630158.1657027033934
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Hi,
Sorry, I am a novice on this subject. I am just not getting how MMU works=
=20
with two differents A core groups (4 A53 and 2 A72) and how Jailhouse=20
manages it...
Nevertheless, thank you for your replay

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
jailhouse-dev/d892634a-d2ee-4b41-bbc3-43b67936108en%40googlegroups.com.

------=_Part_6751_976630158.1657027033934
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br>Hi,<div>Sorry,&nbsp;I am a novice on this subject. I am just not gettin=
g how MMU works with two differents A core groups (4 A53 and 2 A72) and how=
 Jailhouse manages it...</div><div>Nevertheless, thank you for your replay<=
br></div><div><br></div><div>Kind regards,</div><div><br></div><div>Jean</d=
iv><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">Le lun=
di 4 juillet 2022 =C3=A0 08:42:03 UTC+2, Peng Fan a =C3=A9crit=C2=A0:<br/><=
/div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border=
-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">





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
%26reserved%3D0&amp;source=3Dgmail&amp;ust=3D1657113020487000&amp;usg=3DAOv=
Vaw3EVZD5eBYeWWlJZmup2Y7a">
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
om/d/msgid/jailhouse-dev/d892634a-d2ee-4b41-bbc3-43b67936108en%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/d892634a-d2ee-4b41-bbc3-43b67936108en%40googlegroups.co=
m</a>.<br />

------=_Part_6751_976630158.1657027033934--

------=_Part_6750_293064670.1657027033934--
