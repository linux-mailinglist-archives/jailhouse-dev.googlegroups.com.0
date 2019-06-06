Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB2VV4TTQKGQEHHBJFLI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A067375BE
	for <lists+jailhouse-dev@lfdr.de>; Thu,  6 Jun 2019 15:53:47 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id 9sf555487ljv.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Jun 2019 06:53:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559829227; cv=pass;
        d=google.com; s=arc-20160816;
        b=uuvF/iE6jCrZAfLscxPG3P/kAABAhssaZSlBMBHBdavhVlsaDhkGhubFRex1fRbJhR
         NzdHa4oE4rgEGleqkkW6fxN08UDdhZW7baMo9Y/KsrzK2reOmXeW9VcdDUxwHFbBArXd
         HkexJ+rIuvBG7RTvXlpkMY7QfFis+LDnNOyqrnvUVVY96NbqjZ71lrBT/eZHOmLmUFfg
         ojMv8Q4ARFan1kWYb1kQANgvCXxZ54hv2pSSnfINb9C5b2EryT/1SQHcmtTUmo/dgjZ7
         qlTP6K/LH4XfYj8XMkPiKUDbIanYSlno4+uTfvyx+WmamJOx4vymLznK3JWF3C+qGFns
         ec9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=TVhySLQmf+NS4xt1hMg9ABu6o6sVcRhhFRpdfDF5AO8=;
        b=GJBCZ1cnukV3YlN1TzuFZ8EIZT7VmbQHaTBXscTjmq6DsRph77bRbq0I6P8fe+8oA4
         1yiBChE1hJ/Fu6CXeJ2IM83rtScCW8iQBlKlBABMI+kjxjvmOheV1UhEF7nVnx20dWw8
         U+COTBpjiQMetgUbiFmOyT9b+TjZIIyGlBBqPztLN8Jn0lC6k+mdA8+56IBdOr12/oaI
         A4VlWRCnl8Ycs1zznQeWUjB+oY+e0GXLejrKm8qBVCLPgFVB0K1jpVPJczISjhWWedu7
         prmdpDbTGKt+pjgD1FrSqGBOWOvIkFwZQ2HvEjFCQn0Ca4UIWRRCre/qJdvW/wdJc3tM
         ilXg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=S0C+gMU5;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=TVhySLQmf+NS4xt1hMg9ABu6o6sVcRhhFRpdfDF5AO8=;
        b=EVkbtjthr4VVgPHuJdQ79VqMAbS9Eiy9U7c4QQ0aKfjF1QjR8NeHybdxGp9nBjJ2BN
         s/Qmia/ROjx4uD8nzLFYt0cYLfd1xgTOU1KEJgwrzDYv2cgCeeUMxS+IY1utp2FvN1ui
         fbvn9lHCPDE7fNBzPexZDh2fmUrseiwUqxP9BlNDjzK4ZCl1/TAwD7Lg/sU4o9nuB+Av
         V2K37WLCHiOuVOI1zYasZLZMK85eLxwnIp/Ays1Ysx71iql4WvzjnGu6YUQMhYdJa0t4
         IljUi5AN7AUoaqEjT1bWclxgQJD8X2WseHl/m4GpHF2nCyIaMhYIjR1HpQlkHH+G+R/M
         bD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=TVhySLQmf+NS4xt1hMg9ABu6o6sVcRhhFRpdfDF5AO8=;
        b=hdZktLkuwYew0Bm2cj/3GlG2Ys8m9RZs++d2Gz9bqjanWe1KboIhuTkAI87/pLBpRQ
         i1J1YYeY/CMuWgxj8jU1VIrxxZHja1zXXItvthuJ37nh9hnjTxfbSGgCLwvj7/81WN+X
         2RaCU59HCwCjxOVGDyJgNXmcfB8P6YIb1oZx7NCjdM7meGY62EXhl3mnOgqB9/4pxh0k
         9jv5q3plM8sE3mGJc9i5AMSjAOJdjcMmssX4Urq7PBp6tThcDQBiAj6hB0/nXhK8qxQ1
         hP/zktGUpjqNLfBM2q1gMwjHksyfB0NN6HW7kVM/JxFWg0JDfg1WXUs+H81Pkzc78Ibq
         p7dg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWyz+63XuhP6K0ZmB0YsgiYeGLeLgCaJO5dxhfrjiXUs4lfbooT
	VHULpeMxio1bqRwoLhVZsZs=
