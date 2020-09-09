Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBVN54P5AKGQEXN63KUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83d.google.com (mail-qt1-x83d.google.com [IPv6:2607:f8b0:4864:20::83d])
	by mail.lfdr.de (Postfix) with ESMTPS id 7516F262F63
	for <lists+jailhouse-dev@lfdr.de>; Wed,  9 Sep 2020 15:55:34 +0200 (CEST)
Received: by mail-qt1-x83d.google.com with SMTP id b54sf1804562qtk.17
        for <lists+jailhouse-dev@lfdr.de>; Wed, 09 Sep 2020 06:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GL+vWJDA+IV4StHNS0i2PO4yInRRfBYqs4AQ2ybitr4=;
        b=SfLiMkWcelcliuMvwzti8PQygWM5FRZZQ8dU+rfTcvNv2TdxuFwdnm19zxJ0OkUAwr
         gTiPFpS/D/S133++PJr8F1bftZ5gBiQRs7C+h3qCH+P/WGdGEenSz8Z6zDxnhvv6hnq4
         /0rrl4e5rfbrSA4aGiKTaysuvnnYnWpZQTGPy9rTnHoRAfnwm6lfBI1n1PiOs/6A2I8i
         RsMHvdhpnQm9biKpnqIMNBXMntu7njcb466Gap8AKtZDlIqChAm09fdI8XWeor2XkvGy
         q9ZvQZ8kWvEhJsvq0jqvgskH2ellcbmXEI4T3l/FS5AIWdU7Ws80pkwW39iw/AMcqiNV
         9jhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GL+vWJDA+IV4StHNS0i2PO4yInRRfBYqs4AQ2ybitr4=;
        b=sJyFhKxS6NTMBETLMAztsfYjiquPq1ADw4wdOHbEkH3hlYMv+h0WqvOylxe8cY6mvy
         BCa+NyUS0a0FjYaxWH4/NL1JtuNeY6+65bIFS3bHhV9E93pSfC4aOd1Vm8C7m2kuGhrT
         8Yj9AWdBtJvcJI33c64SQ/BmbOYvXt4seo1JGDqb63VG4vD+OGfX9kGut0JBtRo/jqQ+
         yMwSJXfaze3346HmPisN0jb/hYAAK6sKRT7okCGmQcRH/7WDQ5F0Oq3YFTTNyTtrpjRr
         GJRx+oRBfm78kjCFn7q+rRX8VGkVANvPoWZ7K+ERuNgRRwJO1sRSaTh2yNtDdE/5WDRq
         iGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=GL+vWJDA+IV4StHNS0i2PO4yInRRfBYqs4AQ2ybitr4=;
        b=AR6Lm9/m3OYxJIQd71IW7sWmOJmsuP+31D+MHCtNq+uD/Dv2qSDKvDsQxM+z5sPaD/
         nxSvy6Qe/B5MKEq9RZI5gkDIwRdYbp0fcglzpSBffiBVovl+rL1XbT5BlKbJX0zIZPPz
         icib00hMgAQWHEUgpEW2o4gWaHPEcuP5BHUsU1EWPOfqd9BgLYc1DH5SIbN/6b6ZDhQf
         N5Uxfp0QwTvMJoo4Nw9S822T0x8bWondCDuXRMcI17TWimY3fucXk1MX9Xg6btWWIn6H
         6sZHQoLXZVOF+I3ru+DU7+z3kX9Ws1IXmysVknV1uTPetSrsmDVhrkFCApws8htb7H7N
         T7Ag==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533glc5YjTUV4zgFJUEf+/2BxxwV9sWj/uXhsgypAWASkNbx3/w9
	ijFZEVcbQKQt5aaCl7hAQVM=
X-Google-Smtp-Source: ABdhPJxmL/xgG+2Xv8CSse/wJiMyBALtNrJfOvrkqpLhkTZkyK20d1+ciHvdU316rRw5/YanpjNF4w==
X-Received: by 2002:ac8:18da:: with SMTP id o26mr3170314qtk.92.1599659733545;
        Wed, 09 Sep 2020 06:55:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ae9:edcb:: with SMTP id c194ls1345023qkg.7.gmail; Wed, 09
 Sep 2020 06:55:32 -0700 (PDT)
