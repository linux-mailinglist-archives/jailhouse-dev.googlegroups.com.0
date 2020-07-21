Return-Path: <jailhouse-dev+bncBD7236HKXYJRBPFD3P4AKGQE5NXPLVY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23c.google.com (mail-oi1-x23c.google.com [IPv6:2607:f8b0:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFA9227EE5
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 13:30:06 +0200 (CEST)
Received: by mail-oi1-x23c.google.com with SMTP id k188sf9331652oih.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 04:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1rLAL2WlwMkREBy8At/osCXZkW2Ve3YkyBGApbIBNIM=;
        b=qU3tCXyrL0LOFpp66wizgpjgnY8ncrBIiOjSzacu558aAop1t9/3PKm0do1aY+4+7E
         FJqr0Vmb7AHkUJM6b5HaAsxbkls/Fmm538/CTOXA5piol+84yRPqfaAMO7+EIQ1Y/QYd
         X9ONNVvzQmDedPjRuJDeWDrH/xlDmkRfepx0TthsszC9F8td017W7Wi3S4Sd3ToTBvkS
         Cj2gECYJxyJK3ThzSomhDdwR9PdGmv4G9Asqej8/7ghmOKDhaT+6LFr80fgaqctLbSv4
         Q7+lKmtOFwGUQBdqsy0QmVBSANqCwmJZuNrHPqEAJIeIbe5v5ToOtSnzco/Py2ol7Fxp
         N03Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1rLAL2WlwMkREBy8At/osCXZkW2Ve3YkyBGApbIBNIM=;
        b=AfNnsStH8XmWAEodzwJ0SsWpzyz4RViHyTEqXgBdFoNkiwX1KtkTXlbVfbpUnQChKL
         R0QS04I9vvxGdcdxsCi+DwbQxs25whBFkTc9Qtge7/bFL7WbUCrIaNe/AbQ2gnk3hIN8
         QtE1Xz8ZDBkDF2kWfaRjltEpF3i2mfLJRcd28xaE9kSCZoNkKv9ReKeDy9GZT5CkDGR4
         M13Z4mG7j6I+KFuLLITpIwWnxMGIT8R6ZoNgnnIWWkQ/jxFpup8crmqWlyxGALPjUt1D
         NZbSUZefT3Xj9CclMdVCFS6YwxlCZywAJrulRFG+F4s0lXurKknIXTtJ5LJNqqOVyQ7B
         pj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1rLAL2WlwMkREBy8At/osCXZkW2Ve3YkyBGApbIBNIM=;
        b=MHwxF0fGyelAiDTwAUNPFbyqlZPdKHqf3DtmoWUhJ+n2m/r9DhaC4wuQYhM3hbnVBZ
         dS7K71XJZi8iqURIolsXkf2k5Arc2ps7ts9rjuZqRSapaES5WkuKUBGjDFDnDF9SpyTD
         qxyIyUaspf/JavnrqFfxItboohgULqKjAsGf9hxuc+WZjceawAGauhJqrdia4eWe5UBL
         9se5DYEHaBpcDQAec18afjj3xlOCbN2EFYEpj5Beu8cvpb232YpZJM0MpQx92t03VgYN
         uMGA+HlYABwv5BSc91EBOZF62ahQzq2rC09iLdJj9IwTWBCr5ft8h+Y+yL7vY9CcV4sV
         +X2g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530fhWnO5xydIQ8JHH5AWhHvCCo42h7iKf18mYTks8rOs+0MvYuE
	xx0TCqJu0aWtCocK7eIgWOM=
X-Google-Smtp-Source: ABdhPJw8Uih5LhNskDoKgNUDEsUPjc3VUae969131hmYaezb/tQks05Yil4wjvNq8/7OWn7QJUN4RA==
X-Received: by 2002:a9d:7188:: with SMTP id o8mr24434011otj.290.1595331005209;
        Tue, 21 Jul 2020 04:30:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:1e4d:: with SMTP id e13ls3864386otj.5.gmail; Tue,
 21 Jul 2020 04:30:04 -0700 (PDT)
X-Received: by 2002:a9d:4717:: with SMTP id a23mr22271896otf.348.1595331004353;
        Tue, 21 Jul 2020 04:30:04 -0700 (PDT)
Date: Tue, 21 Jul 2020 04:30:03 -0700 (PDT)
From: "contact....@gmail.com" <contact.thorsten@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <8b1bf245-4bef-4ca8-9ffc-0dcb66dca9ccn@googlegroups.com>
Subject: ivshmem-net no going lower_up in root-cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_672_492841676.1595331003554"
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

------=_Part_672_492841676.1595331003554
Content-Type: multipart/alternative; 
	boundary="----=_Part_673_2039584884.1595331003554"

------=_Part_673_2039584884.1595331003554
Content-Type: text/plain; charset="UTF-8"

Hej,
looking for a hint / tip where I may go wrong.

Without pouring the whole config here,
I am on a real box, x86_64 (Intel Apollo Lake), Jailhouse-images is next, 
building --latest.
I have a an ivshmem-net defined between the root cell and the first 
non-root Linux, and another one between the first NR-Linux and a second 
NR-Linux. The second one between the NR-Ls is working smoothly fine.

However, I cannot get the first one up. Jailhouse-console-ivshmem says the 
cells are connected, In Linux the device comes up fine with mem and alike, 
but the stats stay at zero, no carrier detected. I have checked the configs 
to my best knowledge, mem-regions + devices look right. Any classic 
pitfalls? Could this be an IRQ issue / misconfiguration?

cheers,
Thorsten

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8b1bf245-4bef-4ca8-9ffc-0dcb66dca9ccn%40googlegroups.com.

------=_Part_673_2039584884.1595331003554
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hej,</div><div></div><div>looking for a hint / tip where I may go wron=
g.</div><div><br></div><div>Without pouring the whole config here,</div><di=
v>I am on a real box, x86_64 (Intel Apollo Lake), Jailhouse-images is next,=
 building --latest.<br></div><div> I have a an ivshmem-net defined between =
the root cell and the first non-root Linux, and another one between the fir=
st NR-Linux and a second NR-Linux. The second one between the NR-Ls is work=
ing smoothly fine.</div><div><br></div><div>However, I cannot get the first=
 one up. Jailhouse-console-ivshmem says the cells are connected, In Linux t=
he device comes up fine with mem and alike, but the stats stay at zero, no =
carrier detected. I have checked the configs to my best knowledge, mem-regi=
ons + devices look right. Any classic pitfalls? Could this be an IRQ issue =
/ misconfiguration?</div><div><br></div><div>cheers,<br>Thorsten<br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/8b1bf245-4bef-4ca8-9ffc-0dcb66dca9ccn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/8b1bf245-4bef-4ca8-9ffc-0dcb66dca9ccn%40googlegroups.co=
m</a>.<br />

------=_Part_673_2039584884.1595331003554--

------=_Part_672_492841676.1595331003554--
