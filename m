Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLWB4D6AKGQE4GGWVHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B1E29AD4A
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 14:29:19 +0100 (CET)
Received: by mail-wm1-x33f.google.com with SMTP id z7sf585690wme.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 06:29:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603805359; cv=pass;
        d=google.com; s=arc-20160816;
        b=pIdZS0WC5VH+IDqHB2s65s+FT9c3oGW9JLHv9ywJHf133O0cBEkeX//jX7BVPAJlZd
         X2DuCQLhjKfqondpnkHrCRMHxKyzZZy1n+r5hbUa7SfxuFnYaVcYXHsDgzzrwfOhOVju
         SsSGTFXNImE9igrsALMcVDgiC3P3F6o5W9Tr8e9/cLoTesnBtki1CjsZtNhpm8tTa7Qe
         icLxoCJx+eD6gYdGnfhuiZVS2OOXu0BkSJLJstoU0e4XG9L7jhIRHrIihKwDcn7EzRtz
         1Tlztr8xutaSgSePnMNvPlyw6inV8bmKsEfQwMdjCuI86luW7WR6PslLGOHQigDxlhfc
         eKSA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=rgH2fXvTSxdgenbZ+06Qpn6M8NWtr4GJsN9g8bp3g/A=;
        b=s4aUHvMRWoNEcONzRo7qOU9kX2OasLRXW948Fxpc1R4NeO0UTKm2BnvanfrqlfqZcx
         Ahb/x7CZTypSV2RIIq4V9E8OwmfINH1VM5PIgT3wBLpOAOO+j2fCpPxF3H9KG4a5ArAT
         ETE26wh+BA1B6ExZJ/7gu2oLvk+yFbkuRmxJEW6naX+GqKA9r6kj03EiaGcVocg6PMww
         ho745eloR6wN3pDELRDNT+9/KKlSXaIFDOWJ5VmKIhyKdGxYVdTmSRekn7OwGldWggez
         AV90b4R8N/2cLClKkN3a0x+R56mmItJemwI7BBVYq/fiZW2D/xKQt6681xf89Yeh0rEA
         YdrQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rgH2fXvTSxdgenbZ+06Qpn6M8NWtr4GJsN9g8bp3g/A=;
        b=qJDYV8rGrfTjGa0ChGqXd0U38lPUm5Sg7NSY6NoAc2BNVx6RMnvtlYmtTAdor0q9PQ
         oDw4vRjL6/Bp+wM+X1ShTSmJbZ3rRkHqdpv/Wl0zXmPBTDzz8rDF7Kq/dw9TuuddIl/H
         1sgDoJtKgLFJ8oTCXSz1o6SprTF/hIEpja45dchnLZr4kBlfajaslwqSU1X9uRNPSJD5
         zkXu4e4sp7NnND+o4PxMo6Q5cHeQ7eeC2I9Qfv3G7Jemu2cmxNhOcWTaHDikkvcBJNNB
         ubklpJJtgdYcnxeoPlptNjP+qSeipKUt0rk7A9cwAC3h0UWsSm6rR4p0Fae3fPg7l5Hg
         fMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=rgH2fXvTSxdgenbZ+06Qpn6M8NWtr4GJsN9g8bp3g/A=;
        b=ARBpCvBrr7/Zn2GVcb/CgQu6upqnax9N+ZyUnkZTBUW8odFqyWt54YzfowvBd0fdU+
         0jL76/RXqrO9TcXX7OtOt9BlPNtjbNkw7HmFfhSH719n+05tp1WgJFabVNdaRYCihJSk
         YJFizpy5s3rmFcyYssIqKDsH0e3LM4OtATkQ3uqCk2+lLiCZw8O9JWUW4kahBVpbhxIx
         wE4T1GQkLwYqq4EFcDc+hCBZ5TTTN31Luh6QI2Ip0TalNp1dWpwy5KAsDF0a6zEeUQBH
         qHS2vhq8DfRP12dikXxk8ep13tVwqRSd9OxYBo1SZ0EHdhrdhpW7sw4f8b5Gkwp/TJw7
         sNdw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533ZLLQ1Oud3JgHJ+afYxhkhE9sNttYN43dzypVnQ+AUmCTYEN1P
	ZeBiAcog+DAdk9ZL0648wnw=
X-Google-Smtp-Source: ABdhPJzifOoHPHQjCHWW62rh1+CV9tCE6Ropt27AYKhdEh/7RhQH5u6Au/j1tRPjTPDqb/y9YW+1qg==
X-Received: by 2002:adf:f101:: with SMTP id r1mr3128188wro.392.1603805359143;
        Tue, 27 Oct 2020 06:29:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4ac3:: with SMTP id y3ls2287537wrs.2.gmail; Tue, 27 Oct
 2020 06:29:18 -0700 (PDT)
