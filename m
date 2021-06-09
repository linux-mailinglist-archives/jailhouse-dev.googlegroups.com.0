Return-Path: <jailhouse-dev+bncBDCYRLU33MNBBVFKQGDAMGQEOA7VR5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3a.google.com (mail-qv1-xf3a.google.com [IPv6:2607:f8b0:4864:20::f3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 175E23A0BED
	for <lists+jailhouse-dev@lfdr.de>; Wed,  9 Jun 2021 07:44:54 +0200 (CEST)
Received: by mail-qv1-xf3a.google.com with SMTP id h10-20020a0cab0a0000b029020282c64ecfsf17304423qvb.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Jun 2021 22:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5FRA3GzIuaEvK2wAMyZppDU4Bh9eh9OcxXWiSOve8Ro=;
        b=HpYKIHnC5dkSg0oeYGy6Kvg/f1UbPF8gYwZ3mk5o3SgQTfMnWhXhBUI8oFGEGk4JLi
         3iacc3jyYoDX40JCm048LxAVYGXSKDjYset0IMYsKIw19BpCxPdbeZp5eng2mrGUMp9V
         mboMWz8o6650AiNFMYHLHgTSV1FN4SBlLdwYA+J/R+pZkXdULf7+dwANFSl442H81ZcI
         6C85Zhafg9pYt4kYwxlIXp1Ns0OEI0ASPNj0ti4yuJbyXP6nA6Fmv3chOjOvdXL59Ckr
         0xG1tyxkr+l3I1LGwG2gWTRrvO06xgu/XFWq3/hjeViQi4ohSmB+knOuBoqvNSICJiFc
         GvPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5FRA3GzIuaEvK2wAMyZppDU4Bh9eh9OcxXWiSOve8Ro=;
        b=f/Kuz7Wnw4gjoJK1I6LohnXrZOsUjrRCyG9U625GfIFvzO4NNK3jCQE21Vg9Hcvns0
         0rRTvexs3uw/5LBuXGLBunG8fxG5JyfayxPrik6ar+45erbeX4m4amSrBXpEkZODmqZC
         ItfcvhBrJgSDrvy7obOPWEU84cySowLr9g/EFL0t4v2ofXwXW8ZeGnYcGLMYh06nywjM
         v3I7Y84bqSNdeCpuEQPGpTVe8BPytrUhrljxd1gO/24wrfanSutzbrggy0RjvQG9UyBX
         DmxEr8uuelh8xCjuforQX5hP5pkn7CnJok0PguIvRMH0e2cTaCqm6mroPp/ZszzKYg7Z
         U7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=5FRA3GzIuaEvK2wAMyZppDU4Bh9eh9OcxXWiSOve8Ro=;
        b=FY0rkk7lptkPmObmGz7hUVrKmIElKe9vaIsCv/RVtmx5E+MwmDQI9UWjbDR4Q8unHP
         W8wIYv310QjIlGDgu/cjnsTsSye5FluWjga1FFocfYKap0SjbhPey3i7FrdrdPlUFmq4
         JU30XNXDs6PrhVnwO6bRzB0k8xuigfJyQ7GLpIRzRDcfrn5SLO95zAstZGGxagdmhAny
         mGLwiYT5d2uuqEwQFtiWcr3BBcdjKU2LAhbUmDVeB802JkMqmI0cwqH0KKiZJ+m4mj91
         mpJseHSTylWAt4DnqnViLz6wDdVDSTOfo+LaQYJoelbspUK/aR+3RmtMzm1VErUdpD06
         vwCw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532EF4OUkZm0tXK0atWIWL/AblmxWHBIlRR4wtG6OWtJXn9DcJbI
	CZPAd3cOITNRKQlxt0Xii7o=
X-Google-Smtp-Source: ABdhPJwgZmcDfrGgIcTOF0zg8Zseu99ECcxecUJhuUFlSLZX11V9l5LSCbMXYAvzfqlT994e/Y/uwQ==
X-Received: by 2002:a37:485:: with SMTP id 127mr24774503qke.278.1623217492880;
        Tue, 08 Jun 2021 22:44:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ad4:438f:: with SMTP id s15ls430206qvr.3.gmail; Tue, 08 Jun
 2021 22:44:52 -0700 (PDT)
X-Received: by 2002:ad4:5fc7:: with SMTP id jq7mr4126216qvb.41.1623217492451;
        Tue, 08 Jun 2021 22:44:52 -0700 (PDT)
Date: Tue, 8 Jun 2021 22:44:51 -0700 (PDT)
From: Simon Sun <simonsungm@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <0cff4aad-e317-4c0f-a3fb-d24ac122cf4fn@googlegroups.com>
In-Reply-To: <10331404-4fab-410c-ba3f-77f4ed6ccbebn@googlegroups.com>
References: <10331404-4fab-410c-ba3f-77f4ed6ccbebn@googlegroups.com>
Subject: Re: install and run jailhouse on rpi4 board
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_996_615062920.1623217491928"
X-Original-Sender: simonsungm@gmail.com
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

------=_Part_996_615062920.1623217491928
Content-Type: multipart/alternative; 
	boundary="----=_Part_997_2060325480.1623217491928"

------=_Part_997_2060325480.1623217491928
Content-Type: text/plain; charset="UTF-8"


hello, I have an document for rpi4b board to install jailhouse with its own 
kernel, where I can change some code of jailhouse .  I try a lot and 
finally install it. But I only use deconfig of rpi4.cell for no auto tools 
to build root cell config . What's more, unfortunately the document is in 
chinese .  If you need it , mail me.
On Friday, June 4, 2021 at 6:24:49 PM UTC+8 nmiliak...@gmail.com wrote:

> Dear all, 
>
> I am student in ECE NTUA and I am studying Jailhouse for my diploma 
> thesis. So far I managed to install and run jailhouse in virtual 
> environment (QEMU) in x86 and use ready-to-use jailhouse images for virt 
> environment for both x86 and arm architecture. Now I am assigned to install 
> it on rpi4 board. 
>
> I know there is this repo https://github.com/siemens/jailhouse-images 
> with ready to use image for rpi4, but I would like to install it manually 
> to explore better all the options provided, write some code on my own and 
> test it. 
>
> I have already explored the internet and this google group for further 
> information, and apart from some general guidance, I didnt find anything 
> specific/(or maybe I coudn't understand some key points). 
>
>
> I would really appreciate it if someone could give me some advice/guidance 
> on this subject.
>
> Thank you all in advance. 
>
> Nikoleta Iliakopoulou
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0cff4aad-e317-4c0f-a3fb-d24ac122cf4fn%40googlegroups.com.

------=_Part_997_2060325480.1623217491928
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br>hello, I have an document for rpi4b board to install jailhouse with its=
 own kernel, where I can change some code of jailhouse .&nbsp; I try a lot =
and finally install it. But I only use deconfig of rpi4.cell for no auto to=
ols to build root cell config . What's more, unfortunately the document is =
in chinese .&nbsp; If you need it , mail me.<div class=3D"gmail_quote"><div=
 dir=3D"auto" class=3D"gmail_attr">On Friday, June 4, 2021 at 6:24:49 PM UT=
C+8 nmiliak...@gmail.com wrote:<br/></div><blockquote class=3D"gmail_quote"=
 style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); p=
adding-left: 1ex;">Dear all,=C2=A0<div><br></div><div>I am student in ECE N=
TUA and I am studying Jailhouse for my diploma thesis. So far I managed to =
install and run jailhouse in virtual environment (QEMU) in x86 and use read=
y-to-use jailhouse images for virt environment for both x86 and arm archite=
cture. Now I am assigned to install it on rpi4 board.=C2=A0</div><div><br><=
/div><div>I know there is this repo=C2=A0<a href=3D"https://github.com/siem=
ens/jailhouse-images" target=3D"_blank" rel=3D"nofollow" data-saferedirectu=
rl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://github.com/siemens=
/jailhouse-images&amp;source=3Dgmail&amp;ust=3D1623303495828000&amp;usg=3DA=
FQjCNEYVSYo7NbU0VS9mqoAt2pOKVpxRg">https://github.com/siemens/jailhouse-ima=
ges</a> with ready to use image for rpi4, but I would like to install it ma=
nually to explore better all the options provided, write some code on my ow=
n and test it.=C2=A0</div><div><br></div><div>I have already explored the i=
nternet and this google group for further information, and apart from some =
general guidance, I didnt find anything specific/(or maybe I coudn&#39;t un=
derstand some key points).=C2=A0</div><div><br></div><div><br></div><div>I =
would really appreciate it if someone could give me some advice/guidance on=
 this subject.</div><div><br></div><div>Thank you all in advance.=C2=A0</di=
v><div><br></div><div>Nikoleta Iliakopoulou</div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0cff4aad-e317-4c0f-a3fb-d24ac122cf4fn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/0cff4aad-e317-4c0f-a3fb-d24ac122cf4fn%40googlegroups.co=
m</a>.<br />

------=_Part_997_2060325480.1623217491928--

------=_Part_996_615062920.1623217491928--
