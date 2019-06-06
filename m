Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJFQ4PTQKGQE7LB4VEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A75236F81
	for <lists+jailhouse-dev@lfdr.de>; Thu,  6 Jun 2019 11:08:53 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id a21sf2724434edt.23
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Jun 2019 02:08:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559812133; cv=pass;
        d=google.com; s=arc-20160816;
        b=nAXXZexeBNGpXKnN4DqLEWY0f9HCd8cG7TXlJEiOMw9n3db1RALIk6E50I5s4GfXN6
         L7xspYtD1bIfw+noeGaX1K27MdFAOhHtsWfeEUdYRRTgU7i76FEGyTv7+VvIjPU67KHW
         GlQ3mUEjp+8zeHnhtdMG/+A7FosTQOmv1bowmc7oBHMG3pU4oh/zrSyTV3wQispBWgA4
         16F6knXtydFRkw9XPOCDNzg+RXpg04cpP0S2PthVxbzx3B5Y9KXpSiQtwPGZvSQE9qQ2
         TX5IKun78heT5+NVR7/Mjldi7pxbkUlJatTgKgokBHUAFUBkBIdS/VrYFO9bIyRJBgo5
         KxBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=DA3aLqM0BmjB2jt1i3skVkRqhTcmAr0zMJwVIcRlbUE=;
        b=MFpfn5yNA3vOVuJlQcyLybRv4iw5wRe+NhJeZd9LcbiOP4cQVNLYprPFQG39bIQFEJ
         lj1q7Cd1RBl+efuSQDS6ZTefxJkFIxkwHkgS+ACf3iFLwe2HZHmoc8yECaMGj1h4VP6y
         JKOlMYIlqyQp2WtM10pfF2Inr+zr4B8lZlYc6sTZ7Hz96vi0KmGRRU/egmrglAAn/tuy
         5EhXF7m6AXF3knyX9pgpjSoaAppfJsPle8aot7me+6EEJ2zVxONRkwxFyghQthopvZtY
         wL+nrzeouw3rXflS4JoL1gLAcEMVJMpiBYJVGRc7wCZP+o/fjTgFilCFkJYOh0w+/ORq
         aHKQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=DA3aLqM0BmjB2jt1i3skVkRqhTcmAr0zMJwVIcRlbUE=;
        b=WYhxqM/TsG7umjvYk2rDehhCacpP9SUd9yBe39afQDqPqR2DEp0ISTZk0yhcFL6XjY
         aORHGjHN6+3aZRK/tgXxi0pC275BqXCw9247pjNxmDrOH3LVS5YIy3xxaewp106FXdsN
         Mx3DCBhtUliTzW4NUAU9lpgTF7xhTifc1DEg8nudLn3IFarU51GqGDgTU6ZMrGidKEZw
         K+7pgjJn/a2zh8Zo65TX+qfd82X9ciaJ5tNOJXM+BH6VPZsGe4CjFv/G5q1ECPJGnwNh
         Pl9IhaqqeELqZq0oEcOfINtLKA72qzFj1F6BvwQ8M1sG5iC8Ut67fvanJvArntIBs2o6
         f5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=DA3aLqM0BmjB2jt1i3skVkRqhTcmAr0zMJwVIcRlbUE=;
        b=D6bC2PFiPBZs/Y2Wg8Xoad0t8YiUkqX4c+RnJNNTLNoXCWurX1h4DE9AAfoV8tYic9
         fZM10epib0iNCw5X3DrsVjEgog6StCxd5B0i3UaXnmDQAs0TdrlT4o98JQ3U1V38N8ha
         NfoBVSIw+ie2nDFPaxc4qBqoUo+HOWb47IXhblgl2R43GtOmwQVFvSfl1goRsAzazgdo
         rVsOxk7HPtnNpd2fyp84zdHaD/peIm6r2piTxnltVr0oiDWS7Jr/q99jbkHgqT0AeHYH
         qZfWvt5LlPvdNZpqLP3neCnxDiKYbn1LwJR4NWRZEL3uu4s3ehZAkCXlaM3b7IqyOmzb
         /Gpw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW2ua/eWdO2PWvkW7boapwgPBcN5h2t/pRhTV1wVMmQGSEjDE9n
	ZYZ63dfb8m/Rf/d3qSCsAxQ=
