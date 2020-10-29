Return-Path: <jailhouse-dev+bncBD3ZFSMAZYNBBWGK5L6AKGQELVPWPZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x438.google.com (mail-pf1-x438.google.com [IPv6:2607:f8b0:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B9829EA5F
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 12:19:54 +0100 (CET)
Received: by mail-pf1-x438.google.com with SMTP id o128sf1924467pfg.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 04:19:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603970393; cv=pass;
        d=google.com; s=arc-20160816;
        b=sQBa62g32fKQLdlj4h40vxU2qfITmuYtm+U4nvL9ChSEKL04EuBrFzcy+iUG2OShqC
         xDHV+tW3PgWJfpUS5ZHouZoxDlgf1XYJhy6r2XnYR1uNjJPJQ74qgxApvjsc/IAVq8kO
         z3PYv3iVBZaeCrcJdYX4iesaLCALDBIkEnvZRIaQUZJe5NqbVB2mMpqGsY5ZzwmGoHEG
         d2Xhs+5lI9NQoR1UXw59xQjpjSMmvWG42S8sg7ozvKAxdRY+432sQakIhFNvHEUJsSOc
         IcPlI44M8KKqUizDzdgEaxFhcMbIxMBfx7xpYM+cnNmO2P4MmQKYPc6HuzXGG883KSGF
         v49w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=wbyvG3sqCS+BrSbITF6FBTlcrcyBb0dFws4WmXAn/FQ=;
        b=yI7BWDhO3kYH4q1QS+kk0qClD3AzvlUGMSIHqaWMqfJq5Eiw3Av7XHxWH/LfVyqZRR
         P9eZI1kcCSfrAQpE3wDqmT7yC0QQIGvIEv983rJ1lm2ubUnDsxZUv64S1zJR2mElSaFq
         HgxhfKilJJ147PHbzgwK3Aayps0BQpG/ChLAM2KHBZZ8u+c4pTMFo6p77lwovtXgrLV8
         lJYK/NVHbzTGFw1oxzibBhoCg2+KLrE8F/cp9eOmHnnLE5TqfzHvgQs+HnioMWDoS42X
         qpRyI/zK+cyZiZedzgr/ZzQtJDSw9Zp3xB3/gWJALsstgwSHbu63eVeLIhmpELv9z3n7
         d2zg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=MMJ+zN6Q;
       spf=pass (google.com: domain of rntmancuso@gmail.com designates 2607:f8b0:4864:20::244 as permitted sender) smtp.mailfrom=rntmancuso@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wbyvG3sqCS+BrSbITF6FBTlcrcyBb0dFws4WmXAn/FQ=;
        b=FpBs60Ix1IfrsVPbdw+8ugo1PM9eFyZrFjF6HwuWpmvUn7qwBr12AZHo97VK555Xqj
         6Aher7PgylI+aJqgexGcL3HyejGXkwSpTlrhb1Ctl8chKWCjNSz8qEh7VyJNIDM4tEk/
         T9sKo1tr7KCLdwXKYMzzdaLf4gk2TBl7FskSX7ZSN+60HtuJgk2d1p7B2oCKwsUTGidb
         +n2MKxxofcg5QKqBdGrWu3/SshvECH/yNOGzWSi1dD6G9Ex6O1kMJolwkuwYnFsQlZJK
         vQjo9nAWEDdECDLxNVQA4HrNfMJgiGHjv4S4viRX1G5Z+NrQu0G78APUdeRTEpIyvpnY
         /5dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wbyvG3sqCS+BrSbITF6FBTlcrcyBb0dFws4WmXAn/FQ=;
        b=Nia1okHJtKNxGhvweQKre3Q37YDipYu8FoLP6kbtoz2AG6RuQipgT+clom3OOKJkGP
         yUMBiNm+95KmAJSoJMkZB91rlPRNCB6szZWHeR6hbNJrmqkBt6fQv2PDZ1yqDNDEsvqY
         FpYVNGdoRKsTpMEvUxTxv68M0YDKMMOsLM90YzSzmi2tPmMin4pFTEIsnEJaLqYSd2Vw
         7FP40sJWJC+U3ZIFNkSeknA03yTTUV7iyTK+0NlFTBkl9pfeTQnEkWCJctLVcYD4RkEd
         avpS1ipyT8X+6lUGa4N+9s6ZS2jcUVXzjnzRg1WU75jM1eGUW8duLsrviY5XvuHXeWkm
         VkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wbyvG3sqCS+BrSbITF6FBTlcrcyBb0dFws4WmXAn/FQ=;
        b=lxtER12PouVzyk12bAs9o9Vy4w5/kE12uUd60DJD235x2UbPHHdU4Y9ChKq4CdrlWV
         LxAkb6BfKBUCUtxPhBa1mV6J8MOtrCkZe3nCT5b7OC3OGFgZrsy9ZVjrRTI9bw8i354I
         UoIcKgga8TNuzYHk3UXMA4eMkuGRNuapiF6KbhqfM1jRNWuex+rp34jc9CSNOGd3ZCR/
         HK6/c06gllchQbd3tqUoKyoGCmH8BYW6FmuHfH5NsrJlBWyn8A+LTgfdSsB/BySyLoL2
         PLFZJ8c9aLbc9xyO/qm9zY1cjZFvtWTFzC92NJNJ6U5MiD0M4V74LuessGYk6IE4Z42D
         VKWw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530/MaNu4EOPXinliwZhgrSC88dGmoSCN4UYZs0epsTookVARSwV
	qmCQyMYMiFMzprRvbSGNck4=
X-Google-Smtp-Source: ABdhPJyJ1omF9fp6TjdGNtIWYkNmmxHn5//vBBZNJtx3u3CCWPH4AazFPQ3qXK7Sui7iXlQcO1/vZQ==
X-Received: by 2002:a62:8458:0:b029:160:843:18b7 with SMTP id k85-20020a6284580000b0290160084318b7mr3695773pfd.77.1603970393217;
        Thu, 29 Oct 2020 04:19:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6a00:843:: with SMTP id q3ls962741pfk.10.gmail; Thu, 29
 Oct 2020 04:19:52 -0700 (PDT)
X-Received: by 2002:a62:7e10:0:b029:164:9f40:7276 with SMTP id z16-20020a627e100000b02901649f407276mr4105722pfc.22.1603970392470;
        Thu, 29 Oct 2020 04:19:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603970392; cv=none;
        d=google.com; s=arc-20160816;
        b=Gn0UNrOTSjNVVKu19JATgE/aZjvXw4wYYQREgU60Yt3nC2eyIKIcTpHgEms/O7FcF7
         bmzfUsJ0lO7/UjYj8BKNH+otxmb6lf3U6myhVJZsDNlum+MJiuROAVA4JpU5EIFG1Zl2
         jzXfL1Mwvfzt77sL/u8vp/2UyZu7a94KT+ROMe3M2PPue2huEvudM8GSrJBLAJdv4M7+
         e3akgHzXcLARkltK+dsaKqSepBT7U+V1O1YJ/lOYTaSbdfhCAhaRCQg82ghO5Oi60XQc
         NyxCXnI60jBV4n/7AjDk3XRkJKrceCSAfqzrpWGqvOiHm0Q8qEDHN38It0FnDsv2ULTw
         ba0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YAP+c75L8/ejT0wItObqgH/ZUHAruSyWSQRJ74mzx3g=;
        b=Vaot5r+U3iW74K+jZiwJIRRkD9kMFT9UWf+MujNB0Ne7QiXaWH/A2W5p2o/YUjHUbp
         czx+p7zcKQH4wCNNmxHQejlP4wJGP6OLJVy4rEl0TZ+aOxXfairLgOZ5B0cOyI1g2P4U
         m9fgABIEPwJfvAGj6JAxYi6/Vz77kzJXzg7s/lDmbh2WyH0aRIVwJ9RCy0NpSx7afkWd
         8JmvY5iWCZytA3N1sgfYQmoWstRfEZkZz8wN1q2KGxNQqFZVH6vxH1wWi5XHJKwiGq4K
         rfB7X+8r6LuvWFvRCTmWQ7i/NlCB6TFwhLpw3sGWVjQG/ogXjbf50z5AAkTtqoD15PaL
         rRvA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=MMJ+zN6Q;
       spf=pass (google.com: domain of rntmancuso@gmail.com designates 2607:f8b0:4864:20::244 as permitted sender) smtp.mailfrom=rntmancuso@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com. [2607:f8b0:4864:20::244])
        by gmr-mx.google.com with ESMTPS id 191si168370pfu.3.2020.10.29.04.19.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2020 04:19:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of rntmancuso@gmail.com designates 2607:f8b0:4864:20::244 as permitted sender) client-ip=2607:f8b0:4864:20::244;
