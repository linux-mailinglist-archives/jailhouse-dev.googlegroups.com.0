Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBEUM5HTQKGQEKJS25KY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id D345E38892
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2019 13:10:10 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id q16sf762663wrx.5
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jun 2019 04:10:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559905810; cv=pass;
        d=google.com; s=arc-20160816;
        b=b5kZNbv/JDgRRVRVAAEmCYQdJfycN4pHel/E9PBV7UWT8bqaw674L1kEK9PeYP8DFU
         RShXd3QY3Bkmoc4+WDi06u8D1rA53y8q0OlJX9/bIdnQGwN/W9QAlrrN+BvtDBsQUuNZ
         gCi++nlLAC2fu26vS3GAeMT/sPpVQxrwfm2x3YIM/U2ZYkexxiR2nGM2F8eRSX7ILPSv
         mCRuy7wVez+J5NydvTo9UlbOy5fjv1pgozgOD99tViO6LDncD6it9gU9AwLimPRY6Etb
         vCz/+f2bOnA138xt3CqzYGOREvWgGsNOjV1YHsuHTybjUOTx2bldX6bAyiJul7McjL0Y
         wN8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:sender:dkim-signature;
        bh=PhCKc+LixdeJNrA5YJtzinAZP7OWxcRGyxrXrd6W0K4=;
        b=Ykqi5EDzYgBQXJHbNHb/YLubrjgjIiYQwTq3idbopgU+ZuEJ9I0av7y78oXOVZuTdn
         ChnRY4ru0KHrtOQ60hUJFGgIC7/gNsn4RVLPokhXTwMONBK6co8cJyylUo2vuCX24MUw
         Z67X0376oGgtEHzRzVtuWN/8V2pozOZBFHlY7J0wE53Us7v77DL2wLqfybihwlwmAU/i
         9h8jmYLNrWAaFLEXwysAqgcdakDY56KhwBo5NA2jfPTx9zKxJzFbkq5SOz5XS+x2d7h9
         6rqms9BOsc+BkCCKSlcdyAwcn0x2sLCZjhrnPuM8zKknn+uQj0N3yv47wW/xbEL6ZNLf
         6UGA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=rWpHEGLR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=PhCKc+LixdeJNrA5YJtzinAZP7OWxcRGyxrXrd6W0K4=;
        b=ZLW/OMOqeMaIombP3tTe5c+EXTa4joMN2B4k2IrwlKDjw6YW+DgFV+hITN6Icv3OE/
         Lay4N4HL1myIovyRYV5eovK0mVennv/7mxoiJ7m913zretKgVkF+3sM58JDfVUszjq3L
         8RbSysoGkhgHwKpcXzsLxlkrY8NYusJwT3WBYQgxS7Lrmgt3CHXk4YdiHBXsuiOYwIj/
         TQzit58A8u7FucBk7KJkrB6fJi+fwcrL+tlk5pSypgXvEjJfRqE/7d0XQL4PLehScgjB
         5mRqYBYkoQ1jXTgQURxnBRm1VG0kIaqVixyIc8JLO4tKBT9Pqw+yX3K17XG4dtVOxoI5
         0H4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PhCKc+LixdeJNrA5YJtzinAZP7OWxcRGyxrXrd6W0K4=;
        b=qR5eXFj/ZTmIzlZuwofjAjTDqSrjfTjnpgxljdXzaqJVeBAv3nHKdRDB8jwOxwneMz
         4ctlhkyLZ3DD/VSjxQQw++XfwazQ2f6a84/ifczKcwiVkT4nkVIllPRLVTmfqUgvgixo
         xuFrZhA1Gu37Az6Cma56BaD/lN0hZzNTlhnRCrvd5AJnxKvAJst41WRSExibUhHLzmOd
         A5vdnSLb2DgPSUuPfDc9T6+ztIf+g4GhbSdGE05kfQ2Bu7vWjq5uQfNgBWWDUIL9oujN
         60SY024AHUO1Y0B+Xx7FDDvjhHENcbT4VTDNkEe66F58nZo+xJDYsvOOoLNWREAjc3J/
         yaSA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXLHfvacCcnn2AcVLzOx8LefkbE1LuBVVXlIrApzUmPsyoFBHUo
	oW/6wS5lU7ZV6iizoWZxKaA=
X-Google-Smtp-Source: APXvYqw5GcdULQI1TmFAM4c6Ek+UqFINK33xBSCZpMqXj7HDpPIwS9XrwIpYUoIk+rO8wHIejRrt5Q==
X-Received: by 2002:a1c:3886:: with SMTP id f128mr3209556wma.151.1559905810542;
        Fri, 07 Jun 2019 04:10:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4bc2:: with SMTP id l2ls999698wrt.8.gmail; Fri, 07 Jun
 2019 04:10:10 -0700 (PDT)
