Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZ6MRCDAMGQEXUFT4PY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id F164C3A2E92
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Jun 2021 16:49:11 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id q11-20020ac2510b0000b029030783d1d1f0sf671606lfb.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Jun 2021 07:49:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623336551; cv=pass;
        d=google.com; s=arc-20160816;
        b=oA/aAeR6GXyuRbot3OSEJ3rvoD9W2WBchnogliu6VqbAMoLNA3h7Z9RMu9FCVuXNJb
         sbz8Wr+JYvmKO83fRtb4lPQZMCpPhyiA99uVYjqU/HLcEE1XiVUFqR6EV24S9bc4byeZ
         rR6r5rXpJo6R9JmDG556mmvjcwzPgniBfKal1j+T1dZHAbLJwXQnxUvp7eYKWECYsDhb
         18hXbsRGeYnb3yxpGHDKCnT+PKiIG0HduvSTcO8HqcI4UMa5oc7GRWFlS1NeGWWBpHfY
         2r68XjC3knmqHUZ+rgC6eL3DPrr6E4iTEYW7W+WkCor7kqhnKhNVYfrbUcN3tjPnY7Jn
         cZIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=LcBEgj8iPx0GlQ9AEcnNNQq0+wRi8kzU55OveT4oG1U=;
        b=BhGqC4qUMKGYU87xy2ZF1+2uvxtxODyDhhcE2VFPfo8nuUvkmYlyKYJXj79LAMICxC
         4W7bDu843fQmsHaBRP+Opjt9ScyHHkx3XygrjXxPENK1Kwpo97lZiRwzZDr/TTFSKv5V
         m84+F8N8w+QuCiahh+VrkTor8EVfw8hFoTShUTMGOqfc47p75JNiJMeyFP5HHIql6I6X
         Afuwv6kFBQ85zNgqbHuBg9il+eCofTr3LwUFKTxYfcd2reYd96UBJTMq7uednPTDgtB3
         NOLL1W0iPtkNDo1G2VIhC95iYTOZyq1qy77Meq/QhORPjEpQIQXefZO9tdvr4fjzTgKc
         HA4g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=LcBEgj8iPx0GlQ9AEcnNNQq0+wRi8kzU55OveT4oG1U=;
        b=lU4yaGw60CoUA2linRrEd4rnhoxd2NVjtpktiAMwUf9rhi9LrPXMJnULjoi7yxpEtT
         OUa6Z+gjOzFxU78PaAEiP6LaV5Dw827B+Cyd1QqcQe5rAxuyiNAZLxmbFdNlicg1dxBB
         chjbdylpY1WqanWb7nS3RcxGxF2fwbMobw2t6U8Le59uLRjpCkc/q6sFBevwdGTeuO/F
         DzLMlqQG7AKcmhpzHbqK+ZhSOh1kqrcWr0of/CXNa2H/6tX28FNISEI8iwRBwX3fbT2P
         nnY747esgG5pxai5vKONLpFOEV2463vAhSQzAQWsdDy1mPCuuaWogaLRSjDMT/7ZZum8
         z3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=LcBEgj8iPx0GlQ9AEcnNNQq0+wRi8kzU55OveT4oG1U=;
        b=CNQnATr2hTBXyV2RD5Wqex5eyBku8ZQjKvjht1H/3egV4z23XyMh4nESkkHM/JYQwg
         ljmylUkOz3XzJP4zVLfzozaYwS/MZeLpeCIDuKUsdlQL3rG8r7ClGAzme+98Q2jFExrn
         is6zVaqNh2RDs0rLfIP4fvzSesEyx9XcIo3v1EaNhqVSiRDWGfjKZS3MNgGk9oiAwo1F
         DIDEaQyJKej3LeVEtUeMf5dGTopslflmgfIriF/ku/4R/eC5CUufpohuyf2SuS62HWps
         8J/Cn2dwxGPA9A7o6Jkv1tlHDElfyfiZV22XMd3Wdgt14BWDhpFByEwLUEIOdEymSNgC
         NBIg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531rJX9DkYZuGVJDnab9uUj+ESeb7Kdv21dWLkkzhu43BNcG7o/8
	5et58HMGS3fMUaQHF+hkDhc=
X-Google-Smtp-Source: ABdhPJzS+3LuU1kOd4KPnuZ7tGdNDeIgL9vzwfPEMBvUxvdj1JndO1BkiJbohBhtzMakQ76KzoYNLQ==
X-Received: by 2002:a2e:9b8a:: with SMTP id z10mr2525178lji.159.1623336551406;
        Thu, 10 Jun 2021 07:49:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:32f:: with SMTP id b15ls1180496ljp.10.gmail; Thu,
 10 Jun 2021 07:49:10 -0700 (PDT)