X-Received: by 2002:a05:620a:1104:: with SMTP id o4mr3234094qkk.462.1599659732598;
        Wed, 09 Sep 2020 06:55:32 -0700 (PDT)
Date: Wed, 9 Sep 2020 06:55:31 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <9dd555de-385b-429e-827c-408cbc04122fn@googlegroups.com>
In-Reply-To: <0f3281b7-5da9-d616-d7ba-775ae1593e0b@siemens.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <992cd8fe-ef09-d0bc-119d-e488de158759@siemens.com>
 <c5f91e66-7742-4736-83fc-8565b08989d5n@googlegroups.com>
 <1776338.qqhLftCfjJ@monster>
 <33ee04f7-5518-4f30-b28d-fb567ef1c609n@googlegroups.com>
 <0845ad7a-09a3-c366-91c3-b4f1b6725c56@siemens.com>
 <618bbad6-8276-476b-934e-ea765b28a796n@googlegroups.com>
 <0f3281b7-5da9-d616-d7ba-775ae1593e0b@siemens.com>
Subject: Re: Build jailhouse on embedded target
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2580_999384793.1599659731736"
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

------=_Part_2580_999384793.1599659731736
Content-Type: multipart/alternative; 
	boundary="----=_Part_2581_1249952740.1599659731736"

------=_Part_2581_1249952740.1599659731736
Content-Type: text/plain; charset="UTF-8"

