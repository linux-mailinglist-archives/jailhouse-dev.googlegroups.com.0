Return-Path: <jailhouse-dev+bncBC7PTOEB2ALRB4W4VWCAMGQE7BERJCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73a.google.com (mail-qk1-x73a.google.com [IPv6:2607:f8b0:4864:20::73a])
	by mail.lfdr.de (Postfix) with ESMTPS id 1820636F41B
	for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Apr 2021 04:41:55 +0200 (CEST)
Received: by mail-qk1-x73a.google.com with SMTP id m1-20020a05620a2201b02902e5493ba894sf5160794qkh.17
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Apr 2021 19:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HoPK+PcdWdp/u/Zv7Gnyz5DdzZ9r6OIA1/CmRwoQ8Cs=;
        b=f0RGTJ7u4oSkJXkfpUgqHdxtt9Q7fAmWlGifaP7hUfC9/vEaABwFWubsayyX1nPMCm
         YPpk7i6X+R+KES8IX48lDi+0RnCEJu65+46IdTYUpy0XDlyKR5mUogT0fQQfTTbbTGJd
         d07LihhQj7gqjIdbxyL+mpGmUruSdSetYuK6j6V9LA/H24vTtReszBvEnRh3jgS2apEM
         IA8YXpXfpM326lAZkQlqL9EK/MHucRueNVlq+jLg+PcLTrIaN4n2p8sKf9hM8wqSYxOC
         hfb9AOb/2ATd8gAkMdTD/PoWnFsgmlm2I8o2TV7UF4yMV79/RdlWdx6ui/q8dOoHFCMU
         Ax0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HoPK+PcdWdp/u/Zv7Gnyz5DdzZ9r6OIA1/CmRwoQ8Cs=;
        b=X6cIwM7iq8Z+IPr0Xucf1Gtn8+tm+lRsfg/Q2BYGCVvbuEkx6VzR8z2uaoeNwFcqI4
         e82LVjnUDbLHfG+6szCfimlyJXqRnJ36OtrGGVdl9nJkzLv2KachX/Gy4NeqwLI9fnzU
         Qk6q24XCsHePcGqo3tktrJQaw8qTG5Hn6mj441wiem/bf7VxWCGCQJxwEr6Mmy32T5j7
         WTzmWvjUWibCj+nTe64qpvg/KSLhHawkT4BMJykGikXuj2puCWrw2B5YCuViDdNUnAfU
         wQMFye5oQB9P8IToG6Zpus4rIVlFVwVNFEv6koX/tBwGZADXPP5Qbn5nUQKd7vsHRgDd
         E12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=HoPK+PcdWdp/u/Zv7Gnyz5DdzZ9r6OIA1/CmRwoQ8Cs=;
        b=P4KqWkTQ613wmt7XVbCn+6kHFqm3rmCE1WnqqCeUtIQWzARGXzDhfoLXZHtWNewznd
         Gs7u/b6Hk5YJ9WA3WzhtZys1OchVo06/70OwRygz8ysP00m9oVbxKEcQFQJQT4xc+cVo
         VKXquQrwOL0qTVeN5CPEShISyOXUIKzicO6mVfFUt5g/jeFOJeRaOsOEmSrwvaVnwtUo
         ghekhHo8GkjXSh5lK1Var6Gn/hJuaEN6pAu8pqMv4LJAwEKo33pY2PNsCoKnzb+cd5/n
         r5u8esPtygs0Lk/Te4H3VC2pWnrUeen2RdU17kSKiSL99zarCM6LEyVhQZgoCA4rx9UU
         i+Gw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530LGMpwEP2raL37d7ESZBc5b7fV3zgrAw9EkXT4U9Bzs+S4RkRv
	YZFevNdodrLZyeKOT/PBd8s=
X-Google-Smtp-Source: ABdhPJzXkdc7vh8vaL4YVX/yp1oZmn5j4fhoBIZsLhemHb4bRMswRMkRnFJ3qv5btQDbbuGIdcw51w==
X-Received: by 2002:a37:8bc2:: with SMTP id n185mr3021074qkd.320.1619750514172;
        Thu, 29 Apr 2021 19:41:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ad4:4a34:: with SMTP id n20ls1483658qvz.11.gmail; Thu, 29
 Apr 2021 19:41:53 -0700 (PDT)
X-Received: by 2002:ad4:4eaa:: with SMTP id ed10mr2915752qvb.22.1619750513614;
        Thu, 29 Apr 2021 19:41:53 -0700 (PDT)
Date: Thu, 29 Apr 2021 19:41:53 -0700 (PDT)
From: along li <v6543210@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a83de6d2-e84f-42f3-a1e7-84a782ffb28fn@googlegroups.com>
In-Reply-To: <743a492d.2b32.179176b845e.Coremail.caohp19@lzu.edu.cn>
References: <743a492d.2b32.179176b845e.Coremail.caohp19@lzu.edu.cn>
Subject: Re: HELP about Jailhouse
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_66_166577537.1619750513010"
X-Original-Sender: v6543210@gmail.com
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