X-Received: by 2002:a5d:6709:: with SMTP id o9mr19728621wru.301.1559905809991;
        Fri, 07 Jun 2019 04:10:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559905809; cv=none;
        d=google.com; s=arc-20160816;
        b=is8eKkZX3QLarVs4TDCAwaGnNLCR3Y/3mL0e1xAtMB/PTETHdYcjKDZxAK+V4UqE3S
         ZaIsmPMJi7nhxiWDDIyiK+tzEs/2pRj11lsVsR3mLgneMGOBlK0O83B0c3EBS739+7or
         fe4mQcVF9+gA57/dTUG8IIve/D6J+aw9RMZDMfadPBQjKE4wiNKUQ3U0jBY40dcU04qe
         CIH2WSpCcuF19C5Fma4y7w+5HwcT+cQq2TBOup8pCVKYNzWy0gYwLgoSUDlBEtLQqJZ/
         b0j8vAKI4zNXk9FQbxsEV8leqv3p8NZbfbr6+P3kTqeB5TyFtf1a/ybuSEItZMElBgi7
         o/0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature;
        bh=hembs8stVTEGjh9xC0QBRObHf978BNhkDCpHM8ZGdl0=;
        b=B8w3c8HA+EbcTyhdBpDbPMNZSyxZLKeR+j6suTeI06qhxFhWQB6QtrhFyPSRlZrAtB
         ANa4KyGAy3AzytjfD/4m86uWByClmfivAWmtQRihpbLQ40x+c0ZPh7dAQKUiIP5vRhXt
         f3alXFrAJP2p28yozSZZKmESgPkKUy8/UigopxEOY7x3Td+8ZHbG1OIKtEPpD+pfdpX9
         NpK6J7rhTkhVUg6AV0DqYHACcIW3EzZEYZT9G3v+Msg/V9nzKKJYefuxmCGZUNJA+swc
         Oy0lnrVRXOlxZ3BY8Gvn0wAA1tgB0t0p4AJ0iIeL8HIbdYXwvX0826Y/MoIzpQCjNv3+
         ekag==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=rWpHEGLR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id z11si161397wmc.2.2019.06.07.04.10.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 04:10:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45L0Dd48z6zyNf;
	Fri,  7 Jun 2019 13:10:09 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 7 Jun 2019
 13:10:09 +0200
Subject: Re: [PATCH v2 1/3] x86: mmio: fix accidental clears of bits in
 registers
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
References: <20190606224457.1053-1-ralf.ramsauer@oth-regensburg.de>
 <20190606224457.1053-2-ralf.ramsauer@oth-regensburg.de>
 <d9071e5a-ae9c-5915-b81d-eafb57d27789@siemens.com>
 <31132492-0d6d-5e61-ec83-9536d9d38887@oth-regensburg.de>
 <90aa3d6a-25fd-4c80-64c1-f57877f5805a@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <a99d8c19-d19f-80b5-3faa-40d548960460@oth-regensburg.de>
