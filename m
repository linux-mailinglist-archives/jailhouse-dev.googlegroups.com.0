Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB2EM77TQKGQEE5Y3KBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2513D093
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 17:19:04 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id 12sf2186254ljj.17
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 08:19:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560266344; cv=pass;
        d=google.com; s=arc-20160816;
        b=u24WhNyjNBjBN/b1ih2/4iJhox2ddnPcQ62dxSxrCsgAJ4foV+ZhlACb1/iFmFHX/L
         m0YqjFezG/9YjVEb1bRPed4VGszapXQN9eSVPmEhDr4a1Bay9KHvGX9Tdh+3QRzRwsFS
         Oejs/oJ8wpjD4e9qJomYrxpBvKeCGfcVxoMjz4eAuKnPiMZXdph4h0+EyLDFvVK92bu8
         aB4I6T88w7F6DqwA69xk0H15wVXHly5cgLc1RNnPQ7KEr7FxBfpcIc0UqHlP91DqdG2V
         AiMLKcwesZmfXr5tMOoGSM5+2y5xrRO2rJAds8gJ67pQUkq/zHuguTpfsK3JbBknIDGJ
         HVxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=kYiv5YgCXfR19MpKE/DrGKy29M1vCyTfYekKnHG2j4I=;
        b=IHatAmbNAtoAYv2ZBOmLn+WnqEdNJRYALeh7elxDlC2WXKzWzihVi7HRVdJDU94PmF
         hCd1ZodejCn5ddnr7dDLkDsu0aQsUBM1fJfAzpeWsDFUMecNrJa4mJF3O4t6Ox4lIF8N
         QxE44IDlu62MhaHpnPrUuiy9DoX4sGRfOu2zZzkF/ABm8G1sGh3a/j4S6MpVTd/JPt2M
         MII2S3tfF+glb/GGHShOHAgaEdoVm2+vN3QlGRfQhfvikyKkdFLQ0CMNaYwT4wHYd4x0
         /vNOq9CfUPs/P28u3gR3IbZ+xjtTSzJsj9nzjb4BlBhIrAdVYMCGWav9CZb+LzFm3hxs
         U7GQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=D25QOvJ2;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kYiv5YgCXfR19MpKE/DrGKy29M1vCyTfYekKnHG2j4I=;
        b=Evb5qtQSnMMrKLe3d9r3g6VTnHPwsWg/MCgkkCw1G1i7hXA2leUjIDDDzHFKp2vBJr
         ZmpGx8mgUd5o/IhSkQokIJC8OUypfpS/Wg/Xyoiv3BFjvF7ckbKw4OwwZf/rVHrIE8Sc
         BWi3mG0sK0ZhidmzTHuN8GK5I5GPM65wHBjtrZ3QzistPyyDqAf3/e6epMZB6sONsW21
         zkCXQM9Ivw0ajRwNj270Wcq/hZ6q/m+oK3840j/iYHYMRmZlLj6XOkzmP7avyhXkGDpQ
         XZQfgPlW391sGI38ZhLNhgtCKEgswdYpo8aF1zxlLYoSRPVltClEFzbIAGKErwPovJWK
         151g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=kYiv5YgCXfR19MpKE/DrGKy29M1vCyTfYekKnHG2j4I=;
        b=oQ43myj6WU16YiJFaTKBBMNTX2bg6YOEvbRhIX8C0HGND1ym/IcJtcGot1DTPvzsb4
         M0skTqcMYw/L3I7m2Fm0yyzLa0CShDZ02oFhj1LqimttoCttKu+91cZ83dznjUZKmsZ8
         zPA66YWtAFkbNjXkNt61npGPxUZ6hlHAzXxdbomLgdHJKlCBbkWgOsv77eTrWOt2aokR
         5vEPvzJvbVPW6yYH1CO609/OSKLrIENKuwNj6MtVloCrCLViwTQwJq70gBN+dLHwRrCt
         7QJceaynzLiLiaRZZzUduPe2qsY1PWD/29NqKP943Rmh6/N9MYIX8U++oG6uk6hBpqdM
         QJMg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX08i9Mxzp9QiOS5CQ1W1HhbfiwZp3KeeRgmRz4Xgmn+JhVajgt
	SQ9eMvKZUdoxkCZ1UHCzSGo=
