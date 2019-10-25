Return-Path: <jailhouse-dev+bncBC2PTC4R4MNBBDU2ZHWQKGQEGRIMMXI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33d.google.com (mail-ot1-x33d.google.com [IPv6:2607:f8b0:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BB1E40E9
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Oct 2019 03:17:03 +0200 (CEST)
Received: by mail-ot1-x33d.google.com with SMTP id r5sf302114otn.22
        for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Oct 2019 18:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/rxhgu2KMDQHLgUdZiO2ylQuiv2jFJSbo0MZZ8QlWUs=;
        b=WEQPImRMRNZHFXRemTyS1bMGA7wOfL1DiaFbTUupIGN4efwTOHqjNm1nQrqkhXmsC+
         FawvZeDN5KoMBnheRgrt5Ocya/JhUrBkjOhwArDT04Ni3nVQttoPlr2tDtVnqzoXGYNQ
         uz6ho7cnFeJjRnsX9XKeVLmwzWzCG5hREOVC98aI2pTAM9EBcYTE7eMkN7IxrXc6K+3C
         gVafUc/qTjrLr65kabaHqsvciZsfEiyKKx4Lkg8ylNR/LIagRiUBbANbtxhUeEBXg5fN
         C3D/kHlPQPPtgsRiPiOneO9OgN0PMrhwjouo3kGVE/BeIbblngVgGT4JCSXf96Gbdlp5
         LodQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/rxhgu2KMDQHLgUdZiO2ylQuiv2jFJSbo0MZZ8QlWUs=;
        b=Eq9TyydtSaQDIO4ERx89ll9eUAdM/F3UxQ/7IhWyRa47UpzULjLE3LfW3z6h02vJQZ
         JdCq6BtiD+oJvIgTaB4AI3cdjUIJ6o7HwPsdFXmFCb6EqXYfFITC535lcRUbPUGZZrEL
         hEA9Kweoqn6NZ3sEDs/TWFq8+2IBDY2eU4McdJQHwJ2Cyx2WLYg/dgxUxfN79aQ1JI7J
         j+bDSmewPSa+cOXYrZfsl6ZnLA3lqiesO8UbEo0k3mF3BTu+XyiTKOZF3UE8SmX4PXBm
         M80H5bxJWejXfVelzvQkJeEB1vKNkAyIlNZBKFuBeO/Cv1KruZWX5W7/othZtT8+8cJ0
         RFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/rxhgu2KMDQHLgUdZiO2ylQuiv2jFJSbo0MZZ8QlWUs=;
        b=r4AhaWsj4N3IJYbYGFVUSlcO0AjRnAJ8/F+09Jurul0+SCjvFFu9nWyYc2BRSej8TP
         CUX5QCitAvXHDCtqSI7zwGZ6GCj0qaE/2bdZBiOLZjJXfgkthVEcPzYZbEplqLgC5Gh7
         ySCLgdc11arYmwxahKO7nNirbNPaDYunNx6p/DWYp3/2TME2c9A6HRh77GGNQjv4/VU8
         DpqjO7qmzn5/icUgP9QPM0t5/9CjDWvvGQ3c6G1vTlEUUL0ka0kYtFngXTwCn7+MH1I9
         hOAnoulEK9WfXNVnuSHttvAOotKwBqPG4MhFW4qy7vVZG//JrFK/9S7Jy3biHggIg+u5
         xuTA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUP2bLb09oNcH2i4G10R73pwJuJaOvh8MO4CZuPBy+/b5SOfj9Q
	XC9pl0NdBtlAdUOndDtUlQ4=
X-Google-Smtp-Source: APXvYqwmnFGoMIWMV8/rvybfuiyAf8/dPgqJt3zqAmxW+Yx3rN8HoFHE4kWogtqSkk7mcT0kaoZQ+g==
X-Received: by 2002:a05:6830:1103:: with SMTP id w3mr671415otq.176.1571966222839;
        Thu, 24 Oct 2019 18:17:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:1383:: with SMTP id d3ls2353508otq.0.gmail; Thu, 24
 Oct 2019 18:17:02 -0700 (PDT)
X-Received: by 2002:a9d:7843:: with SMTP id c3mr592772otm.71.1571966222222;
        Thu, 24 Oct 2019 18:17:02 -0700 (PDT)
Date: Thu, 24 Oct 2019 18:17:01 -0700 (PDT)
From: Chung-Fan Yang <sonic.tw.tp@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <eed4bd9a-7020-4182-9949-d529bef7b3b2@googlegroups.com>
In-Reply-To: <6defc2d1-96ac-c470-818d-1c9a8e1d8725@web.de>
References: <a54a651c-13de-4aa1-9c32-475ebddc4e6f@googlegroups.com>
 <6defc2d1-96ac-c470-818d-1c9a8e1d8725@web.de>
Subject: Re: v0.9 vs v1.1 interrupt latency raise
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_136_759234135.1571966221644"
X-Original-Sender: Sonic.tw.tp@gmail.com
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

------=_Part_136_759234135.1571966221644
Content-Type: multipart/alternative; 
	boundary="----=_Part_137_902031613.1571966221644"

------=_Part_137_902031613.1571966221644
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



>
> Do you mean upgrading Jailhouse (and only that) from 0.9 to 0.11?=20
>
>
Yes

We refactored quite a bit between the two releases. Namely, 0.10 brought=20
> per-cpu page tables.=20
>

Page table might be the cause, but I am not sure.
I did noticed that my my process updating the page table during CTX in RTOS=
=20
has dramatically slowed down after upgrade.
It was < 10us, but 250 us after upgrade.
I did some optimization by saving the 2-level and 3-level page directory=20
entries and managed to reduce it to 25us.
=20

>
> You could first of try to narrow the reason down a bit: Do the exit=20
> statistics look different for both versions?


I don't see a large difference.

With Intel x86, you should=20
> normally have no exit for an external or timer interrupt injection.=20


I did noticed in both version, I have a large amount of exit due to MSR=20
access.
Doesn't x2APIC EOI cause an exit?
=20

> From=20
> that perspective, even 20 =C2=B5s is too high. Try to identify the path t=
hat=20
> causes the latency.=20
>
> You could also try to bisect Jailhouse between the two versions, in=20
> order to identify the causing commit. But that is only plan B I would say=
.=20
>

I will work on this, but bisect Jailhouse can be difficult considering the=
=20
ABI and config format change from time to time.

 Yang

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/eed4bd9a-7020-4182-9949-d529bef7b3b2%40googlegroups.com.

------=_Part_137_902031613.1571966221644
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><blockquote class=3D"gmail_quote" style=3D"margin: 0;m=
argin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">
<br>Do you mean upgrading Jailhouse (and only that) from 0.9 to 0.11?
<br>
<br></blockquote><div><br></div><div>Yes</div><div> <br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px=
 #ccc solid;padding-left: 1ex;">We refactored quite a bit between the two r=
eleases. Namely, 0.10 brought
<br>per-cpu page tables.
<br></blockquote><div><br></div><div>Page table might be the cause, but I a=
m not sure.</div><div>I did noticed that my my process updating the page ta=
ble during CTX in RTOS has dramatically slowed down after upgrade.</div><di=
v>It was &lt; 10us, but 250 us after upgrade.</div><div>I did some optimiza=
tion by saving the 2-level and 3-level page directory entries and managed t=
o reduce it to 25us.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;pad=
ding-left: 1ex;">
<br>You could first of try to narrow the reason down a bit: Do the exit
<br>statistics look different for both versions?</blockquote><div><br></div=
><div>I don&#39;t see a large difference.<br></div><div><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left:=
 1px #ccc solid;padding-left: 1ex;"> With Intel x86, you should
<br>normally have no exit for an external or timer interrupt injection. </b=
lockquote><div><br></div><div>I did noticed in both version, I have a large=
 amount of exit due to MSR access.</div><div>Doesn&#39;t x2APIC EOI cause a=
n exit?<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: =
1ex;">From
<br>that perspective, even 20 =C2=B5s is too high. Try to identify the path=
 that
<br>causes the latency.
<br>
<br>You could also try to bisect Jailhouse between the two versions, in
<br>order to identify the causing commit. But that is only plan B I would s=
ay.
<br></blockquote><div><br></div><div>I will work on this, but bisect Jailho=
use can be difficult considering the ABI and config format change from time=
 to time.<br></div><div><br></div><div>=C2=A0Yang</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/eed4bd9a-7020-4182-9949-d529bef7b3b2%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/eed4bd9a-7020-4182-9949-d529bef7b3b2%40googlegroups.com<=
/a>.<br />

------=_Part_137_902031613.1571966221644--

------=_Part_136_759234135.1571966221644--
