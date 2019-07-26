Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBI7H5TUQKGQE2DI4ZDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 4876376F80
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 19:08:52 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id z20sf34510066edr.15
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 10:08:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564160932; cv=pass;
        d=google.com; s=arc-20160816;
        b=Iqh9Hm2g90VG4tmiY1R8s4p6uBfgE5bqcxSHwrByk4up1q5gI0PiZaDZduqFNgieYB
         eHtp3HUDuKmNPSFFeDDFOLkgIenhnIjwBDtkBQfh86o/7e7ieRwoz4K0qxpSFAPvYytL
         sKFb50Xz2YpeK5lyKRLp89fbIOI178srMQW3jiq1o4phnjBgcO24sVaPyBnD1z3gd3nc
         yjuzxkiSB9k0JuncijqELAnn/vMZLok94EuhaoWeKD2PrE5bMjKiJOlJGhUSbRXqBi1r
         mUjYffi2Udw8zRtwkejMBAoL13X2DPhHkeBiYh1hu0/lrbozc4wlkY87yEx8ozg7mj61
         RIKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=u6rFchyEyCnyzCAMhN2cItmRZEyjPWqTbRCEbe1yK/Q=;
        b=J0wpckfxFJoP7+FP5RBVbURx12II0+DlpHPXSEGWJ61BPQOwDUHhHmQcgtuZVlfGH4
         NaVUmmuodDcvfFkEAQDPL2XecESy0mhidkc6prybQ3jcbR/EbtR3zO0kRavHwD4DrI4n
         w92U1qOeCu+B0px0aCveCgfdywLz8NiW8v3sfRBFaI6byWXJaapgSeqF9Gq9UJPLZ1Yw
         YTSDQH4JcRO6nI6rXOn7wHvubW1+nL/94FuZghUA4HzVEn8WO3V3Z+qvNYMlWCiU0hLu
         M3bSChYAhmLqD9jzVbtsYPRJtVU2zPb/twlbNpfheJnPeCaWgx8EP8XDx1J7lakmGTdH
         hikw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=u6rFchyEyCnyzCAMhN2cItmRZEyjPWqTbRCEbe1yK/Q=;
        b=E87meqBsoaolvFekVBwlOUhxI17KclA9zq1+xgfI0F1fGNu+MaWIn9UQlDGFBk+HXu
         +skPDK2WcGBwxt3dUnmW2wkeAybNJ9z/Fv6s1MEcsNTNDVglDrgeXwdvHHqqqhGc1qzE
         DShPxPshrBEaoQMI5GL3CoSssyTiJefU/T4NrSbmpOXKs8q+C913mGDYqXJttnYShnlr
         phYUYXo8QHeeb4jCU8zIbqu15ebD0ZhcRlkgw+wEN+O8FH8470azRkC/LIcU0lN42nTN
         D8VaeKPCxvyyNxXS/rIV9GRsb0C/wwxOqmqtOt9vAXnSkP1c8albnYho6JFfmz+yjVgJ
         E3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=u6rFchyEyCnyzCAMhN2cItmRZEyjPWqTbRCEbe1yK/Q=;
        b=YgcrQ7ULSnUMk05bZOYuehccXyswLt6kSFLmyO8TUp0IqIlR2Fztg0ogfkLva8bycN
         WugqAkAucll3nsB2Y9JmIm0GExMGJY/y7fsm4CPeQp/gj/B6kWvD+eSYP+cPZgbWYPQl
         O828j3Gdp3fZpk17KbozBdDcdr8WkKhQILRBxpwme47fFA1AUqYGcoIP1/HUtl9f/Hx6
         9iceq8uhUGiSdrQtD8daMSF9vcGeLSWQTemz8z/9wUaq5mpRhYB6iNgTYaqW4Q7wELSu
         jcZkJ5Gk2t0BC0xIusprvV+rbvUIdElvLqkfO2KCnnm1t9J3knJfvB1P7wZf4ZS5s+L7
         pZZw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVBxU2B3dWCzaC4D2PLLY2d+RTglDUioI8sraeRwwJg2rLLPD4b
	5VyLUsx+oPXbh8VcXDBSqeA=