Received: by mail-oi1-x244.google.com with SMTP id 9so2806940oir.5
        for <jailhouse-dev@googlegroups.com>; Thu, 29 Oct 2020 04:19:52 -0700 (PDT)
X-Received: by 2002:aca:b882:: with SMTP id i124mr2468563oif.53.1603970391918;
 Thu, 29 Oct 2020 04:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1602664149.git.jan.kiszka@siemens.com> <78334f5d-b665-8de6-31fc-10599877b3b1@siemens.com>
 <DB6PR0402MB2760F60895CFBCCAEA5F2F3A88160@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <bee3d688-1c2d-f4d8-f434-b9ff8d50ce10@siemens.com> <fd8fe9cc-9e69-4406-21e2-979b282b6d16@siemens.com>
 <8c0cec16-dc86-b316-ef84-af51a15c80aa@tum.de> <4b408440-354d-521e-0a88-e1541eaed1d7@siemens.com>
 <fa5b83f2-fa5c-e158-4b99-cc86db20ea43@tum.de> <eaa35809-1823-9bac-a971-12b9e4a2ec54@siemens.com>
 <CAL30Xq9rJCRQLTqdhuMdLz+RXEoJDqv+r4jZVbmmX+FnqvvBCw@mail.gmail.com> <e0eb91a0-17ce-383b-51ac-2bb41071a3a1@siemens.com>