X-Google-Smtp-Source: APXvYqxu686vPkcPi/ukHVZ4f/mXkPForfDlcJ1F7XqVnSvM5LhQQcWbnoN8hKc0vlftMfChgsAeEA==
X-Received: by 2002:a05:6512:1d2:: with SMTP id f18mr23259105lfp.173.1559829227080;
        Thu, 06 Jun 2019 06:53:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:6109:: with SMTP id v9ls667574ljb.2.gmail; Thu, 06 Jun
 2019 06:53:46 -0700 (PDT)
X-Received: by 2002:a2e:4e09:: with SMTP id c9mr12187977ljb.30.1559829226088;
        Thu, 06 Jun 2019 06:53:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559829226; cv=none;
        d=google.com; s=arc-20160816;
        b=jFx4dwBn7N3WQgnnEYHVuyYhK1oUsAaAOeD+lNKMy4QH7r2igatv3sK3CUICnOxdYJ
         nGsbxWwU0hDlB/Kh8Y75gqBIjW0Pybn7xC75bLW+OoV4QXgf9qrpAw3wQrEKyPaxngwH
         7I7QGjvlP33MZpWNWnOze8rZBDKKCLpXsUVpvNSCZrLIL4neMxIE5cevbz5TwP57F5W8
         EvDN7oxnlwbVPVFEk5tj55K4kaapq0eS3qn87BCI2S25R+ex48tVIvjLnA7iXWlp1aFZ
         st+LbgVTCcMk7+ghib0e4pWSyzfoR6pQI7lm4Q2Vpnvxg8B0a8qykcGaN/XxnWm7AO9b
         DIew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=BrjlRXrKCV9c2CSFdlG87MQbyEM4ypCIKL1pzRP0ci8=;
        b=zaD/ncaLfaQIWjRc448slpE3jdSoesZDUaJVnqgzBZIpcxgaw8x8s+YLfz/YW2p3DD
         pGQnVJcVokPluIbxjyIUkdri+SmsQxy3bpfl9MiLsNn46fgaZEE/5hhLH8wng6cPSff6
         EIaxEWdkPX4vzNB3VJLOANL09YUztFpDuUYt9jWwxKGPBui4iy1GWV3D7E4WqqBVaMJH
         FMsiKOLmSV+Ov6Z3Jd7ML/79ZyvUA9UQuVUYhQ/8FgXxUw4mUzGgNko5patzWh8M2CKs
         3RJe1wvXT1yrYODLG/zE3mwgb6bmBT/xgeE6xKg31Ksm+uZ6Tayghqp7Sm6sHYSq4G3s
         B5Lg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=S0C+gMU5;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id i70si95428lfg.1.2019.06.06.06.53.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 06:53:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45KRvs25VKzySj;
	Thu,  6 Jun 2019 15:53:45 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 6 Jun 2019
 15:53:45 +0200
Subject: Re: [PATCH] x86: mmio: add support for 0x66 operand prefix
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Mario Mintel <mario.mintel@st.oth-regensburg.de>
References: <20190604210229.23554-1-ralf.ramsauer@oth-regensburg.de>
 <f7338cdd-3f1b-3b1c-d56c-6d783688348f@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <c72d9659-2d46-5aff-062b-9d7d13dfcef4@oth-regensburg.de>
Date: Thu, 6 Jun 2019 15:53:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <f7338cdd-3f1b-3b1c-d56c-6d783688348f@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=S0C+gMU5;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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


On 6/5/19 12:06 AM, Jan Kiszka wrote:
> On 04.06.19 23:02, Ralf Ramsauer wrote:
>> mov (%rax), %ax is a 16-bit data MOV_FROM_MEM that will emit
>> 0x66 0x8b 0x00.
>>
>> 0x66 is the operand-size override prefix which we currently do not
>> support.
>>
>> We should support it, as we can find this opcode, for example, for some
>> mmconfig space access from Linux (e.g., pci_generic_config_read).
>>
>> This also adds appropriate mmio-access tests.
>>
>> Tested in QEMU virtual target.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>> =C2=A0 hypervisor/arch/x86/include/asm/processor.h |=C2=A0 1 +
>> =C2=A0 hypervisor/arch/x86/mmio.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 37 ++++++=
+++++++++++----
>> =C2=A0 inmates/tests/x86/mmio-access-32.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +++
>> =C2=A0 inmates/tests/x86/mmio-access.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +++
>> =C2=A0 4 files changed, 40 insertions(+), 6 deletions(-)
>>
>> diff --git a/hypervisor/arch/x86/include/asm/processor.h
>> b/hypervisor/arch/x86/include/asm/processor.h
>> index 70a6c3ff..d8111690 100644
>> --- a/hypervisor/arch/x86/include/asm/processor.h
>> +++ b/hypervisor/arch/x86/include/asm/processor.h
>> @@ -145,6 +145,7 @@
>> =C2=A0 =C2=A0 #define X86_REX_CODE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 4
>> =C2=A0 +#define X86_PREFIX_OP_SZ=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x66
>> =C2=A0 #define X86_PREFIX_ADDR_SZ=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x67
>> =C2=A0 =C2=A0 #define X86_OP_MOVZX_OPC1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0f
>> diff --git a/hypervisor/arch/x86/mmio.c b/hypervisor/arch/x86/mmio.c
>> index b234bd79..6d9ad1c5 100644
>> --- a/hypervisor/arch/x86/mmio.c
>> +++ b/hypervisor/arch/x86/mmio.c
>> @@ -79,6 +79,26 @@ static unsigned int get_address_width(bool
>> has_addrsz_prefix)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (!!(cs_attr & VCP=
U_CS_DB) ^ has_addrsz_prefix) ? 4 : 2;
>> =C2=A0 }
>> =C2=A0 +static unsigned int get_op_width(bool has_rex_w, bool has_opsz_p=
refix)
>=20
> We should move all the flags into parse_context so that we can pass them
> around more easily.

