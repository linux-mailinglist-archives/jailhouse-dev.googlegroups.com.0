Return-Path: <jailhouse-dev+bncBC7PTOEB2ALRBJOR4KCQMGQELWG2TYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf37.google.com (mail-qv1-xf37.google.com [IPv6:2607:f8b0:4864:20::f37])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DA5399E5E
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Jun 2021 12:02:14 +0200 (CEST)
Received: by mail-qv1-xf37.google.com with SMTP id r11-20020a0cb28b0000b02901c87a178503sf4032825qve.22
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Jun 2021 03:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tk0N7Di8ppclw2CVE8v+IKOk5xWWN5F5lDMd3rs8TeA=;
        b=ojM7boYNgsX+/ml0WG3EeZxwXuCUnPwFWgjX3P0QxsnzIm9Ue0j/q0cg3ZkNqBRRkE
         0BbgWM+ujabFB7Fp71Tz4RR2r3TIjKn85LDiXTa3/63Yi9FJr8pdAtNKlV+mCcc/1d3+
         MytFT9+xI+tdrf8RdeT+bbqOXXQEPArH0pdmW0q/2hKm04C9QezogSDOZGLhAQoCeL9M
         uwawuDer9apgaMw9wc7uyqBeu1h7pVlAOZmRpX/g7/7JjyPy/bX9Qgaa2cIGgVAIc+64
         MHIc7XQF8laY+2E7mo6cYoVL22vIt68G5RCm2fruT6QMSvJF7gd3wZ85ghM30XjjVdKr
         YSjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tk0N7Di8ppclw2CVE8v+IKOk5xWWN5F5lDMd3rs8TeA=;
        b=DRuAxTljiCTrlxfP9JKSnhgx6OEoqNt8gTqQjzqSPpzfK0LsdL4cFYO8/0jduPusDi
         d6XOAAt5upLRmnsv4re89KnFlWUee+BJ6jx43z7kTlY7vdEK9h7K2YyOEEf0qjf/WmyB
         qeU3SJDuBAd2vy1UNpBGm+jrmJ4aYrCrrzI6WOLu0rKWFcy3UKzSvrnVKZDj22JdMRJO
         3AQi6v3Ndf+IfAozI1j2dRO/DB9HXzp4sGZBHdGcA0J4zjhR3vdpxfoqplSIkaQHxqSC
         wQDstsMFpNZDii21Kr0GkhntgXb3fzAHnC5MpBhO1IRr3SKIEkD+Pu58b4yrwo13MO4B
         Flqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=tk0N7Di8ppclw2CVE8v+IKOk5xWWN5F5lDMd3rs8TeA=;
        b=IqNsWDTY/V/dDKqZ92Z7rLc0t7VI92nv+UiA2pPt3fYh5O1wycV9pngycFKUgvWHCi
         Krfw5/IHAsCMHjI6sM4+pFIPsOKU3FAispvirxeUXX5F0q5YWf+syonwE7xR8azC1W34
         kSSFe5jXdn8i6fuI0bHyeOm4RSz7QjlCf9D8B5J3CRkRw5lpT/kH7IFcBY3i+syhu86G
         9Lx7qOS5xM8VkbnlkNx8zqT2QLXRTNZl/PYVPFh6wlDZIlJqpq5fh2Z9DJCMZMhCGnbn
         DO3DpVgsAbaU44G7xjL7OGuk+sUvrO/I0H9HSPNMEn3VVpYUF0cWTdMjjR6dP3wDSk6+
         AnXQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532eaA6rTuutcmJZLdZLnsPSfIYLs2YOZ+uiVf4Tqap5BTVE/0mA
	NAEfdKQD8knrMN3Yf7JpbYY=
X-Google-Smtp-Source: ABdhPJyXTKrvaLT0rYbaX7aByxxalT5OkCiNSJis5P49IX3qkesz1wWT1u7p5zIl7mLvGu3iQKlawQ==
X-Received: by 2002:a0c:c3d1:: with SMTP id p17mr33027980qvi.44.1622714533656;
        Thu, 03 Jun 2021 03:02:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:622a:118c:: with SMTP id m12ls671905qtk.9.gmail; Thu, 03
 Jun 2021 03:02:13 -0700 (PDT)
X-Received: by 2002:a05:622a:1210:: with SMTP id y16mr15506337qtx.260.1622714532927;
        Thu, 03 Jun 2021 03:02:12 -0700 (PDT)
Date: Thu, 3 Jun 2021 03:02:12 -0700 (PDT)
From: along li <v6543210@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <aa1b60e5-a823-4cb5-b36f-d0162bf0583en@googlegroups.com>
In-Reply-To: <d5e6079c-5cf5-ce18-45c0-d0eaa7d60350@siemens.com>
References: <09c2642b-ba89-4226-8452-534393dc6a33n@googlegroups.com>
 <d5e6079c-5cf5-ce18-45c0-d0eaa7d60350@siemens.com>
Subject: Re: How to partition PCI devices to none-root cells in rpi4b?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_456_477715126.1622714532375"
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

------=_Part_456_477715126.1622714532375
Content-Type: multipart/alternative; 
	boundary="----=_Part_457_1769517512.1622714532375"

------=_Part_457_1769517512.1622714532375
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