X-Received: by 2002:a2e:b4bc:: with SMTP id q28mr2503883ljm.286.1623336550219;
        Thu, 10 Jun 2021 07:49:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623336550; cv=none;
        d=google.com; s=arc-20160816;
        b=mNFL+GuB2Dlue93l+QKQZGe9lBHyzPbHhQrL2CDrIZngvh7Loeae2B8fpDBSDQkIz6
         l1DlBtgOel25DyVPNoAskLlpixU/DwzxFDgCYolMEGomcwy+9XXX6rElhmjR4JtbS+dF
         Jcel0mzswuYPonBxuLM+WN4sjuTFx10zVcu2RCtgKq+9B6jKejPZOO8wj+pdvDxZn3bP
         c9yG+XkybdV/zga/IUe/pJtg23l1bmxQJyyGjGQbLjl+Py1xRG61h+m+eq4vwAe6t4kj
         bzQkpTu7SKMODLF2+kNbUt7CWuLY2NkyTpdkBDkQWmZ/mCe7YebuHYXyAPmfSLl+mEze
         OatQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=X+UpGRxzOcmyroULy1rdP24PfYVdwcYUiPYEemcc/Qg=;
        b=UlTo1oQUf16Crzk7xn9wjzTZM6Xpd/Avs9Va9II0g5ZbsoDRcdlfW2QbKFQ+WPd+tU
         NfRXpFUNQyJs3Iq0rAzSivTAs/FDjQ6hg+bUAZGf5ddJ9IgGIySSdeyVZ/jheE6CuxEP
         JkvqqJXHdh6nUszqjAzB4mfhsmmdufCbvq0jxaFzMcuToaOHrOaAkO3980f8hvNI99yo
         cEFyA7QzZZWPShwacG3dOWVbDWYiX+nYHHhfiKd+AQQSyB+RUFU7K09vFOp62R9eiEs0
         Axg2dMrI9ZoNsZZ5yRetgGuoUYzNKjioj3saIfwkD+vAMC6l19DV8ppVr0JPR8Q//CmG
         B8Rg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id f20si191374ljj.6.2021.06.10.07.49.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Jun 2021 07:49:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 15AEn9M4023250
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Jun 2021 16:49:09 +0200
Received: from [167.87.77.77] ([167.87.77.77])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 15AEn8Xu012035;
	Thu, 10 Jun 2021 16:49:08 +0200
Subject: Re: [PATCH] arm64: Do not dynamically enable private per-CPU address
To: Dongjiu Geng <gengdongjiu1@gmail.com>, jailhouse-dev@googlegroups.com
References: <20210610133621.31470-1-gengdongjiu1@gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <4d1b57bc-d152-5651-3a85-9bada12d952e@siemens.com>
Date: Thu, 10 Jun 2021 16:49:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210610133621.31470-1-gengdongjiu1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 10.06.21 15:36, Dongjiu Geng wrote:
> In order to safe, forbid other CPUs to access per-CPU private
> address when it exits from VM.
> 
> Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
> ---
>  hypervisor/arch/arm64/setup.c | 2 +-
>  hypervisor/arch/arm64/traps.c | 6 ++----
>  2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/hypervisor/arch/arm64/setup.c b/hypervisor/arch/arm64/setup.c
> index 376648e3..82da01ea 100644
> --- a/hypervisor/arch/arm64/setup.c
> +++ b/hypervisor/arch/arm64/setup.c
> @@ -143,7 +143,7 @@ void arch_shutdown_self(struct per_cpu *cpu_data)
>  		:: "r" (hypervisor_header.arm_linux_hyp_vectors));
>  
>  	/* Return to EL1 */
> -	shutdown_func((struct per_cpu *)paging_hvirt2phys(cpu_data));
> +	shutdown_func((struct per_cpu *)paging_hvirt2phys(per_cpu(this_cpu_id())));
>  }
>  
>  void arch_cpu_restore(unsigned int cpu_id, int return_code)
> diff --git a/hypervisor/arch/arm64/traps.c b/hypervisor/arch/arm64/traps.c
> index 488dd7f8..95d8d860 100644
> --- a/hypervisor/arch/arm64/traps.c
> +++ b/hypervisor/arch/arm64/traps.c
> @@ -43,10 +43,8 @@ static enum trap_return handle_hvc(struct trap_context *ctx)
>  
>  	regs[0] = hypercall(code, regs[1], regs[2]);
>  
> -	if (code == JAILHOUSE_HC_DISABLE && regs[0] == 0) {
> -		paging_map_all_per_cpu(this_cpu_id(), true);
> -		arch_shutdown_self(per_cpu(this_cpu_id()));
> -	}
> +	if (code == JAILHOUSE_HC_DISABLE && regs[0] == 0)
> +		arch_shutdown_self((struct per_cpu *)LOCAL_CPU_BASE);
>  
>  	return TRAP_HANDLED;
>  }
> 

You are not changing the "shutdown VM" (destroy cell) path but the
"shutdown Jailhouse completely". After that, there is no control of
Jailhouse over data left in memory anyway, including what was in the
hypervisor state. Furthermore, Jailhouse only supports
disabling/shutdown after all non-root cells have been destroyed, thus
when there is nothing to leak anymore.

I strongly recommend that you provide test cases and more precise
descriptions along change requests. While creating them, you may see
clearer what actually happens - or help us to better understand what may
actually go wrong so far.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4d1b57bc-d152-5651-3a85-9bada12d952e%40siemens.com.
