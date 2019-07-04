Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPM77DUAKGQE2MHSPHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 915735FA35
	for <lists+jailhouse-dev@lfdr.de>; Thu,  4 Jul 2019 16:39:57 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id v125sf1681883wme.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 04 Jul 2019 07:39:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562251197; cv=pass;
        d=google.com; s=arc-20160816;
        b=H8eLBBzh8Wqoc7DVoJwiVtXh1Owqz02tP4PKiaCEehJWQpHPXpvXosh+Vij15QpSKC
         SH2iLNIjVvXjwAS2zMADvxSV70xfQr0e8Z50GD4NSl2C77KInt1ScEg2J6COUPUKNug7
         Qs+HADrKRKzVuXWRFvxMYdlwnKSZDpnPt8RVUk6UKqKig3boULpgkhB4BcSU7iEhCPWy
         EPTBe7XTwWNoY9bG0IfyYCfnTAJEtudy6ywOcK3s7/rA1CmHMRWFB+Zdy73rhlneSiF2
         A7GSrUKISWZmEwSroN/kes0Q2nAFDuXbA/pZvHuAXbbZHVJvjy339QBSzupppPnP3fWu
         17+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=9cynA1Ct2i5RTyVV5wqtHl6D2dcauqIdQuBPMX/qi9U=;
        b=baabqSQm9ekf9g/Nulfb5lA2eiAcicNiHLP38OcwIJqFLDUH+lKq+pqcBjK8HLwXol
         kSj7LyatKWXU6VYsPh4QaS81SHqaWjnX9AwH0NolzvdjfpKwp56QNsgtrFFzLTwN3gJM
         WrjSyazzVwDCcHf948k6McCYJ5SASFLre5a9vA8m0PxJrvd72q45ZFAwZzxMNGibeuZU
         PMsUWA2DUJgS6UXk33Zx/4lMXy3RzLE4xwrWKdvDHpz0jctW1zNqj6sljjr36HuiGouu
         zudjNlB9OysaE5LC9LPiVVzi9mnNbYh1ALapSnZMxhUYVaEPbanT43zVKBun7vkYdxeR
         duiw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9cynA1Ct2i5RTyVV5wqtHl6D2dcauqIdQuBPMX/qi9U=;
        b=TRX3LzGxsmhXTtbDfYQv7/MuDrMLrKSJ0taXMv/R7Mg0F31mUsxGzZQXjKiR5WHYDf
         gw10Q+C/oai1GUV1OutqEtL7z+DaT5QzeqlUZxwPl1cxvAe+IUajTKRz+2e9ToXCibuV
         A7JWDeL+MQuv4xbM66J/6byQV/VtoKnRcIMSVsDvqvGtn7XSLL259FK1oB76JPLDWSkm
         t8wefjD7z33SqkLrw7lptvly7WCwcJLH6gDW6k7Acn9cfblf5veAcD55eNi5QlU/lEvH
         m5JY3yVZwSXeOZFuL+zeN4TTtmY91B5aGNBlePcBsBJsrd81u43HYJVJ/giiHuSj9rXV
         UhFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9cynA1Ct2i5RTyVV5wqtHl6D2dcauqIdQuBPMX/qi9U=;
        b=au9XWax1cIo0vJ/ys7GrV4iF6+rRZRLOBkmdvH3B67/7AC/fdGDt2pQHGL8fgCx9WY
         Q52yRPh3B9I3mkUuqMeWGAHQ1ZQ50WOiH6EKYt2eh64q26JeND9ux8dpowlqriekPstZ
         GNWqNC1icEZ0vZuyhoQ5OUUpMjRkHujPaA07c2gI92+QV37GIbpugzWFTSQ1a9cRVsjb
         Ls4cErdaDw9uDjTXVdu1kXRYNfxyGYXeSmhJT8DcvfQPdKyG1CoxK1t3+FqQHjwzWTr4
         2elGHWrR1ZD7sf/gThjATs1bHLxr3PmdcwA4VlvMMUaxdtsvVItl0G5mITQNh/fTXI5P
         XI9w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW/Nw7D6oknOqIm2tZ9/VGY7u1oqPRlegHOD8EoqWdx42a4XgM9
	8zHbcCEWC5rUzsUGuvYFGaw=
X-Google-Smtp-Source: APXvYqyuzPQ8CRwCLJY5CSYek3FNF5Rb/FPelIqE7mpj9aOe2vJmWVG5nGamnmwBGQZkw7WfgbzVTg==
X-Received: by 2002:a5d:4941:: with SMTP id r1mr32919815wrs.225.1562251197231;
        Thu, 04 Jul 2019 07:39:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a2cd:: with SMTP id t13ls1376843wra.8.gmail; Thu, 04 Jul
 2019 07:39:56 -0700 (PDT)