In-Reply-To: <e0eb91a0-17ce-383b-51ac-2bb41071a3a1@siemens.com>
From: Renato Mancuso <rntmancuso@gmail.com>
Date: Thu, 29 Oct 2020 07:19:41 -0400
Message-ID: <CAL30Xq_jo2vLwtVdAC_nFHvqdMjs_wmJT5quqz3Xb1Op8217FA@mail.gmail.com>
Subject: Re: [PATCH v2 00/46] arm64: Rework SMMUv2 support
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Andrea Bastoni <andrea.bastoni@tum.de>, Peng Fan <peng.fan@nxp.com>, 
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Alice Guo <alice.guo@nxp.com>, 
	Renato Mancuso <rmancuso@bu.edu>
Content-Type: multipart/alternative; boundary="00000000000070cb4c05b2cd75df"
X-Original-Sender: rntmancuso@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=MMJ+zN6Q;       spf=pass
 (google.com: domain of rntmancuso@gmail.com designates 2607:f8b0:4864:20::244
 as permitted sender) smtp.mailfrom=rntmancuso@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--00000000000070cb4c05b2cd75df
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 29, 2020 at 6:56 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:

> On 29.10.20 11:49, Renato Mancuso wrote:
> > Hi Jan, Andrea,
> >
> > Thanks for looping me in on this topic!
> >
> > Just a not that I in my version I don't just recreate the root page, but
> > the entire page table tree to be NC for the SMMU. That immediately gave
> > me a stable system on the ZCU102. I have tested that even with a
> > dynamically recolored root cell. I haven't tested with colored
> > DMA-capable inmates, but I'll do that soon as I have just added support
> > to boot colored Linux inmates. I keep SMMU and CPU tables in sync by
> > duplicating any change in map/unmap operations at cell creation time.
>
> That recreation is what we do for VT-d vs. VT-x as well because tables
> are incompatible (at least in the VT-d version we support). On AMD, that
> is not needed, and I thought that the ARM tables were designed to enable
> the same. How does Linux handle this?
>

On ARM the format of SMMU page tables is supposed to be compatible.
Re-using the CPU page tables is also what Linux does for SMMUv2.
However as far as I can tell there is a lack of testing for the SMMUv2
support of Linux on the ZCU102.
It might as well be an errata of the specific instance of SMMU on my cut of
ZCU102 systems. I know that Andrea has been performing some more debugging
to test this hypothesis.

-- Renato

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAL30Xq_jo2vLwtVdAC_nFHvqdMjs_wmJT5quqz3Xb1Op8217FA%40mail.gmail.com.

--00000000000070cb4c05b2cd75df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 29, 2020 at 6:56 AM Jan Kiszk=
a &lt;<a href=3D"mailto:jan.kiszka@siemens.com">jan.kiszka@siemens.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 29=
.10.20 11:49, Renato Mancuso wrote:<br>
&gt; Hi Jan, Andrea,<br>
&gt; <br>
&gt; Thanks for looping me in on this topic!<br>
&gt; <br>
&gt; Just a not that I in my version I don&#39;t just recreate the root pag=
e, but<br>
&gt; the entire page table tree to be NC for the SMMU. That immediately gav=
e<br>
&gt; me a stable system on the ZCU102. I have tested that even with a<br>
&gt; dynamically recolored root cell. I haven&#39;t tested with colored<br>
&gt; DMA-capable inmates, but I&#39;ll do that soon as I have just added su=
pport<br>
&gt; to boot colored Linux inmates. I keep SMMU and CPU tables in sync by<b=
r>
&gt; duplicating any change in map/unmap operations at cell creation time.<=
br>
<br>
That recreation is what we do for VT-d vs. VT-x as well because tables<br>
are incompatible (at least in the VT-d version we support). On AMD, that<br=
>
is not needed, and I thought that the ARM tables were designed to enable<br=
>
the same. How does Linux handle this?<br></blockquote><div><br></div><div>O=
n ARM the format of SMMU page tables is supposed to be compatible. Re-using=
 the CPU page tables is also what Linux does for SMMUv2.</div><div>However =
as far as I can tell there is a lack of testing for the SMMUv2 support of L=
inux on the ZCU102.</div><div>It might as well be an errata of the specific=
 instance of SMMU on my cut of ZCU102 systems. I know that Andrea has been =
performing some more debugging to test this hypothesis.</div><div><br></div=
><div>-- Renato</div><div><br></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAL30Xq_jo2vLwtVdAC_nFHvqdMjs_wmJT5quqz3Xb1Op8217F=
A%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CAL30Xq_jo2vLwtVdAC_nFHvqdMjs_wmJT5quqz3Xb1=
Op8217FA%40mail.gmail.com</a>.<br />

--00000000000070cb4c05b2cd75df--
