Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZE45HTQKGQEMJB5ITA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id A63443894E
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2019 13:45:40 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id b33sf2757193edc.17
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jun 2019 04:45:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559907940; cv=pass;
        d=google.com; s=arc-20160816;
        b=qysQ4NcsnjunQNtM6ft2vpfmsh5Xwal+rTSWJM1D+8cB4tue/0ThCi9nXmtq2r3D5c
         LGbmXed5kF1h1SjOsfZ57XJ5DOS+6I251g/CqFS8WetEw7x8e9ksPn7a7bXuhuzs/ZIk
         uQjJbtpRNe/aSV3mI5sNIS0kqFccTP+fjn1xQPJkDxboXt6q+X+Prj1balIVu+lap1BY
         xJXMu82VOvTPoNYxpK68NB4mcLE47H+eDkxtDIVzvyE6ByjooCExlfavSo+gc8aOp3Wy
         62JojuSXj0cvKwzyHeQHF6Z86LGFFuyfN7ORWZiHf+XniaK2DG0stId6D6SbU+abTHb3
         hqvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=D44cEohrs5ejA+wl/Jo1OawO9/PAMvvH6ymTpBk5UPU=;
        b=ZoBClve//xe8cWvwIBjW3v9H3hkKi1i/D1F5Lh8/ndxhDiW57AC1NlJbYsIViAE8Ux
         NDy0aQ+hqEUS6m2T/oem7HOZeSRSH6j6tx3w+VDQUmsuOG06CEy4nWp1uURZBRIb4MfH
         l9ULirEroCBrvaT8ew8AeQNhnhH63TXx4IGUE7KJhA6N4RwXl69AsM8ShM91eVCS7oZ1
         mQoBVXXCBsL18pfLDEMo2ZhU282CPEAsntvKReY3JAJTPePWT736XaeFMmn0z1rxvP3S
         594Ipgg1jnMPMH0LJyGjZSl7e6oA67uyr0O+TNTR7NUY3TmhyHpwE3nvmbKNS7JWSI4l
         H2HQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=D44cEohrs5ejA+wl/Jo1OawO9/PAMvvH6ymTpBk5UPU=;
        b=JyRt40SXrpq6N3uw6nMCLs3LYKlEf1weJHxpunZUYy2MBbH1WxCMbbFzMBDkuUfZxR
         oQuzI6uh2ty+TNuxLQKNZomQim4rAYD9VdRKhQVriO3S2lbo9kb2ARbVzhfgTruqkEgj
         03Q6iYBItIB9hkMa7mS7OcBC14PlhUpBlB4CMLjjOkgPkLywywbhVOLVScmbzFjbn8rk
         EpqUZhguYaiO5JN8PD7YN9VDmgZP0+bNjmeh5FvNMmzlLTF1vLa5kVsGrE6sKeE+p9k3
         0FylqgJbp9bNsnNaAdqGpltmC+TqKZYlnk1FkKSfNPRbcR+Q5KOGLwWcBPtLJ/BCMXXh
         PaOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=D44cEohrs5ejA+wl/Jo1OawO9/PAMvvH6ymTpBk5UPU=;
        b=q1wSi/i3HTReBzSRoL1fYpoFQBhocZpoCnLAqmxCq6+Dcjb6zqDcdAbEt0OzhUlCsZ
         V+GjBFqKJ7UseFJeV3WeXzW6sw3vVbWDFZdBzp+VEJTpejRqUIau+n1ppW+CEghPM++1
         SWEwDSbbyILthE1fEvXXF2jvBQ8tqxMTtQ9p+KmCWUz+yvCpqcVQ64PmscCR1ie2fum1
         PTssBng1x/GNbfHCJ44G4Y84TrFSCiL4MT78iS3Z8Sfs8+K50LAmUr8gyiYHkvGJr9nl
         2Lim6GgXj9yHFeE68mzqV8yA/bhyoG/RGw0puhrkBqKC65XF/lPBHIM2nbndk1+mKpc1
         7GSQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUaF5RNkHAS6fzuJCNru+hAB9Hao2kjIUXjvJNz5bqD3Wu0ZM75
	mU3wvjBqIOLTH17Wa53m/BQ=