X-Google-Smtp-Source: APXvYqzUK6UxhEuhvFZTwgCbakwTA50dk8/ft2nzS0rdjYVy/uP000x2+q7dalC35IBLhtHOg/u8kA==
X-Received: by 2002:a17:906:5048:: with SMTP id e8mr40072289ejk.91.1559812133018;
        Thu, 06 Jun 2019 02:08:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:6dc1:: with SMTP id j1ls1239999ejt.1.gmail; Thu, 06
 Jun 2019 02:08:52 -0700 (PDT)
X-Received: by 2002:a17:906:f91:: with SMTP id q17mr9603223ejj.297.1559812132255;
        Thu, 06 Jun 2019 02:08:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559812132; cv=none;
        d=google.com; s=arc-20160816;
        b=eBC1+FpH0D46zFj6YiqTWCpPz8cZEHd7mZP7xbh/oZyb+h8P3KH32ophmlTNyHkiIw
         E9eG3z5tQ7V7nTUbxy0yB+9IRVZCTaVIgTv1CvEscCyk0DigaLNYsE5Isd2khhfBF+V3
         WtF0gBADCkWE1j73WO1+Y9iLoTkkSqU49/cmzcas2GVgX2j82AZ0UXU/dPVYnL412Vi+
         ITY4Z067/LANywVBuel5JGxLa7pLEyqKgYCxgCS+ccTAAjTBzmYzQ8acRcw0LETavCJ6
         ggIJ03sIibj44A6mE6I2Dl3DUMLh2Du+g62dYJJOjZbyMEm3tCr1O71aBQ6TPspxNfcn
         FSjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=ZREVupfPyzuB1R8tAXaoo/rj3g7t+1s/WKjoq5W7TWY=;
        b=x+qyDlj0h2tuU/sMsWorkUzw7n1USNkRdl7q9CzVSt0YAcP6SEt2YNKz7zalp50sCt
         aK6+u/J4HIxLnK8OyhQYBySw+YKByowF2eDIy2aseaAaa5B7nurfuBKFqUI54naKMkqz
         5hk+wgd/xqUaTdxcSan8aEHpO6W5+n4oAbp7RNHTuwMxaMNo83uAVbh2UanVbQdgLi/8
         aRtGsE2B/DDNG+sZUpRLuAQkE+YfzMRC8PNd0OBzp9O7hwxEdy9J6yCyWQB//5ByE4Ep
         jyzxC4kaPTfkyKF5PXkxnW68txidQNEVqp+gFbbk95b8uaIc76E0GZFbR0ye+hjmDnUa
         iZ+A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id o1si75113edc.2.2019.06.06.02.08.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 02:08:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x5698p7k016424
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Jun 2019 11:08:51 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x5698peV006213;
	Thu, 6 Jun 2019 11:08:51 +0200
Subject: Re: [PATCH] x86: mmio: add support for 0x66 operand prefix
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
Cc: Mario Mintel <mario.mintel@st.oth-regensburg.de>
References: <20190604210229.23554-1-ralf.ramsauer@oth-regensburg.de>
 <813d52b7-789f-acea-98a3-ed71e36a6022@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <68904dc8-bce4-c98f-da9a-e65ad353ae70@siemens.com>
Date: Thu, 6 Jun 2019 11:08:50 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <813d52b7-789f-acea-98a3-ed71e36a6022@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 04.06.19 23:17, Ralf Ramsauer wrote:
> Hi,
> 
> just a short side note:
> 
> x86 opcode parsing is really a hell, by the way...
> 
> All existing tests in mmio-access tests (of course) still pass. [1] This
> doesn't necessarily mean that my patch is absolutely correct. Please
> review carefully.
> 
> get_op_width() returns the width according to this (really helpful) table:
> 
> https://wiki.osdev.org/X86-64_Instruction_Encoding#Operand-size_and_address-size_override_prefix
> 

FWIW, the official tables are 3-3 and 3-4 in SDM volume 1. I would assume they 
are in sync, though.

