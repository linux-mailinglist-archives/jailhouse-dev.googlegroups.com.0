Return-Path: <jailhouse-dev+bncBCF23YV2QAERB55LQGDAMGQELHXKJLA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83d.google.com (mail-qt1-x83d.google.com [IPv6:2607:f8b0:4864:20::83d])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9203A0BF3
	for <lists+jailhouse-dev@lfdr.de>; Wed,  9 Jun 2021 07:47:36 +0200 (CEST)
Received: by mail-qt1-x83d.google.com with SMTP id d7-20020ac811870000b02901e65f85117bsf10747852qtj.18
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Jun 2021 22:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=E91VL0RWbLhOaGWofLeDiUNCzxDhWnDd/uQRnoRGNFs=;
        b=kM6LyzMAA2nVIwfgiuv9efAIzrgiYOyQs3yOy12lANU3el2uoZIliMK+U4y2qcbTH3
         /89JFPAXc5jASFQH5UFCs/lA6ya0p2v9M0wZFcXMkPHnCoCIzKatENZ6cRS7JUX0Obmt
         +9uhK3DNOudUjEMp9uU6S65GbG5FWRyjgl6jUa8JwGuZ1gJJM8Bb0zO3UPjNlkqAY+3x
         aDGr+9Y6pZQc5m8hIV/gLO1QMO1H5mA7ou2PcOZKmc7S0UGhyMDqtk1Kh3Y5Nf6zFRFW
         LILj/OoMtChP3rnULgGf5ofBXEJ97o6NDiYkA+fwmb5T5UISUA3R6FG6XwL7NFRTwIp6
         8N1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=E91VL0RWbLhOaGWofLeDiUNCzxDhWnDd/uQRnoRGNFs=;
        b=K6wSj/7ZIMhCttLG9aEr9zM5cRA08HpZ2/1saUm109cZYmKPTchytiOailBomqGC2j
         XkzbZFN4U1CWqzD4Srfi2VE90vjwy++o9kufIS4ccu9B2MTYkP94fL1o3lIdH//ZMjJ5
         gCkxAWsGPSyYM08qGlo0L28JtNHO+amjpG5gknanltxxZfHmKd1aAH5/xRZPO4wTRvxR
         TEJCVzFjQfK10DEIWsxcHJtYVJQQJ8Tkz+OHHBw5lPE96S8ZVmBOQ2bIVqOw/GdYwnoF
         FE3KXcXiwJdIMLe7tmmrKz+uNzwjewAP+gKq/1X42u+kGZgWmmsmKjC2U/JDMQcZHhVM
         wfiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=E91VL0RWbLhOaGWofLeDiUNCzxDhWnDd/uQRnoRGNFs=;
        b=FcGzzPTK7TNvrIrWQRMJykMPKrfueU/FpRcgexBg2QOzy+qXMKk4yo9YNFP5rma/0N
         xKTIlEZ3PTOi1ZjI+l+m7DV+v//6aZquRtAmW1sLwq8Vh1tuqQjwX903kx6tf94EropZ
         1wdPY+755cNFStWeFyEUDs3W2IdwSmHxEvp8CCl+ZpNGgmfI71DYVL0zQYd7BC2qlemJ
         qJO/O0W8U4hHWaHcXbfcJV1IB1+Te6eH6YptW4VutiuNUpeEjirBj0b4msV5nR/SGZYh
         mAA3O1zmIddPO4coe4Yu9Djb18Z9YB65i7ygI6peqnPsTChs2BgCgCQ7jo6jpFbTc7mo
         bX8g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533ga61ZuxmgWx0cSfNyodp9glpscPWk/oOpOzHhYKnkjvckl1dl
	8Ujb9zOZgzMhMgk/FZnA3Vw=
X-Google-Smtp-Source: ABdhPJxGZOF/IJ3t9P9Q/qk9FruxNPcfYR5RXmP+BtgpKwWwTjzMrTpZyn6VOGTflx1OXKKJEu1UWQ==
X-Received: by 2002:a05:622a:c6:: with SMTP id p6mr24993696qtw.99.1623217655564;
        Tue, 08 Jun 2021 22:47:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:7fcd:: with SMTP id b13ls533207qtk.9.gmail; Tue, 08 Jun
 2021 22:47:35 -0700 (PDT)
X-Received: by 2002:ac8:7d15:: with SMTP id g21mr24314783qtb.351.1623217655054;
        Tue, 08 Jun 2021 22:47:35 -0700 (PDT)
