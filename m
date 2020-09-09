Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBZVN4P5AKGQEAOYTRWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x840.google.com (mail-qt1-x840.google.com [IPv6:2607:f8b0:4864:20::840])
	by mail.lfdr.de (Postfix) with ESMTPS id 21193262F11
	for <lists+jailhouse-dev@lfdr.de>; Wed,  9 Sep 2020 15:21:44 +0200 (CEST)
Received: by mail-qt1-x840.google.com with SMTP id j19sf1735952qtp.19
        for <lists+jailhouse-dev@lfdr.de>; Wed, 09 Sep 2020 06:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=H29FoPvCZG+jP6FV/3ivsqISRQSELqlcZNCDVotkkMs=;
        b=tn8pwbmVA0qtnRFzG2u6mWMvFT/AP/aYcUrexg4cnUzQj+3SN9O8GfnvYWZXVfYkpW
         eq/lYLa13SAc5AwC3X34ykdrCtSZGxtJg3LvwIKdVl97vb5ZdfdqRFjDxh66cd7Jm1jE
         mIW7A1Q8RvMjS1EfxppUD8jYexPQuVniihu2kjyUHZVoXl9Cbu937Z9RUrpbREM2Tc85
         aPgnyyxEU6ugMipvKgxmDERlRnqd7moku380hSJRe3DKG/X1DjBFNA7Mag5grz0PWbfH
         59QSvfhr7CEpqckUxeOrip4uUhdlPxtdiF07TGrutDtXExNCiq5hohQLuMh6INH90EQg
         tVKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=H29FoPvCZG+jP6FV/3ivsqISRQSELqlcZNCDVotkkMs=;
        b=gh8r/cCqhAbNt0OZxmQmIjP2dUicbtWE5j4EiBB6UmEve6/0b6HHcSBfCKCm+sC0Zv
         ROYD5YV0NUJrErZiheRJiEXSgfJMBFJ1x05Pw49/1EmVR326C457RuV+WfWKv2+wB/o2
         vP6EjGwsk1AczQ1f3YfPm+zdXjY4F4XemwT4aYvPbRc0tVZ2MMjKsBLhN82E0CD96fQG
         nVgQVu3wlKt5Y5O0Brt/aN7m1J/mPE6sib9has2TJW6PZsO3x2v4/SO3hLzNTalGVyQl
         Tbv35i2MqNBNOrxUE8xQnuPWGtJuMlsHOK1dePwg+nHp7Ku/wkdMFPyNWUQEZoAIBRpv
         32YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=H29FoPvCZG+jP6FV/3ivsqISRQSELqlcZNCDVotkkMs=;
        b=KMokjLOkK7JgIoWKYSSPxHrCnB3JgIEmY4xDCA18vgEqzk7BGJp8fhJGX2+CaQfBxk
         /kkY1P+OrzrYFsPhAnbChF6+hPGcE1huJ+gYh5ETJJweZMPepNSkahKGzfkLzmZAj4d7
         QaOAT2pKdxZrt/QXngjftkogovw/5VvohPbdpB6jGxA8ijcmnLHNnkxnq2jt+DujWfXN
         RCy1B36FYyv1uKq+6MwbrCEX0ZAZ9WYvgony8aaqWCJ79p54jrwStChdz0lXkGXGoHc0
         bxnR4uasVto8RFA/sCupOFGKOPOwdkkPXRFDMNrd++heBJdI06tqGFgyDJy23MkM1fi7
         16bw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533OfnxZRjJUPoEJVFmFO4MbPpanbJ0Ybc7ipnXui/LRMEfKdslr
	G2sQK9hAAS1sz2q9jR0W6RQ=
X-Google-Smtp-Source: ABdhPJxE0lXGGAHoiZ9bam96RB/htlSay6yHzOx79j+bKjcIaLLz+5C6vzMz25EfSomOnUQSIAleRQ==
X-Received: by 2002:aed:29a6:: with SMTP id o35mr3166920qtd.123.1599657703040;
        Wed, 09 Sep 2020 06:21:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:226:: with SMTP id j6ls612804qvt.9.gmail; Wed, 09
 Sep 2020 06:21:42 -0700 (PDT)
X-Received: by 2002:a0c:8001:: with SMTP id 1mr4071589qva.21.1599657701737;
        Wed, 09 Sep 2020 06:21:41 -0700 (PDT)
Date: Wed, 9 Sep 2020 06:21:40 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <618bbad6-8276-476b-934e-ea765b28a796n@googlegroups.com>
In-Reply-To: <0845ad7a-09a3-c366-91c3-b4f1b6725c56@siemens.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <992cd8fe-ef09-d0bc-119d-e488de158759@siemens.com>
 <c5f91e66-7742-4736-83fc-8565b08989d5n@googlegroups.com>
 <1776338.qqhLftCfjJ@monster>
 <33ee04f7-5518-4f30-b28d-fb567ef1c609n@googlegroups.com>
 <0845ad7a-09a3-c366-91c3-b4f1b6725c56@siemens.com>
Subject: Re: Build jailhouse on embedded target
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1866_128224372.1599657700982"
X-Original-Sender: stranzjanmarc@gmail.com
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

------=_Part_1866_128224372.1599657700982
Content-Type: multipart/alternative; 
	boundary="----=_Part_1867_315455682.1599657700982"

------=_Part_1867_315455682.1599657700982
Content-Type: text/plain; charset="UTF-8"

