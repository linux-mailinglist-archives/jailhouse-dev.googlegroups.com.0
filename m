Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXEC4XUQKGQEX25BGKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id B77F074572
	for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 07:42:52 +0200 (CEST)
Received: by mail-wm1-x33b.google.com with SMTP id t62sf15150549wmt.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 24 Jul 2019 22:42:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564033372; cv=pass;
        d=google.com; s=arc-20160816;
        b=nqWjCQrmTQyikWbj/pHtNa5SVfpSQ24hEXzfQAxSQ0hA6w66yIk9Qaes/iBV8pgDcb
         YFsNj1os7Ezqo4pTmx2U4lw2Q+6JProIr1TxEdu2kuylj3nqS0Q5DjGMabzenIZHWZuv
         EP5Y4ItMG07YvSjA/adxXGyw3HzmUSK6KrlMSvAwgRHK4xhJuNu/6sgpd0tF68aRh7pj
         7Hh/iynVoGAIJcSJPKSdJIggz065oo+aCAWqQniscYYjySGYJksTP4qsRKv9dOzwXaKt
         C+0qHIV1N/itUvNlKVYffTyM3SEW4Bo4J1NMLOg2T27/4s4JqhToeX5ucYORj0czS6t5
         Xr/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=loTvfIWKlY83+obpztmsKRlto8POhsQTjhuf7mJLaXU=;
        b=rqqsxQKrfA5SNoV1AyyL9643u7dhiB4/jZ6ab70beNeWg1cdMAcL9O0Q9aPy8m+rlY
         AM+I/qULY8NKFEaFZjBOsycYAvPbf5yJpCSDWMkyGpG4onHzZDIGng9/5bQkhYzAKIR0
         GofzSrRZ5aBil4wVbivj9lR2M5w0r4u2qYtJGYJSlid4ix7JAT9hK02RsK1Ig1P+pRHt
         FuTiMz9mtA0LlwtJvPW0GkTO3qeMnIpWpdKLI6NUP/tsclPsxk+kwYhDB817sQ7kNjQA
         ilZ1/pJMKVeb02j7wDJOncG2/5yF57ihyL48IycBE2Sd0PYEtOnJX3Xjh0Yft1VfQn1l
         FyxQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=loTvfIWKlY83+obpztmsKRlto8POhsQTjhuf7mJLaXU=;
        b=H+1Yikah1L5cIAqe91M32usa4eBGBJACK4tbLE7n43gpj7QqY7S0ES2tnJcbxjllYT
         e72iq0rFRLc5Ghl76NxKdEaDpNRikUxC3c/UIDGUk+xKv5G1KE01DKOLfhAIetFP59+I
         0QKErZkMEyHZeSRdBbbcb7+inaDZcuMzl/wwuwtxTeQvWfm04DwgZWaJ9ROQ0cx8xAW0
         SThiWWuPyPpHFDd64HcxUu1kt6/s8FnmkZy1SmIukUZxoT1BQSIFSBkRdYJX/AnnlU1q
         aEateZKGFfkIhs3WiC2ZBbJJfPd6YYaHEA6nn7uHwGbvgg4NOjDO+PyUIDucquGIlzsa
         ZEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=loTvfIWKlY83+obpztmsKRlto8POhsQTjhuf7mJLaXU=;
        b=F+tFOGvsfaQ9xp8KmQUXlR98Vh2mb1mG5ZFYOKKndhNQVgDTX4MHb6gmGJw35twfio
         xGYXWlVJWrOZrRlJICXG78TApDDad7aVQriMLqFf9Jf/YPlkL9LDRv83vuQaJQY3cgpP
         puKiHtj3mM2SJTSCK4hWeaee172zC4Gm6hVxP8832J3uSq4hsf87Z2o2qUPqPe2Qzp2T
         lXZKaWzE99zmV9FaUZUJnmzcaaxlnHZjpc0ZrSE7rlvrRnHoVWtvWZKtqdIELlK9V7aN
         PNOXAu8MAyxsgC4oPrxUZQoo2iE62jvPF4CrRwADPRh1kl4NhPsYRCaXUBqzqc+j8jS4
         ZFeg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUUsB9gNOmBifJNdzQBiarIM+dPxH99+dkHOBKQJ+HCoJKlon7r
	kvxwVxnplhT5+3FrD7WmdDo=
