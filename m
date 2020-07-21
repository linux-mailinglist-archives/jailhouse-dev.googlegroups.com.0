Return-Path: <jailhouse-dev+bncBD7236HKXYJRBLHZ3P4AKGQENWRQCOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3b.google.com (mail-oo1-xc3b.google.com [IPv6:2607:f8b0:4864:20::c3b])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E68228243
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 16:33:17 +0200 (CEST)
Received: by mail-oo1-xc3b.google.com with SMTP id d143sf9742381oob.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 07:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=b1rVHYsNWlb9JwCTjyN2sUW3OyfnX4xvnkn2ZZcF5MM=;
        b=bmwHkzVe4OhRI28KB3ukfi9dPnO/0ok1vGf/p6WTWn12iHlswu3AOLZJvgDbhCSBeE
         ZXSF4xkDYZNTbhE6mYLP0LGjB+zdX3HemHj2VkALvlqhfZZtC/c/3HepBK57NTJeVvQh
         cSL7xosa67xq7lr746kFg7Hrz1A9CtwoXyf5zbxCSLYcDYrG6LvFqWilmMO3yltIlCSm
         xsj7anVzfs0pnrHGzMS7xzPw8tTv02+MRrnc89zimLvMJTnYc4OtN8oRNoQQIZgNcRCL
         mEdXDSKHS1nB1U0B1cjHuXHxuCuT4iZGedYO7rvBxUtsxCrRPOQHfvW2RzfZ++iL/Twg
         ItjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=b1rVHYsNWlb9JwCTjyN2sUW3OyfnX4xvnkn2ZZcF5MM=;
        b=aTv+FlmxB69B9HO2FtMSsah4SG3zsX90avIaIR5qrDHOjppO3U8Wrq1UjDnyZ2PFuM
         L1plIG70tjaBtDzrcE4nqWvJfVxtSOUFLLTeTERzNwHoRH4/YB4wj7zRZaJvCdhS1iSU
         Ca3bdM5cWgWpMQsEJ7mDEmCM/rNwTVUAwVlv49Qe9b3hsJZaP3u/2VEBxD+YG9uiyl/i
         qJ3FdApe2r5fyGw/jkHJUnZdCQqm6Un4is6Wz88B9a0YwDwOaPXyk6Fj7WGGGV1iaUdG
         V1+Bk0z4Zea4xbqNfAJFVXlrEJUR3lw4URHXNxxP8nJA+DNexQIFP1/xTIpAwwXPoRDM
         TTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=b1rVHYsNWlb9JwCTjyN2sUW3OyfnX4xvnkn2ZZcF5MM=;
        b=GPmW1rvJAialRppCzhPUaBer1rzUBWPszhIaL/LKLrrudU7g8wutn7iIq9fA562DoF
         HWwUdWBOgV8rD2sKHKCGRS4QKmoxUWZHVvOam7vitawaPkqZabk3sjs9/OQn7alAVr1X
         djUAHOr80RdekxTeCnT+t2S/f7hC6PZm9ZUVkG9fe9MaMc+FZxPjO1tcMPhBRWbFjWwL
         HUTF1X+myWSO4Nz1lZw/mBLyk7PYVPo7rnUx2cpIcylAq9B8F4WIjU+a47seAxilduvb
         QEeNTdrK6m1242+gyKIfnnBLFMmxAxMieZlzPuA86x9oFvHvIcLa/5JMS29EJc2/K0mt
         YKTQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531cfIMk7Oz/rNUG51MoQPGqQA2Dpp0Ce4pJ5rGHPMOWERh2me2r
	0dlzrROWGwgnIK1Qurfd240=
X-Google-Smtp-Source: ABdhPJz5oon4kNIPuhSCeIMO2QFPaKZnitqlBMpf6eKTAHQyeqB3jbWPqSr0Ge7useMx2C3fh5m0pQ==
X-Received: by 2002:a9d:eee:: with SMTP id 101mr26162071otj.203.1595341996524;
        Tue, 21 Jul 2020 07:33:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:1247:: with SMTP id s7ls3972095otp.0.gmail; Tue, 21
 Jul 2020 07:33:15 -0700 (PDT)
X-Received: by 2002:a05:6830:15cc:: with SMTP id j12mr25244479otr.116.1595341995491;
        Tue, 21 Jul 2020 07:33:15 -0700 (PDT)
Date: Tue, 21 Jul 2020 07:33:14 -0700 (PDT)
From: "contact....@gmail.com" <contact.thorsten@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <526c5075-2422-4c20-9563-08e2b166d60fn@googlegroups.com>
In-Reply-To: <1e8a7abd-91e8-26b2-3446-e9734bcf8d86@siemens.com>
References: <4f73eee2-1784-4049-8fc0-6a889e2ea419o@googlegroups.com>
 <1e8a7abd-91e8-26b2-3446-e9734bcf8d86@siemens.com>
Subject: Re: Is Jailhouse already used on products? And if not what's the
 gap?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_572_1520671842.1595341994156"
X-Original-Sender: contact.thorsten@gmail.com
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

------=_Part_572_1520671842.1595341994156
Content-Type: multipart/alternative; 
	boundary="----=_Part_573_302282371.1595341994156"

------=_Part_573_302282371.1595341994156
Content-Type: text/plain; charset="UTF-8"

I have been reluctant to ask this question for quite a while, especially 
from third perspective security, which actually goes hand-in-hand with the 
second.

Jan schrieb am Montag, 20. Juli 2020 um 23:27:54 UTC+2:

> On 20.07.20 09:57, Rick Xu wrote: 
> > For 3 reasons, first, it uses a LINUX as a host OS and then changes it 
> > to a guest OS, so a running host OS was saved. 
> > Second, less virtualization and more real-time. 
> > Third,  it's easy to use. 
> > [..]
> > And if it has not been used for products, why?
>
 
From my last months' view of setting up an academical use-case of a mixed 
criticality/mixed security-level system, from the perspective of an 
application-oriented engineer, I would not agree on the term 'easy'. I have 
also setup my use-case using other hypervisors, which I would consider 
'easier', but I hit other barriers. Though, everything has pros and cons 
and I may be comparing apples with chocolate cheesecake, not blaming anyone.
It is really cool to see the improved features and the HW support growing 
on ARM systems. At this point, I find Jailhouse being quite tightly 
interwoven with its underlying HW, in other words, without excellent 
knowledge of the HW, setting up JH is really hard.
If I had only one wish, it would be improving the documentation for 
Jailhouse integrators.

Jailhouse is primarily useful in two application areas. [...]
>
> The second, still more research-like area is functional safety. This is 
> our (Siemens) primary focus with Jailhouse. And while we are still 
> waiting for and even collaborating on developing [3] a certifiable [...]
>
 
The Selene Project sounds interesting, all the best with that!
I am/was working on a project on mixed-criticality security certification 
and certifiable HW really is still a blind spot. (what about, "we just 
_trust_ Intel processors to do the right thing"?!)

I believe, in the not so far future a good portion of mixed-criticality 
systems will also require security certification (to prove integrity of the 
safety function). Nothing can function in a void. Any (modern) critical 
functionality requires some sort of networking / data exchange and it is 
quite wise to split that off into different cells, so there are different 
certification levels - both in terms of safety (thorough, long-term) and of 
security (quick update/patches). Jailhouse really shows how much we trust 
in the underlying HW for these separation guarantees.
There are evolving security standards like ISO62443, or, e.g., its 
derivative EN 50701 for railway. However, from my current understanding 
Jailhouse is still too "low-level" and would require more tooling and 
documentation to enable "easy" product certification. And this could become 
a professional/commercial service beyond the open-source initiative or 
requires additional forces in the product development.

cheers,
Thorsten

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/526c5075-2422-4c20-9563-08e2b166d60fn%40googlegroups.com.

------=_Part_573_302282371.1595341994156
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have been reluctant to ask this question for quite a while, especially fr=
om third perspective security, which actually goes hand-in-hand with the se=
cond.<br><br><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_at=
tr">Jan schrieb am Montag, 20. Juli 2020 um 23:27:54 UTC+2:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px =
solid rgb(204, 204, 204); padding-left: 1ex;">On 20.07.20 09:57, Rick Xu wr=
ote:
<br>&gt; For 3 reasons, first, it uses a LINUX as a host OS and then change=
s it=20
<br>&gt; to a guest OS, so a running host OS was saved.
<br>&gt; Second, less virtualization and more real-time.
<br>&gt; Third,&nbsp; it's easy to use.
<br>&gt; [..]<br>&gt; And if it has not been used for products, why?<br></b=
lockquote><div>&nbsp;</div><div>From my last months' view of setting up an =
academical use-case of a mixed criticality/mixed security-level system, fro=
m the perspective of an application-oriented engineer, I would not agree on=
 the term 'easy'. I have also setup my use-case using other hypervisors, wh=
ich I would consider 'easier', but I hit other barriers. Though, everything=
 has pros and cons and I may be comparing apples with chocolate cheesecake,=
 not blaming anyone.</div><div>It is really cool to see the improved featur=
es and the HW support growing on ARM systems. At this point, I find Jailhou=
se being quite tightly interwoven with its underlying HW, in other words, w=
ithout excellent knowledge of the HW, setting up JH is really hard.</div><d=
iv>If I had only one wish, it would be improving the documentation for Jail=
house integrators.</div><div><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padd=
ing-left: 1ex;">Jailhouse is primarily useful in two application areas. [..=
.]<br>
<br>The second, still more research-like area is functional safety. This is=
=20
<br>our (Siemens) primary focus with Jailhouse. And while we are still=20
<br>waiting for and even collaborating on developing [3] a certifiable=20
[...]<br></blockquote><div>&nbsp;</div><div>The Selene Project sounds inter=
esting, all the best with that!</div><div>I am/was working on a project on =
mixed-criticality security certification and certifiable HW really is still=
 a blind spot. (what about, "we just _trust_ Intel processors to do the rig=
ht thing"?!)</div><div><br></div><div>I believe, in the not so far future a=
 good portion of mixed-criticality systems will also require security certi=
fication (to prove integrity of the safety function). Nothing can function =
in a void. Any (modern) critical functionality requires some sort of networ=
king / data exchange and it is quite wise to split that off into different =
cells, so there are different certification levels - both in terms of safet=
y (thorough, long-term) and of security (quick update/patches). Jailhouse r=
eally shows how much we trust in the underlying HW for these separation gua=
rantees.</div><div>There are evolving security standards like ISO62443, or,=
 e.g., its derivative EN 50701 for railway. However, from my current unders=
tanding Jailhouse is still too "low-level" and would require more tooling a=
nd documentation to enable "easy" product certification. And this could bec=
ome a professional/commercial service beyond the open-source initiative or =
requires additional forces in the product development.<br></div><div><br></=
div><div>cheers,<br></div><div>Thorsten<br></div><div><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/526c5075-2422-4c20-9563-08e2b166d60fn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/526c5075-2422-4c20-9563-08e2b166d60fn%40googlegroups.co=
m</a>.<br />

------=_Part_573_302282371.1595341994156--

------=_Part_572_1520671842.1595341994156--