I got it!
The entry msut be "memmap=0x5200000\$0x3a000000"(only one "\").

The command "less /proc/iomem" then shows the following:
 ...
3a000000-3f1fffff : Reserved
...

So far everything is fine.

I've also tried "jailhouse enable nuc8i7.cell"; the system freezes.
So now I have to adjust the cell configuration.
It could be that I need your help later.


j.kiszka...@gmail.com schrieb am Mittwoch, 9. September 2020 um 15:35:09 
UTC+2:

> On 09.09.20 15:21, Jan-Marc Stranz wrote:
> > I change the kernel command line directly in the "grub.cfg" file; i.e.
> > the resulting command line is identical to the line specified in the 
> file.
> > 
> > I've also tried "memmap=0x5200000\\\$0x3a000000" with the same result.
> > 
>
> If the resulting command line of the kernel is actually
> "memmap=0x5200000$0x3a000000" now (directly in grub.conf, you must only
> quote once: "\$"), you either have some other resources at 0x3a000000,
> not just RAM. Check what /proc/iomem reports - when that parameter is
> not in use. Or your system has less than 512 MB RAM (unlikely)...
>
> Maybe share your generated config.c.
>
> Jan
>
> > j.kiszka...@gmail.com schrieb am Mittwoch, 9. September 2020 um 15:10:03
> > UTC+2:
> > 
> > On 09.09.20 14:58, Jan-Marc Stranz wrote:
> > > I have good news.
> > > I now have a Linux system on an Intel NUC8I7 with IOMMU support!.
> > >
> > > The hardware check of Jalihouse works and I was able to create a
> > > configuration for the root cell with "jailhouse config create
> > nuc8i7.c".
> > > (I've attached this configuration.)
> > > I inserted this cell configuration into the Yocto build system and
> > the
> > > file "nuc8i7.cell" is created and installed under
> > > "/usr/share/jailhouse/cells".
> > >
> > > In order to start Jailhouse with "jailhouse enable nuc8i7.cell" I
> > > extended the Linux command line with:
> > > intel_iommu=off memmap=0x5200000$0x3a000000
> > >
> > > I took the entry "memmap = ..." from the generated configuration
> > "nuc8i7.c".
> > >
> > > While re-booting the system it gets stuck with the following message:
> > > Kernel panic - System is deadlocked on memory
> > >
> > > The kernel parameter  "memmap = ..." should actually work, because
> > 82M
> > > of the following area is reserved:
> > >
> > > /* MemRegion: 00100000-39ffffff : System RAM */
> > > {
> > >      .phys_start = 0x100000,
> > >      .virt_start = 0x100000,
> > >      .size = 0x39f00000,
> > >      .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > >       JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
> > > }
> > >
> > > What could I do?
> > >
> > 
> > Most probably, that "$" in the kernel command line is prematurely
> > resolved as "$0" or so and the resulting kernel command line is
> > invalid.
> > Depending in how you inject the parameter, make sure quoting or
> > escaping
> > ("\$", or even more) is correctly done and validate the output of the
> > kernel.
> > 
> > Jan
> > 
> > -- 
> > Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> > Corporate Competence Center Embedded Linux
> > 
> > -- 
> > You received this message because you are subscribed to the Google
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send
> > an email to jailhouse-de...@googlegroups.com
> > <mailto:jailhouse-de...@googlegroups.com>.
> > To view this discussion on the web visit
> > 
> https://groups.google.com/d/msgid/jailhouse-dev/618bbad6-8276-476b-934e-ea765b28a796n%40googlegroups.com
> > <
> https://groups.google.com/d/msgid/jailhouse-dev/618bbad6-8276-476b-934e-ea765b28a796n%40googlegroups.com?utm_medium=email&utm_source=footer
> >.
>
> -- 
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9dd555de-385b-429e-827c-408cbc04122fn%40googlegroups.com.

------=_Part_2581_1249952740.1599659731736
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>I got it!</div><div>The entry msut be "memmap=3D0x5200000\$0x3a000000"=
(only one "\").</div><div><br></div>The command "less /proc/iomem" then sho=
ws the following:<br><div>&nbsp;...</div><div><span style=3D"font-family: C=
ourier New;">3a000000-3f1fffff : Reserved</span></div><div>...</div><div><b=
r></div><div>So far everything is fine.</div><div><br></div><div>I've also =
tried "jailhouse enable nuc8i7.cell"; the system freezes.<br>So now I have =
to adjust the cell configuration.<br>It could be that I need your help late=
r.<br></div><div><br></div><div><br></div><div class=3D"gmail_quote"><div d=
ir=3D"auto" class=3D"gmail_attr">j.kiszka...@gmail.com schrieb am Mittwoch,=
 9. September 2020 um 15:35:09 UTC+2:<br/></div><blockquote class=3D"gmail_=
quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 2=
04); padding-left: 1ex;">On 09.09.20 15:21, Jan-Marc Stranz wrote:
<br>&gt; I change the kernel command line directly in the &quot;grub.cfg&qu=
ot; file; i.e.
<br>&gt; the resulting command line is identical to the line specified in t=
he file.
<br>&gt;=20
<br>&gt; I&#39;ve also tried &quot;memmap=3D0x5200000\\\$0x3a000000&quot; w=
ith the same result.
<br>&gt;=20
<br>
<br>If the resulting command line of the kernel is actually
<br>&quot;memmap=3D0x5200000$0x3a000000&quot; now (directly in grub.conf, y=
ou must only
<br>quote once: &quot;\$&quot;), you either have some other resources at 0x=
3a000000,
<br>not just RAM. Check what /proc/iomem reports - when that parameter is
<br>not in use. Or your system has less than 512 MB RAM (unlikely)...
<br>
<br>Maybe share your generated config.c.
<br>
<br>Jan
<br>
<br>&gt; <a href data-email-masked rel=3D"nofollow">j.kiszka...@gmail.com</=
a> schrieb am Mittwoch, 9. September 2020 um 15:10:03
<br>&gt; UTC+2:
<br>&gt;=20
<br>&gt;     On 09.09.20 14:58, Jan-Marc Stranz wrote:
<br>&gt;     &gt; I have good news.
<br>&gt;     &gt; I now have a Linux system on an Intel NUC8I7 with IOMMU s=
upport!.
<br>&gt;     &gt;
<br>&gt;     &gt; The hardware check of Jalihouse works and I was able to c=
reate a
<br>&gt;     &gt; configuration for the root cell with &quot;jailhouse conf=
ig create
<br>&gt;     nuc8i7.c&quot;.
<br>&gt;     &gt; (I&#39;ve attached this configuration.)
<br>&gt;     &gt; I inserted this cell configuration into the Yocto build s=
ystem and
<br>&gt;     the
<br>&gt;     &gt; file &quot;nuc8i7.cell&quot; is created and installed und=
er
<br>&gt;     &gt; &quot;/usr/share/jailhouse/cells&quot;.
<br>&gt;     &gt;
<br>&gt;     &gt; In order to start Jailhouse with &quot;jailhouse enable n=
uc8i7.cell&quot; I
<br>&gt;     &gt; extended the Linux command line with:
<br>&gt;     &gt; intel_iommu=3Doff memmap=3D0x5200000$0x3a000000
<br>&gt;     &gt;
<br>&gt;     &gt; I took the entry &quot;memmap =3D ...&quot; from the gene=
rated configuration
<br>&gt;     &quot;nuc8i7.c&quot;.
<br>&gt;     &gt;
<br>&gt;     &gt; While re-booting the system it gets stuck with the follow=
ing message:
<br>&gt;     &gt; Kernel panic - System is deadlocked on memory
<br>&gt;     &gt;
<br>&gt;     &gt; The kernel parameter=C2=A0 &quot;memmap =3D ...&quot; sho=
uld actually work, because
<br>&gt;     82M
<br>&gt;     &gt; of the following area is reserved:
<br>&gt;     &gt;
<br>&gt;     &gt; /* MemRegion: 00100000-39ffffff : System RAM */
<br>&gt;     &gt; {
<br>&gt;     &gt; =C2=A0=C2=A0 =C2=A0 .phys_start =3D 0x100000,
<br>&gt;     &gt; =C2=A0=C2=A0=C2=A0=C2=A0 .virt_start =3D 0x100000,
<br>&gt;     &gt; =C2=A0=C2=A0=C2=A0=C2=A0 .size =3D 0x39f00000,
<br>&gt;     &gt; =C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D JAILHOUSE_MEM_READ | =
JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; =C2=A0=C2=A0 =C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOU=
SE_MEM_DMA,
<br>&gt;     &gt; }
<br>&gt;     &gt;
<br>&gt;     &gt; What could I do?
<br>&gt;     &gt;
<br>&gt;=20
<br>&gt;     Most probably, that &quot;$&quot; in the kernel command line i=
s prematurely
<br>&gt;     resolved as &quot;$0&quot; or so and the resulting kernel comm=
and line is
<br>&gt;     invalid.
<br>&gt;     Depending in how you inject the parameter, make sure quoting o=
r
<br>&gt;     escaping
<br>&gt;     (&quot;\$&quot;, or even more) is correctly done and validate =
the output of the
<br>&gt;     kernel.
<br>&gt;=20
<br>&gt;     Jan
<br>&gt;=20
<br>&gt;     --=20
<br>&gt;     Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>&gt;     Corporate Competence Center Embedded Linux
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google
<br>&gt; Groups &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send
<br>&gt; an email to <a href data-email-masked rel=3D"nofollow">jailhouse-d=
e...@googlegroups.com</a>
<br>&gt; &lt;mailto:<a href data-email-masked rel=3D"nofollow">jailhouse-de=
...@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/618bbad=
6-8276-476b-934e-ea765b28a796n%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dde&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/618bbad6-8276-476b-934e-=
ea765b28a796n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D15997456082=
35000&amp;usg=3DAFQjCNH4qq6KIyvxMfUDqO_pKO67VnU9uw">https://groups.google.c=
om/d/msgid/jailhouse-dev/618bbad6-8276-476b-934e-ea765b28a796n%40googlegrou=
ps.com</a>
<br>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/618=
bbad6-8276-476b-934e-ea765b28a796n%40googlegroups.com?utm_medium=3Demail&am=
p;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirect=
url=3D"https://www.google.com/url?hl=3Dde&amp;q=3Dhttps://groups.google.com=
/d/msgid/jailhouse-dev/618bbad6-8276-476b-934e-ea765b28a796n%2540googlegrou=
ps.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=
=3D1599745608235000&amp;usg=3DAFQjCNFLlTsIrqbDzeCj1krjOrqOfszqSw">https://g=
roups.google.com/d/msgid/jailhouse-dev/618bbad6-8276-476b-934e-ea765b28a796=
n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
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
om/d/msgid/jailhouse-dev/9dd555de-385b-429e-827c-408cbc04122fn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/9dd555de-385b-429e-827c-408cbc04122fn%40googlegroups.co=
m</a>.<br />

------=_Part_2581_1249952740.1599659731736--

------=_Part_2580_999384793.1599659731736--
