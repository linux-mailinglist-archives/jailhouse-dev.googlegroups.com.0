Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBPWASDVQKGQEJVPMHPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x240.google.com (mail-oi1-x240.google.com [IPv6:2607:f8b0:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF419D579
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Aug 2019 20:09:04 +0200 (CEST)
Received: by mail-oi1-x240.google.com with SMTP id r7sf5947946oij.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Aug 2019 11:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7S2xblP8aSd4tjHNAIO4zh01cKZy0q1lypXK7PkU3OU=;
        b=DyyqCXJoVh5gVro735fuQQUZ/IKhXFZuVA/t2913r3cdJGQ1ku216p9RF4DrB87hXj
         a1R4Nz2Rh17txeUyfYOS4X5NJV4KZL8gJ4bYMV5xTPpbphRdGMrdRlyr0eoB1jikmA6L
         R+wt1/1ZJjL+6CqGZc5VVUOXdR6gNysEZBG7kA97t4QEED+N13zHsmhWgv5EWMHCjOi8
         B6fgHg0HcCJZMZuLxs7/f+DDKympUL7WL52rnXl2JnnnNP07HUaBYLEowATg2BWKt4Hk
         T0wi7U9ZXRsciHOk1Un0MHP2yeAEJqSZC2Y9j/GNC7fGfqz63mkpjOgGaDAEchpB2BtV
         zfZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7S2xblP8aSd4tjHNAIO4zh01cKZy0q1lypXK7PkU3OU=;
        b=XaKtu5hCfXG42Zqo6DfPgNSxsqFZpDYry16iz/t9uIS6YqyGvsA6fM29RO2wHsfPcO
         7RyM3h5Jr7Eym95RXEkjws3sgcsyaIKVWKRY0Jh48+SKuXA/krV6AWWGhoVcAykgsbT7
         dw/7AobeQnknEvAKBZx/E61PxWfIgAmWzNYYhuE+PkzuQU7SFDtgwoIwOp4ZjJCxrvOp
         prPQqycWO0M6uPogvHN0GVShZIxkHrRtganj1/9mecbOsKpdMUbhiVcxkcl3LvrfX80R
         p2IVz9mqBUcn3X1nZP0I0pz1O/PfvCxLfMBl7sDiqpfed7PwdFWtyctLLDxYN6jNRCBO
         cy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=7S2xblP8aSd4tjHNAIO4zh01cKZy0q1lypXK7PkU3OU=;
        b=TFKtKawW9+z6gfnssHT0Js3ofdvRkRIymo1I3Er/Jfe7I4kwIuYXiAX+xdzI63WsJW
         9iou4Yg/Mc5ai4zJFXF1qS2QIpcyRGWQesMZFIdO0d3zlqKANXG05gxmrlPti0HHe+NJ
         pt45jzjusTg3MGtnmwNTHRS7ywz+jntA4hBUxB2s6771+oDt+jlrgu1wjprs39uXBX+R
         9w+AeBooQicN9+yehENzUOwzsrbvbUcCjGMeHi0RakuE0SQchnRGJ8wFXxJhk3TBL+Tx
         ApN1f8bkCV9H21p3b42ifwByMoRFfAflCs81Ar1YmNXcQReM+Jw/RvKAcv79aM/tK6/l
         ieng==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU+sbd+8ZcmHN6OTGQEB7PAIEyNx71CNuIrUg7n/pdhgK9EJfao
	4WpRAiEaiDiQShcoPpgszF4=
X-Google-Smtp-Source: APXvYqwstlc13KQOeGSvgjBdq0E2A863gCspffF7nZDpkvKh+e2ZuNN2KVrffFYkKB7rHNyQbU9btA==
X-Received: by 2002:a9d:6213:: with SMTP id g19mr15876287otj.257.1566842943075;
        Mon, 26 Aug 2019 11:09:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:6343:: with SMTP id y3ls497553otk.7.gmail; Mon, 26 Aug
 2019 11:09:02 -0700 (PDT)
X-Received: by 2002:a9d:1eb:: with SMTP id e98mr17376119ote.244.1566842942690;
        Mon, 26 Aug 2019 11:09:02 -0700 (PDT)
Date: Mon, 26 Aug 2019 11:09:02 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <12e2c8ec-e900-4d3a-9f78-086803483af6@googlegroups.com>
In-Reply-To: <1c8ad7db-eb23-034d-dbad-33267d4227f1@siemens.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <12a82b12-b9bd-4258-87fb-9525f4bb648a@googlegroups.com>
 <5fe86ed7-e82f-3fef-6eef-a888e4ef6be7@siemens.com>
 <1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c@googlegroups.com>
 <164159e0-478e-c5e9-fc8a-e0c0cb27da7a@siemens.com>
 <f1de42fc-bae2-4962-ace6-a38e99a441d4@googlegroups.com>
 <dd33650a-c068-52ca-4da7-4537de652bfa@siemens.com>
 <82a56f53-a498-4a27-8458-250d9a7e7078@googlegroups.com>
 <211c06d2-9f92-cbd1-8215-12c577eefa62@siemens.com>
 <2add490d-0d13-44f6-9873-d7fcbf1c4141@googlegroups.com>
 <2dc2470b-9494-4f43-a582-06c2558fa985@googlegroups.com>
 <df7be3b4-a447-0ff1-f43b-ee37bf6513bb@web.de>
 <c183c116-5942-4d08-a0a7-a897e8fbed20@googlegroups.com>
 <6dfd2128-011a-420f-860f-4ccb472c079f@googlegroups.com>
 <67cdfa4b-86e9-496a-3878-b5a0016b75c0@siemens.com>
 <521c355a-eacc-434e-b50d-dd7c797be08a@googlegroups.com>
 <4fe67562-ffb1-a306-542e-c27b0450bca1@web.de>
 <71ab42b5-b8c9-4392-9575-759f6eb899a0@googlegroups.com>
 <1c8ad7db-eb23-034d-dbad-33267d4227f1@siemens.com>
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1883_1737410660.1566842942142"
X-Original-Sender: jpagsreis@gmail.com
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

------=_Part_1883_1737410660.1566842942142
Content-Type: multipart/alternative; 
	boundary="----=_Part_1884_425198828.1566842942143"

------=_Part_1884_425198828.1566842942143
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am using inmate-zynqmp.dtb for non-root cell, which is not being used by=
=20
root cell. Or are you referring to Petalinux's device tree? In that case,=
=20
what nodes must i alter? The memory node?

segunda-feira, 26 de Agosto de 2019 =C3=A0s 18:03:56 UTC+1, Jan Kiszka escr=
eveu:
>
> On 26.08.19 18:39, Jo=C3=A3o Reis wrote:=20
> > Thank you, that worked!=20
> > But when i connect to non-root cell using ssh, i issue commands like=20
> "cat=20
> > /proc/iomem", and it still displays the contents if i was still in root=
=20
> cell. Is=20
> > it normal?=20
>
> Are you using the same device tree for the non-root cell? Then no=20
> surprise.=20
>
> Jan=20
>
> --=20
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE=20
> Corporate Competence Center Embedded Linux=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/12e2c8ec-e900-4d3a-9f78-086803483af6%40googlegroups.com.

------=_Part_1884_425198828.1566842942143
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am using inmate-zynqmp.dtb for non-root cell, which is n=
ot being used by root cell. Or are you referring to Petalinux&#39;s device =
tree? In that case, what nodes must i alter? The memory node?<br><br>segund=
a-feira, 26 de Agosto de 2019 =C3=A0s 18:03:56 UTC+1, Jan Kiszka escreveu:<=
blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;bord=
er-left: 1px #ccc solid;padding-left: 1ex;">On 26.08.19 18:39, Jo=C3=A3o Re=
is wrote:
<br>&gt; Thank you, that worked!
<br>&gt; But when i connect to non-root cell using ssh, i issue commands li=
ke &quot;cat=20
<br>&gt; /proc/iomem&quot;, and it still displays the contents if i was sti=
ll in root cell. Is=20
<br>&gt; it normal?
<br>
<br>Are you using the same device tree for the non-root cell? Then no surpr=
ise.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/12e2c8ec-e900-4d3a-9f78-086803483af6%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/12e2c8ec-e900-4d3a-9f78-086803483af6%40googlegroups.com<=
/a>.<br />

------=_Part_1884_425198828.1566842942143--

------=_Part_1883_1737410660.1566842942142--