Date: Tue, 8 Jun 2021 22:47:34 -0700 (PDT)
From: =?UTF-8?B?5pyx6Iul5Yeh?= <zhuzhuzhuzai@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a185b8ff-0b39-4864-bbf2-ca937835ac70n@googlegroups.com>
In-Reply-To: <10331404-4fab-410c-ba3f-77f4ed6ccbebn@googlegroups.com>
References: <10331404-4fab-410c-ba3f-77f4ed6ccbebn@googlegroups.com>
Subject: Re: install and run jailhouse on rpi4 board
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1076_1592188684.1623217654486"
X-Original-Sender: zhuzhuzhuzai@gmail.com
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

------=_Part_1076_1592188684.1623217654486
Content-Type: multipart/alternative; 
	boundary="----=_Part_1077_1136010698.1623217654486"

------=_Part_1077_1136010698.1623217654486
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hello, I have an document for rpi4b board to install jailhouse with its own=
=20
kernel, where I can change some code of jailhouse .  I try a lot and=20
finally install it. But I only use deconfig of rpi4.cell for no auto tools=
=20
to build root cell config . What's more, unfortunately the document is in=
=20
chinese .  If you need it , mail me.

=E5=9C=A82021=E5=B9=B46=E6=9C=884=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94 UTC+8=
 =E4=B8=8B=E5=8D=886:24:49<nmiliak...@gmail.com> =E5=86=99=E9=81=93=EF=BC=
=9A

> Dear all,=20
>
> I am student in ECE NTUA and I am studying Jailhouse for my diploma=20
> thesis. So far I managed to install and run jailhouse in virtual=20
> environment (QEMU) in x86 and use ready-to-use jailhouse images for virt=
=20
> environment for both x86 and arm architecture. Now I am assigned to insta=
ll=20
> it on rpi4 board.=20
>
> I know there is this repo https://github.com/siemens/jailhouse-images=20
> with ready to use image for rpi4, but I would like to install it manually=
=20
> to explore better all the options provided, write some code on my own and=
=20
> test it.=20
>
> I have already explored the internet and this google group for further=20
> information, and apart from some general guidance, I didnt find anything=
=20
> specific/(or maybe I coudn't understand some key points).=20
>
>
> I would really appreciate it if someone could give me some advice/guidanc=
e=20
> on this subject.
>
> Thank you all in advance.=20
>
> Nikoleta Iliakopoulou
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a185b8ff-0b39-4864-bbf2-ca937835ac70n%40googlegroups.com.

------=_Part_1077_1136010698.1623217654486
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hello, I have an document for rpi4b board to install jailhouse with its own=
 kernel, where I can change some code of jailhouse .&nbsp; I try a lot and =
finally install it. But I only use deconfig of rpi4.cell for no auto tools =
to build root cell config . What's more, unfortunately the document is in c=
hinese .&nbsp; If you need it , mail me.<br><br><div class=3D"gmail_quote">=
<div dir=3D"auto" class=3D"gmail_attr">=E5=9C=A82021=E5=B9=B46=E6=9C=884=E6=
=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94 UTC+8 =E4=B8=8B=E5=8D=886:24:49&lt;nmilia=
k...@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A<br/></div><blockquote class=3D"=
gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, =
204, 204); padding-left: 1ex;">Dear all,=C2=A0<div><br></div><div>I am stud=
ent in ECE NTUA and I am studying Jailhouse for my diploma thesis. So far I=
 managed to install and run jailhouse in virtual environment (QEMU) in x86 =
and use ready-to-use jailhouse images for virt environment for both x86 and=
 arm architecture. Now I am assigned to install it on rpi4 board.=C2=A0</di=
v><div><br></div><div>I know there is this repo=C2=A0<a href=3D"https://git=
hub.com/siemens/jailhouse-images" target=3D"_blank" rel=3D"nofollow" data-s=
aferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://git=
hub.com/siemens/jailhouse-images&amp;source=3Dgmail&amp;ust=3D1623304040923=
000&amp;usg=3DAFQjCNERkgbRZYr5s_5Wi-gOzVnFHgErkA">https://github.com/siemen=
s/jailhouse-images</a> with ready to use image for rpi4, but I would like t=
o install it manually to explore better all the options provided, write som=
e code on my own and test it.=C2=A0</div><div><br></div><div>I have already=
 explored the internet and this google group for further information, and a=
part from some general guidance, I didnt find anything specific/(or maybe I=
 coudn&#39;t understand some key points).=C2=A0</div><div><br></div><div><b=
r></div><div>I would really appreciate it if someone could give me some adv=
ice/guidance on this subject.</div><div><br></div><div>Thank you all in adv=
ance.=C2=A0</div><div><br></div><div>Nikoleta Iliakopoulou</div></blockquot=
e></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/a185b8ff-0b39-4864-bbf2-ca937835ac70n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/a185b8ff-0b39-4864-bbf2-ca937835ac70n%40googlegroups.co=
m</a>.<br />

------=_Part_1077_1136010698.1623217654486--

------=_Part_1076_1592188684.1623217654486--
