Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBFOG4P5AKGQEEENYYAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf38.google.com (mail-qv1-xf38.google.com [IPv6:2607:f8b0:4864:20::f38])
	by mail.lfdr.de (Postfix) with ESMTPS id 55681262F98
	for <lists+jailhouse-dev@lfdr.de>; Wed,  9 Sep 2020 16:13:42 +0200 (CEST)
Received: by mail-qv1-xf38.google.com with SMTP id j5sf1417246qvb.16
        for <lists+jailhouse-dev@lfdr.de>; Wed, 09 Sep 2020 07:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=E/XjTfMVxRY6itUngWK08/i8EaTOnMMFS34d0c+gWVU=;
        b=jLK2ED2UyMf1xRi0zgbtIegqrXRr24GkSCmLHrwf4hv/Hkb6vEjLRwskCBVPUb+hk3
         Pskys2xEVECLdEcJzblM5aBkj63OJFYqIeOL4MmPO/I5YDiac3O/I6lAo58pxHJ4ZwOB
         D59A5qVBn6orWD5hXjDp+E/a/9ctVlwyrev/2C2rAixgC98/6uJp6Q15sEq/S1soAIvg
         Le1d1GMAO8KXSwrLjwi6RgwFm1Pkr7JJaC6JRGFJsA0OitQt3Y9D7qW6vi/FNgtCRfsp
         azls722+Kil4X3GhsUwvkcgsu51ek30par0JgK0QKMF1FPb5WNKBD+GzjBRJdop7jf/7
         RObQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=E/XjTfMVxRY6itUngWK08/i8EaTOnMMFS34d0c+gWVU=;
        b=P4Erujbg8moh3fDyDj8K8mAYeb/XUC9pW5k6t6pBJ6sB0pmcLRihGbQwoa2vIm4tpe
         YfiDX3q/o83pYrFg2AxT7icqoKWrny/AE6XDa/vS20OHOfRzU4vY5ETUyqxy2yn5x6q0
         oNTTYHbhPLfJtRwzDxmgrX3sMtDUmvEHvxWvCkqNpLgTySpYfaaiOvvSWJAlCzgfFNP0
         x8UFxbwq+pRXb2PBfopHTx7Zq07svwZLxN/P8yJW6ajLyDATa0wGsz1LmWQFrACGaJ4a
         UfZG8OiYCczW0k7U+QQcM2OOM+IxJ03M4Sg7Q4c9H8l7QwFgXW+qZaU8oqI4XY8g4uGa
         xe5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=E/XjTfMVxRY6itUngWK08/i8EaTOnMMFS34d0c+gWVU=;
        b=frxo6zIvTe4rI3UAdtyipzX6/pQ6K7D1aklF4ODMQGZ73vJqZpd5K2WkfRR7YSQ/yv
         Qivl04FikVHfoALM+RLW67yOT/Qys7j8hvxzFs8qv5tX4FWfre6W1FrAsgl/pIQGbtKk
         JuuHf1P9HK1J5Sjo4NGCohHxUwhpT8XCcrVW1Oy1i90cKzcNDGc9KtKeEH+omcsW4DXR
         N2X3amf3KZmglhTVe+JsZfmnW6GMKp2n+hdcGXYGAUEsCCI/wOBmokvcJ8IahM2IwZcd
         d+BK5Ooqvxwxb7Ki8e5RFftNTkBJ/tPk0HGEm6nao6Y9fYpcMoRBPzsD3mTa9XzRNXak
         4MNg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5337xp/agTzb7foKnKPEuXx6L0Hc5z2UuKlg0AzPf74AahMFDhFb
	xDNbatSOxQo/+Xy1LXUCawU=
X-Google-Smtp-Source: ABdhPJzyvkoMVcSD7kiK20z+4hfuXRmAR/HCG7EjEm6u1pJzuhuAWSeemE7/n1N0v7oZrKPStA0nTw==
X-Received: by 2002:a37:7c6:: with SMTP id 189mr3501563qkh.275.1599660821380;
        Wed, 09 Sep 2020 07:13:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ad4:4c91:: with SMTP id bs17ls709824qvb.3.gmail; Wed, 09 Sep
 2020 07:13:40 -0700 (PDT)
X-Received: by 2002:ad4:534c:: with SMTP id v12mr4143374qvs.27.1599660820737;
        Wed, 09 Sep 2020 07:13:40 -0700 (PDT)