Good point.

>=20
>> +{
>> +=C2=A0=C2=A0=C2=A0 u16 cs_attr;
>> +=C2=A0=C2=A0=C2=A0 bool long_mode;
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Op size prefix is ignored if rex.w =3D 1 */
>> +=C2=A0=C2=A0=C2=A0 if (has_rex_w)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 8;
>> +
>> +=C2=A0=C2=A0=C2=A0 cs_attr =3D vcpu_vendor_get_cs_attr();
>> +=C2=A0=C2=A0=C2=A0 long_mode =3D (vcpu_vendor_get_efer() & EFER_LMA) &&
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (cs_=
attr & VCPU_CS_L);
>=20
> This may mean accessing the same VMCS regs multiple times. I vaguely
> recall from KVM that it pays off to avoid that and keep the results
> cached (per vmexit).

See comment below=E2=80=A6

(BTW: not that it solved this issue, but we could also consider to
inline VCPU_VENDOR_GET_ accessors)

>=20
>> +
>> +=C2=A0=C2=A0=C2=A0 if (long_mode)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* CS.d is ignored in long m=
ode */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return has_opsz_prefix ? 2 :=
 4;
>> +
>> +=C2=A0=C2=A0=C2=A0 return (!!(cs_attr & VCPU_CS_DB) ^ has_opsz_prefix) =
? 4 : 2;
>=20
> This does the same as get_address_width (minus different output values),
> but its code format is different. Should be aligned.

Yeah. I chose this style, as it took me a while to understand what

long_mode ? (has_addrsz_prefix ? 4 : 8) : (!!(cs_attr & VCPU_CS_DB) ^
has_addrsz_prefix) ? 4 : 2;

actually means -- with respect to ?'s operator precedence (which is
clear in this case, but I got confused). May I propose to rather align
the line mentioned above? (but let's see -- maybe we can consolidate it
in any case)

>=20
> In fact, I could imagine a combined helper:
>=20
> void parse_widths(struct parse_context *ctx,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mmio_instruction *inst,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool parse_addr_width)
>=20
> That one would obtain cs_attr and long_mode only once, would do the
> address width thing only if parse_addr_width is true, and would push its
> results directly into *inst.

... as an inlined single-user function, right?

Good idea, that would also save the potential double efer/cs_attr
access. I'm just curious: It's Intel's vmread that you worry about? At
least on AMD, guest's efer is directly read from vmcs region.

>=20
>> +}
>> +
>> =C2=A0 struct mmio_instruction
>> =C2=A0 x86_mmio_parse(const struct guest_paging_structures *pg_structs,
>> bool is_write)
>> =C2=A0 {
>> @@ -94,6 +114,7 @@ x86_mmio_parse(const struct guest_paging_structures
>> *pg_structs, bool is_write)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool has_rex_w =3D false;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool has_rex_r =3D false;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool has_addrsz_prefix =3D false;
>> +=C2=A0=C2=A0=C2=A0 bool has_opsz_prefix =3D false;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!ctx_update(&ctx, &pc, 0, pg_s=
tructs))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto error_noinst=
;
>> @@ -114,9 +135,13 @@ restart:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (op[0].raw) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_PREFIX_ADDR_SZ:
>> +=C2=A0=C2=A0=C2=A0 case X86_PREFIX_OP_SZ:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!ctx_update(&=
ctx, &pc, 1, pg_structs))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 goto error_noinst;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 has_addrsz_prefix =3D true;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (op[0].raw =3D=3D X86_PRE=
FIX_ADDR_SZ)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 has_=
addrsz_prefix =3D true;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 has_=
opsz_prefix =3D true;
>=20
> I would avoid the double-dispatching just to save one ctx_update.

