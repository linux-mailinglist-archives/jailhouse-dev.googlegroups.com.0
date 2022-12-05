Return-Path: <jailhouse-dev+bncBDKIHPWY7EBBBENZXCOAMGQE35N6VYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83d.google.com (mail-qt1-x83d.google.com [IPv6:2607:f8b0:4864:20::83d])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F555642CCF
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Dec 2022 17:30:17 +0100 (CET)
Received: by mail-qt1-x83d.google.com with SMTP id u31-20020a05622a199f00b003a51fa90654sf32550525qtc.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Dec 2022 08:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=USCYZEerQcmAEKwZnpVqLEWQYt530Tzi0Fjf00FJ8F0=;
        b=TwicxBXxdTn/gRWfsMFlQIH8lbC8J093H7LyCaoqbso+eZd6Wa8bvOyDQ4zPl84QP4
         tI36ppJV6w7APaZqr1+QBub/gcdS9WvN/rdmDCm5pO23CqT6YhtsJ/QMeyCm77EXTFyo
         CgzHemAHG1rMhvfzd/Vs69hIdK1ACWbBIrO2c0UJMwBxOuYCk1+rsxfvz4ySXZ0Q1ei0
         r7VWv4Z9BMxGkGcAnRMz5MOnHQkHrBxKP8QRUusUOgV6objrhTpO7aHQn7osoM+ZjcF2
         q1hjfDe4/BD93UBmO1Z2V2kAw2Rl0jLggtmuzTV3XMuy/xklYZttmxWU5TGfeUY+rvEd
         T0Rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USCYZEerQcmAEKwZnpVqLEWQYt530Tzi0Fjf00FJ8F0=;
        b=ok1Pn7I52HGIq7Bd9T6gvibGHcuJsu3wwetGH2G23iawUX8ozl1m+VD9/rnCRc2CPC
         Y1FAGYLcMWQDB7P4L46dHAuAxojdTmMWdYnvASoVqduO2QBBUcKpZLkYYAsg5Ta0vL/Y
         N+N+rmmwXGX7fsEwiu9g/DjFzITjeqH2BY3POpmCDazbqHsTk3cCoDXI+9ekrVlZliRm
         ou0XvEt0ZoBTslr/zPnJK+n7pzSd++Ir/bE206CjnHp3bH0OfftQ9iMNPHZRF7eIH83l
         cLGIJYaiaJUWULp37RfxoRqaWpbbFvEQF4FUOKl914ugioVVq46Ux0mGrGZ7fHMcsqL5
         HpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USCYZEerQcmAEKwZnpVqLEWQYt530Tzi0Fjf00FJ8F0=;
        b=ac11AO5Kp320K+oxlzJqLChIRtPgx0EdWWezcybQ9yJZJLsTWPxasRfHT7xvGQz4ab
         BTyf/iLPeTuqDeDEWZacsfW4IuPjalMqNpkE7PpkQmjad/uWV+jg4DqMVMxaTrJcPUZJ
         P91Pm4dWbac23SGRUuY4QKAENyA/52RKjc/Ep6+K4SCcvrlqzL3W9b1btDvrfzTuLv2d
         AF7Fi0PBzTteUOJ2dN8I4KFBbhWcSFHUj4yF73CCiZ6pKqmu12/jkznIRRo7bT7D3kv9
         ulyjkDJUF5Hp2pOCOyLmBIjfu+/6q7PgK+LB2KEJE1QLHO9mkZCudy18Yo/QSypSIw0g
         YZnQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pllqb7qT5idIl6XYm+70C/bZpO3q6SUzIZcenEOiK/8jOv6viqP
	vamUNcKkJnaYi+Ur8ldHWJY=
X-Google-Smtp-Source: AA0mqf44WZLa8ElZEyHVMnDWlY49+DE2FEGg9i2D5iZ3aFhD0RiTKGPwjI8WWpg43ez5AEYAJJpFbg==
X-Received: by 2002:a05:622a:1aa9:b0:3a5:32c8:7825 with SMTP id s41-20020a05622a1aa900b003a532c87825mr76882583qtc.486.1670257809342;
        Mon, 05 Dec 2022 08:30:09 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:714b:0:b0:3a6:881f:5223 with SMTP id h11-20020ac8714b000000b003a6881f5223ls3435305qtp.9.-pod-prod-gmail;
 Mon, 05 Dec 2022 08:30:08 -0800 (PST)
X-Received: by 2002:ac8:548f:0:b0:3a6:94c0:805a with SMTP id h15-20020ac8548f000000b003a694c0805amr16951188qtq.298.1670257808324;
        Mon, 05 Dec 2022 08:30:08 -0800 (PST)