I change the kernel command line directly in the "grub.cfg" file; i.e. the 
resulting command line is identical to the line specified in the file.

I've also tried "memmap=0x5200000\\\$0x3a000000" with the same result.

j.kiszka...@gmail.com schrieb am Mittwoch, 9. September 2020 um 15:10:03 
UTC+2:

> On 09.09.20 14:58, Jan-Marc Stranz wrote:
> > I have good news.
> > I now have a Linux system on an Intel NUC8I7 with IOMMU support!.
> > 
> > The hardware check of Jalihouse works and I was able to create a
> > configuration for the root cell with "jailhouse config create nuc8i7.c".
> > (I've attached this configuration.)
> > I inserted this cell configuration into the Yocto build system and the
> > file "nuc8i7.cell" is created and installed under
> > "/usr/share/jailhouse/cells".
> > 
> > In order to start Jailhouse with "jailhouse enable nuc8i7.cell" I
> > extended the Linux command line with:
> > intel_iommu=off memmap=0x5200000$0x3a000000
> > 
> > I took the entry "memmap = ..." from the generated configuration 
> "nuc8i7.c".
> > 
> > While re-booting the system it gets stuck with the following message:
> > Kernel panic - System is deadlocked on memory
> > 
> > The kernel parameter  "memmap = ..." should actually work, because 82M
> > of the following area is reserved:
> > 
> > /* MemRegion: 00100000-39ffffff : System RAM */
> > {
> >      .phys_start = 0x100000,
> >      .virt_start = 0x100000,
> >      .size = 0x39f00000,
> >      .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> >       JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
> > }
> > 
> > What could I do?
> > 
>
> Most probably, that "$" in the kernel command line is prematurely
> resolved as "$0" or so and the resulting kernel command line is invalid.
> Depending in how you inject the parameter, make sure quoting or escaping
> ("\$", or even more) is correctly done and validate the output of the
> kernel.
>
> Jan
>
> -- 
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/618bbad6-8276-476b-934e-ea765b28a796n%40googlegroups.com.

------=_Part_1867_315455682.1599657700982
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I change the kernel command line directly in the "grub.cfg" file; i.e. the =
resulting command line is identical to the line specified in the file.<br><=
div><br></div><div>I've also tried "<span>memmap=3D0x5200000\\\$0x3a000000"=
 with the same result.<br></span></div><div><br></div><div class=3D"gmail_q=
uote"><div dir=3D"auto" class=3D"gmail_attr">j.kiszka...@gmail.com schrieb =
am Mittwoch, 9. September 2020 um 15:10:03 UTC+2:<br/></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb=
(204, 204, 204); padding-left: 1ex;">On 09.09.20 14:58, Jan-Marc Stranz wro=
te:
<br>&gt; I have good news.
<br>&gt; I now have a Linux system on an Intel NUC8I7 with IOMMU support!.
<br>&gt;=20
<br>&gt; The hardware check of Jalihouse works and I was able to create a
<br>&gt; configuration for the root cell with &quot;jailhouse config create=
 nuc8i7.c&quot;.
<br>&gt; (I&#39;ve attached this configuration.)
<br>&gt; I inserted this cell configuration into the Yocto build system and=
 the
<br>&gt; file &quot;nuc8i7.cell&quot; is created and installed under
<br>&gt; &quot;/usr/share/jailhouse/cells&quot;.
<br>&gt;=20
<br>&gt; In order to start Jailhouse with &quot;jailhouse enable nuc8i7.cel=
l&quot; I
<br>&gt; extended the Linux command line with:
<br>&gt; intel_iommu=3Doff memmap=3D0x5200000$0x3a000000
<br>&gt;=20
<br>&gt; I took the entry &quot;memmap =3D ...&quot; from the generated con=
figuration &quot;nuc8i7.c&quot;.
<br>&gt;=20
<br>&gt; While re-booting the system it gets stuck with the following messa=
ge:
<br>&gt; Kernel panic - System is deadlocked on memory
<br>&gt;=20
<br>&gt; The kernel parameter=C2=A0 &quot;memmap =3D ...&quot; should actua=
lly work, because 82M
<br>&gt; of the following area is reserved:
<br>&gt;=20
<br>&gt; /* MemRegion: 00100000-39ffffff : System RAM */
<br>&gt; {
<br>&gt; =C2=A0=C2=A0 =C2=A0 .phys_start =3D 0x100000,
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0 .virt_start =3D 0x100000,
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0 .size =3D 0x39f00000,
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE=
_MEM_WRITE |
<br>&gt; =C2=A0=C2=A0 =C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DM=
A,
<br>&gt; }
<br>&gt;=20
<br>&gt; What could I do?
<br>&gt;=20
<br>
<br>Most probably, that &quot;$&quot; in the kernel command line is prematu=
rely
<br>resolved as &quot;$0&quot; or so and the resulting kernel command line =
is invalid.
<br>Depending in how you inject the parameter, make sure quoting or escapin=
g
<br>(&quot;\$&quot;, or even more) is correctly done and validate the outpu=
t of the
<br>kernel.
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
om/d/msgid/jailhouse-dev/618bbad6-8276-476b-934e-ea765b28a796n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/618bbad6-8276-476b-934e-ea765b28a796n%40googlegroups.co=
m</a>.<br />

------=_Part_1867_315455682.1599657700982--

------=_Part_1866_128224372.1599657700982--
