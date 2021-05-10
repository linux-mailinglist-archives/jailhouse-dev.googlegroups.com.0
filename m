Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBSXH4WCAMGQE7AFJQ4Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 810EF379690
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 May 2021 19:56:26 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id r19-20020a05640251d3b02903888eb31cafsf9464039edd.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 May 2021 10:56:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1620669386; cv=pass;
        d=google.com; s=arc-20160816;
        b=G9jwuWD919FgjP9pF0HshkS55NDzST+iCShBxdZ/4nSs50tjUX/FL/nqknn4TuBk2F
         bLsQfzH81tRY//AuVab9X02LIvojCxFdFYo4Wm7yZrFqDrOQvWiS/ANeckKmSpsM+fQn
         YPTgbACrSxGrrvz3AMDcUUDiuMexcpcvuFdONxHSzzsWanrJ2C4IkScFiKoeLscukEE/
         jcWKzE0QdrGgDjGaib65SFzJKoTP726y3q6sYnOzg2+FC6WQyfEp3Qsru55I6c/F6U/j
         aotoEChgOwCUHD4omdgX6KlXNpHr6ZV8WWn72iuQqAIjlf5d2u9ERvDHSbCn+fO+Fz2d
         R9bQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:sender:dkim-signature;
        bh=EvfUYwuTS+XyNntNnUA1Nb1pOE3hkmM3MXgdmooIMKk=;
        b=UbgT3ipo7Ho0512iiKc3GXiYfjFy2xEuTpLu4fzqDTEgDAMi6SQcYDC1RFZPaP+OI7
         dV3JNGpFi8uAKq3sIHD5j3zG1Zhkyz+zykWbbrl15xcOdTjdiYxlvK9WRguLgXVOf7MX
         zcy70711Ltsv9hnyFJgqcQlO+esRWaPxvA88zY8xru5w5Q4nl+7hkFbb4qilqS7qrN2S
         vJGlwMluJ3xAJJsIeM5GO2WgPqMtnKek117FKMOsQV2jMLY0Mf43p0cIjORjI4FzlqcP
         e4kYmrPv9U66uBa0zY4uN2K82QwkiZzJBF/+vT+k27+uG0JLDoLRunrarxq4FJQP3qBS
         dS0A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=EvfUYwuTS+XyNntNnUA1Nb1pOE3hkmM3MXgdmooIMKk=;
        b=esCksUcMyNmAccCksHCqvCQGfgACgxD7Ybp5jW4sSwstyJRtZ7VT2/HIicM5f5mHkS
         r2cXirGOY2BSfr8ukNKzrjt96nAIbHLzL/8uMQP1UBPrLV7Cm+5cLPgZGq+TIMu7QYbJ
         v0AjzqfQp0f/TpdxUNky0ZVSN0wuMCl8uFRZf95+lHXG/IlI/L5HeBiuCfJ/j3gjX5yg
         B61A/ZWfwUTmLGn31cb87vKxmhveNqRqCj9sF2bat3byJwERNz+NVItoEC4UZuV2mFiK
         Wj7YN0zhGtJfyhxnZerVbBnuAMsJbFKzYd82UvtWdSgYVav20gmRjnFogMbS9WAIE3OG
         yEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=EvfUYwuTS+XyNntNnUA1Nb1pOE3hkmM3MXgdmooIMKk=;
        b=H9ZwivuT1DARcAWaX7G/a3VKk7ZVRzk/JYSCCeljrg3hx2R0bpZDRsAj9vZ0EH0/LX
         zyrufOb5Bu3yrYrbaMK1RdqxvbdVtR/e+/+/f/WlfWHUFVsdCvQFYNGgTmtxY+uL6gW3
         five7agLnxUsNX9n3N8RTLNnElXjXcUjLTwnaM1C5h2eyBVbN5emqNxAtIUcskW7fUvU
         A4GR82jhRC0sZ13MbsI0S4hb7BATmQ7ZChz55TQ6j8RmGuRog6ofC+PCGsh8Kwjp4Os1
         iSiSXC5sk5BPRl8w1CwiqcK2F5yBSMtlpEioAIXRMD8K15VskSN7YpLYN59mXOM+QFwg
         H8bQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Kv49LaewWNEwQssJuOUY5/SHCMm0dua2I6KAZj83aoyoy7ORJ
	jqH4tolNTXXMdyrHuBnfWo0=
X-Google-Smtp-Source: ABdhPJzpkSaxThDkpinAj600MKBkPitfnClDuUnm2QIiskU7QWG33yt/8dPaL+C4XYNpZBnhhdPS0g==
X-Received: by 2002:a17:906:2559:: with SMTP id j25mr26337048ejb.42.1620669386205;
        Mon, 10 May 2021 10:56:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:fa90:: with SMTP id w16ls7462830edr.1.gmail; Mon, 10 May
 2021 10:56:25 -0700 (PDT)