X-Received: by 2002:a5d:6508:: with SMTP id x8mr36397675wru.310.1562251196653;
        Thu, 04 Jul 2019 07:39:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562251196; cv=none;
        d=google.com; s=arc-20160816;
        b=EvhSXzZI8capGgKGDTcOhL5QSZKrURD8/7Gg9Do2BAx2a6MiFFAsRUuiLe+9bOicD6
         VHK/2YNee/5mHcuQBR0JY8xaROV7xapfZViJZmuzM3GqnEpYEzoqGevR+NSoUrKkfa5p
         tqQUcsA2I1cMHtvno4dWmhRyxIEqLLqJF9G62WneCcKuqY/jlXpusDFH8fUBIY2A0Q8/
         2S14bZ3ckyLOXqVInOeVIYkwBaVv7kf0THNQhK8zsH1FlIvDscXGdDVsbLMhwGzEW0ac
         qBgpbJUAZ6zAh37QcnnY8oNqcIfI1b/PRcuyxhK5U037/uh0o71E09gumSIk9pHYzjHB
         vpAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=1irXrOMPX3iB9m9DrqFLTQ2+838U4yOw/ezeA9hgXcA=;
        b=rSEXhm1wzFgT/w/+zOpcS8xpywlTQyinvXptleJqwKU/Y/znHbheln73g4jbNqVpx1
         4O5j2rEZFbO+8+GcNG4S6rTlCewT5xjukqHDdDVccB2w4zqPqIA1VPjYjd3GCo3X7kTd
         AjdZp+tvB32qqGnsQJzGrSSuNlDIdJZelREosJUiG5XeBlb3aRUu5RvmV9AIwzWT6A0+
         YS7I7i0cSieof479l3VYHAoldP9TnCWxKyzV+BXyepIMHXC7tenNuERl9SUaMaw7FOBG
         e7AX1+FiQllZ7NQd7naqwHgho/TDphCLEIq6XqP8HStyASF/bLLX2Orf3VdOyUJei15v
         QFCA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id s13si470752wra.1.2019.07.04.07.39.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jul 2019 07:39:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x64EduKd013313
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Jul 2019 16:39:56 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x64Edtnq030939;
	Thu, 4 Jul 2019 16:39:55 +0200
Subject: Re: AMD: non-root linux inmates
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Andrej Utz <andrej.utz@st.oth-regensburg.de>
References: <c2839a0f-c1b5-9139-43d5-01139341981a@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <814c68a3-d59b-75b6-ce96-411cb8e5f4a6@siemens.com>
Date: Thu, 4 Jul 2019 16:39:54 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <c2839a0f-c1b5-9139-43d5-01139341981a@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
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

On 04.07.19 15:43, Ralf Ramsauer wrote:
> Hi,
>=20
> we have some trouble starting non-root Linux on an AMD box. I already
> tried to narrow things down, but it raised several questions.
>=20
>=20
> The main problem is, that non-root Linux tries to write to LVT0, and
> jailhouse crashes with:
>=20
>    FATAL: Setting invalid LVT delivery mode (reg 35, value 00000700)
>=20
>=20
> Turns out, in comparison to Intel x86, we don't trap on APIC reads, we
> only intercept APIC write on AMD (cf. svm.c:338). I thought this would
> be the issue of this bug, as that's an obvious difference between Intel
> and AMD: on VMX, we do trap xAPIC reads and writes. However, VMX works
> slightly different in these regards (side note: [1]).
>=20
> xAPIC reads on AMD systems don't trap the hypervisor, so I intercepted
> reads (by removing the present bit of the XAPIC_PAGE of the guest), and
> forwarded the traps to the apic dispatcher (adjusted VMEXIT_NPF).
>=20
> I can confirm that we now trap reads as well as writes. But the non-root
> Linux still crashes with the same error.
>=20
> Digging a bit deeper, I found out that xAPIC reads are directly
> forwarded to the hardware, if they were intercepted. So this explains
> why the bug still remains. This raised another question regarding xAPIC
> handling on Intel:
>=20
>    On AMD, we don't intercept xAPIC reads. On Intel, we do, as we
>    follow the strategy mentioned in [1]=E2=80=A6 But why?

It accelerates write dispatching at least. I never did the comparison if us=
ing a=20
different access scheme would be beneficial because xAPIC is practically de=
ad on=20
Intel.

>=20
>    Wouldn't it be more performant to just trap on xAPIC writes on
>    Intel? This could be done by switching from APIC_ACCESS interception
>    to simple write-only trap & emulate (page faults).
>=20
> However, back to the initial issue. Looks like the difference between
> Intel and AMD boot is as follows.
>=20
> AMD:
> [    0.325578] Switched APIC routing to physical flat.
> [    0.366464] enabled ExtINT on CPU#0
>=20
> Intel:
> [    0.099486] Switched APIC routing to physical flat.
> [    0.113000] masked ExtINT on CPU#0
>=20
>=20
> This is why the above-mentioned Jailhouse crash occurs. I tried to find
> out why Linux takes this decision on AMD. Our victim is in apic.c:1587.
>=20
> On Intel, apic_read(LVT0) & APIC_LVT_MASKED results in 65536, on AMD it
> is 0. This is why we take a different path.
>=20
> Now the question is simple -- why? :-)
>=20
> Are we just lacking ExtINT delivery mode in Jailhouse, or is anything
> else odd?

Yes, the ExtINT makes no sense for secondary cells, and it should also not =
be=20
needed for primary ones. Let's dig deeper:

value =3D apic_read(APIC_LVT0) & APIC_LVT_MASKED;
if (!cpu && (pic_mode || !value || skip_ioapic_setup)) {
	value =3D APIC_DM_EXTINT;
	apic_printk(APIC_VERBOSE, "enabled ExtINT on CPU#%d\n", cpu);

What are the values here, and which are different?

Jan

>=20
>    Ralf
>=20
>=20
> [1] Regarding Intel VMX, why do we actually need the apic_access_page /
> SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES dance? On VMX, we do trap on
> xAPIC reads AND writes. So why do we need virtualisation? Why don't we
> simply trap on MMIO and handle these situations under
> EXIT_REASON_EPT_VIOLATION?
>=20
> Is it just to save the dispatching or is there another reason?
>=20

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/814c68a3-d59b-75b6-ce96-411cb8e5f4a6%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
