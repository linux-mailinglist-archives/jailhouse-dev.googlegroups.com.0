Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBG7F5TUQKGQEBSLHNAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F2076F74
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 19:04:27 +0200 (CEST)
Received: by mail-ed1-x538.google.com with SMTP id b12sf34423934ede.23
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 10:04:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564160667; cv=pass;
        d=google.com; s=arc-20160816;
        b=gWtXeqyROdjO4rcdPGQsYu52BYFBG3PYvLh0mQmvHMdXw0bTSKKyHIEib+QjgsuVFL
         /5q/wlBPXMb6Cac7KvttuVgaAG/BJCzpzUo+CVCS9OHlJ2K+ELLkAjUjv6FbSTrILiSD
         V5bOWOPGN3KxnwQVLshx9RlvA+B73nm6JFEnlgvxkyIO+QYpdLj3tzkexJYzfR7eR3Qs
         JGtNNQRjvtSK2eRthW3TuokAhERwgZEMnyqDjiH1/0OED8+uJBwctNJjWdLndwjvLnNc
         VzfV1kv5vchnoM1+MabMDkapF5PouE1kgeLZpGslG6tbcKiUqTHHoIZTB/qn80J6oGeW
         RJAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=+YFgJknnEcVe69ZCTnh58JNKtIWhjpDc5GB8mnkWxuw=;
        b=jGbzUtMVdO9e4tyUk0MJsdHfd9TuvwP0Iqt1nr2/bxgQNzv5pQgP0IEBP578syHAa9
         jey7nGwzipa/Oevv70WTu3fUWYQoYy64vXfNOi3UkvfBLmoUApEGMXGi0A1WWM2u4u0O
         cnyz5hACnpD7RXTpGJjyEtLEi3evcCc+XXh5uzPoKlBZ9EzXdC8A/aGH4HzCcCdWayo9
         B810zQqoykU/pwFHc+Uym4bwjgOZCj1Y6rkgdF7dxQtjtmPCP0ecznh5nhq0A9w/F81T
         0TWeJ+s+xihc4BEJOkPdiRNLhTlDXmKAvZ5uCiO/Bh/H6VopcvuTdNim5pRLhrMeag2s
         8opw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+YFgJknnEcVe69ZCTnh58JNKtIWhjpDc5GB8mnkWxuw=;
        b=Rppi+GjLmw0ymzQmatyhrAvM/Nzq8/y05DzyuUDbevxrjHuGccgUIqIK2Iy8j/ZxNs
         +tmfeZLyi61NKFrmhKFuxbwDYPi1XitIUnnIntdxgwh08LecydzI2e6NLtJqWrsBBcAO
         DWdtx3X5ufWpsI2rgqmYVwISZ2YsdUMmkax3mABF8J+FdP6FTkQpoOqXoRbVSBVr4tT8
         Hb99njNsyDY0CgIhcP1DoXRIkvxuhchCSCxS+oZuFFnvTTcm1DEJhGwLIcDRqMnc7iJL
         VF/KBbii/UbOpGjMZX3vABDzRlwTo1iNzPZE+uXiY3fuCWcctzklqyA1RvHH/lLuufSK
         eDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=+YFgJknnEcVe69ZCTnh58JNKtIWhjpDc5GB8mnkWxuw=;
        b=C0PQ/VGcwdLPBxT4SDw4WvOKgHBS9ElYLKvXAyXrvLnnkmoIDuNfgoRo8PDE23ndjS
         Z39t6Zmf2uV0eseA2UcNLxazSLjQ6MUwiOnejwgwzZYI3bQ6KQpcAMiecqashNgWnbze
         I4gj9VJXGfVInly81X0AEC+LTw6hjpYwkdP/IQEKHodd9AXS8dnoznyGiWYU/z6G8O9R
         yFgNMJRYouzs6rAuY032Oixee4D18cp8Z4JdjknRn/O51jjKvqGFWHDGrdLG+mCcsIa5
         QZh6875NWzIg17Yv5Wkm0Z1fsIArJJ/KaOpMB4v77ML8GroUZ/QzyFPYlsmwTED/Nq9t
         AmkA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU4U08SjBSaJA8oHdSD8tbdY6ElfsiQr7XU2W7JROod8IArxFM+
	6BVkXEimRmGY5k4jyfX5HOw=