Date: Fri, 7 Jun 2019 13:10:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <90aa3d6a-25fd-4c80-64c1-f57877f5805a@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=rWpHEGLR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 6/7/19 12:58 PM, Jan Kiszka wrote:
> On 07.06.19 12:24, Ralf Ramsauer wrote:
>> On 6/7/19 10:35 AM, Jan Kiszka wrote:
>>> On 07.06.19 00:44, Ralf Ramsauer wrote:
>>>> We trap certain MMIO accesses and need to emulate their access.
>>>>
>>>> On x86, a 32-bit read will clear bits 32-63 of a register.
>>>>
>>>> Inconsistently, on x86, 16-bit and 8-bit reads must not clear high
>>>> bits.
>>>> Jailhouse erroneously cleared those bits. Prevent this by applying a
>>>> preserved mask that keeps bits alive.
>>>>
>>>> Add tests that check correct behaviour.
>>>>
>>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>> ---
>>>> =C2=A0=C2=A0 hypervisor/arch/x86/include/asm/mmio.h |=C2=A0 5 +++++
>>>> =C2=A0=C2=A0 hypervisor/arch/x86/mmio.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++++-
>>>> =C2=A0=C2=A0 hypervisor/arch/x86/vcpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++++--
>>>> =C2=A0=C2=A0 inmates/tests/x86/mmio-access-32.c=C2=A0=C2=A0=C2=A0=C2=
=A0 | 10 +++++++---
>>>> =C2=A0=C2=A0 inmates/tests/x86/mmio-access.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 10 +++++++---
>>>> =C2=A0=C2=A0 5 files changed, 28 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/hypervisor/arch/x86/include/asm/mmio.h
>>>> b/hypervisor/arch/x86/include/asm/mmio.h
>>>> index 756c84a8..4b3b2ea8 100644
>>>> --- a/hypervisor/arch/x86/include/asm/mmio.h
>>>> +++ b/hypervisor/arch/x86/include/asm/mmio.h
>>>> @@ -30,6 +30,11 @@ struct mmio_instruction {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /** Output value, already copied =
either from a register or
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * f=
rom an immediate value */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long out_val;
>>>> +=C2=A0=C2=A0=C2=A0 /** A read must not clear the upper bits of regist=
ers, if the
>>>> access
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * width is smaller than 32 bit. This mask de=
scribes the bits
>>>> that have
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * to be preserved.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> +=C2=A0=C2=A0=C2=A0 unsigned long reg_preserve_mask;
>>>> =C2=A0=C2=A0 };
>>>> =C2=A0=C2=A0 =C2=A0 /**
>>>> diff --git a/hypervisor/arch/x86/mmio.c b/hypervisor/arch/x86/mmio.c
>>>> index b234bd79..c04cf449 100644
>>>> --- a/hypervisor/arch/x86/mmio.c
>>>> +++ b/hypervisor/arch/x86/mmio.c
>>>> @@ -85,7 +85,7 @@ x86_mmio_parse(const struct guest_paging_structures
>>>> *pg_structs, bool is_write)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct parse_context ctx =3D { .r=
emaining =3D X86_MAX_INST_LEN,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .coun=
t =3D 1 };
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union registers *guest_regs =3D &=
this_cpu_data()->guest_regs;
>>>> -=C2=A0=C2=A0=C2=A0 struct mmio_instruction inst =3D { .inst_len =3D 0=
 };
>>>> +=C2=A0=C2=A0=C2=A0 struct mmio_instruction inst =3D { 0 };
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 pc =3D vcpu_vendor_get_rip();
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int n, skip_len =3D 0;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool has_immediate =3D false;
>>>> @@ -168,6 +168,9 @@ restart:
>>>> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 op[2].raw =3D *ctx.inst;
>>>> =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 if (!does_write && inst.access_size <=
 4)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.reg_preserve_mask =3D=
 ~BYTE_MASK(inst.access_size);
>>>> +
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* ensure that we are actually ta=
lking about mov imm,<mem> */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (op[0].raw =3D=3D X86_OP_MOV_I=
MMEDIATE_TO_MEM && op[2].modrm.reg
>>>> !=3D 0)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto erro=
r_unsupported;
>>>> diff --git a/hypervisor/arch/x86/vcpu.c b/hypervisor/arch/x86/vcpu.c
>>>> index 5a557d0b..a1fb8660 100644
>>>> --- a/hypervisor/arch/x86/vcpu.c
>>>> +++ b/hypervisor/arch/x86/vcpu.c
>>>> @@ -231,6 +231,7 @@ bool vcpu_handle_mmio_access(void)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mmio_access mmio =3D {.siz=
e =3D 0};
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vcpu_mmio_intercept interc=
ept;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mmio_instruction inst;
>>>> +=C2=A0=C2=A0=C2=A0 unsigned long *reg;
>>>> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vcpu_vendor_get_mmio_inter=
cept(&intercept);
>>>> =C2=A0=C2=A0 @@ -249,8 +250,10 @@ bool vcpu_handle_mmio_access(void)
>>>> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 result =3D mmio_handle_acc=
ess(&mmio);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (result =3D=3D MMIO_HANDLED) {
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!mmio.is_write)
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gu=
est_regs->by_index[inst.in_reg_num] =3D mmio.value;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!mmio.is_write) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
g=3D &guest_regs->by_index[inst.in_reg_num];
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *r=
eg =3D (*reg & inst.reg_preserve_mask) | mmio.value;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vcpu_skip=
_emulated_instruction(inst.inst_len);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return tr=
ue;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> diff --git a/inmates/tests/x86/mmio-access-32.c
>>>> b/inmates/tests/x86/mmio-access-32.c
>>>> index 2f47f211..be1d470f 100644
>>>> --- a/inmates/tests/x86/mmio-access-32.c
>>>> +++ b/inmates/tests/x86/mmio-access-32.c
>>>> @@ -47,9 +47,13 @@ void inmate_main(void)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg32, pattern);
>>>> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* MOV_FROM_MEM (8a), 8-bi=
t data */
>>>> -=C2=A0=C2=A0=C2=A0 asm volatile("movb (%%ebx), %%al"
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg32) : "a" (0)=
, "b" (mmio_reg));
>>>> -=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg32, (u8)pattern);
>>>> +=C2=A0=C2=A0=C2=A0 asm volatile("movb (%%eax), %%al"
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg32) : "a" (mm=
io_reg));
>>>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL((u8)reg32, (u8)pattern);
>>>
>>> Hmm, that test looks redundant to the following one. Same for other
>>> double-checks in this patch and patch 3. Or am I missing something?
>>
>> If the implementation of the simulator is correct, then those tests are
>> redundant.
>>
>> Think of cases where the first check passes, and the second check fails.
>> Was helpful during development.
>=20
> Well, don't we print both values when the test fails?

Yes, we do, and yes, it's redundant. If this is the question, let's
simply remove those redundant checks. The second check covers both
cases. I just wanted to argue why they are still here -- it was a
guidance for debugging.

  Ralf

>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a99d8c19-d19f-80b5-3faa-40d548960460%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