X-Received: by 2002:adf:ea0a:: with SMTP id q10mr2822345wrm.242.1603805358009;
        Tue, 27 Oct 2020 06:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603805358; cv=none;
        d=google.com; s=arc-20160816;
        b=wCf6Tm1gQAmz5dwk1GVG9Ops97vIDqtebGlNp9/c83b2mirHw/WTU3xaYqdZfl6aCv
         q0iN5xq6EKJuCcJoC5ikEg4yWJt0vNc7n7wZvoSo71n4tJiA7FAwErybaUaE3tMDuxff
         FRtLy7lBxuBgoJdI2OgnaF0CdY1iMzg81BsKA7xvenFD29R6lbc9e1XsZoey2jom6psB
         BT2E9hrQHNJtBn9XcDnHZ3u8SHYg/OHPPsI+++M2RndErxgjzgyaZEw+Tk8zQv/IdYKK
         Dhpo65a0xXZ1YRS28/QYHy9MGPGfi/Es4rWClLeB+oVwBfeARqO4NYdNUNhGv4+rkBPR
         ytRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=+VgcT8HdNyyEWSQ7bLpnkfM9dDEklRlwc+p3lc/mwdM=;
        b=aC8jjcfuWIgH0zAkuTnG4eRIMNtGAf2VXLsbKrHyTX6IHvWkrFd9pLW9d5bxVKYl2A
         B0QwXiV12uIGoS1Mb4IEcxtXglAI/SVKfvntWJM/SPtU/PHK+6LQkeBuQWb+iedmRQGD
         o+LIoPm/fE9Af1GufzWpf1EKYeva4Wzbr8WRgrHri7ii2BkzoW2B6XTEV/jUb/HTPKiq
         ShIaqBF1iSArS9CzPaGnoTS1qCRfrItjTiAXrobSYtq9Y1t/INTT5mWdPdqHZApH26F4
         n5/RYpIm6mjll5MvVnwhpyD3pkjfywM+GxTbwdA5xRw/2r1D8v/nxsAXkmdi7URUb2m1
         8UnA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id k3si34826wrl.5.2020.10.27.06.29.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 06:29:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 09RDTHcx028634
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Oct 2020 14:29:17 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09RDTHL7015663;
	Tue, 27 Oct 2020 14:29:17 +0100
Subject: Re: [PATCH v2 27/33] x86: control, vcpu: force cast to prevent
 Wsign-compare
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
 <20201022175826.199614-28-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d526bdc0-27cb-20e8-bce5-9390bec47dfb@siemens.com>
Date: Tue, 27 Oct 2020 14:29:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201022175826.199614-28-andrea.bastoni@tum.de>
Content-Type: text/plain; charset="UTF-8"
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

On 22.10.20 19:58, Andrea Bastoni wrote:
> The cast is just to prevent fallouts due to the Werror. The error and
> rax are really unsigned values, but int to unsigned promotion is mixed
> too many times to be easily fixed.
> 
> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
> ---
>  hypervisor/arch/x86/control.c | 2 +-
>  hypervisor/arch/x86/vcpu.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hypervisor/arch/x86/control.c b/hypervisor/arch/x86/control.c
> index 2aea807a..98659f4a 100644
> --- a/hypervisor/arch/x86/control.c
> +++ b/hypervisor/arch/x86/control.c
> @@ -238,7 +238,7 @@ x86_exception_handler(struct exception_frame *frame)
>  {
>  	panic_printk("FATAL: Jailhouse triggered exception #%lld\n",
>  		     frame->vector);
> -	if (frame->error != -1)
> +	if ((int)frame->error != -1)

Why not define and use some EXCEPTION_NO_ERROR as ~(0) here as well?

>  		panic_printk("Error code: %llx\n", frame->error);
>  	panic_printk("Physical CPU ID: %lu\n", phys_processor_id());
>  	panic_printk("RIP: 0x%016llx RSP: 0x%016llx FLAGS: %llx\n", frame->rip,
> diff --git a/hypervisor/arch/x86/vcpu.c b/hypervisor/arch/x86/vcpu.c
> index 7a6543bf..5dd23d49 100644
> --- a/hypervisor/arch/x86/vcpu.c
> +++ b/hypervisor/arch/x86/vcpu.c
> @@ -194,7 +194,7 @@ void vcpu_handle_hypercall(void)
>  
>  	guest_regs->rax = hypercall(code, guest_regs->rdi & arg_mask,
>  				    guest_regs->rsi & arg_mask);
> -	if (guest_regs->rax == -ENOSYS)
> +	if ((int)guest_regs->rax == -ENOSYS)
>  		printk("CPU %d: Unknown hypercall %ld, RIP: 0x%016llx\n",
>  		       cpu_id, code,
>  		       vcpu_vendor_get_rip() - X86_INST_LEN_HYPERCALL);
> 

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d526bdc0-27cb-20e8-bce5-9390bec47dfb%40siemens.com.