X-Google-Smtp-Source: APXvYqxtzMRVoLphaQfzlY/TLFW2GRzUZn/p+UaElz+dqfbRc2M2KbMrLkylYg5AjVhGxNUwdYC0eQ==
X-Received: by 2002:a17:906:d154:: with SMTP id br20mr71556307ejb.76.1564160932000;
        Fri, 26 Jul 2019 10:08:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:8efb:: with SMTP id x56ls12736961edx.9.gmail; Fri, 26
 Jul 2019 10:08:49 -0700 (PDT)
X-Received: by 2002:a50:eb8f:: with SMTP id y15mr83933375edr.31.1564160929893;
        Fri, 26 Jul 2019 10:08:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564160929; cv=none;
        d=google.com; s=arc-20160816;
        b=0KuBD86AVqgZewAgZotk2CfFShZMmmmsBq4BF+Tn0KfPdt4dFn3qCU3icyjxDzYOrO
         KEjXLI+aePWNI2oy4eTWOlp1NDhAjUUQAk6OmL92HjU89MzYDmiELdBgjzr2L9vIKC58
         fexNDmiir+pAmYHaB0mO9gtZZn9hdLM/LkeunRulxQ/OqPBAjn4VUwMO8zgJt05lQNwo
         1+QHbHzk+O/jcdMtQT8VrI+bJG9+rkkigUZiFLxTYAaY8GFsKrTLL5PA/okzz9JsKn3k
         lMB6rtYlQJbNIWW/lhURLwID+T7qBhmgU9Vuu3a1a5M/6yQ1TGLmEwCybFZwdPvaHOiT
         lh4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=sc7i6NSJ72iBVlobeEKdFa/fbs1Mrqu4ybIZxxikMB4=;
        b=JnoB1yDHD9HbKR/a62CgYTaQuvjPtYmZqvbpA5RfDmn2e3HnSdXmiaG2i+TS7LXAv+
         PylRBGL1mFyVpky4AuophseGjb45UInVKbHME2vZYrp9wii8Ob7/0g5YhsGXbaWW1Twt
         +BgBTMnFvBhLA6AuSKF56aUhIpoQsYSGO577mSGlRoqwYOJkZmnLoaBev5149+LWXa38
         JlmZtSfJnafOBLHysC3e+9Pe6wBJOiDxar4BeDcSWbM1M+c5MC4aoPlSaaEu1eCip5JN
         Y8tb9L0PZUl3O2eP3if3PE/jMRWO8NElxD9+N4sTgBvTpfpSPcBpCOkwB1mDsYV0ZxnR
         M4mA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id t15si2549082ejq.1.2019.07.26.10.08.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 10:08:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x6QH8njV009636
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Jul 2019 19:08:49 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6QH8nQB031437;
	Fri, 26 Jul 2019 19:08:49 +0200
Subject: Re: [PATCH v3 4/5] x86: pio: use a whitelist instead of a permission
 bitmap
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190726135911.16810-1-ralf.ramsauer@oth-regensburg.de>
 <20190726135911.16810-5-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1a9ff13b-9198-c8ff-a042-f8a05cc01baf@siemens.com>
Date: Fri, 26 Jul 2019 19:08:48 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190726135911.16810-5-ralf.ramsauer@oth-regensburg.de>
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

On 26.07.19 15:59, Ralf Ramsauer wrote:
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
>  14 files changed, 149 insertions(+), 182 deletions(-)
> 

...