Date: Wed, 9 Sep 2020 07:13:39 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <42b8fa41-88cc-4907-bdce-44474b98d8acn@googlegroups.com>
In-Reply-To: <9dd555de-385b-429e-827c-408cbc04122fn@googlegroups.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <992cd8fe-ef09-d0bc-119d-e488de158759@siemens.com>
 <c5f91e66-7742-4736-83fc-8565b08989d5n@googlegroups.com>
 <1776338.qqhLftCfjJ@monster>
 <33ee04f7-5518-4f30-b28d-fb567ef1c609n@googlegroups.com>
 <0845ad7a-09a3-c366-91c3-b4f1b6725c56@siemens.com>
 <618bbad6-8276-476b-934e-ea765b28a796n@googlegroups.com>
 <0f3281b7-5da9-d616-d7ba-775ae1593e0b@siemens.com>
 <9dd555de-385b-429e-827c-408cbc04122fn@googlegroups.com>
Subject: Re: Build jailhouse on embedded target
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2600_1301891171.1599660819933"
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

------=_Part_2600_1301891171.1599660819933
Content-Type: multipart/alternative; 
	boundary="----=_Part_2601_418277551.1599660819934"

------=_Part_2601_418277551.1599660819934
Content-Type: text/plain; charset="UTF-8"

My serial port is "/dev/ttyUSB0".
I've connected this with an other Linux PC and tested it with "minicom".

But if I start Jailhouse with "jailhouse enable ..." then I do not receive 
any messages via this serial port.
Do jailhouse use "/dev/ttyUSB*"?

Jan-Marc Stranz schrieb am Mittwoch, 9. September 2020 um 15:55:31 UTC+2:

> I got it!
> The entry msut be "memmap=0x5200000\$0x3a000000"(only one "\").
>
> The command "less /proc/iomem" then shows the following:
>  ...
> 3a000000-3f1fffff : Reserved
> ...
>
> So far everything is fine.
>
> I've also tried "jailhouse enable nuc8i7.cell"; the system freezes.
> So now I have to adjust the cell configuration.
> It could be that I need your help later.
>
>
> j.kiszka...@gmail.com schrieb am Mittwoch, 9. September 2020 um 15:35:09 
> UTC+2:
>
>> On 09.09.20 15:21, Jan-Marc Stranz wrote: 
>> > I change the kernel command line directly in the "grub.cfg" file; i.e. 
>> > the resulting command line is identical to the line specified in the 
>> file. 
>> > 
>> > I've also tried "memmap=0x5200000\\\$0x3a000000" with the same result. 
>> > 
>>
>> If the resulting command line of the kernel is actually 
>> "memmap=0x5200000$0x3a000000" now (directly in grub.conf, you must only 
>> quote once: "\$"), you either have some other resources at 0x3a000000, 
>> not just RAM. Check what /proc/iomem reports - when that parameter is 
>> not in use. Or your system has less than 512 MB RAM (unlikely)... 
>>
>> Maybe share your generated config.c. 
>>
>> Jan 
>>
>> > j.kiszka...@gmail.com schrieb am Mittwoch, 9. September 2020 um 
>> 15:10:03 
>> > UTC+2: 
>> > 
>> > On 09.09.20 14:58, Jan-Marc Stranz wrote: 
>> > > I have good news. 
>> > > I now have a Linux system on an Intel NUC8I7 with IOMMU support!. 
>> > > 
>> > > The hardware check of Jalihouse works and I was able to create a 
>> > > configuration for the root cell with "jailhouse config create 
>> > nuc8i7.c". 
>> > > (I've attached this configuration.) 
>> > > I inserted this cell configuration into the Yocto build system and 
>> > the 
>> > > file "nuc8i7.cell" is created and installed under 
>> > > "/usr/share/jailhouse/cells". 
>> > > 
>> > > In order to start Jailhouse with "jailhouse enable nuc8i7.cell" I 
>> > > extended the Linux command line with: 
>> > > intel_iommu=off memmap=0x5200000$0x3a000000 
>> > > 
>> > > I took the entry "memmap = ..." from the generated configuration 
>> > "nuc8i7.c". 
>> > > 
>> > > While re-booting the system it gets stuck with the following message: 
>> > > Kernel panic - System is deadlocked on memory 
>> > > 
>> > > The kernel parameter  "memmap = ..." should actually work, because 
>> > 82M 
>> > > of the following area is reserved: 
>> > > 
>> > > /* MemRegion: 00100000-39ffffff : System RAM */ 
>> > > { 
>> > >      .phys_start = 0x100000, 
>> > >      .virt_start = 0x100000, 
>> > >      .size = 0x39f00000, 
>> > >      .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
>> > >       JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA, 
>> > > } 
>> > > 
>> > > What could I do? 
>> > > 
>> > 
>> > Most probably, that "$" in the kernel command line is prematurely 
>> > resolved as "$0" or so and the resulting kernel command line is 
>> > invalid. 
>> > Depending in how you inject the parameter, make sure quoting or 
>> > escaping 
>> > ("\$", or even more) is correctly done and validate the output of the 
>> > kernel. 
>> > 
>> > Jan 
>> > 
>> > -- 
>> > Siemens AG, Corporate Technology, CT RDA IOT SES-DE 
>> > Corporate Competence Center Embedded Linux 
>> > 
>> > -- 
>> > You received this message because you are subscribed to the Google 
>> > Groups "Jailhouse" group. 
>> > To unsubscribe from this group and stop receiving emails from it, send 
>> > an email to jailhouse-de...@googlegroups.com 
>> > <mailto:jailhouse-de...@googlegroups.com>. 
>> > To view this discussion on the web visit 
>> > 
>> https://groups.google.com/d/msgid/jailhouse-dev/618bbad6-8276-476b-934e-ea765b28a796n%40googlegroups.com 
>> > <
>> https://groups.google.com/d/msgid/jailhouse-dev/618bbad6-8276-476b-934e-ea765b28a796n%40googlegroups.com?utm_medium=email&utm_source=footer>. 
>>
>>
>> -- 
>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE 
>> Corporate Competence Center Embedded Linux 
>>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/42b8fa41-88cc-4907-bdce-44474b98d8acn%40googlegroups.com.

------=_Part_2601_418277551.1599660819934
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>My serial port is "/dev/ttyUSB0".</div><div>I've connected this with a=
n other Linux PC and tested it with "minicom".</div><div><br></div><div>But=
 if I start Jailhouse with "jailhouse enable ..." then I do not receive any=
 messages via this serial port.</div><div>Do jailhouse use "/dev/ttyUSB*"?<=
br></div><br><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_at=
tr">Jan-Marc Stranz schrieb am Mittwoch, 9. September 2020 um 15:55:31 UTC+=
2:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex=
; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><div>I got=
 it!</div><div>The entry msut be &quot;memmap=3D0x5200000\$0x3a000000&quot;=
(only one &quot;\&quot;).</div><div><br></div>The command &quot;less /proc/=
iomem&quot; then shows the following:<br><div>=C2=A0...</div><div><span sty=
le=3D"font-family:Courier New">3a000000-3f1fffff : Reserved</span></div><di=
v>...</div><div><br></div><div>So far everything is fine.</div><div><br></d=
iv><div>I&#39;ve also tried &quot;jailhouse enable nuc8i7.cell&quot;; the s=
ystem freezes.<br>So now I have to adjust the cell configuration.<br>It cou=
ld be that I need your help later.<br></div><div><br></div><div><br></div><=
div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr"><a href da=
ta-email-masked rel=3D"nofollow">j.kiszka...@gmail.com</a> schrieb am Mittw=
och, 9. September 2020 um 15:35:09 UTC+2:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On 09.09.20 15:21, Jan-Marc Stranz wrote:
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
<br>&gt; <a rel=3D"nofollow">j.kiszka...@gmail.com</a> schrieb am Mittwoch,=
 9. September 2020 um 15:10:03
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
<br>&gt; an email to <a rel=3D"nofollow">jailhouse-de...@googlegroups.com</=
a>
<br>&gt; &lt;mailto:<a rel=3D"nofollow">jailhouse-de...@googlegroups.com</a=
>&gt;.
<br>&gt; To view this discussion on the web visit
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/618bbad=
6-8276-476b-934e-ea765b28a796n%40googlegroups.com" rel=3D"nofollow" target=
=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dde&amp;=
q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/618bbad6-8276-476b-934e=
-ea765b28a796n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1599746994=
506000&amp;usg=3DAFQjCNEVI7xwYJjOeuVVThMxp6q7jCoULQ">https://groups.google.=
com/d/msgid/jailhouse-dev/618bbad6-8276-476b-934e-ea765b28a796n%40googlegro=
ups.com</a>
<br>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/618=
bbad6-8276-476b-934e-ea765b28a796n%40googlegroups.com?utm_medium=3Demail&am=
p;utm_source=3Dfooter" rel=3D"nofollow" target=3D"_blank" data-saferedirect=
url=3D"https://www.google.com/url?hl=3Dde&amp;q=3Dhttps://groups.google.com=
/d/msgid/jailhouse-dev/618bbad6-8276-476b-934e-ea765b28a796n%2540googlegrou=
ps.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=
=3D1599746994507000&amp;usg=3DAFQjCNG-hdpSuLlwWsjicrRkMGpDbED_dw">https://g=
roups.google.com/d/msgid/jailhouse-dev/618bbad6-8276-476b-934e-ea765b28a796=
n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
<br>
<br>--=20
<br>Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/42b8fa41-88cc-4907-bdce-44474b98d8acn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/42b8fa41-88cc-4907-bdce-44474b98d8acn%40googlegroups.co=
m</a>.<br />

------=_Part_2601_418277551.1599660819934--

------=_Part_2600_1301891171.1599660819933--