X-Google-Smtp-Source: APXvYqzDM+BkS+Dj8bhd785RtyU4vl/4dltQWy5c090tjIRenV5q31x8dBCbK3OxX5NLpH0yjM7SpQ==
X-Received: by 2002:a17:906:d7ab:: with SMTP id pk11mr26939051ejb.216.1559907940374;
        Fri, 07 Jun 2019 04:45:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:94ce:: with SMTP id t14ls1328642eda.7.gmail; Fri, 07 Jun
 2019 04:45:39 -0700 (PDT)
X-Received: by 2002:a50:9431:: with SMTP id p46mr37412862eda.38.1559907939654;
        Fri, 07 Jun 2019 04:45:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559907939; cv=none;
        d=google.com; s=arc-20160816;
        b=nIkbljvQJtFF0Ysksg4vlg/QUF5Nnggrk992K1kxV2rmVMWYHvKleu93rSRPlCmUYA
         /zwsk4arOb9oLlFYy0EA7PY0pdOqnV8Apck6bU7Zyj/R9jInt1eHpbAksUT0cLMweTo7
         0XbHlACl7fAZkHRg4pxA7i+2ZB+rscxUW1RYfnw7lkwUcYBGKpGtHu4Mrdzl5oMcYswW
         7b1jZhGO/q6OVB6MHDiutG0aMQnHokL2mAcK0gofLa2q2veCO/X80roUmyNsRosqRUZH
         VuHLuBHwUQQA1w7t/BFy99lR9uq1/dJcn2NDLMk7pACoP+FpC5LYADpMn2nI7C//6J8U
         KCng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=J1Fx4wEo/30v+fxyRhEQSWfsVW6HmjJpN4rwUoMVN/8=;
        b=MEpf9i4bGl33BpqQhSgpWiDX3++VIV7W9Z6Rd5iGiULxSg52169IC7gBUG4c5qVvUw
         Ba+fvtAcW3+fLwL+swa5YlyZtqSPg4Ur2hbK1aSMNpXfiIDXMObkAvF22zQIZnHVnOi0
         GEtU9fTSZpGDz8As6jr3JlxoaanuBxC9GNPVNjZtUcMoHKoOKLkwGfKt7b2jCNGbB491
         UMKcA7+xsxXZz0awcmc1MoZZ4GByARx5WIBLBwJBBa/ERMqanvvu9n0bH2UVkIzWj3+i
         yYQ11xlr4+t33QVWdQpTIILUZtqOqS1AvaV+KYQAJsK1+cy5Wn06xciw7pGiaYEq5zP+
         gRrA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id t36si57896edb.0.2019.06.07.04.45.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 04:45:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x57Bjd8P017119
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Jun 2019 13:45:39 +0200
Received: from [139.22.46.107] ([139.22.46.107])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x57BjbpV021011;
	Fri, 7 Jun 2019 13:45:38 +0200
Subject: Re: [PATCH v2 3/3] x86: mmio: add support for 0x66 operand prefix
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20190606224457.1053-1-ralf.ramsauer@oth-regensburg.de>
 <20190606224457.1053-4-ralf.ramsauer@oth-regensburg.de>
 <6294be2a-0ce1-1021-1691-c801456b36a3@siemens.com>
 <954cb55c-f616-ddbe-19a7-5fc336c01ad7@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <705ff8a6-e48c-1257-f16a-3a3dfd1faab5@siemens.com>