X-Google-Smtp-Source: APXvYqyxuOeqWGCdoqkDFovCgR4MlJgmUfUKlUh626/0O4TrhslwVTNo+rKsxFu8snnaWIX+A4vrvg==
X-Received: by 2002:a1c:9d53:: with SMTP id g80mr72484249wme.103.1564033372269;
        Wed, 24 Jul 2019 22:42:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a2cd:: with SMTP id t13ls14475073wra.8.gmail; Wed, 24
 Jul 2019 22:42:51 -0700 (PDT)
X-Received: by 2002:adf:d4cc:: with SMTP id w12mr93894952wrk.121.1564033371408;
        Wed, 24 Jul 2019 22:42:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564033371; cv=none;
        d=google.com; s=arc-20160816;
        b=DmVVNDa9ru7ZIW6tYNr/so0QVP8uCqW9ERBL/DXa+nRukO407DAv96ja8CDGxMWCEQ
         k4F3sJgwCJLD/++QysOz/UQVZj5bTknoC9UW5l2BWho+hKt+SI3BG8P/ExEhAraJhTvW
         4fSTi9sqCo4ZVf8Xvy7j4VukZJaUyaQ6rHrw9rcE0+2G/ZatT2IM8TlMDDZVD8w5EvdF
         7PChz0q6hHG54KI/eH8/uD1lxoGZTeQdsGez93g6Gg8fmftemQa50O7TdtTWhcMr7koL
         ib0YBx1QHT/eyETC9pO6FPGF9OgldcqOswZtqZNJthOBSUlvkzH3jA3qiyygKAgnldYB
         voPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=dDrLWwnkhYDF27RYP5Oy9gGHu1exoNg8km7B+XDq8Qo=;
        b=dgTzrVSThnZB2xiKaI3w4DFl/GXYIWrpeHxLjm17lvBTfZdw9fvRNTcA5udGU5GUrW
         dJc8TM6YtA0aF/Hx48Gm0u3C3HmYQunucAm/o4ycQuWcRDoSEmXOXlT1hGB2a7ySyQaB
         7u9UTMrqS4IgQMs0Wt2jgGL2jjJQ6unxhSx/q/NabOWr4jCH7y8QELev/d05slUMGSAm
         0OSK5184Urk47vx4Bd424AZAIPgsCsYGaQTDBYsSWg+pf/a/GHCxOSg9Xbg++G90SCPv
         Lwmhdh3UiU37//n37uEQvzeuk1HUWQ1tP7nAJBrf5mXt8krA7TVzxD0P4YjrZxAmkOQD
         tSyw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id r13si2382156wrn.3.2019.07.24.22.42.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 22:42:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x6P5goKL022126
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jul 2019 07:42:51 +0200
Received: from [167.87.33.114] ([167.87.33.114])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6P5gok2015927;
	Thu, 25 Jul 2019 07:42:50 +0200
Subject: Re: [PATCH 10/11] x86: pio: use a whitelist instead of a permission
 bitmap
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190713181037.4358-1-ralf.ramsauer@oth-regensburg.de>
 <20190713181037.4358-11-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e049667a-6d1e-cd7b-783b-0739191e227c@siemens.com>
Date: Thu, 25 Jul 2019 07:42:50 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190713181037.4358-11-ralf.ramsauer@oth-regensburg.de>
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