> 
> I make the assumption that if rex.w is set, we can always return 8 for
> performance reasons (we can save other useless checks in this case).
> 
> rex.w must only be set in long mode, and then we always have 8b width,
> so there's no need to check for non-long mode if rex.w is set -- or
> should we? Could this maybe be exploited by faulty opcodes by guests
> running in non-long mode that inject 0x66 8b 00 e.g.? (e.g., by targeted
> access to page boundaries)

I would expect that invalid opcodes trigger an exception prior to triggering any 
MMIO exit. If the opcode combination is valid, just pointless, we will be 
called, though.

Jan

> 
>    Ralf
> 
> [1] Without my SSE series, 32-bit requires -mno-sse to be tested at the
>      moment
> 
> On 6/4/19 11:02 PM, Ralf Ramsauer wrote:
>> mov (%rax), %ax is a 16-bit data MOV_FROM_MEM that will emit
>> 0x66 0x8b 0x00.
>>
>> 0x66 is the operand-size override prefix which we currently do not support.
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
>>   hypervisor/arch/x86/include/asm/processor.h |  1 +
>>   hypervisor/arch/x86/mmio.c                  | 37 +++++++++++++++++----
>>   inmates/tests/x86/mmio-access-32.c          |  4 +++
>>   inmates/tests/x86/mmio-access.c             |  4 +++
>>   4 files changed, 40 insertions(+), 6 deletions(-)
>>
>> diff --git a/hypervisor/arch/x86/include/asm/processor.h b/hypervisor/arch/x86/include/asm/processor.h
>> index 70a6c3ff..d8111690 100644
>> --- a/hypervisor/arch/x86/include/asm/processor.h
>> +++ b/hypervisor/arch/x86/include/asm/processor.h
>> @@ -145,6 +145,7 @@
>>   
>>   #define X86_REX_CODE					4
>>   
>> +#define X86_PREFIX_OP_SZ				0x66
>>   #define X86_PREFIX_ADDR_SZ				0x67
>>   
>>   #define X86_OP_MOVZX_OPC1				0x0f
>> diff --git a/hypervisor/arch/x86/mmio.c b/hypervisor/arch/x86/mmio.c
>> index b234bd79..6d9ad1c5 100644
>> --- a/hypervisor/arch/x86/mmio.c
>> +++ b/hypervisor/arch/x86/mmio.c
>> @@ -79,6 +79,26 @@ static unsigned int get_address_width(bool has_addrsz_prefix)
>>   		(!!(cs_attr & VCPU_CS_DB) ^ has_addrsz_prefix) ? 4 : 2;
>>   }
>>   
>> +static unsigned int get_op_width(bool has_rex_w, bool has_opsz_prefix)
>> +{
>> +	u16 cs_attr;
>> +	bool long_mode;
>> +
>> +	/* Op size prefix is ignored if rex.w = 1 */
>> +	if (has_rex_w)
>> +		return 8;
>> +
>> +	cs_attr = vcpu_vendor_get_cs_attr();
>> +	long_mode = (vcpu_vendor_get_efer() & EFER_LMA) &&
>> +		    (cs_attr & VCPU_CS_L);
>> +
>> +	if (long_mode)
>> +		/* CS.d is ignored in long mode */
>> +		return has_opsz_prefix ? 2 : 4;
>> +
>> +	return (!!(cs_attr & VCPU_CS_DB) ^ has_opsz_prefix) ? 4 : 2;
>> +}
>> +
>>   struct mmio_instruction
>>   x86_mmio_parse(const struct guest_paging_structures *pg_structs, bool is_write)
>>   {
>> @@ -94,6 +114,7 @@ x86_mmio_parse(const struct guest_paging_structures *pg_structs, bool is_write)
>>   	bool has_rex_w = false;
>>   	bool has_rex_r = false;
>>   	bool has_addrsz_prefix = false;
>> +	bool has_opsz_prefix = false;
>>   
>>   	if (!ctx_update(&ctx, &pc, 0, pg_structs))
>>   		goto error_noinst;
>> @@ -114,9 +135,13 @@ restart:
>>   	}
>>   	switch (op[0].raw) {
>>   	case X86_PREFIX_ADDR_SZ:
>> +	case X86_PREFIX_OP_SZ:
>>   		if (!ctx_update(&ctx, &pc, 1, pg_structs))
>>   			goto error_noinst;
>> -		has_addrsz_prefix = true;
>> +		if (op[0].raw == X86_PREFIX_ADDR_SZ)
>> +			has_addrsz_prefix = true;
>> +		else
>> +			has_opsz_prefix = true;
>>   		goto restart;
>>   	case X86_OP_MOVZX_OPC1:
>>   		if (!ctx_update(&ctx, &pc, 1, pg_structs))
>> @@ -134,28 +159,28 @@ restart:
>>   		does_write = true;
>>   		break;
>>   	case X86_OP_MOV_TO_MEM:
>> -		inst.access_size = has_rex_w ? 8 : 4;
>> +		inst.access_size = get_op_width(has_rex_w, has_opsz_prefix);
>>   		does_write = true;
>>   		break;
>>   	case X86_OP_MOVB_FROM_MEM:
>>   		inst.access_size = 1;
>>   		break;
>>   	case X86_OP_MOV_FROM_MEM:
>> -		inst.access_size = has_rex_w ? 8 : 4;
>> +		inst.access_size = get_op_width(has_rex_w, has_opsz_prefix);
>>   		break;
>>   	case X86_OP_MOV_IMMEDIATE_TO_MEM:
>> -		inst.access_size = has_rex_w ? 8 : 4;
>> +		inst.access_size = get_op_width(has_rex_w, has_opsz_prefix);
>>   		has_immediate = true;
>>   		does_write = true;
>>   		break;
>>   	case X86_OP_MOV_MEM_TO_AX:
>>   		inst.inst_len += get_address_width(has_addrsz_prefix);
>> -		inst.access_size = has_rex_w ? 8 : 4;
>> +		inst.access_size = get_op_width(has_rex_w, has_opsz_prefix);
>>   		inst.in_reg_num = 15;
>>   		goto final;
>>   	case X86_OP_MOV_AX_TO_MEM:
>>   		inst.inst_len += get_address_width(has_addrsz_prefix);
>> -		inst.access_size = has_rex_w ? 8 : 4;
>> +		inst.access_size = get_op_width(has_rex_w, has_opsz_prefix);
>>   		inst.out_val = guest_regs->by_index[15];
>>   		does_write = true;
>>   		goto final;
>> diff --git a/inmates/tests/x86/mmio-access-32.c b/inmates/tests/x86/mmio-access-32.c
>> index 2f47f211..b4f83850 100644
>> --- a/inmates/tests/x86/mmio-access-32.c
>> +++ b/inmates/tests/x86/mmio-access-32.c
>> @@ -41,6 +41,10 @@ void inmate_main(void)
>>   	mmio_write32(mmio_reg, pattern);
>>   	EXPECT_EQUAL(*comm_page_reg, pattern);
>>   
>> +	/* MOV_FROM_MEM (8b), 16-bit data, 32-bit address, OP size prefix */
>> +	asm volatile("mov (%%eax), %%ax" : "=a" (reg32) : "a" (mmio_reg));
>> +	EXPECT_EQUAL(reg32, (u16)pattern);
>> +
>>   	/* MOV_FROM_MEM (8b), 32-bit data, 32-bit address */
>>   	asm volatile("movl (%%ebx), %%eax"
>>   		: "=a" (reg32) : "a" (0), "b" (mmio_reg));
>> diff --git a/inmates/tests/x86/mmio-access.c b/inmates/tests/x86/mmio-access.c
>> index 0e6a56b1..86694353 100644
>> --- a/inmates/tests/x86/mmio-access.c
>> +++ b/inmates/tests/x86/mmio-access.c
>> @@ -51,6 +51,10 @@ void inmate_main(void)
>>   	mmio_write64(mmio_reg, pattern);
>>   	EXPECT_EQUAL(*comm_page_reg, pattern);
>>   
>> +	/* MOV_FROM_MEM (8b), 16-bit data, Ox66 OP size prefix */
>> +	asm volatile("mov (%%rax), %%ax" : "=a" (reg64) : "a" (mmio_reg));
>> +	EXPECT_EQUAL(reg64, (u16)pattern);
>> +
>>   	/* MOV_FROM_MEM (8b), 64-bit data, mod=0, reg=0, rm=3 */
>>   	asm volatile("movq (%%rbx), %%rax"
>>   		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
>>

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/68904dc8-bce4-c98f-da9a-e65ad353ae70%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
