Return-Path: <jailhouse-dev+bncBC2PTC4R4MNBBTHP5HWQKGQE6GQLZFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x237.google.com (mail-oi1-x237.google.com [IPv6:2607:f8b0:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6AAEAA82
	for <lists+jailhouse-dev@lfdr.de>; Thu, 31 Oct 2019 06:57:34 +0100 (CET)
Received: by mail-oi1-x237.google.com with SMTP id 24sf1282019oiq.12
        for <lists+jailhouse-dev@lfdr.de>; Wed, 30 Oct 2019 22:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=aMXGvZiFoJxdekhlwZjydQfljoxQHBcBBMaxj/bgVSk=;
        b=U6bxGrIEqeMl6QoyI5y9NO7d23LFSffbmF6PeXtTg8a8CU3ra79DQzT5IsEAADK63l
         JpOxJQ04P7ObKETlCsz4xe0/oqlrziBm/6KjVVjPuB2pClQtvgNznoYcW2aZzpUh7AHg
         ktqa7Rh1EMKdD3BbL34DvYSpp+GDe+yNGQ8NPV6oB6w6J1Q/4Ri/x6aB04El78ei/ebF
         m/w+eDVqa22dSzxPQMw5nHcDkWlslCEzdsKQNg2IL0Fo/rqdD/XcQ1c972cMJg5ld+Af
         Zqg1tiQPapSAjVGkAalSk6sEBgf+c+Xi98sTfQ4S528VzKe+lRPDMkuNPbmfkhxEHPlR
         jiIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=aMXGvZiFoJxdekhlwZjydQfljoxQHBcBBMaxj/bgVSk=;
        b=Fi9N5WkekS0nuZu1I2IBDu0S/lcIoeQyKus8f9U9yYHlBc5s0a1H3ZHVenv83G5Xc2
         uFEROiYJ86slehfF9u3WY+6/dDjKbd3z62NYr0/sThzwuXCitcQXlxru/1sYugbp8l8S
         t7EzOuJSr+bY58e5qXLGv9oExQyq68w5cSoTOoeBdQIzRq3sUvZ5NqyIQLUcbX8F5lPA
         mBl+SfkmPnBRk2Ohk8Xxe4j738tLXRgE57HI+oYTb376HuxspRNVc1cpfHKTyvKscNfT
         aTf8wMlMGnwkluEAuGYakAdJsileEA3M5MKt++SA4+FxbALuo7cxRkXYjOE/JJcgzf/q
         1RSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=aMXGvZiFoJxdekhlwZjydQfljoxQHBcBBMaxj/bgVSk=;
        b=APeDC/vhWI2la2YiUg6XnwAEK7d42F8yzsSesmrjQ6xub3mg+0dX34j0AwGoNr528Z
         ifvvG8VxgEmGr1VCpocGlTITp6E0gQztWu7mwLAObvtOuS9En23lyev10JA5MrRm/R4i
         E2MrFY/PQ7PcBD2EUg4oVF2K9W0f8wsde2sZMjWCkCNYkxF+wbn6hDBAIKWxI8qqZT/Z
         /5y2c9QwY/yBgOGQ8c2ns1QfH/mPFIgKnr+6XDAMXGQWiBQ+vjaa70AtrGSAWv6LBvL2
         4w+9FTTh0XHzqDnO9I4R6Rd+LpAiOxgTuuUy1OKbXT7gV31C6/MsQN8fRRKfVLNwjP/r
         4bJQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXCAOiNMVPVA37x+HTPSIrdcXd+oSsB0wpDhaHaejQQxKG92XcT
	Tw3MuIXIOaR5lxfbRLtqJgg=
X-Google-Smtp-Source: APXvYqwz06uxV210RHNYnILVB0e2dl0TP/+JtKshYGC94S7xY8sKkkMi2vtnutw54GUP8PG6c4jNuw==
X-Received: by 2002:aca:ec81:: with SMTP id k123mr2280424oih.171.1572501452880;
        Wed, 30 Oct 2019 22:57:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:4a9c:: with SMTP id i28ls412129otf.14.gmail; Wed, 30 Oct
 2019 22:57:32 -0700 (PDT)
X-Received: by 2002:a9d:3b1:: with SMTP id f46mr3151152otf.216.1572501452084;
        Wed, 30 Oct 2019 22:57:32 -0700 (PDT)
Date: Wed, 30 Oct 2019 22:57:31 -0700 (PDT)
From: Chung-Fan Yang <sonic.tw.tp@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <6705dfff-635e-4182-a684-86d0b861e94e@googlegroups.com>
In-Reply-To: <09cf7ef6-0bb0-0d3e-cab3-493c500c6559@siemens.com>
References: <a54a651c-13de-4aa1-9c32-475ebddc4e6f@googlegroups.com>
 <6defc2d1-96ac-c470-818d-1c9a8e1d8725@web.de>
 <eed4bd9a-7020-4182-9949-d529bef7b3b2@googlegroups.com>
 <48bb5fe2-9b9f-4ad1-872e-9eae4bdd2c43@googlegroups.com>
 <20191025155257.6af12e29@md1za8fc.ad001.siemens.net>
 <76ecfa10-3a69-b5bc-382a-48a59c345637@siemens.com>
 <579d40f1-a8f4-4144-9405-3bba1ea23c14@googlegroups.com>
 <2151b869-9732-4483-8659-90234a971f1b@googlegroups.com>
 <09cf7ef6-0bb0-0d3e-cab3-493c500c6559@siemens.com>
Subject: Re: v0.9 vs v1.1 interrupt latency raise
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2477_544033734.1572501451459"
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

------=_Part_2477_544033734.1572501451459
Content-Type: multipart/alternative; 
	boundary="----=_Part_2478_1162505902.1572501451460"

------=_Part_2478_1162505902.1572501451460
Content-Type: text/plain; charset="UTF-8"



> Interesting findings already, but I'm afraid we will need to dig deeper: 
> Can you describe what all is part of your measured latency path? 


I measured using an oscillate scope and function generator.
I am using MMIO GPIOs. The application calls a system call and waits for an 
interrupt on a certain GPIO.
When I send a pulse to the GPIO, the IRQ handler release a semaphore, 
interm trigger the scheduler and wake-up the application, which send 
another pulse to another GPIO using MMIO.

FG -> Serial -> APIC -> RTOS IRQ Hnd -> Scheduler -> Application -> Serial 
-> OSC

The timing different of these 2 pulses are measured.

Because of the waiting mechanism used, receiving the pulse involved the 
system call / semaphore / interrupt handling of the RTOS.
On the other hand, sending doesn't use any of the RTOS feature.

Do you just run code in guest mode or do you also trigger VM exits, e.g. to 
> issue ivshmem interrupts to a remote side? 


I tried to instrument the system.
So far there are no additional interrupts send, nor received during the 
whole process.
VMExit do exist for EOI(systick and serial IRQ) and when I fiddle the 
TSC_deadline timer enable/disable bit of APIC MSR.
The whole process is not related to any ivshmem operations. 

Maybe you can sample some latencies along the critical path so that we have 
> a better picture about  
>
where we lose time, overall or rather on specific actions. 
>

Basically, it is an overall slowdown.
But code in the scheduler and application slowdown more than other places.

BTW, I tested the again with a partially working setup of <kernel 
4.19/Jailhouse v0.11/old ivshmem2>.
Currently, I cannot get my application running, due to some mystery, but I 
am observing some slowdown.
Pinging the RTOS using ivshmem-net the RTT has about 2x latency:
 * <kernel 4.19/Jailhouse v0.11/old ivshmem2>: ~0.060ms
 * <kernel 4.19/Jailhouse v0.11/new ivshmem2>: ~0.130ms

----
Yang

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6705dfff-635e-4182-a684-86d0b861e94e%40googlegroups.com.

------=_Part_2478_1162505902.1572501451460
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><blockquote class=3D"gmail_quote" style=3D"margin: 0;m=
argin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">Interesti=
ng findings already, but I&#39;m afraid we will need to dig deeper:
<br>Can you describe what all is part of your measured latency path? </bloc=
kquote><div><br></div><div>I measured using an oscillate scope and function=
 generator.</div><div>I am using MMIO GPIOs. The application calls a system=
 call and waits for an interrupt on a certain GPIO.</div><div>When I send a=
 pulse to the GPIO, the IRQ handler release a semaphore, interm trigger the=
 scheduler and wake-up the application, which send another pulse to another=
 GPIO using MMIO.</div><div><br></div><div>FG -&gt; Serial -&gt; APIC -&gt;=
 RTOS IRQ Hnd -&gt; Scheduler -&gt; Application -&gt; Serial -&gt; OSC<br><=
/div><div><br></div><div>The timing different of these 2 pulses are measure=
d.</div><div><br></div><div>Because of the waiting mechanism used, receivin=
g the pulse involved the system call / semaphore / interrupt handling of th=
e RTOS.</div><div>On the other hand, sending doesn&#39;t use any of the RTO=
S feature.<br></div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: =
1ex;">Do you just run code in guest mode or do you also trigger VM exits, e=
.g. to
<br>issue ivshmem interrupts to a remote side? </blockquote><div><br></div>=
<div>I tried to instrument the system.</div><div>So far there are no additi=
onal interrupts send, nor received during the whole process.</div><div>VMEx=
it do exist for EOI(systick and serial IRQ) and when I fiddle the TSC_deadl=
ine timer enable/disable bit of APIC MSR.<br></div><div>The whole process i=
s not related to any ivshmem operations. <br></div><div><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left:=
 1px #ccc solid;padding-left: 1ex;">Maybe you can sample some
latencies along the critical path so that we have a better picture about=C2=
=A0
<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin: 0;margi=
n-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">where we lose=
 time, overall or rather on specific actions.
<br></blockquote><div><br></div><div>Basically, it is an overall slowdown.<=
/div><div>But code in the scheduler and application slowdown more than othe=
r places.</div><div><br></div><div>BTW, I tested the again with a partially=
 working setup of &lt;kernel 4.19/Jailhouse v0.11/old ivshmem2&gt;.</div><d=
iv>Currently, I cannot get my application running, due to some mystery, but=
 I am observing some slowdown.</div><div>Pinging the RTOS using ivshmem-net=
 the RTT has about 2x latency:</div><div>=C2=A0* &lt;kernel 4.19/Jailhouse =
v0.11/old ivshmem2&gt;: ~0.060ms<br></div><div>=C2=A0* &lt;kernel 4.19/Jail=
house v0.11/new ivshmem2&gt;: ~0.130ms</div><div><br></div><div>----</div><=
div>Yang<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/6705dfff-635e-4182-a684-86d0b861e94e%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/6705dfff-635e-4182-a684-86d0b861e94e%40googlegroups.com<=
/a>.<br />

------=_Part_2478_1162505902.1572501451460--

------=_Part_2477_544033734.1572501451459--