------=_Part_66_166577537.1619750513010
Content-Type: multipart/alternative; 
	boundary="----=_Part_67_24294404.1619750513010"

------=_Part_67_24294404.1619750513010
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

the jailhouse from  jailhouse-images is   github.com/simens/jailhouse =20
"next" branch. =20
not the  master branch.
maybe it's different.


=E5=9C=A82021=E5=B9=B44=E6=9C=8828=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC+=
8 =E4=B8=8B=E5=8D=883:39:57<=E6=9B=B9=E5=AE=8F=E9=B9=8F> =E5=86=99=E9=81=93=
=EF=BC=9A

> Dear sir,
> Last year, I used the rapi-linux-demo.cell to launch a second cell on my=
=20
> Raspberry Pi 4 model B. And the memory size of second cell was about 184M=
.
> However, that is not enough to me to execute some test on it. So I try to=
=20
> change the size of the cell in the rpi-linux-demo.c, but it failed (maybe=
=20
> occupied
> other's memory, I don't know). A good news is, someone fixed this problem=
.=20
> The demo can provide 1G memory size=EF=BC=8C and I git clone the new proj=
ect.
>
> BUT when I executed the operations same with before, I can not build the=
=20
> jailhouse
>
> my operations is:
> 1. git clone https://github.com/siemens/jailhouse.git
> 2. sudo make &amp;&amp; make modules_install &amp;&amp; make install
> 3. sudo insmod driver/jailhouse.ko
> 4. sudo jailhouse enable configs/arm64/rpi4.cell=20
>
> The 4th step is failed, the error is:
> JAILHOUSE_ENABLE: Invalid argument
>
> I don't know why it occurs. Because there are two project on my Raspberry=
=20
> (one is new, the other is cloned in last year ), the old one can run=20
> properly.
> If I can get your generous help, I will appreciate.
>
> Yours sincerely,
> Hongpeng Cao.=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a83de6d2-e84f-42f3-a1e7-84a782ffb28fn%40googlegroups.com.

------=_Part_67_24294404.1619750513010
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

the jailhouse from&nbsp; jailhouse-images is&nbsp; &nbsp;github.com/simens/=
jailhouse&nbsp; "next" branch.&nbsp;&nbsp;<div>not the&nbsp; master branch.=
</div><div>maybe it's different.<br><div><br></div><div><br></div></div><di=
v class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">=E5=9C=A8202=
1=E5=B9=B44=E6=9C=8828=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC+8 =E4=B8=8B=
=E5=8D=883:39:57&lt;=E6=9B=B9=E5=AE=8F=E9=B9=8F> =E5=86=99=E9=81=93=EF=BC=
=9A<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8e=
x; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">Dear sir,=
<br>Last year, I used the rapi-linux-demo.cell to launch a second cell on m=
y Raspberry Pi 4 model B. And the memory size of second cell was about 184M=
.<br>However, that is not enough to me to execute some test on it. So I try=
 to change the size of the cell in the rpi-linux-demo.c, but it failed (may=
be occupied<br> other&#39;s memory, I don&#39;t know). A good news is, some=
one fixed this problem. The demo can provide 1G memory size=EF=BC=8C and I =
git clone the new project.<p>BUT when I executed the operations same with b=
efore, I can not build the jailhouse<p>my operations is:<br>1. git clone <a=
 href=3D"https://github.com/siemens/jailhouse.git" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&am=
p;q=3Dhttps://github.com/siemens/jailhouse.git&amp;source=3Dgmail&amp;ust=
=3D1619836653367000&amp;usg=3DAFQjCNGsgNMZn_pfnEo4Z_8_IVqL3gL30w">https://g=
ithub.com/siemens/jailhouse.git</a><br>2. sudo make &amp;amp;&amp;amp; make=
 modules_install &amp;amp;&amp;amp; make install<br>3. sudo insmod driver/j=
ailhouse.ko<br>4. sudo jailhouse enable configs/arm64/rpi4.cell <p>The 4th =
step is failed, the error is:<br>JAILHOUSE_ENABLE: Invalid argument<p>I don=
&#39;t know why it occurs. Because there are two project on my Raspberry (o=
ne is new, the other is cloned in last year ), the old one can run properly=
.<br>If I can get your generous help, I will appreciate.<p>Yours sincerely,=
<br>Hongpeng Cao. </p></p></p></p></p></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/a83de6d2-e84f-42f3-a1e7-84a782ffb28fn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/a83de6d2-e84f-42f3-a1e7-84a782ffb28fn%40googlegroups.co=
m</a>.<br />

------=_Part_67_24294404.1619750513010--

------=_Part_66_166577537.1619750513010--