Ok.

>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto restart;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_OP_MOVZX_OPC1:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!ctx_update(&=
ctx, &pc, 1, pg_structs))
>> @@ -134,28 +159,28 @@ restart:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 does_write =3D tr=
ue;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_OP_MOV_TO_MEM:
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.access_size =3D has_rex=
_w ? 8 : 4;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.access_size =3D get_op_=
width(has_rex_w, has_opsz_prefix);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 does_write =3D tr=
ue;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_OP_MOVB_FROM_MEM:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.access_size =
=3D 1;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_OP_MOV_FROM_MEM:
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.access_size =3D has_rex=
_w ? 8 : 4;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.access_size =3D get_op_=
width(has_rex_w, has_opsz_prefix);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_OP_MOV_IMMEDIATE_TO_MEM:
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.access_size =3D has_rex=
_w ? 8 : 4;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.access_size =3D get_op_=
width(has_rex_w, has_opsz_prefix);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 has_immediate =3D=
 true;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 does_write =3D tr=
ue;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_OP_MOV_MEM_TO_AX:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.inst_len +=
=3D get_address_width(has_addrsz_prefix);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.access_size =3D has_rex=
_w ? 8 : 4;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.access_size =3D get_op_=
width(has_rex_w, has_opsz_prefix);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.in_reg_num =
=3D 15;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto final;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case X86_OP_MOV_AX_TO_MEM:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.inst_len +=
=3D get_address_width(has_addrsz_prefix);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.access_size =3D has_rex=
_w ? 8 : 4;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.access_size =3D get_op_=
width(has_rex_w, has_opsz_prefix);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst.out_val =3D =
guest_regs->by_index[15];
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 does_write =3D tr=
ue;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto final;
>> diff --git a/inmates/tests/x86/mmio-access-32.c
>> b/inmates/tests/x86/mmio-access-32.c
>> index 2f47f211..b4f83850 100644
>> --- a/inmates/tests/x86/mmio-access-32.c
>> +++ b/inmates/tests/x86/mmio-access-32.c
>> @@ -41,6 +41,10 @@ void inmate_main(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmio_write32(mmio_reg, pattern);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, pattern);
>> =C2=A0 +=C2=A0=C2=A0=C2=A0 /* MOV_FROM_MEM (8b), 16-bit data, 32-bit add=
ress, OP size
>> prefix */
>> +=C2=A0=C2=A0=C2=A0 asm volatile("mov (%%eax), %%ax" : "=3Da" (reg32) : =
"a" (mmio_reg));
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg32, (u16)pattern);
>=20
> We should try to cover all cases of current get_op_width.

Ok.

>=20
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* MOV_FROM_MEM (8b), 32-bit data, 32-bit=
 address */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("movl (%%ebx), %%eax"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg32) =
: "a" (0), "b" (mmio_reg));
>> diff --git a/inmates/tests/x86/mmio-access.c
>> b/inmates/tests/x86/mmio-access.c
>> index 0e6a56b1..86694353 100644
>> --- a/inmates/tests/x86/mmio-access.c
>> +++ b/inmates/tests/x86/mmio-access.c
>> @@ -51,6 +51,10 @@ void inmate_main(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmio_write64(mmio_reg, pattern);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(*comm_page_reg, pattern);
>> =C2=A0 +=C2=A0=C2=A0=C2=A0 /* MOV_FROM_MEM (8b), 16-bit data, Ox66 OP si=
ze prefix */
>> +=C2=A0=C2=A0=C2=A0 asm volatile("mov (%%rax), %%ax" : "=3Da" (reg64) : =
"a" (mmio_reg));
>> +=C2=A0=C2=A0=C2=A0 EXPECT_EQUAL(reg64, (u16)pattern);
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* MOV_FROM_MEM (8b), 64-bit data, mod=3D=
0, reg=3D0, rm=3D3 */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile("movq (%%rbx), %%rax"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (reg64) =
: "a" (0), "b" (mmio_reg));
>>
>=20
> Thanks for picking this up. I guess we need to complete that aspect of
> the instruction parsing. Eventually, it will be simpler to argue about
> being complete, rather than why not being so.

Yeah, I somehow feel sorry that we need this.

Just had a look at KVM's emulate.c. Oh my dear.

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
jailhouse-dev/c72d9659-2d46-5aff-062b-9d7d13dfcef4%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