X-Google-Smtp-Source: APXvYqz6jhnEwmNUBaJVPWfR8n7pE1LOx+vn4XLWBbfpCfAC3h1aq7RDsA6KhU6xt7AqxnF2F2HKTQ==
X-Received: by 2002:a2e:9788:: with SMTP id y8mr17166285lji.41.1560266344431;
        Tue, 11 Jun 2019 08:19:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:f715:: with SMTP id z21ls400347lfe.9.gmail; Tue, 11 Jun
 2019 08:19:03 -0700 (PDT)
X-Received: by 2002:a19:1908:: with SMTP id 8mr37502072lfz.171.1560266343820;
        Tue, 11 Jun 2019 08:19:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560266343; cv=none;
        d=google.com; s=arc-20160816;
        b=VbP98iO819X702ev+D6vnMiYv+ZFwBWwjhOI0V38nuzDjaRgYGeWimpocVVyFRMKqz
         rkCG6zbCarmMbydsD6H7QAz+rO4k5sHaQRIEhqok8lYVVnxYTCaRV05K5p2pvUKzvR9p
         QjwVAi7hpe7kgPVXWLPrQ4R6KUZexHP+s+otFwS7R/auP5kAiNeGtG+lW105DdMRXRAB
         nOGLZa5CFEhDSd0mzQWypurSfbbwQL534VfmBKdY6J8BpfcFOdkcGnAb/YD46qzejZRO
         jlF/iavSey5EYJGwZAN0RuehRkJNGve4s2fLKLIwWiwlbrQczm4yQxWjtU1xZ+Zh9yJW
         ti4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=pTRHquZ3JdDIYl/8E+kys5VDEUANRwlqPiWp7j1CTwE=;
        b=IVNeDeCywnuejanRXI4uaJqTMm3wD6nQC4CkkrOEv37+WRP088DnRUy49kHC2G8TJ5
         o6aCF44AhX41D6RWfY6HnwfKRIqyg5oIX2H+jdYzXC1NTNew9N8WEqEbab366OzzZ8up
         5akMoCJPif5o2Zh8XZXsazYtEqi4aSCT9/cwixqB0eYaXPFiqFAJpREhSYjO2YoYPvAo
         fABoKLqq/DjoZu4P71kaZ9XfC4QIcVnYuCXYhZKFwnDNGo4OEgLYZA8t3EjCWnIfewAe
         NZ8Q4N58POb9DccUgf/tr6lRpqIF30paMIso/1Ssjhe+iqjCd1eqLjrB5PCJPeF0qMf2
         rDLQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=D25QOvJ2;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id v29si889525lfq.2.2019.06.11.08.19.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 08:19:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [172.18.208.3] ([46.183.103.8]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LmcnP-1h0YaI1oqh-00aBSq; Tue, 11
 Jun 2019 17:19:03 +0200
Subject: Re: [PATCH v3 07/10] inmates: x86: Add accessors for different system
 registers
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
 <20190610230330.21419-8-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <af503930-9803-c39b-8d96-f922a4fa4806@web.de>
Date: Tue, 11 Jun 2019 17:18:51 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190610230330.21419-8-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:YiB8YL9Ex2tZbLQktEZpUt0sKVbB3JtF34QeF9piIPgg9dHzUEq
 fHBKW5bydNNNgxwM7IH5Ysggoo713O+F8Ms3UTiGFM+pXoQKB+BBIHiwzZ4rBHXkYFPXZIx
 KyCji1KQmDXnhnkx1IRWLVncei8wT+QL1DJaKLff6FF91pd+YHY5UfUFB7TskXMqLqDEE4U
 s9PKx2P9VecuzkKhD7x+A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:knBmuNFFXWo=:4tqu/bqTkzxTZmo1Bx/uk7
 I8+F8Iui80u7Zk54oWSmTy6CwkUCuVRHxGbDOIS1YJXoc/Ea+F6eKrrabnVF8VH1omxFWZPR6
 wVYLmf+pO/SLcNv3L0SkZ4jN9lQln6WJ5YFq4nYuKaGmpfCQryWy761U1BU0oRh4JBftJ1Xek
 VKHb+MQ/Ht0n0U3pNM9MNTjV01nnX/F6dFA5UbdAmV8nYjDSYEXR+PgihN639lWjC+UGXUOmL
 FPqFzk42PBWFD0qE2qtvo//X6oxTpVLIljKcHX7uwRuVsRmoLQa+fgXiOW+p4nHu0nu72V3Bt
 qcqNqK01YmGYd9OEG5cCoa0tIoTDueNIKBgp59/emYr+Mgs9RJD3PP9RTshkOnL0xm2gtHXeH
 +dIW5EUjDykYAo+kyYayBr4XiV4Z3/HlnXuM500Bt0asLogbyb0JrsOPh/Ef9ixuEOrpaKot1
 Fhkf+8XT4Yz/S+XGn15xZWs22AtrpU4/U1OQbBIA9vEbFpeEGDdPKUBR8vUWVak/UKljYa6bE
 U80fomczYzGlay8uDQCkIT2OkLUIzFEUAMoi45BTb39ReN3oxVthGWrYZM0koyA88Us0hfHcV
 jx4tSksQnNM/mNfdHJqGFlSZsM+d54mZThsvFZnWph+Yp9eWGl4hufgJjoLG0jHEREUJXkDrd
 e5jm8+JR2rhiBCiUjGctqNELP1pKcWO1E90N8/doHawTduD3vtk6kiKhSafAIzCz4foyOenGP
 9xmghC2X2C4hAL1A/V3CPSRK5/Etf4GXyq0Ch6V8FL+KXfNFLnrTTGFMYWllEV/Zn8sV9VLwv
 ML7ECxVhYqS1tMwMTF3YtkoJ0FQrVcSIF4A6masXd+QgFwsSh5R3raCBnBmQYju38QO9quf1j
 Qk8kpWXxYBxva2GePT0paQpe4Rbm+/5118jPdS3godxRhPtfL+qfdJNXDCHVr4FBjck/kNQTm
 VDPANP+MZR7wDQr5sJA/Jp+hoN74dKpELgEHZSubUBquWn+sQ/oMQiDh5+bRhNBQCZJZwmmTZ
 lmIue3NYkcw5ybhwSNMqP48=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=D25QOvJ2;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 11.06.19 01:03, Ralf Ramsauer wrote:
> Add R/W accessors for CR3, CR4, XCR0 and implement CPUID.
>
> Partly copied over from the hypervisor and added cpuid_edax helper,
> which combines edx:eax to a 64 bit uint.

The bits you copied over, who has copyright on them? If it was only you and some
folks from Siemens, this is fine, but it should still be documented.

>
> And use these acessors where it's already possible.

accessors

Jan

>
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   inmates/lib/x86/include/asm/regs.h | 79 ++++++++++++++++++++++++++++++
>   inmates/lib/x86/mem.c              |  3 +-
>   2 files changed, 81 insertions(+), 1 deletion(-)
>
> diff --git a/inmates/lib/x86/include/asm/regs.h b/inmates/lib/x86/include/asm/regs.h
> index a004fdd2..cfea8580 100644
> --- a/inmates/lib/x86/include/asm/regs.h
> +++ b/inmates/lib/x86/include/asm/regs.h
> @@ -48,3 +48,82 @@
>
>   #define MSR_MTRR_DEF_TYPE	0x000002ff
>   #define MTRR_ENABLE		0x00000800
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <string.h>
> +
> +static unsigned long __force_order;
> +
> +#define READ_CR(n)						\
> +	static inline unsigned long read_cr##n(void)		\
> +	{							\
> +		unsigned long cr;				\
> +		asm volatile("mov %%cr" __stringify(n) ", %0"	\
> +			: "=r" (cr), "=m" (__force_order));	\
> +								\
> +		return cr;					\
> +	}
> +
> +READ_CR(3)
> +READ_CR(4)
> +
> +static inline void write_cr4(unsigned long val)
> +{
> +	asm volatile("mov %0, %%cr4" : : "r" (val), "m" (__force_order));
> +}
> +
> +static inline u64 read_xcr0(void)
> +{
> +	register u32 eax, edx;
> +
> +	asm volatile("xgetbv" : "=a" (eax), "=d" (edx) : "c" (0));
> +
> +	return ((u64)(edx) << 32) + ((u64)(eax));
> +}
> +
> +static inline void write_xcr0(u64 xcr0)
> +{
> +	unsigned int eax = xcr0;
> +	unsigned int edx = xcr0 >> 32;
> +
> +	asm volatile("xsetbv" : : "a" (eax), "d" (edx), "c" (0));
> +}
> +
> +static inline void cpuid(unsigned int *eax, unsigned int *ebx,
> +                         unsigned int *ecx, unsigned int *edx)
> +{
> +        /* ecx is often an input as well as an output. */
> +        asm volatile("cpuid"
> +            : "=a" (*eax), "=b" (*ebx), "=c" (*ecx), "=d" (*edx)
> +            : "0" (*eax), "2" (*ecx)
> +            : "memory");
> +}
> +
> +static inline u64 cpuid_edax(unsigned int op, unsigned int sub)
> +{
> +	unsigned int eax, ebx, ecx, edx;
> +
> +	eax = op;
> +	ecx = sub;
> +	cpuid(&eax, &ebx, &ecx, &edx);
> +	return ((u64)edx << 32) + (u64)eax;
> +}
> +
> +#define CPUID_REG(reg)							  \
> +static inline unsigned int cpuid_##reg(unsigned int op, unsigned int sub) \
> +{									  \
> +	unsigned int eax, ebx, ecx, edx;				  \
> +									  \
> +	eax = op;							  \
> +	ecx = sub;							  \
> +	cpuid(&eax, &ebx, &ecx, &edx);					  \
> +	return reg;							  \
> +}
> +
> +CPUID_REG(eax)
> +CPUID_REG(ebx)
> +CPUID_REG(ecx)
> +CPUID_REG(edx)
> +
> +#endif /* __ASSEMBLY__ */
> diff --git a/inmates/lib/x86/mem.c b/inmates/lib/x86/mem.c
> index c6903897..e391f2b0 100644
> --- a/inmates/lib/x86/mem.c
> +++ b/inmates/lib/x86/mem.c
> @@ -37,6 +37,7 @@
>    */
>
>   #include <inmate.h>
> +#include <asm/regs.h>
>
>   #define PG_PRESENT	0x01
>   #define PG_RW		0x02
> @@ -48,7 +49,7 @@ void map_range(void *start, unsigned long size, enum map_type map_type)
>   	unsigned long pt_addr, *pt_entry, *pt;
>   	unsigned long vaddr = (unsigned long)start;
>
> -	asm volatile("mov %%cr3,%0" : "=r" (pt_addr));
> +	pt_addr = read_cr3();
>
>   	size += (vaddr & ~HUGE_PAGE_MASK) + HUGE_PAGE_SIZE - 1;
>   	size &= HUGE_PAGE_MASK;
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/af503930-9803-c39b-8d96-f922a4fa4806%40web.de.
For more options, visit https://groups.google.com/d/optout.
