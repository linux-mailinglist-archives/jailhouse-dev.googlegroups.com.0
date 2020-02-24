Return-Path: <jailhouse-dev+bncBCKO35F6UENRBAGPZ3ZAKGQES7TADYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23d.google.com (mail-oi1-x23d.google.com [IPv6:2607:f8b0:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C03F16A409
	for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Feb 2020 11:37:53 +0100 (CET)
Received: by mail-oi1-x23d.google.com with SMTP id 3sf3999816oij.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Feb 2020 02:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5S/ITLIhl1Fsaj3hqUwkBdaJY5DMdfdHinmA1ymM0Hg=;
        b=sDiP3byBmzVyriP+xbGH8Y/2EWvjouO1k/UXk0bJl4pOfG3jeIJtk8dD/UyK/ZRY/M
         jsJE6ebFw5FIXOA+EyOJUFm7Tp6XS1aLKRYX87grarRm851OTfH4rHPzlLfwWUfuXTpD
         CfZBIHDW7SaLpJiZZD8XlLZLuJnTkhMYDsaejLF/fnpyx9XYKXc13WUMbbml35BYet35
         5G6QUTOdhfazGM0k+Q6PYpWiYbytsw5vumxdT8kT8lYpOWNZ8/+WGxQVTMCVbhQJ7AqB
         EjCgTdB4wvA0YOpx24MhIVFZHv8aXYHn2R9XuBWfsGYJdHg3YGCV1dTkgro7x+nV6BhX
         Mk9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5S/ITLIhl1Fsaj3hqUwkBdaJY5DMdfdHinmA1ymM0Hg=;
        b=Y7EJmF3yFaymwhKLKolMY8cFH4wWhhNb0UPd/ydQIszq9HDt7y3YdpPF6KngwVGyyt
         w4pqrFujP3r6PulaYScpf+4s29wtz40ujr8ypfiaN12FSFWcOShf/T5uq2wlH4BWKlwO
         sg7W9IjO+rUo3/is7dLwFvMjZgrnq5FLV8bM//Yhp2h2i9MbnIESRHN/0NtqhvAp4NH9
         TXS7yHJaC4J2JZqabBZ4J887HbCdqXQFj0V6Gn6xgv05/ve2U+frF3X0XCTLGfhAnZwc
         AcDlHSumhWRYDTtLdsHB75BxnXcqWUPBdDoyGaxB5NDJvQLE3FfWvG6+v0gPGpt1UPIJ
         yJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=5S/ITLIhl1Fsaj3hqUwkBdaJY5DMdfdHinmA1ymM0Hg=;
        b=Z2C/k97N62dtg1yXWHCNMxcVXlPA/cko1DNkszs44b5GYVQogqJXsi8Rq8UOC95vaT
         rhHMzGu/JUtwmAk8zQhSENmGGM2O/+jpq0HmryUKOuAHCEDA9EycaJM5S9k+PIdw/V5K
         hE8bl4joh7CDfYbOd8D1Ja/MDEq3zE2m+vrr8835+e4EfDlBpDqpa9/Ek2kF34IDHbdp
         ybhEfwnL2tBUysMIUsKk+jEbSQWWv5MST5vjoAJAgKOL3mhbh+IQ0iCs4A/paJJks1b6
         7Ly8I45NZ4gGCykOhBWPo3bMMlEdAlgt5iD4vFJYf2LIMnRqRsW1R/HjzXgd0WXC+H87
         K8cA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX46g0/VXVF/v3gMQ6tHo086+RdAlq6ipaElZkJI0V+8nyxE0XP
	7DhLLOLu2MMsXTNtfoCC97Q=
X-Google-Smtp-Source: APXvYqz3no2rEqEIrSxsHxmHdGtHOH1boY9yQysIeR3ST4S2TWqW316J4HKKWLLgxJc5rtw3aboXxQ==
X-Received: by 2002:aca:6543:: with SMTP id j3mr11791407oiw.150.1582540672242;
        Mon, 24 Feb 2020 02:37:52 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:cf95:: with SMTP id f143ls2718058oig.7.gmail; Mon, 24
 Feb 2020 02:37:51 -0800 (PST)
X-Received: by 2002:aca:c1c2:: with SMTP id r185mr12327204oif.19.1582540671595;
        Mon, 24 Feb 2020 02:37:51 -0800 (PST)
Date: Mon, 24 Feb 2020 02:37:51 -0800 (PST)
From: raymanfx@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <5a39fc19-8844-4750-8a33-b834690b7a6e@googlegroups.com>
In-Reply-To: <e088a0bc-e100-5acd-7268-a33c134ad821@siemens.com>
References: <2b9c213c-a111-4f3f-94c5-4f89d06b5fdf@googlegroups.com>
 <eebfa055-f561-d5fb-7da6-706bb1e858ea@siemens.com>
 <439a798e-f9c3-4455-8128-e4047e5aa9e3@googlegroups.com>
 <5d6e66d7-2a25-1678-2ff1-247e861ab8d5@siemens.com>
 <dfe23f77-f16a-41c9-9f6e-8e67b853b66e@googlegroups.com>
 <ba1334c7-a13c-fdea-7177-53ad21c23244@siemens.com>
 <221c5f40-594d-4b11-ab0f-dab66585471f@googlegroups.com>
 <e088a0bc-e100-5acd-7268-a33c134ad821@siemens.com>
Subject: Re: Linux non-root cell tooling
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1078_1726728393.1582540671146"
X-Original-Sender: raymanfx@gmail.com
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

------=_Part_1078_1726728393.1582540671146
Content-Type: multipart/alternative; 
	boundary="----=_Part_1079_1901035202.1582540671146"

------=_Part_1079_1901035202.1582540671146
Content-Type: text/plain; charset="UTF-8"

Thanks again, it all worked out this time!
I'll send out the documentation patches later this week.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5a39fc19-8844-4750-8a33-b834690b7a6e%40googlegroups.com.

------=_Part_1079_1901035202.1582540671146
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks again, it all worked out this time!</div><div>=
I&#39;ll send out the documentation patches later this week.<br></div></div=
>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/5a39fc19-8844-4750-8a33-b834690b7a6e%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/5a39fc19-8844-4750-8a33-b834690b7a6e%40googlegroups.com<=
/a>.<br />

------=_Part_1079_1901035202.1582540671146--

------=_Part_1078_1726728393.1582540671146--