> diff --git a/hypervisor/arch/x86/vcpu.c b/hypervisor/arch/x86/vcpu.c
> index 2e3a1880..17a3a305 100644
> --- a/hypervisor/arch/x86/vcpu.c
> +++ b/hypervisor/arch/x86/vcpu.c
> @@ -26,6 +26,12 @@
>  #include <jailhouse/percpu.h>
>  #include <asm/vcpu.h>
>  
> +#define for_each_pio(pio, config, counter)		\
> +	for ((pio) = jailhouse_cell_pio(config),	\
> +	     (counter) = 0;				\
> +	     (counter) < (config)->num_pio_regions;		\

Renamed to for_each_pio_region on merge - and aligned the \.

> +	     (pio)++, (counter)++)
> +
>  static u8 __attribute__((aligned(PAGE_SIZE))) parking_code[PAGE_SIZE] = {
>  	0xfa, /* 1: cli */
>  	0xf4, /*    hlt */
> @@ -76,15 +82,23 @@ out_err:
>  	return NULL;
>  }
>  
> +static void pio_allow_access(u8 *bm, const struct jailhouse_pio *pio,
> +			     bool access)
> +{
> +	void (*access_method)(unsigned int, volatile unsigned long*) =
> +		access ? clear_bit : set_bit;
> +	unsigned int length, start_bit = pio->base;
> +
> +	for (length = pio->length; length > 0; length--, start_bit++)
> +		access_method(start_bit, (unsigned long*)bm);
> +}
> +
>  int vcpu_cell_init(struct cell *cell)
>  {
>  	const unsigned int io_bitmap_pages = vcpu_vendor_get_io_bitmap_pages();
> -	const u8 *pio_bitmap = jailhouse_cell_pio_bitmap(cell->config);
> -	u32 pio_bitmap_size = cell->config->pio_bitmap_size;
> +	const struct jailhouse_pio *pio;
>  	unsigned int n, pm_timer_addr;
> -	u32 size, iobm_size;
>  	int err;
> -	u8 *b;
>  
>  	cell->arch.io_bitmap = page_alloc(&mem_pool, io_bitmap_pages);
>  	if (!cell->arch.io_bitmap)
> @@ -97,30 +111,30 @@ int vcpu_cell_init(struct cell *cell)
>  	}
>  
>  	/* initialize io bitmap to trap all accesses */
> -	iobm_size = io_bitmap_pages * PAGE_SIZE;
> -	memset(cell->arch.io_bitmap, -1, iobm_size);
> +	memset(cell->arch.io_bitmap, -1, io_bitmap_pages * PAGE_SIZE);
>  
> -	/* copy io bitmap from cell config */
> -	size = pio_bitmap_size > iobm_size ?  iobm_size : pio_bitmap_size;
> -	memcpy(cell->arch.io_bitmap, pio_bitmap, size);
> +	/* cells have no access to i8042, unless the port is whitelisted */
> +	cell->arch.pio_i8042_allowed = false;
>  
> -	/* always intercept access to i8042 command register */
> -	cell->arch.io_bitmap[I8042_CMD_REG / 8] |= 1 << (I8042_CMD_REG % 8);
> +	for_each_pio(pio, cell->config, n) {
> +		pio_allow_access(cell->arch.io_bitmap, pio, true);
>  
> -	/* but moderate only if the config allows i8042 access */
> -	cell->arch.pio_i8042_allowed =
> -		pio_bitmap_size >= (I8042_CMD_REG + 7) / 8 ?
> -		!(pio_bitmap[I8042_CMD_REG / 8] & (1 << (I8042_CMD_REG % 8))) :
> -		false;
> +		/* moderate i8042 only if the config allows it */
> +		if (pio->base <= I8042_CMD_REG &&
> +		    pio->base + pio->length > I8042_CMD_REG)
> +			cell->arch.pio_i8042_allowed = true;
> +	}
> +
> +	/* but always intercept access to i8042 command register */
> +	cell->arch.io_bitmap[I8042_CMD_REG / 8] |= 1 << (I8042_CMD_REG % 8);
>  
>  	if (cell != &root_cell) {
>  		/*
>  		 * Shrink PIO access of root cell corresponding to new cell's
>  		 * access rights.
>  		 */
> -		for (b = root_cell.arch.io_bitmap; pio_bitmap_size > 0;
> -		     b++, pio_bitmap++, pio_bitmap_size--)
> -			*b |= ~*pio_bitmap;
> +		for_each_pio(pio, cell->config, n)
> +			pio_allow_access(root_cell.arch.io_bitmap, pio, false);
>  	}
>  
>  	/* permit access to the PM timer if there is any */
> @@ -135,18 +149,25 @@ int vcpu_cell_init(struct cell *cell)
>  
>  void vcpu_cell_exit(struct cell *cell)
>  {
> -	const u8 *root_pio_bitmap =
> -		jailhouse_cell_pio_bitmap(root_cell.config);
> -	const u8 *pio_bitmap = jailhouse_cell_pio_bitmap(cell->config);
> -	u32 pio_bitmap_size = cell->config->pio_bitmap_size;
> -	u8 *b;
> -
> -	if (root_cell.config->pio_bitmap_size < pio_bitmap_size)
> -		pio_bitmap_size = root_cell.config->pio_bitmap_size;
> -
> -	for (b = root_cell.arch.io_bitmap; pio_bitmap_size > 0;
> -	     b++, pio_bitmap++, root_pio_bitmap++, pio_bitmap_size--)
> -		*b &= *pio_bitmap | *root_pio_bitmap;
> +	const struct jailhouse_pio *cell_wl, *root_wl;
> +	unsigned int interval_start, interval_end, m, n;
> +	struct jailhouse_pio refund;
> +
> +	/* Hand back ports to the root cell. But only hand back those ports
> +	 * that overlap with the root cell's config. This is done by pairwise
> +	 * comparison of the cell's and the root cell's whitelist entries. */
> +	for_each_pio(cell_wl, cell->config, m)
> +		for_each_pio(root_wl, root_cell.config, n) {
> +			interval_start = MAX(cell_wl->base, root_wl->base);
> +			interval_end = MIN(cell_wl->base + cell_wl->length,
> +					   root_wl->base + root_wl->length);
> +			if (interval_start < interval_end) {
> +				refund.base = interval_start;
> +				refund.length = interval_end - interval_start;
> +				pio_allow_access(root_cell.arch.io_bitmap,
> +						 &refund, true);
> +			}
> +		}
>  
>  	page_free(&mem_pool, cell->arch.io_bitmap,
>  		  vcpu_vendor_get_io_bitmap_pages());
> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
> index a95db470..4b69654a 100644
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
> +	__u32 num_pio_regions;
>  	__u32 num_pci_devices;
>  	__u32 num_pci_caps;
>  
> @@ -277,7 +277,7 @@ jailhouse_cell_config_size(struct jailhouse_cell_desc *cell)
>  		cell->num_memory_regions * sizeof(struct jailhouse_memory) +
>  		cell->num_cache_regions * sizeof(struct jailhouse_cache) +
>  		cell->num_irqchips * sizeof(struct jailhouse_irqchip) +
> -		cell->pio_bitmap_size +
> +		cell->num_pio_regions * sizeof(struct jailhouse_pio) +
>  		cell->num_pci_devices * sizeof(struct jailhouse_pci_device) +
>  		cell->num_pci_caps * sizeof(struct jailhouse_pci_capability);
>  }
> @@ -319,10 +319,11 @@ jailhouse_cell_irqchips(const struct jailhouse_cell_desc *cell)
>  		 cell->num_cache_regions * sizeof(struct jailhouse_cache));
>  }
>  
> -static inline const __u8 *
> -jailhouse_cell_pio_bitmap(const struct jailhouse_cell_desc *cell)
> +static inline const struct jailhouse_pio *
> +jailhouse_cell_pio(const struct jailhouse_cell_desc *cell)
>  {
> -	return (const __u8 *)((void *)jailhouse_cell_irqchips(cell) +
> +	return (const struct jailhouse_pio *)
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
> +		((void *)jailhouse_cell_pio(cell) +
> +		 cell->num_pio_regions * sizeof(struct jailhouse_pio));
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1a9ff13b-9198-c8ff-a042-f8a05cc01baf%40siemens.com.