So this means:  jailhouse  cann't  partition  a  PCI device  into  inmate =
=20
on  raspberry 4 board  for now?
If we want to partition  a PCI device  into  inmate,  we should  modify the=
=20
source code.  Is this right?

=20


=E5=9C=A82021=E5=B9=B45=E6=9C=8814=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94 UTC+=
8 =E4=B8=8B=E5=8D=886:10:37<j.kiszka...@gmail.com> =E5=86=99=E9=81=93=EF=BC=
=9A

> On 14.05.21 05:08, along li wrote:
> > Dear community,
> >=20
> > For X86 platform, the  tutorial  pdf talks some about  how to partition
> > pci device into none-root cells.    =20
> > tutorial:=20
> > =20
> https://events.static.linuxfound.org/sites/events/files/slides/ELCE2016-J=
ailhouse-Tutorial.pdf
> > <
> https://events.static.linuxfound.org/sites/events/files/slides/ELCE2016-J=
ailhouse-Tutorial.pdf
> >
> >=20
> > But how to do this in arm64 platforms, there is no  document.
> >=20
> > Well how to do this, Are there  some configuration demos ?
> >=20
>
> Plenty, though understanding the details requires a bit knowledge about
> the respective platforms. If you look at
> configs/arm64/zynqmp-zcu102-linux-demo.c, e.g., you can see that it gets
> a UART assigned by handing over the MMIO region and (IIRC) GIC IRQ 54.
> But, as I already explained, there can be more complex challenges when
> you also need to enable / clock the respective device, and those
> controls are shared with the root cell.
>
> Jan
>
> --=20
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/aa1b60e5-a823-4cb5-b36f-d0162bf0583en%40googlegroups.com.

------=_Part_457_1769517512.1622714532375
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

So&nbsp;this&nbsp;means:&nbsp; jailhouse&nbsp; cann't&nbsp; partition&nbsp;=
 a&nbsp; PCI device&nbsp; into&nbsp; inmate&nbsp; on&nbsp; raspberry 4 boar=
d&nbsp; for now?<div>If we want to partition&nbsp; a PCI device&nbsp; into&=
nbsp; inmate,&nbsp; we should&nbsp; modify the source code.&nbsp; Is this r=
ight?</div><div><br></div><div>&nbsp;</div><div><br><br></div><div class=3D=
"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">=E5=9C=A82021=E5=B9=B4=
5=E6=9C=8814=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94 UTC+8 =E4=B8=8B=E5=8D=886:=
10:37&lt;j.kiszka...@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A<br/></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px=
 solid rgb(204, 204, 204); padding-left: 1ex;">On 14.05.21 05:08, along li =
wrote:
<br>&gt; Dear community,
<br>&gt;=20
<br>&gt; For X86 platform, the=C2=A0 tutorial=C2=A0 pdf talks some about=C2=
=A0 how to partition
<br>&gt; pci device into none-root cells.=C2=A0 =C2=A0 =C2=A0
<br>&gt; tutorial:=C2=A0
<br>&gt; =C2=A0<a href=3D"https://events.static.linuxfound.org/sites/events=
/files/slides/ELCE2016-Jailhouse-Tutorial.pdf" target=3D"_blank" rel=3D"nof=
ollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=
=3Dhttps://events.static.linuxfound.org/sites/events/files/slides/ELCE2016-=
Jailhouse-Tutorial.pdf&amp;source=3Dgmail&amp;ust=3D1622630046250000&amp;us=
g=3DAFQjCNHNiDajNlZvCYth86pCt2QquHbixA">https://events.static.linuxfound.or=
g/sites/events/files/slides/ELCE2016-Jailhouse-Tutorial.pdf</a>
<br>&gt; &lt;<a href=3D"https://events.static.linuxfound.org/sites/events/f=
iles/slides/ELCE2016-Jailhouse-Tutorial.pdf" target=3D"_blank" rel=3D"nofol=
low" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3D=
https://events.static.linuxfound.org/sites/events/files/slides/ELCE2016-Jai=
lhouse-Tutorial.pdf&amp;source=3Dgmail&amp;ust=3D1622630046250000&amp;usg=
=3DAFQjCNHNiDajNlZvCYth86pCt2QquHbixA">https://events.static.linuxfound.org=
/sites/events/files/slides/ELCE2016-Jailhouse-Tutorial.pdf</a>&gt;
<br>&gt;=20
<br>&gt; But how to do this in arm64 platforms, there is no=C2=A0 document.
<br>&gt;=20
<br>&gt; Well how to do this, Are there=C2=A0 some configuration demos ?
<br>&gt;=20
<br>
<br>Plenty, though understanding the details requires a bit knowledge about
<br>the respective platforms. If you look at
<br>configs/arm64/zynqmp-zcu102-linux-demo.c, e.g., you can see that it get=
s
<br>a UART assigned by handing over the MMIO region and (IIRC) GIC IRQ 54.
<br>But, as I already explained, there can be more complex challenges when
<br>you also need to enable / clock the respective device, and those
<br>controls are shared with the root cell.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, T RDA IOT
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
om/d/msgid/jailhouse-dev/aa1b60e5-a823-4cb5-b36f-d0162bf0583en%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/aa1b60e5-a823-4cb5-b36f-d0162bf0583en%40googlegroups.co=
m</a>.<br />

------=_Part_457_1769517512.1622714532375--

------=_Part_456_477715126.1622714532375--