X-Google-Smtp-Source: APXvYqx5pYhM8l7rnQuQddQEvUs2JO6/iGznFu3gd4cQqzhSRQXRud2g5TynuXsUOGeiCL02eIfeFw==
X-Received: by 2002:aa7:d058:: with SMTP id n24mr57252375edo.143.1564160667695;
        Fri, 26 Jul 2019 10:04:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:5e48:: with SMTP id b8ls11458681eju.3.gmail; Fri, 26
 Jul 2019 10:04:27 -0700 (PDT)
X-Received: by 2002:a17:906:2ecc:: with SMTP id s12mr21836178eji.110.1564160667125;
        Fri, 26 Jul 2019 10:04:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564160667; cv=none;
        d=google.com; s=arc-20160816;
        b=rMHxksBAWjoE5WE8/SAeZZ3z2Vjpq9kc/273baZIx40mEDesuuAbSviZs7stNAoiOm
         l0Zun37qEWd8QeLAbP/vNMjAzpxrup4EUmdDEfaprb+Eez3dsFyT0Za10Wie8yuWTTOk
         obKOs69OmobW05e+lpw+8JTcG5XGALbvWpm1e7gMo1gpFgjq6t3IrFeqgTeP9dsAxpsY
         N6mBHC4NUOLjlT8RTHkEMO6QSNla3hupbbbQNbUZUs9MZ1MWvSZ/yIA0AdG7PahpiNhy
         hN5NN2/iOlQ6UKVeKyFIIvnO5zcy6qR/La1WmSLpZ+/YkbLd1r3poUwtJD6P3+ohCtTv
         hj9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=Hl3TzPDtoOET7oBBWSfqOd1hoJadADgQRfFla5uMiSM=;
        b=AnAQcSpLjP2HZi/qHB2bbF6Hvyt7Kz2bN/msfP9OKv8QHtGwiEhbPTPp8JPsYrkhM4
         myD7Ru1Jsx4SOs89kXKvl/CHN8PunSPSwY5H0DP0GN7NH2G38KbAQaPhXsmBJp5zrsL3
         tfbaZ4yMDaA/n5kZWpiauqwc44bk1i1DGp5wuGqGsxgy1Wb+GCNn+iLOb59Pl6XNoj5U
         Nf3R0/YSJgORwfHcxhWWQcpWJu2CShotk/FPZeHmkYx1uWjAb/bydQJ6puSptFH6xIG9
         YFui9Yc2pdn/SCc7z37uWnZ19EW1loBV93tR0Cmv2Mh6CwdTvUin49fHkdU/2bTbdG+5
         QIcg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id t15si2548282ejq.1.2019.07.26.10.04.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 10:04:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x6QH4QjN026458
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Jul 2019 19:04:26 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6QH4QQK026496;
	Fri, 26 Jul 2019 19:04:26 +0200
Subject: Re: [PATCH v3 2/5] x86: drop vcpu_vendor_get_cell_io_bitmap and
 struct vcpu_io_bitmap
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190726135911.16810-1-ralf.ramsauer@oth-regensburg.de>
 <20190726135911.16810-3-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <26d99151-437b-0865-2e98-9430c3cd8651@siemens.com>
Date: Fri, 26 Jul 2019 19:04:26 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190726135911.16810-3-ralf.ramsauer@oth-regensburg.de>
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

On 26.07.19 15:59, Ralf Ramsauer wrote:
> Intel and ARM are now basically the same. No more need for those level
            ^^^
Fixed on merge ;)