Date: Fri, 7 Jun 2019 13:45:36 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <954cb55c-f616-ddbe-19a7-5fc336c01ad7@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 07.06.19 13:22, Ralf Ramsauer wrote:
>=20
>=20
> On 6/7/19 1:04 PM, Jan Kiszka wrote:
>> On 07.06.19 00:44, Ralf Ramsauer wrote:
>>> mov (%rax), %ax is a 16-bit data MOV_FROM_MEM that will emit
>>> 0x66 0x8b 0x00.
>>>
>>> 0x66 is the operand-size override prefix which we currently do not
>>> support.
>>>
>>> We should support it, as we can find this opcode, for example, for some
>>> mmconfig space access from Linux (e.g., pci_generic_config_read).
>>>
>>> This also adds appropriate mmio-access tests.
>>>
>>> Tested in QEMU virtual target.
>>>
>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>> ---
>>>  =C2=A0 hypervisor/arch/x86/include/asm/processor.h |=C2=A0 1 +
>>>  =C2=A0 hypervisor/arch/x86/mmio.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 47 +++=
++++++++++++------
>>>  =C2=A0 inmates/tests/x86/mmio-access-32.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 21 ++++++++-
>>>  =C2=A0 inmates/tests/x86/mmio-access.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 21 ++++++++-
>>>  =C2=A0 4 files changed, 76 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/hypervisor/arch/x86/include/asm/processor.h
>>> b/hypervisor/arch/x86/include/asm/processor.h
>>> index 70a6c3ff..d8111690 100644
>>> --- a/hypervisor/arch/x86/include/asm/processor.h
>>> +++ b/hypervisor/arch/x86/include/asm/processor.h
>>> @@ -145,6 +145,7 @@
>>>  =C2=A0 =C2=A0 #define X86_REX_CODE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 4
>>>  =C2=A0 +#define X86_PREFIX_OP_SZ=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x66
>>>  =C2=A0 #define X86_PREFIX_ADDR_SZ=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x67
>>>  =C2=A0 =C2=A0 #define X86_OP_MOVZX_OPC1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0f
>>> diff --git a/hypervisor/arch/x86/mmio.c b/hypervisor/arch/x86/mmio.c
>>> index df8c97a1..b836f43c 100644
>>> --- a/hypervisor/arch/x86/mmio.c
>>> +++ b/hypervisor/arch/x86/mmio.c
>>> @@ -54,6 +54,7 @@ struct parse_context {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool has_rex_w;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool has_rex_r;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool has_addrsz_prefix;
>>> +=C2=A0=C2=A0=C2=A0 bool has_opsz_prefix;
>>>  =C2=A0 };
>>>  =C2=A0 =C2=A0 static bool ctx_update(struct parse_context *ctx, u64 *p=
c,
>>> unsigned int advance,
>>> @@ -74,14 +75,33 @@ static bool ctx_update(struct parse_context *ctx,
>>> u64 *pc, unsigned int advance,
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>>>  =C2=A0 }
>>>  =C2=A0 -static unsigned int get_address_width(bool has_addrsz_prefix)
>>> +static void parse_widths(struct parse_context *ctx,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mmio_instruction *inst, bool parse_addr_=
width)
>>>  =C2=A0 {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u16 cs_attr =3D vcpu_vendor_get_cs_attr=
();
>>> -=C2=A0=C2=A0=C2=A0 bool long_mode =3D (vcpu_vendor_get_efer() & EFER_L=
MA) &&
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (cs_attr & VCPU_CS_L);
>>> +=C2=A0=C2=A0=C2=A0 bool cs_db =3D !!(cs_attr & VCPU_CS_DB);
>>> +=C2=A0=C2=A0=C2=A0 bool long_mode =3D
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (vcpu_vendor_get_efer() & E=
FER_LMA) && (cs_attr & VCPU_CS_L);
>>>  =C2=A0 -=C2=A0=C2=A0=C2=A0 return long_mode ? (has_addrsz_prefix ? 4 :=
 8) :
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (!!(cs_attr & VCPU_CS_DB) ^=
 has_addrsz_prefix) ? 4 : 2;
>>> +=C2=A0=C2=A0=C2=A0 /* Op size prefix is ignored if rex.w =3D 1 */
>>> +=C2=A0=C2=A0=C2=A0 if (ctx->has_rex_w) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst->access_size =3D 8;
>>> +=C2=A0=C2=A0=C2=A0 } else {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (long_mode)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* CS.d is ignored in long =
mode */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ins=
t->access_size =3D ctx->has_opsz_prefix ? 2 : 4;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ins=
t->access_size =3D
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (cs_db ^ ctx->has_opsz_prefix) ? 4 : 2;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (parse_addr_width) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (long_mode)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ins=
t->inst_len +=3D ctx->has_addrsz_prefix ? 4 : 8;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ins=
t->inst_len +=3D
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (cs_db ^ ctx->has_addrsz_prefix) ? 4 : 2;
>>> +=C2=A0=C2=A0=C2=A0 }
>>>  =C2=A0 }
>>>  =C2=A0 =C2=A0 struct mmio_instruction
>>> @@ -118,6 +138,11 @@ restart:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 goto error_noinst;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx.has_addrsz_=
prefix =3D true;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto restart;
>>> +=C2=A0=C2=A0=C2=A0 case X86_PREFIX_OP_SZ:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!ctx_update(&ctx, &pc, =
1, pg_structs))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 got=
o error_noinst;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx.has_opsz_prefix =3D tru=
e;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto restart;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_OP_MOVZX_OPC1:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!ctx_update=
(&ctx, &pc, 1, pg_structs))
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 goto error_noinst;
>>> @@ -134,28 +159,26 @@ restart:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx.does_write =
=3D true;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_OP_MOV_TO_MEM:
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.access_size =3D ctx.ha=
s_rex_w ? 8 : 4;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parse_widths(&ctx, &inst, f=
alse);
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx.does_write =
=3D true;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_OP_MOVB_FROM_MEM:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.access_siz=
e =3D 1;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_OP_MOV_FROM_MEM:
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.access_size =3D ctx.ha=
s_rex_w ? 8 : 4;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parse_widths(&ctx, &inst, f=
alse);
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_OP_MOV_IMMEDIATE_TO_MEM:
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.access_size =3D ctx.ha=
s_rex_w ? 8 : 4;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parse_widths(&ctx, &inst, f=
alse);
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx.has_immedia=
te =3D true;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx.does_write =
=3D true;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_OP_MOV_MEM_TO_AX:
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.inst_len +=3D get_addr=
ess_width(ctx.has_addrsz_prefix);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.access_size =3D ctx.ha=
s_rex_w ? 8 : 4;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parse_widths(&ctx, &inst, t=
rue);
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.in_reg_num=
 =3D 15;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto final;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_OP_MOV_AX_TO_MEM:
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.inst_len +=3D get_addr=
ess_width(ctx.has_addrsz_prefix);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.access_size =3D ctx.ha=
s_rex_w ? 8 : 4;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parse_widths(&ctx, &inst, t=
rue);
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.out_val =
=3D guest_regs->by_index[15];
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx.does_write =
=3D true;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto final;
>>> diff --git a/inmates/tests/x86/mmio-access-32.c
>>> b/inmates/tests/x86/mmio-access-32.c
>>> index be1d470f..9c1db1d8 100644
>>> --- a/inmates/tests/x86/mmio-access-32.c
>>> +++ b/inmates/tests/x86/mmio-access-32.c
>>> @@ -41,6 +41,10 @@ void inmate_main(void)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmio_write32(mmio_reg, pattern);
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, pattern);
>>>  =C2=A0 +=C2=A0=C2=A0=C2=A0 /* MOV_FROM_MEM (8b), 16-bit data, 32-bit a=
ddress, OP size
>>> prefix */
>>> +=C2=A0=C2=A0=C2=A0 asm volatile("mov (%%eax), %%ax" : "=3Da" (reg32) :=
 "a" (mmio_reg));
