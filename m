Return-Path: <jailhouse-dev+bncBCDJXM4674ERBNNKZTYQKGQEN3ESYZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x338.google.com (mail-ot1-x338.google.com [IPv6:2607:f8b0:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B55B14E01B
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jan 2020 18:41:11 +0100 (CET)
Received: by mail-ot1-x338.google.com with SMTP id p13sf2060004oto.12
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jan 2020 09:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=n4AB+yhpIatjg3QccUJUMSrC1A9DW6J0f05DwWHYowo=;
        b=FTP3EaNQcYF3Nh1RTK9apRb5SJAFzEWpK+pja6qiozsriC4pQLJO+y184mOggJ+CdG
         ykX/f4xGG0MGNt1NL8lZLmMDtglbX2oekUHwx6HFqfMxIAWDT0u1c0y9+qS4Qj3m8wip
         LOJwGFQzmtlGE1Vs4T3FITNzOlF4Kf04PLhsPe6Q6N5ARm3c37agoe0f9pNYVHLyRsgI
         xwbsrzsA1mD2xfkfAYwxyw4E789mIze5HIHb7EYgvTAcUcmHzOyNQVw6i2ofgX+JqldR
         PA0Hvo95ICoqEIyJuxSfjfKp6nvayZMVXQPRChAdsa6LCFuAcO5V3A3FXWmDnU8qMicw
         5O4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=n4AB+yhpIatjg3QccUJUMSrC1A9DW6J0f05DwWHYowo=;
        b=lrEDUzyA/jiO2PQtDoZUAsbaCTakt9IC49IL94Tc8Puv0x7ea+2RTmcwG1cU7hNuGe
         Kt1TSJx9oLFUcxoJm5vBHkcSZo6N+QCG4kDf8zLPLm4Y7Nr6VxnINdyt7jzKAK0UEQXD
         AV+VHJe1sUyFpDXh2SpLk++wpgTQBPZsmnzy+OtYIouDja4i48APSj/S9tlJ38/s3pBb
         D+AXrmXiDAEpYjzAk3XBt+t8iVh3jcjgFEH7LawxHEFQMdKqlj0E6ueYH02G4vKaTgfq
         jvDJMmxrPemzSoi5SIeMhzm/NQ4lXvFb3V+Zy8k98VkcMNvM6jAh2Q0X45UcvKkB4L5n
         mkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=n4AB+yhpIatjg3QccUJUMSrC1A9DW6J0f05DwWHYowo=;
        b=itjbkstgaH+l290uWveIGS5QmoegLTYbXbDTxtXhkBlFpnVusaqPUGrZKyvlUIRZ5U
         ACi+VxwzSbMwja3YW6cSHBima6BsRQX3J7A7FLG2zn/3maVg/u0dNIvWKVVc8Th3dJzW
         p4o8Evz9PEND+WKy2uTLTNb8B008YMISohNsuOx6fzFjuk5s3S6ZVqFOan4VvFeVq1lC
         08Qv5AG/F8ia7fJ1i5ruor60VwLT8yrX4DmpYnCaSltEnkOZ94bWrDDtipgi2tIOMlrA
         6ZUeQWJSylD5aLjyziab3o8ks+WwARLPb1u+XTdcHjvvY6Tk7PeiWlANUHN+kkUf4Pig
         0QhA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUDoT55x1ENDXLw6zXQZ6jkfWqG7UgCEi6dANUtROQ89ZOEu0rq
	otqB1M+S3CT2gJx+oaqsvME=
X-Google-Smtp-Source: APXvYqyaPnW9KNRvDV9qlM2e7pGhf4Zgw0owbIQ3tDr2mOGtz55BwEywLQeeOMgnbNNGVMLhSfjg/w==
X-Received: by 2002:a54:458d:: with SMTP id z13mr3755335oib.32.1580406069795;
        Thu, 30 Jan 2020 09:41:09 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:40e:: with SMTP id 14ls907669oie.4.gmail; Thu, 30 Jan
 2020 09:41:09 -0800 (PST)
X-Received: by 2002:aca:c692:: with SMTP id w140mr3773433oif.139.1580406069199;
        Thu, 30 Jan 2020 09:41:09 -0800 (PST)
Date: Thu, 30 Jan 2020 09:41:08 -0800 (PST)
From: Michael Hinton <michael.g.hinton@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <40ec476c-8c25-4efe-87c2-50a6ed373206@googlegroups.com>
In-Reply-To: <20200127081602.08ea3fd6@md1za8fc.ad001.siemens.net>
References: <4d8ab27d-7a1a-4601-8d61-429dd0cdd018@googlegroups.com>
 <20200120144629.201f3081@md1za8fc.ad001.siemens.net>
 <b258dc63-26a9-4eff-852a-23d72d2e3258@googlegroups.com>
 <20200123131505.1e5fdeb5@md1za8fc.ad001.siemens.net>
 <5ba8f35f-912a-4749-bf8b-781193f45ebc@googlegroups.com>
 <20200127081602.08ea3fd6@md1za8fc.ad001.siemens.net>
Subject: Re: Difference in execution duration between root cell and inmate
 for same code
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1073_1531115252.1580406068372"
X-Original-Sender: Michael.G.Hinton@gmail.com
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

------=_Part_1073_1531115252.1580406068372
Content-Type: multipart/alternative; 
	boundary="----=_Part_1074_1669309121.1580406068372"

------=_Part_1074_1669309121.1580406068372
Content-Type: text/plain; charset="UTF-8"

On Monday, January 27, 2020 at 12:16:08 AM UTC-7, Henning Schild wrote:
>
> Ok, so we are just looking for differences between the inmate and the 
> linux as non-root cell, because the jailhouse/virtualization overhead 
> is acceptable or known. 
>
I think so, yeah.
 

> In that case a memory bound workload boils down to the mapping and the 
> tlb misses or CAT. And cpu bound could be an issue with the FPU. If your 
> binary uses FPU instructions but is able to fall back to soft-fpu, you 
> should check which path it takes in the inmate. 
>
Let's see: CAT isn't supported by my chip, so that won't help, 
unfortunately. But the Linux workload is mostly idle, so I'm not sure how 
much that would have helped anyways.

My inmates don't use FPU instructions, and it's not even set up, so I don't 
think that will cause a problem.

I will investigate TLB misses and page mappings and see what I can find.

Thanks,
Michael 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/40ec476c-8c25-4efe-87c2-50a6ed373206%40googlegroups.com.

------=_Part_1074_1669309121.1580406068372
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Monday, January 27, 2020 at 12:16:08 AM UTC-7, Henning =
Schild wrote:<blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-le=
ft: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">Ok, so we are jus=
t looking for differences between the inmate and the
<br>linux as non-root cell, because the jailhouse/virtualization overhead
<br>is acceptable or known.
<br></blockquote><div>I think so, yeah.</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px=
 #ccc solid;padding-left: 1ex;">In that case a memory bound workload boils =
down to the mapping and the
<br>tlb misses or CAT. And cpu bound could be an issue with the FPU. If you=
r
<br>binary uses FPU instructions but is able to fall back to soft-fpu, you
<br>should check which path it takes in the inmate.
<br></blockquote><div>Let&#39;s see: CAT isn&#39;t supported by my chip, so=
 that won&#39;t help, unfortunately. But the Linux workload is mostly idle,=
 so I&#39;m not sure how much that would have helped anyways.</div><div><br=
></div><div>My inmates don&#39;t use FPU instructions, and it&#39;s not eve=
n set up, so I don&#39;t think that will cause a problem.</div><div><br></d=
iv><div>I will investigate TLB misses and page mappings and see what I can =
find.</div><div><br></div><div>Thanks,</div><div>Michael=C2=A0</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/40ec476c-8c25-4efe-87c2-50a6ed373206%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/40ec476c-8c25-4efe-87c2-50a6ed373206%40googlegroups.com<=
/a>.<br />

------=_Part_1074_1669309121.1580406068372--

------=_Part_1073_1531115252.1580406068372--