On 13.07.19 20:10, Ralf Ramsauer wrote:
> Whitelist-based permissions align better with the Jailhouse philosophy.
> 
> This patch switches the permission bitmap (which basically was (almost) a
> duplicate of the final io_bitmap) to a structure that whitelists a port range,
> given a base port and a length.
> 
> As a side effect, this patch drastically reduces the size of config files:
> 8404  -> 224   apic-demo.cell
> 8488  -> 312   e1000-demo.cell
> 11450 -> 3290  f2a88xm-hd3.cell
> 11634 -> 3474  imb-a180.cell
> 8424  -> 252   ioapic-demo.cell
> 8480  -> 296   ivshmem-demo.cell
> 8788  -> 608   linux-x86-demo.cell
> 8488  -> 308   pci-demo.cell
> 9730  -> 1586  qemu-x86.cell
> 8392  -> 212   smp-demo.cell
> 8404  -> 224   tiny-demo.cell
> 
> If no whitelist is given, all PIO access will be denied. Additionally, increase
> the config file revision header.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  configs/x86/apic-demo.c         | 16 +++----
>  configs/x86/e1000-demo.c        | 19 +++-----
>  configs/x86/f2a88xm-hd3.c       | 27 +++++------
>  configs/x86/imb-a180.c          | 27 +++++------
>  configs/x86/ioapic-demo.c       | 22 ++++-----
>  configs/x86/ivshmem-demo.c      | 13 ++----
>  configs/x86/linux-x86-demo.c    | 16 +++----
>  configs/x86/pci-demo.c          | 16 +++----
>  configs/x86/qemu-x86.c          | 41 ++++++----------
>  configs/x86/smp-demo.c          | 16 +++----
>  configs/x86/tiny-demo.c         | 16 +++----
>  hypervisor/arch/x86/vcpu.c      | 83 +++++++++++++++++++++------------
>  include/jailhouse/cell-config.h | 17 +++----
>  tools/jailhouse-hardware-check  |  2 +-
>  14 files changed, 151 insertions(+), 180 deletions(-)
> 

[...]

