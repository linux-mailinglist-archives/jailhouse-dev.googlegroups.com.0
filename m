Return-Path: <jailhouse-dev+bncBC2PTC4R4MNBBJN24PWQKGQEAK6F63Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23a.google.com (mail-oi1-x23a.google.com [IPv6:2607:f8b0:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D2AE942C
	for <lists+jailhouse-dev@lfdr.de>; Wed, 30 Oct 2019 01:45:26 +0100 (CET)
Received: by mail-oi1-x23a.google.com with SMTP id r67sf312046oif.18
        for <lists+jailhouse-dev@lfdr.de>; Tue, 29 Oct 2019 17:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=mpx02UtcLO7A1URwuKK19dZRsFZ7KKaSWXWWQxV949k=;
        b=YDWtgIX+8U+ZBOZss9hIktCdTZaaEfmghgEHbBvIlNU/VADsp2u9u6YXSfwsDdOBYj
         WzrRXxcXid7vATJKfaYETGwTCzX6mxeF0ay3DUvnOcUfn5GrIbO0JR+lcL+IKE2pmgpD
         VVIri4Qi6a685nKT0R2XM7gnkxwywRMLzJkJfZ8d84DfabbrFT5ltgbK4RCtn9fc/U1+
         ltE538KosCBWbMUSWondHPDMNJmLHjW6hcfML3cI9KgcMiSFuF6qD+2qpme3rNzhZw3/
         YewWSv6cWZB2mLWM8OlabXoef6FWBkPo0u50b0dod2QVALG9a4BKyCdCNRgOMVE0eSsv
         wznA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=mpx02UtcLO7A1URwuKK19dZRsFZ7KKaSWXWWQxV949k=;
        b=B6k0pDxPxys1xuSubAVZDiFXHj7lZG7FrGR+OxlV0c13GXnvXpfszZRoLqNTMvu/aO
         l+KaDaHLCcPjw/U9OtZnfgBqxudq1jctm7uCvsLhCTLsOoTD51HP86bPFQDvkJhQvodU
         D4r1NTLwXfH9WS14IF+2SdlRPCFIYHNsMyyNiAwNingdHsM41Y/ybiGHAy4i+qRlIbc5
         /sQEzJdekVl/UHbQMBBw3Ucv9YEHuVrHDeVRKAHs7GZWzrljL1346Qa41vm1fDMWP0MH
         K8he+6WAcfMVtRPgtFEQkjf1B0GdoCLGaWVEQ4A1DwA1RhjbOXKu444lau8I7ZgKpOu1
         G4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=mpx02UtcLO7A1URwuKK19dZRsFZ7KKaSWXWWQxV949k=;
        b=ayughMkdKFxwsmZbB/7aUcf/88HRtqNu0iqLDLvCwroNuy9MuhQ1BhiuuerYIHHcsq
         T+OuI1aRoXIREoJg/BoUR+zCUfq7zKSNwmA+nKY4nnKOJR5hFx9abTw1em7znQWUw7cw
         Hc9LOdw38FgdgqwZZ4aar62tvHItho22Dtw1RjW3CA6qEsyiafpMWhL1pLAIq24N6+Oq
         UOD6Th9wQd6Zs7VHbnInZ3z1Xqt4+fwQ0Sw9pmLMiyPusmGjs7/zb+bVB5cL3uJMgLSH
         UwjJTljLkZE4LeOaN8gEVTiP7nd70vLAxQUdA7D15c//1NUKTl+JqXWY90huhrcdl8bg
         sMbQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX5VkAypiCe0McX0hiYPP5wicOjCOzgxHPuE1+gx3kZ/pCpZ94r
	UedwQxFBcKbutKtDz08wODc=
X-Google-Smtp-Source: APXvYqzq9F+okuhNleDIThuR1OXtDlVhpZAeihbGu4nWfTCCKq9ovN7YJOk6LILveI0mogQ3PVKBmA==
X-Received: by 2002:aca:5c89:: with SMTP id q131mr6706502oib.56.1572396325775;
        Tue, 29 Oct 2019 17:45:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:d410:: with SMTP id l16ls1481911oig.2.gmail; Tue, 29 Oct
 2019 17:45:25 -0700 (PDT)
X-Received: by 2002:aca:2408:: with SMTP id n8mr6220005oic.154.1572396325102;
        Tue, 29 Oct 2019 17:45:25 -0700 (PDT)
Date: Tue, 29 Oct 2019 17:45:24 -0700 (PDT)
From: Chung-Fan Yang <sonic.tw.tp@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <579d40f1-a8f4-4144-9405-3bba1ea23c14@googlegroups.com>
In-Reply-To: <76ecfa10-3a69-b5bc-382a-48a59c345637@siemens.com>
References: <a54a651c-13de-4aa1-9c32-475ebddc4e6f@googlegroups.com>
 <6defc2d1-96ac-c470-818d-1c9a8e1d8725@web.de>
 <eed4bd9a-7020-4182-9949-d529bef7b3b2@googlegroups.com>
 <48bb5fe2-9b9f-4ad1-872e-9eae4bdd2c43@googlegroups.com>
 <20191025155257.6af12e29@md1za8fc.ad001.siemens.net>
 <76ecfa10-3a69-b5bc-382a-48a59c345637@siemens.com>
Subject: Re: v0.9 vs v1.1 interrupt latency raise
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1447_588798980.1572396324609"
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

------=_Part_1447_588798980.1572396324609
Content-Type: multipart/alternative; 
	boundary="----=_Part_1448_926460663.1572396324609"

------=_Part_1448_926460663.1572396324609
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



2019=E5=B9=B410=E6=9C=8826=E6=97=A5=E5=9C=9F=E6=9B=9C=E6=97=A5 2=E6=99=8209=
=E5=88=8630=E7=A7=92 UTC+9 Jan Kiszka:
>
> On 25.10.19 15:52, Henning Schild wrote:=20
> > Well you only have soo many shared ressources and if it is not=20
> > additional exits/interrupts then it is contention on shared ressources.=
=20
> >=20
> > We are probably talking about caches, TLBs and buses.=20
> >=20
> > You should be able to use i.e. "perf" on Linux to read out hardware=20
> > performance counters. And there you might want to look for TLB and=20
> > cache misses.=20
> >=20
> > But the bisecting might be the better idea. Jan already mentioned the=
=20
> > "features" that could be responsible. With a bit of educated guessing=
=20
> > you will get away with just a few tries.=20
>
> BTW, does your RTOS happen to use anything of the inmate bootstrap code=
=20
> to start in Jailhouse? That also changed.=20
>
> Jan=20
>

Henning,

I do think there are contentions related to memory, either TLB or=20
Bus(assuming CAT is good).
I will do the bisect this month, got urgent things to do.


Jan,

Yes, I did steal some code.
I will check if they fit.


Yang
=20

>
> >=20
> > Henning=20
> >=20
> > Am Fri, 25 Oct 2019 00:04:36 -0700=20
> > schrieb Chung-Fan Yang <soni...@gmail.com <javascript:>>:=20
> >=20
> >> Alright, I have test the latency from HW IRQ to application response.=
=20
> >>=20
> >> I found out that there aren't any additional VM-Exit or IRQ, nor RTOS=
=20
> >> scheduling and house-keeping.=20
> >>=20
> >> It feels like the processor is generally slower as everything takes=20
> >> longer to run.=20
> >>=20
> >> The IRQ epilogue takes ~7.8us and iretq ~2.x us. In addition, the=20
> >> libc and syscall interface also have slow downed a bit.=20
> >>=20
> >> I do notice after upgrading, even with CAT, my RTOS latency are prone=
=20
> >> to be influenced by the Linux side applications.=20
> >> This was not observed during v0.9.1.=20
> >>=20
> >> It's strange.=20
> >>=20
> >>=20
> >> Yang.=20
> >>=20
> >=20
> >=20
> >=20
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
jailhouse-dev/579d40f1-a8f4-4144-9405-3bba1ea23c14%40googlegroups.com.

------=_Part_1448_926460663.1572396324609
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>2019=E5=B9=B410=E6=9C=8826=E6=97=A5=E5=9C=9F=E6=9B=
=9C=E6=97=A5 2=E6=99=8209=E5=88=8630=E7=A7=92 UTC+9 Jan Kiszka:<blockquote =
class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1p=
x #ccc solid;padding-left: 1ex;">On 25.10.19 15:52, Henning Schild wrote:
<br>&gt; Well you only have soo many shared ressources and if it is not
<br>&gt; additional exits/interrupts then it is contention on shared ressou=
rces.
<br>&gt;=20
<br>&gt; We are probably talking about caches, TLBs and buses.
<br>&gt;=20
<br>&gt; You should be able to use i.e. &quot;perf&quot; on Linux to read o=
ut hardware
<br>&gt; performance counters. And there you might want to look for TLB and
<br>&gt; cache misses.
<br>&gt;=20
<br>&gt; But the bisecting might be the better idea. Jan already mentioned =
the
<br>&gt; &quot;features&quot; that could be responsible. With a bit of educ=
ated guessing
<br>&gt; you will get away with just a few tries.
<br>
<br>BTW, does your RTOS happen to use anything of the inmate bootstrap code
<br>to start in Jailhouse? That also changed.
<br>
<br>Jan
<br></blockquote><div><br></div><div>Henning,</div><div><br></div><div>I do=
 think there are contentions related to memory, either TLB or Bus(assuming =
CAT is good).</div><div>I will do the bisect this month, got urgent things =
to do.</div><div><br></div><div><br></div><div>Jan,<br></div><div><br></div=
><div>Yes, I did steal some code.</div><div>I will check if they fit.</div>=
<div><br></div><div><br></div><div>Yang<br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left:=
 1px #ccc solid;padding-left: 1ex;">
<br>&gt;=20
<br>&gt; Henning
<br>&gt;=20
<br>&gt; Am Fri, 25 Oct 2019 00:04:36 -0700
<br>&gt; schrieb Chung-Fan Yang &lt;<a href=3D"javascript:" target=3D"_blan=
k" gdf-obfuscated-mailto=3D"l6Y-lws2AQAJ" rel=3D"nofollow" onmousedown=3D"t=
his.href=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;=
javascript:&#39;;return true;">soni...@gmail.com</a>&gt;:
<br>&gt;=20
<br>&gt;&gt; Alright, I have test the latency from HW IRQ to application re=
sponse.
<br>&gt;&gt;
<br>&gt;&gt; I found out that there aren&#39;t any additional VM-Exit or IR=
Q, nor RTOS=20
<br>&gt;&gt; scheduling and house-keeping.
<br>&gt;&gt;
<br>&gt;&gt; It feels like the processor is generally slower as everything =
takes
<br>&gt;&gt; longer to run.
<br>&gt;&gt;
<br>&gt;&gt; The IRQ epilogue takes ~7.8us and iretq ~2.x us. In addition, =
the
<br>&gt;&gt; libc and syscall interface also have slow downed a bit.
<br>&gt;&gt;
<br>&gt;&gt; I do notice after upgrading, even with CAT, my RTOS latency ar=
e prone
<br>&gt;&gt; to be influenced by the Linux side applications.
<br>&gt;&gt; This was not observed during v0.9.1.
<br>&gt;&gt;
<br>&gt;&gt; It&#39;s strange.
<br>&gt;&gt;
<br>&gt;&gt;
<br>&gt;&gt; Yang.
<br>&gt;&gt;
<br>&gt;=20
<br>&gt;=20
<br>&gt;=20
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
om/d/msgid/jailhouse-dev/579d40f1-a8f4-4144-9405-3bba1ea23c14%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/579d40f1-a8f4-4144-9405-3bba1ea23c14%40googlegroups.com<=
/a>.<br />

------=_Part_1448_926460663.1572396324609--

------=_Part_1447_588798980.1572396324609--