> of indirection. Consolidate it and save a lot of lines of code.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  hypervisor/arch/x86/include/asm/vcpu.h |  7 ------
>  hypervisor/arch/x86/svm.c              |  7 ------
>  hypervisor/arch/x86/vcpu.c             | 33 ++++++++++----------------
>  hypervisor/arch/x86/vmx.c              |  7 ------
>  4 files changed, 12 insertions(+), 42 deletions(-)
> 
> diff --git a/hypervisor/arch/x86/include/asm/vcpu.h b/hypervisor/arch/x86/include/asm/vcpu.h
> index 24872f55..37c9630b 100644
> --- a/hypervisor/arch/x86/include/asm/vcpu.h
> +++ b/hypervisor/arch/x86/include/asm/vcpu.h
> @@ -25,11 +25,6 @@
>  	 X86_CR0_MP | X86_CR0_PE)
>  #define X86_CR4_HOST_STATE	X86_CR4_PAE
>  
> -struct vcpu_io_bitmap {
> -	u8 *data;
> -	u32 size;
> -};
> -
>  struct vcpu_io_intercept {
>  	u16 port;
>  	unsigned int size;
> @@ -88,8 +83,6 @@ const u8 *vcpu_get_inst_bytes(const struct guest_paging_structures *pg_structs,
>  
>  void vcpu_skip_emulated_instruction(unsigned int inst_len);
>  
> -void vcpu_vendor_get_cell_io_bitmap(struct cell *cell,
> -		                    struct vcpu_io_bitmap *out);
>  unsigned int vcpu_vendor_get_io_bitmap_pages(void);
>  
>  #define VCPU_CS_DPL_MASK	BIT_MASK(6, 5)
> diff --git a/hypervisor/arch/x86/svm.c b/hypervisor/arch/x86/svm.c
> index ae215ade..74abe652 100644
> --- a/hypervisor/arch/x86/svm.c
> +++ b/hypervisor/arch/x86/svm.c
> @@ -1007,13 +1007,6 @@ const u8 *vcpu_get_inst_bytes(const struct guest_paging_structures *pg_structs,
>  	}
>  }
>  
> -void vcpu_vendor_get_cell_io_bitmap(struct cell *cell,
> -		                    struct vcpu_io_bitmap *iobm)
> -{
> -	iobm->data = cell->arch.io_bitmap;
> -	iobm->size = IOPM_PAGES * PAGE_SIZE;
> -}
> -
>  unsigned int vcpu_vendor_get_io_bitmap_pages(void)
>  {
>  	return IOPM_PAGES;
> diff --git a/hypervisor/arch/x86/vcpu.c b/hypervisor/arch/x86/vcpu.c
> index eb171605..2e3a1880 100644
> --- a/hypervisor/arch/x86/vcpu.c
> +++ b/hypervisor/arch/x86/vcpu.c
> @@ -81,9 +81,8 @@ int vcpu_cell_init(struct cell *cell)
>  	const unsigned int io_bitmap_pages = vcpu_vendor_get_io_bitmap_pages();
>  	const u8 *pio_bitmap = jailhouse_cell_pio_bitmap(cell->config);
>  	u32 pio_bitmap_size = cell->config->pio_bitmap_size;
> -	struct vcpu_io_bitmap cell_iobm, root_cell_iobm;
>  	unsigned int n, pm_timer_addr;
> -	u32 size;
> +	u32 size, iobm_size;
>  	int err;
>  	u8 *b;
>  
> @@ -97,18 +96,16 @@ int vcpu_cell_init(struct cell *cell)
>  		return err;
>  	}
>  
> -	vcpu_vendor_get_cell_io_bitmap(cell, &cell_iobm);
> -
>  	/* initialize io bitmap to trap all accesses */
> -	memset(cell_iobm.data, -1, cell_iobm.size);
> +	iobm_size = io_bitmap_pages * PAGE_SIZE;
> +	memset(cell->arch.io_bitmap, -1, iobm_size);
>  
>  	/* copy io bitmap from cell config */
> -	size = pio_bitmap_size > cell_iobm.size ?
> -			cell_iobm.size : pio_bitmap_size;
> -	memcpy(cell_iobm.data, pio_bitmap, size);
> +	size = pio_bitmap_size > iobm_size ?  iobm_size : pio_bitmap_size;
> +	memcpy(cell->arch.io_bitmap, pio_bitmap, size);
>  
>  	/* always intercept access to i8042 command register */
> -	cell_iobm.data[I8042_CMD_REG / 8] |= 1 << (I8042_CMD_REG % 8);
> +	cell->arch.io_bitmap[I8042_CMD_REG / 8] |= 1 << (I8042_CMD_REG % 8);
>  
>  	/* but moderate only if the config allows i8042 access */
>  	cell->arch.pio_i8042_allowed =
> @@ -121,20 +118,17 @@ int vcpu_cell_init(struct cell *cell)
>  		 * Shrink PIO access of root cell corresponding to new cell's
>  		 * access rights.
>  		 */
> -		vcpu_vendor_get_cell_io_bitmap(&root_cell, &root_cell_iobm);
> -		for (b = root_cell_iobm.data; pio_bitmap_size > 0;
> +		for (b = root_cell.arch.io_bitmap; pio_bitmap_size > 0;
>  		     b++, pio_bitmap++, pio_bitmap_size--)
>  			*b |= ~*pio_bitmap;
>  	}
>  
>  	/* permit access to the PM timer if there is any */
>  	pm_timer_addr = system_config->platform_info.x86.pm_timer_address;
> -	if (pm_timer_addr) {
> -		for (n = 0; n < 4; n++, pm_timer_addr++) {
> -			b = cell_iobm.data;
> -			b[pm_timer_addr / 8] &= ~(1 << (pm_timer_addr % 8));
> -		}
> -	}
> +	if (pm_timer_addr)
> +		for (n = 0; n < 4; n++, pm_timer_addr++)
> +			cell->arch.io_bitmap[pm_timer_addr / 8] &=
> +				~(1 << (pm_timer_addr % 8));
>  
>  	return 0;
>  }
> @@ -145,15 +139,12 @@ void vcpu_cell_exit(struct cell *cell)
>  		jailhouse_cell_pio_bitmap(root_cell.config);
>  	const u8 *pio_bitmap = jailhouse_cell_pio_bitmap(cell->config);
>  	u32 pio_bitmap_size = cell->config->pio_bitmap_size;
> -	struct vcpu_io_bitmap root_cell_iobm;
>  	u8 *b;
>  
> -	vcpu_vendor_get_cell_io_bitmap(&root_cell, &root_cell_iobm);
> -
>  	if (root_cell.config->pio_bitmap_size < pio_bitmap_size)
>  		pio_bitmap_size = root_cell.config->pio_bitmap_size;
>  
> -	for (b = root_cell_iobm.data; pio_bitmap_size > 0;
> +	for (b = root_cell.arch.io_bitmap; pio_bitmap_size > 0;
>  	     b++, pio_bitmap++, root_pio_bitmap++, pio_bitmap_size--)
>  		*b &= *pio_bitmap | *root_pio_bitmap;
>  
> diff --git a/hypervisor/arch/x86/vmx.c b/hypervisor/arch/x86/vmx.c
> index 182e4de0..c4b7dbb6 100644
> --- a/hypervisor/arch/x86/vmx.c
> +++ b/hypervisor/arch/x86/vmx.c
> @@ -1219,13 +1219,6 @@ void vmx_entry_failure(void)
>  	panic_stop();
>  }
>  
> -void vcpu_vendor_get_cell_io_bitmap(struct cell *cell,
> -		                    struct vcpu_io_bitmap *iobm)
> -{
> -	iobm->data = cell->arch.io_bitmap;
> -	iobm->size = PIO_BITMAP_PAGES * PAGE_SIZE;
> -}
> -
>  unsigned int vcpu_vendor_get_io_bitmap_pages(void)
>  {
>  	return PIO_BITMAP_PAGES;
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/26d99151-437b-0865-2e98-9430c3cd8651%40siemens.com.