X-Received: by 2002:aa7:dc0b:: with SMTP id b11mr31461396edu.124.1620669385348;
        Mon, 10 May 2021 10:56:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620669385; cv=none;
        d=google.com; s=arc-20160816;
        b=mbd7HCyfyUxoFhZEuhHSEPHklkGlekUH67R8VmRa7fauzwJdkKMZOkYgf2GTUGV3XA
         Ognug8wumsg0RfIJ8V9yFB1gYzJ61XgvZ1lpR62aMvnY3V8/CO6wMtk3PkbTegV5gY2q
         mNhys8dcy2UFIq9J90PAGhwD0DJCI1CQnhVq0BknKYgbxmZ5bicsxfGVD7JoXss1pW//
         /BN/ql41CH8B1Q1T+wBEJn0Jcscs6XuT3kMorqFMyH+uLu4h8ClhJxMyB8RTVlDWWbYR
         DRZt50D3qxYmFWG2G6m/O/m0hfrWILKjn5vHTt5kB5ZN10BX5vVHfgbEwPlMkcWYkF7M
         XOpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=kz1+hzMgHcYtPIhwcRLUsjybVXOgpMXDJUtV/X/fAf0=;
        b=wzBk8YQloprFGxCTX/l2ZS3oRWHBH+VrStmtHM3dNxeoGwK82g100VS8CguJCQKRK2
         tM/CpZQYAtSBu+2Heuum0mXBTLutnfBQOwh09HEjJo+DfBWAhjKWe3SM6OpFn/uPOzIu
         OrEhS8Yh2cTYUdCIl54ge/XdMATAMr0AZlrwjShx4sWlY0Jf/NaAdEO96RZeYr2Qfo8k
         wdo8gX1bxu/zmll5/EXhIficGinPqBqAhIqfFeBZ6KLx+QTQ/ppmBE2RB5EDp6IKrOEG
         8hIo6utqQm1zXbm5PuYnqq1epYM9lzD9yQE5x/hUa+AQZ/PD5kNIq1xV5bJcGlD74KMd
         seFA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id di23si641328edb.0.2021.05.10.10.56.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 May 2021 10:56:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 14AHuOmm005434
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 May 2021 19:56:25 +0200
Received: from md1za8fc.ad001.siemens.net ([139.22.38.12])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 14AHn5oH018317;
	Mon, 10 May 2021 19:49:05 +0200
Date: Mon, 10 May 2021 19:49:02 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>,
        Jailhouse
 <jailhouse-dev@googlegroups.com>
Subject: Re: Windows on Jailhouse
Message-ID: <20210510194902.40fc1ff9@md1za8fc.ad001.siemens.net>
In-Reply-To: <7c85c613-eea3-4e5f-3bb4-7d1fdb7db826@oth-regensburg.de>
References: <AS8PR02MB666306E1B7F04C85B36BFC40B6549@AS8PR02MB6663.eurprd02.prod.outlook.com>
	<7c85c613-eea3-4e5f-3bb4-7d1fdb7db826@oth-regensburg.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Am Mon, 10 May 2021 17:24:25 +0200
schrieb Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>:

> Hi Bram,
>=20
> On 10/05/2021 16:19, Bram Hooimeijer wrote:
> > Dear Jailhouse community,=20
> >=20
> > Is there anyone who has tried to get Windows running in a Jailhouse
> > cell?
> >=20
> > Given that Windows is often used as HMI, it would be interesting to
> > see whether it would be possible to use it alongside Jailhouse.
> >=20
> > What are the fundamental limitations one would run into? =20
>=20
> You MUST emulate every trap that Windows would cause, as you have no
> chance to adjust Windows, as we can do it with Linux. And Windows
> 'expects' a certain defined environment to be present at boot, such as
> ACPI / Bios / EFI. But we arrive in Jailhouse with in a void
> environment. E.g., there's no regular hardware discovery available for
> platform devices.

The most realistic way would be to bring nested virtualization to
jailhouse, which would enable kvm on the root-cell. I think Jan has
once started that but it never reached a merge-point into jailhouse.
Not too many people seem to care, and it would probably increase the
complexity of jailhouse significantly ... maybe to a point where a
working implementation would still not get merged.
You can most likely run Windows in qemu, performance might be "not
acceptable".
There is "llvm-qemu" to maybe mitigate that to some degree, but i am
not sure that is still in the research state or "ready for a product".

And then there is wine, or choosing QT/GTK for your HMI ... if you can.

I guess QT for HMI is the best way, but you might already have an HMI
which might not be QT ...

regards,
Henning

> I could rather imagine to run Windows in the root-cell rather than in
> a non-root cell. But that would require to port the driver to Windows
> and is probably combined with a huge amount of pain. And who knows
> what Windows is doing with your platform while it is running=E2=80=A6
>=20
> Maybe there's a better chance with Windows for ARM, but I never looked
> into that.
>=20
>   Ralf
>=20
> >=20
> > Thanks,=20
> >=20
> > Best regards, Bram Hooimeijer
> >  =20
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20210510194902.40fc1ff9%40md1za8fc.ad001.siemens.net.