>>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL((u16)reg32, (u16)pattern);
>>> +
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* MOV_FROM_MEM (8b), 32-bit data, 32-b=
it address */
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("movl (%%ebx), %%eax"
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg32=
) : "a" (0), "b" (mmio_reg));
>>> @@ -55,6 +59,13 @@ void inmate_main(void)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg32,
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
>>>  =C2=A0 +=C2=A0=C2=A0=C2=A0 /* MOV_FROM_MEM (8a), 8-bit data, 32-bit ad=
dress, OP size
>>> prefix */
>>> +=C2=A0=C2=A0=C2=A0 asm volatile("data16 mov (%%eax), %%al"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg32) : "a" (mmi=
o_reg));
>>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL((u8)reg32, (u8)pattern);
>>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg32,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
>>> +
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* MOVZXB (0f b6), 32-bit data, 32-bit =
address */
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("movzxb (%%ebx), %%eax"
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg32=
) : "a" (0), "b" (mmio_reg));
>>> @@ -87,7 +98,15 @@ void inmate_main(void)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* MOV_TO_MEM (88), 8-bit data */
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("movb %%al, (%%ebx)"
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : : "a" (0x42),=
 "b" (mmio_reg));
>>> -=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, (pattern & 0xffffff00)=
 | 0x42);