> diff --git a/hypervisor/arch/x86/vcpu.c b/hypervisor/arch/x86/vcpu.c
> index 9caba92f..3a660ef1 100644
> --- a/hypervisor/arch/x86/vcpu.c
> +++ b/hypervisor/arch/x86/vcpu.c
> @@ -26,6 +26,12 @@
>  #include <jailhouse/percpu.h>
>  #include <asm/vcpu.h>
>  
> +#define for_each_pio_whitelist(pio, config, counter)			\
> +	for ((pio) = jailhouse_cell_pio_whitelist(config),		\
> +	     (counter) = 0;						\
> +	     (counter) < (config)->num_pio_whitelists;			\
> +	     (pio)++, (counter)++)
> +
>  static u8 __attribute__((aligned(PAGE_SIZE))) parking_code[PAGE_SIZE] = {
>  	0xfa, /* 1: cli */
>  	0xf4, /*    hlt */
> @@ -83,15 +89,26 @@ static inline void vcpu_get_cell_io_bitmap(struct cell *cell,
>  	iobm->size = vcpu_vendor_get_io_bitmap_pages() * PAGE_SIZE;
>  }
>  
> +static void pio_allow_access(struct vcpu_io_bitmap *bm,
> +			    const struct jailhouse_pio_whitelist *pio,
> +			    bool access)
> +{
> +	void (*access_method)(unsigned int, volatile unsigned long*) =
> +		access ? clear_bit : set_bit;
> +	unsigned int start_bit = pio->base;
> +	unsigned int length = pio->length;
> +
> +	for (; length; length--, start_bit++)

I would prefer "length > 0" here.

> +		access_method(start_bit, (unsigned long*)bm->data);
> +}
> +
>  int vcpu_cell_init(struct cell *cell)
>  {
>  	const unsigned int io_bitmap_pages = vcpu_vendor_get_io_bitmap_pages();
> -	const u8 *pio_bitmap = jailhouse_cell_pio_bitmap(cell->config);
> -	u32 pio_bitmap_size = cell->config->pio_bitmap_size;
> +	const struct jailhouse_pio_whitelist *pio_whitelist;
>  	struct vcpu_io_bitmap cell_iobm, root_cell_iobm;
>  	unsigned int n, pm_timer_addr;
> -	u32 size;
> -	int err;
> +	int err, i;

You already have "n", can be recycled, and it has the better type.

>  	u8 *b;
>  
>  	cell->arch.io_bitmap = page_alloc(&mem_pool, io_bitmap_pages);
> @@ -109,19 +126,20 @@ int vcpu_cell_init(struct cell *cell)
>  	/* initialize io bitmap to trap all accesses */
>  	memset(cell_iobm.data, -1, cell_iobm.size);
>  
> -	/* copy io bitmap from cell config */
> -	size = pio_bitmap_size > cell_iobm.size ?
> -			cell_iobm.size : pio_bitmap_size;
> -	memcpy(cell_iobm.data, pio_bitmap, size);
> +	/* cells have no access to i8042, unless the port is whitelisted */
> +	cell->arch.pio_i8042_allowed = false;
>  
> -	/* always intercept access to i8042 command register */
> -	cell_iobm.data[I8042_CMD_REG / 8] |= 1 << (I8042_CMD_REG % 8);
> +	for_each_pio_whitelist(pio_whitelist, cell->config, i) {
> +		pio_allow_access(&cell_iobm, pio_whitelist, true);
>  
> -	/* but moderate only if the config allows i8042 access */
> -	cell->arch.pio_i8042_allowed =
> -		pio_bitmap_size >= (I8042_CMD_REG + 7) / 8 ?
> -		!(pio_bitmap[I8042_CMD_REG / 8] & (1 << (I8042_CMD_REG % 8))) :
> -		false;
> +		/* moderate i8042 only if the config allows it */
> +		if (pio_whitelist->base <= I8042_CMD_REG &&
> +		    pio_whitelist->base + pio_whitelist->length > I8042_CMD_REG)
> +			cell->arch.pio_i8042_allowed = true;
> +	}
> +
> +	/* but always intercept access to i8042 command register */
> +	cell_iobm.data[I8042_CMD_REG / 8] |= 1 << (I8042_CMD_REG % 8);
>  
>  	if (cell != &root_cell) {
>  		/*
> @@ -129,9 +147,8 @@ int vcpu_cell_init(struct cell *cell)
>  		 * access rights.
>  		 */
>  		vcpu_get_cell_io_bitmap(&root_cell, &root_cell_iobm);
> -		for (b = root_cell_iobm.data; pio_bitmap_size > 0;
> -		     b++, pio_bitmap++, pio_bitmap_size--)
> -			*b |= ~*pio_bitmap;
> +		for_each_pio_whitelist(pio_whitelist, cell->config, i)
> +			pio_allow_access(&root_cell_iobm, pio_whitelist, false);
>  	}
>  
>  	/* permit access to the PM timer if there is any */
> @@ -148,21 +165,29 @@ int vcpu_cell_init(struct cell *cell)
>  
>  void vcpu_cell_exit(struct cell *cell)
>  {
> -	const u8 *root_pio_bitmap =
> -		jailhouse_cell_pio_bitmap(root_cell.config);
> -	const u8 *pio_bitmap = jailhouse_cell_pio_bitmap(cell->config);
> -	u32 pio_bitmap_size = cell->config->pio_bitmap_size;
> +	const struct jailhouse_pio_whitelist *cell_wl, *root_wl;
> +	struct jailhouse_pio_whitelist refund;
>  	struct vcpu_io_bitmap root_cell_iobm;
> -	u8 *b;
> +	unsigned int interval_start, interval_end;
> +	unsigned int i, j;

"i" suggests signed integer. We usually use "n" for unsigned int counter. j may
be m or, if that's too close, k.

Also, the unsigned int vars can go into a single line.

>  
>  	vcpu_get_cell_io_bitmap(&root_cell, &root_cell_iobm);
>  
> -	if (root_cell.config->pio_bitmap_size < pio_bitmap_size)
> -		pio_bitmap_size = root_cell.config->pio_bitmap_size;
> -
> -	for (b = root_cell_iobm.data; pio_bitmap_size > 0;
> -	     b++, pio_bitmap++, root_pio_bitmap++, pio_bitmap_size--)
> -		*b &= *pio_bitmap | *root_pio_bitmap;
> +	/* Hand back ports to the root cell. But only hand back those ports
> +	 * that overlap with the root cell's config. This is done by pairwise
> +	 * comparison of the cell's and the root cell's whitelist entries. */
> +	for_each_pio_whitelist(cell_wl, cell->config, i)
> +		for_each_pio_whitelist(root_wl, root_cell.config, j) {
> +			interval_start = MAX(cell_wl->base, root_wl->base);
> +			interval_end = MIN(cell_wl->base + cell_wl->length,
> +					   root_wl->base + root_wl->length);
> +			if (interval_start < interval_end) {
> +				refund.base = interval_start;
> +				refund.length = interval_end - interval_start;
> +				pio_allow_access(&root_cell_iobm, &refund,
> +						 true);
> +			}
> +		}
>  
>  	page_free(&mem_pool, cell->arch.io_bitmap,
>  		  vcpu_vendor_get_io_bitmap_pages());
> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
> index a57fb9ef..b20a2b09 100644
> --- a/include/jailhouse/cell-config.h
> +++ b/include/jailhouse/cell-config.h
> @@ -50,7 +50,7 @@
>   * Incremented on any layout or semantic change of system or cell config.
>   * Also update HEADER_REVISION in tools.
>   */
> -#define JAILHOUSE_CONFIG_REVISION	10
> +#define JAILHOUSE_CONFIG_REVISION	11
>  
>  #define JAILHOUSE_CELL_NAME_MAXLEN	31
>  
> @@ -92,7 +92,7 @@ struct jailhouse_cell_desc {
>  	__u32 num_memory_regions;
>  	__u32 num_cache_regions;
>  	__u32 num_irqchips;
> -	__u32 pio_bitmap_size;
> +	__u32 num_pio_whitelists;

Naming again: we should talk about "pio_regions" here, analogously to the other
regions.

>  	__u32 num_pci_devices;
>  	__u32 num_pci_caps;
>  
> @@ -277,7 +277,7 @@ jailhouse_cell_config_size(struct jailhouse_cell_desc *cell)
>  		cell->num_memory_regions * sizeof(struct jailhouse_memory) +
>  		cell->num_cache_regions * sizeof(struct jailhouse_cache) +
>  		cell->num_irqchips * sizeof(struct jailhouse_irqchip) +
> -		cell->pio_bitmap_size +
> +		cell->num_pio_whitelists * sizeof(struct jailhouse_pio_whitelist) +
>  		cell->num_pci_devices * sizeof(struct jailhouse_pci_device) +
>  		cell->num_pci_caps * sizeof(struct jailhouse_pci_capability);
>  }
> @@ -319,10 +319,11 @@ jailhouse_cell_irqchips(const struct jailhouse_cell_desc *cell)
>  		 cell->num_cache_regions * sizeof(struct jailhouse_cache));
>  }
>  
> -static inline const __u8 *
> -jailhouse_cell_pio_bitmap(const struct jailhouse_cell_desc *cell)
> +static inline const struct jailhouse_pio_whitelist *
> +jailhouse_cell_pio_whitelist(const struct jailhouse_cell_desc *cell)
>  {
> -	return (const __u8 *)((void *)jailhouse_cell_irqchips(cell) +
> +	return (const struct jailhouse_pio_whitelist *)
> +		((void *)jailhouse_cell_irqchips(cell) +
>  		cell->num_irqchips * sizeof(struct jailhouse_irqchip));
>  }
>  
> @@ -330,8 +331,8 @@ static inline const struct jailhouse_pci_device *
>  jailhouse_cell_pci_devices(const struct jailhouse_cell_desc *cell)
>  {
>  	return (const struct jailhouse_pci_device *)
> -		((void *)jailhouse_cell_pio_bitmap(cell) +
> -		 cell->pio_bitmap_size);
> +		((void *)jailhouse_cell_pio_whitelist(cell) +
> +		 cell->num_pio_whitelists * sizeof(struct jailhouse_pio_whitelist));
>  }
>  
>  static inline const struct jailhouse_pci_capability *
> diff --git a/tools/jailhouse-hardware-check b/tools/jailhouse-hardware-check
> index b86756ac..afd1139b 100755
> --- a/tools/jailhouse-hardware-check
> +++ b/tools/jailhouse-hardware-check
> @@ -136,7 +136,7 @@ class Sysconfig:
>      X86_MAX_IOMMU_UNITS = 8
>      X86_IOMMU_SIZE = 20
>  
> -    HEADER_REVISION = 10
> +    HEADER_REVISION = 11
>      HEADER_FORMAT = '6sH'
>  
>      def __init__(self, path):
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e049667a-6d1e-cd7b-783b-0739191e227c%40siemens.com.