Date: Mon, 5 Dec 2022 08:30:07 -0800 (PST)
From: Rasty Slutsker <rslutsker@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <9f1616c7-ac5f-49de-bc24-8bd8520f4c07n@googlegroups.com>
In-Reply-To: <34d2d078-1282-c240-9a65-301469b0bbe2@oth-regensburg.de>
References: <fde55f66-2e83-4df2-8f5e-44b0fb831acbn@googlegroups.com>
 <34d2d078-1282-c240-9a65-301469b0bbe2@oth-regensburg.de>
Subject: Re: RTOS inmate misses interrupts
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_7724_1931138211.1670257807780"
X-Original-Sender: rslutsker@gmail.com
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

------=_Part_7724_1931138211.1670257807780
Content-Type: multipart/alternative; 
	boundary="----=_Part_7725_297212300.1670257807780"

------=_Part_7725_297212300.1670257807780
Content-Type: text/plain; charset="UTF-8"

Hi Ralf,
Thank you for the answer.
We have periodic interrupt each 30 u(!)Sec. Linux cannot deal with such 
rate, so we need hypervisor/RTOS.
We managed to read a code of hypervisor. It appears that all interrupts to 
all cores are intercepted by hypervisor and then forwarded to guests (per 
core).
If we reduce interrupt priority of mentioned interrupt (as you suggest) we 
lose even more interrupts, even without stress.
Interrupt is defined as edge triggered, I assumed that it is memorized by 
gic until serviced.
Is it possible that Hypervisor acknowledges pending interrupt while 
servicing interrupt from another source ? Kind of race - 2 interrupts for 2 
cores arrive nearly simultaneously. One is lost.

Best regards
Rasty

On Monday, December 5, 2022 at 5:14:37 PM UTC+2 Ralf Ramsauer wrote:

> Hi Nir,
>
> On 29/11/2022 14:21, nirge...@gmail.com wrote:
> > Hi there,
> > 
> > Our target is Sitara AM5726 , CortexA15 dual core on which we are 
> > running Linux on A15 core0 and RTOS on core1.
> > 
> > __
> > 
> > RTOS gets periodic interrupt from external hardware via nirq1 pin 
> > (dedicated input into ARM gic).____
> > 
> > Under heavy load in Linux (core 0!), RTOS, which runs on core1 misses 
> > interrupts.____
>
> Uhm. Can you reconstruct that issue w/o Jailhouse under Linux?
>
> I mean, can you set the SMP affinity of that IRQ to core 1 under Linux, 
> and then write some test application running on core 1 that just 
> receives the IRQ. If that issue happens under Linux as well, then you 
> know that the issue has probably nothing to do with Jailhouse.
>
>
> What also might happen: If there's enough pressure on the shared system 
> bus when Linux is under load, then you simply loose those IRQs as the 
> RTOS doesn't have enough time to handle it. You can test this hypothesis 
> if you lower the frequency of the the periodic interrupt. If you still 
> loose IRQs, then this should not be the case.
>
> > 
> > Questions____
> > 
> > 1. Does linux/hypervisor participate in interrupt scheduling/forwarding
> > to cell on Core1____
>
> Linux: No, Linux does not participate in anything that is going on on 
> CPU 1. That's the idea behind Jailhouse.
>
> Jailhouse: Maybe. On ARM platforms, Jailhouse needs to reinject the 
> Interrupt from the hypervisor to the guest, if SDEI is not available. 
> Does the Sitara come with support for SDEI support?
>
> (You can btw monitor the exits of the hypervisor with 'jailhouse cell 
> stats')
>
> Ralf
>
> > 2. Is there a description of interrupt forwarding/virtualization scheme
> > to cores (if exists)? Any pointer to document/source code would be
> > appreciated.
> > 
> > Thanks a lot,
> > 
> > Nir.
> > 
> > -- 
> > You received this message because you are subscribed to the Google 
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send 
> > an email to jailhouse-de...@googlegroups.com 
> > <mailto:jailhouse-de...@googlegroups.com>.
> > To view this discussion on the web visit 
> > 
> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com 
> <
> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com?utm_medium=email&utm_source=footer
> >.
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups.com.

------=_Part_7725_297212300.1670257807780
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ralf,<div>Thank you for the answer.</div><div>We have periodic interrupt=
 each 30 u(!)Sec. Linux cannot deal with such rate, so we need hypervisor/R=
TOS.</div><div>We managed to read a code of hypervisor. It appears that all=
 interrupts to all cores are intercepted by hypervisor and then forwarded t=
o guests (per core).</div><div>If we reduce interrupt priority of mentioned=
 interrupt (as you suggest) we lose even more interrupts, even without stre=
ss.</div><div>Interrupt is defined as edge triggered, I assumed that it is =
memorized by gic until serviced.</div><div>Is it possible that Hypervisor a=
cknowledges pending interrupt while servicing interrupt from another source=
 ? Kind of race - 2 interrupts for 2 cores arrive nearly simultaneously. On=
e is lost.</div><div><br></div><div>Best regards</div><div>Rasty<br><br></d=
iv><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Mon=
day, December 5, 2022 at 5:14:37 PM UTC+2 Ralf Ramsauer wrote:<br/></div><b=
lockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: =
1px solid rgb(204, 204, 204); padding-left: 1ex;">Hi Nir,
<br>
<br>On 29/11/2022 14:21, <a href data-email-masked rel=3D"nofollow">nirge..=
.@gmail.com</a> wrote:
<br>&gt; Hi there,
<br>&gt;=20
<br>&gt; Our target is Sitara AM5726 , CortexA15 dual core on which we are=
=20
<br>&gt; running Linux on A15 core0 and RTOS on core1.
<br>&gt;=20
<br>&gt; __
<br>&gt;=20
<br>&gt; RTOS gets periodic interrupt from external hardware via nirq1 pin=
=20
<br>&gt; (dedicated input into ARM gic).____
<br>&gt;=20
<br>&gt; Under heavy load in Linux (core 0!), RTOS, which runs on core1 mis=
ses=20
<br>&gt; interrupts.____
<br>
<br>Uhm. Can you reconstruct that issue w/o Jailhouse under Linux?
<br>
<br>I mean, can you set the SMP affinity of that IRQ to core 1 under Linux,=
=20
<br>and then write some test application running on core 1 that just=20
<br>receives the IRQ. If that issue happens under Linux as well, then you=
=20
<br>know that the issue has probably nothing to do with Jailhouse.
<br>
<br>
<br>What also might happen: If there&#39;s enough pressure on the shared sy=
stem=20
<br>bus when Linux is under load, then you simply loose those IRQs as the=
=20
<br>RTOS doesn&#39;t have enough time to handle it. You can test this hypot=
hesis=20
<br>if you lower the frequency of the the periodic interrupt. If you still=
=20
<br>loose IRQs, then this should not be the case.
<br>
<br>&gt;=20
<br>&gt; Questions____
<br>&gt;=20
<br>&gt;  1. Does linux/hypervisor participate in interrupt scheduling/forw=
arding
<br>&gt;     to cell on Core1____
<br>
<br>Linux: No, Linux does not participate in anything that is going on on=
=20
<br>CPU 1. That&#39;s the idea behind Jailhouse.
<br>
<br>Jailhouse: Maybe. On ARM platforms, Jailhouse needs to reinject the=20
<br>Interrupt from the hypervisor to the guest, if SDEI is not available.=
=20
<br>Does the Sitara come with support for SDEI support?
<br>
<br>(You can btw monitor the exits of the hypervisor with &#39;jailhouse ce=
ll=20
<br>stats&#39;)
<br>
<br>   Ralf
<br>
<br>&gt;  2. Is there a description of interrupt forwarding/virtualization =
scheme
<br>&gt;     to cores (if exists)? Any pointer to document/source code woul=
d be
<br>&gt;     appreciated.
<br>&gt;=20
<br>&gt; Thanks a lot,
<br>&gt;=20
<br>&gt; Nir.
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google=
=20
<br>&gt; Groups &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send=20
<br>&gt; an email to <a href data-email-masked rel=3D"nofollow">jailhouse-d=
e...@googlegroups.com</a>=20
<br>&gt; &lt;mailto:<a href data-email-masked rel=3D"nofollow">jailhouse-de=
...@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit=20
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/fde55f6=
6-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-=
44b0fb831acbn%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D16703436666=
58000&amp;usg=3DAOvVaw1SEbBxjNH6E51lMw_S6RGY">https://groups.google.com/d/m=
sgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com=
</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/fde55f6=
6-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com?utm_medium=3Demail&amp;ut=
m_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/=
msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%2540googlegroups.=
com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1=
670343666658000&amp;usg=3DAOvVaw07WIxn5NWOxnn-N8ltMSP6">https://groups.goog=
le.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40google=
groups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups.co=
m</a>.<br />

------=_Part_7725_297212300.1670257807780--

------=_Part_7724_1931138211.1670257807780--