>>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffUL) | =
0x42);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* MOV_TO_MEM (88), 8-bit data, OP size prefix */
>>> +=C2=A0=C2=A0=C2=A0 asm volatile("data16 mov %%al, (%%ebx)" : : "a" (0x=
23), "b"
>>> (mmio_reg));
>>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffUL) | =
0x23);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* MOV_TO_MEM (89), 16-bit data, OP size prefix */
>>> +=C2=A0=C2=A0=C2=A0 asm volatile("mov %%ax, (%%ebx)" : : "a" (0x2342), =
"b" (mmio_reg));
>>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffffUL) =
| 0x2342);
>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* IMMEDIATE_TO_MEM (c7), 32-bit=
 data, mod=3D0, reg=3D0, rm=3D3 */
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("movl %0, (%%ebx)"
>>> diff --git a/inmates/tests/x86/mmio-access.c
>>> b/inmates/tests/x86/mmio-access.c
>>> index a9d2fcaf..3794555f 100644
>>> --- a/inmates/tests/x86/mmio-access.c
>>> +++ b/inmates/tests/x86/mmio-access.c
>>> @@ -51,6 +51,10 @@ void inmate_main(void)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmio_write64(mmio_reg, pattern);
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, pattern);
>>>  =C2=A0 +=C2=A0=C2=A0=C2=A0 /* MOV_FROM_MEM (8b), 16-bit data, Ox66 OP =
size prefix */
>>> +=C2=A0=C2=A0=C2=A0 asm volatile("mov (%%rax), %%ax" : "=3Da" (reg64) :=
 "a" (mmio_reg));
>>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL((u16)reg64, (u16)pattern);
>>> +
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* MOV_FROM_MEM (8b), 64-bit data, mod=
=3D0, reg=3D0, rm=3D3 */
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("movq (%%rbx), %%rax"
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg64=
) : "a" (0), "b" (mmio_reg));
>>> @@ -75,6 +79,13 @@ void inmate_main(void)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg64,
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
>>>  =C2=A0 +=C2=A0=C2=A0=C2=A0 /* MOV_FROM_MEM (8a), 8-bit data */
>>> +=C2=A0=C2=A0=C2=A0 asm volatile("data16 mov (%%rax), %%al"
>>
>> The comment should probably clarify that data16 has to be ignored in
>> 64-bit mode, right?
>=20
> Right. In 32-bit mode it remains a 8-bit mov as well.
>=20
> /* MOV_FROM_MEM(8a), 8-bit data, 0x66 OP size prefix (ignored) */
>=20
>=20
> (second comment below)
>=20
>=20
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg64) : "a" (mmi=
o_reg));
>>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL((u8)reg64, (u8)pattern);
>>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg64,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
>>> +
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* MOVZXB (0f b6), to 64-bit, mod=3D0, =
reg=3D0, rm=3D3 */
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("movzxb (%%rbx), %%rax"
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg64=
) : "a" (0), "b" (mmio_reg));
>>> @@ -129,7 +140,15 @@ void inmate_main(void)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* MOV_TO_MEM (88), 8-bit data */
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("movb %%al, (%%rbx)"
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : : "a" (0x42),=
 "b" (mmio_reg));
>>> -=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, (pattern & 0xfffffffff=
fffff00) | 0x42);
>>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffUL) | =
0x42);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* MOV_TO_MEM (88), 8-bit data, OP size prefix */
>>> +=C2=A0=C2=A0=C2=A0 asm volatile("data16 mov %%al, (%%ebx)" : : "a" (0x=
23), "b"
>=20
> Just noticed: ebx should be rbx, and=E2=80=A6
>=20
>>> (mmio_reg));
>>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffUL) | =
0x23);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* MOV_TO_MEM (89), 16-bit data, OP size prefix */
>>> +=C2=A0=C2=A0=C2=A0 asm volatile("mov %%ax, (%%ebx)" : : "a" (0x2342), =
"b" (mmio_reg));
>=20
> =E2=80=A6 same here. Doesn't make a difference, but should be aligned.
>=20

OK, integrated all - and decided to drop the duplicate tests. Merged to nex=
t.

Thanks,
Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/705ff8a6-e48c-1257-f16a-3a3dfd1faab5%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
