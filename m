Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYOE4D6AKGQESC6CJ4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6627929AD7D
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 14:36:34 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id x16sf762210wrg.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 06:36:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603805794; cv=pass;
        d=google.com; s=arc-20160816;
        b=ysA01EGW2TuxJg3TvTRobW7BOYaGmka5SeNIAOD0LB4+4c4QS/BeVQ6rUf51AKgKY4
         7jsEivZu6uI3htr9OTJT8/5HvDJeSMeQ/kiU/OVqXfQGky2VpKDS54fNivbgREBaAdvW
         jGnpyYj6DWXD+mHXVjpKSRajq1y+XMLKP8jO7H8jE1ewTvVPdw7+1HJ/ACMJ03WAGrh3
         pnC7RqbO2UlCD5sCEHjsrLVe+tnih36+t5/IDqAQiFNvEbMoK1eJ6ByWQMEpS/U/F3Bw
         U26QpPHLG5SB6ld+WsoYjcGX2acnHuhEljGIbqRT1N0t0WooFNPtcxI8g5C7dnZTQrJQ
         VHnA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=Qhsh0v5o2dJjoKR6lkzat9ulrx82GYfWg/fmNkz/1P4=;
        b=tadcbRnU/z/lLAwNcd7yImDcelGVq55TTxxrGlxvqyTSZgzYQUEQxpUWpHIlpfFgqg
         EJ9JHVc6CEpLtBYx9zIGZ77NhoDlGZJGXxoqRQyPpFFEWbpmaj5AceRmfBKgSeJlRFL1
         Y5OT25+5Qt58XKZG8/nvjQ9itV1zZWw8GDQX2yWDMgI7YGDsDD5Kt+PI3FErJMzD7cT8
         zZ6RoZ0wDp1UVqMR1HAnZBtLqEEbSFLcO+ONIYlmO0j2CZLpsknpbvRniHdui89cTfx8
         roaGmiaW0gukqTJJP5KwPVCdZm4SsFeT5sO5cEvFmNt+J2zwDV7BRBtouguwBaPAZHs3
         PZ8g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Qhsh0v5o2dJjoKR6lkzat9ulrx82GYfWg/fmNkz/1P4=;
        b=qdgISZWxLoQ8LfLKRM4Lz68+sMtMuAeAIB4AmC5hGM+MT3Dt5mrotHKIJ7sDkrq96Y
         x4FQpcoOagywxbXS8kplBIINm4UYFtVIsuKqEs6D/fQKzPJw0mBGQrFPRLoNS0F2oZgc
         h5AWHv0uLL4dRuEYg4bHeIyE4wXCWpi1MAO1NaxuU77hLfEWxOlrjRGn+mAQLiM1zba+
         YL7QyyY2rZLKZPq5Q1PeA6Id8o9EotsmbxrflU2uC/AXJdkvnBbrgiE7ammLVWrUF6VY
         or5NSyIRIMNOYUyOf940SVdFoPqKQ6VDAnnNPDD6fc166cegGMPI1J+E82/wtIuvap7f
         ojhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Qhsh0v5o2dJjoKR6lkzat9ulrx82GYfWg/fmNkz/1P4=;
        b=aPLuSoOhScxdo8SkgHbsVdOGxP1+hch96n/s2NtcHk5xL0XyWJ3cXq8VU58pYIYOyW
         8HBght8T0CMda5fZwb35h0ZwQTkCH/6n98eLGr9cWqyYrnGqsIyfBuMhC5hbh/+abPCW
         LJkkh63vZdt2srivIi9KvfWBixp2WovUNcUeSjEjA6aIbZGWnmogmKbsD2HzeCVZ6fa0
         wJi22hljZ0AcS+4kUUhnFl9BvuAVDwjjEZT+VxOBV8w8FeAWFOcB4N7WJmEaQYvfDPmf
         kSGpJuwuZTrwPVBgcNG/veJC/aD+G6Jv2+mEOokODhujmlAoNVV5ZKpA1oDcI3TqJa/M
         hqKg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533YtfpyQmo2B0tiaJEkl1TxbKhM/6LC7eiy3mT/XpUl6VEmYQ3o
	61bdrb7JwajNL1OgnSSibFk=
X-Google-Smtp-Source: ABdhPJwIINdDHKJaY2vXHWSz2j3XKRKKo4OvRAj/lFDLhShvxs+YiR65YGaW0jZxpmqudKoluZQ2Ig==
X-Received: by 2002:adf:f3c7:: with SMTP id g7mr3191667wrp.394.1603805794097;
        Tue, 27 Oct 2020 06:36:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4ac3:: with SMTP id y3ls2323186wrs.2.gmail; Tue, 27 Oct
 2020 06:36:33 -0700 (PDT)
X-Received: by 2002:adf:f210:: with SMTP id p16mr3151865wro.40.1603805793097;
        Tue, 27 Oct 2020 06:36:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603805793; cv=none;
        d=google.com; s=arc-20160816;
        b=Rck3vXZ8M+Lmmp7svTsb19YW7WhgYgFJgHlq4/MBBK0oxHm/FYJRzUYKFCnqI5eD6M
         iXtU3YBq8xvSBXUq06lGzWPz1rLFV1xPyyT1zC/3NbxSh/7gWJMpCYTrH76iqy0/Q0P/
         J8meEM4MOLGIUa26fSKPGLAmLDTc/UkzGQJdcua15bE9AWO2BFl5Qt8ZQA/282OfovSl
         JMiEG66095qbOa1mML8GOzWSrF4A6qYJHCQ7B3YzWp1qBOoAWJf+zLx4j1gMZebvIqNH
         P9KtF5etAvpg5VSUx3/g3IvvA4kH3qBIX5q5lSuTkA1vEMXRz1cOa9R1Oydloj0lI5dQ
         iosA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=ym2bOKkryEhEOnfo57/85vk9Vh9StIi0RmKqcrSt0Lk=;
        b=Pnqbw5D8GVDSLzAQHoF9E/T1eNuLl5zwdMWHxt9u6aLsc0aBObt6BV3caaNBzOQTul
         SfaT6Y92ozAY2Tg4NLQp1L7rYzIsay2sEOyOz26yGw0egdTWkzEyRiaKNDV1Glzabi5c
         hBFHOL43TcxV1HaBOgifyToi4rWmO8Wxijvm1+pUqzA4lhNPf1/4wHwH/mf2PSQ1mdPn
         an6i3TxdanuwKWQpYYvo0Jv2cIBc0SG1v9u9j8JxRNkh5aI7yIxwBBrK5u8XftC3iFIe
         ySipifh4QJ6IdN7je+88bA4FVAFE1h6E+gjTxgPMwq/aKpYR90xr1HghCQd6T072/UQC
         zIew==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id w6si72515wmk.2.2020.10.27.06.36.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 06:36:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 09RDaWfd030008
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Oct 2020 14:36:32 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09RDaWJv025362;
	Tue, 27 Oct 2020 14:36:32 +0100
Subject: Re: [PATCH v2 28/33] hypervisor: -Wunused-parameter: keep compiler
 happy
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
 <20201022175826.199614-29-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <86268abe-a991-5720-2f3c-a5b883255ea7@siemens.com>
Date: Tue, 27 Oct 2020 14:36:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201022175826.199614-29-andrea.bastoni@tum.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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
> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
> ---
>  hypervisor/control.c                | 2 ++
>  hypervisor/include/jailhouse/unit.h | 2 +-
>  hypervisor/paging.c                 | 4 ++++
>  hypervisor/pci.c                    | 6 ++++++
>  hypervisor/printk.c                 | 2 +-
>  5 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/hypervisor/control.c b/hypervisor/control.c
> index 0078ef19..81b7614f 100644
> --- a/hypervisor/control.c
> +++ b/hypervisor/control.c
> @@ -884,6 +884,8 @@ static int hypervisor_disable(struct per_cpu *cpu_data)
>  
>  static long hypervisor_get_info(struct per_cpu *cpu_data, unsigned long type)
>  {
> +	(void)cpu_data;
> +
>  	switch (type) {
>  	case JAILHOUSE_INFO_MEM_POOL_SIZE:
>  		return mem_pool.pages;
> diff --git a/hypervisor/include/jailhouse/unit.h b/hypervisor/include/jailhouse/unit.h
> index 40e1cbfe..39dfc056 100644
> --- a/hypervisor/include/jailhouse/unit.h
> +++ b/hypervisor/include/jailhouse/unit.h
> @@ -38,7 +38,7 @@ struct unit {
>  	static void __name##_shutdown(void) { }
>  
>  #define DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB(__name)			\
> -	static unsigned int __name##_mmio_count_regions(struct cell *cell) \
> +	static unsigned int __name##_mmio_count_regions(struct cell *cell __attribute__((unused))) \

Overlong.

>  	{ return 0; }
>  
>  extern struct unit __unit_array_start[0], __unit_array_end[0];
> diff --git a/hypervisor/paging.c b/hypervisor/paging.c
> index 75d5da59..0573cfd2 100644
> --- a/hypervisor/paging.c
> +++ b/hypervisor/paging.c
> @@ -55,6 +55,8 @@ struct paging_structures parking_pt;
>   */
>  unsigned long paging_get_phys_invalid(pt_entry_t pte, unsigned long virt)
>  {
> +	(void)pte;
> +	(void)virt;
>  	return INVALID_PHYS_ADDR;
>  }
>  
> @@ -507,6 +509,8 @@ void *paging_map_device(unsigned long phys, unsigned long size)
>   */
>  void paging_unmap_device(unsigned long phys, void *virt, unsigned long size)
>  {
> +	(void)phys;
> +
>  	/* Cannot fail if paired with paging_map_device. */
>  	paging_destroy(&hv_paging_structs, (unsigned long)virt, size,
>  		       PAGING_NON_COHERENT);
> diff --git a/hypervisor/pci.c b/hypervisor/pci.c
> index fe85ae2f..79b6f920 100644
> --- a/hypervisor/pci.c
> +++ b/hypervisor/pci.c
> @@ -205,6 +205,8 @@ pci_find_capability(struct pci_device *device, u16 address)
>  enum pci_access pci_cfg_read_moderate(struct pci_device *device, u16 address,
>  				      unsigned int size, u32 *value)
>  {
> +	(void)size;
> +
>  	const struct jailhouse_pci_capability *cap;
>  	unsigned int bar_no, cap_offs;
>  
> @@ -253,6 +255,8 @@ enum pci_access pci_cfg_read_moderate(struct pci_device *device, u16 address,
>  static int pci_update_msix(struct pci_device *device,
>  			   const struct jailhouse_pci_capability *cap)
>  {
> +	(void)cap;
> +
>  	unsigned int n;
>  	int result;
>  
> @@ -404,6 +408,8 @@ invalid_access:
>  static enum mmio_result pci_mmconfig_access_handler(void *arg,
>  						    struct mmio_access *mmio)
>  {
> +	(void)arg;
> +
>  	u32 reg_addr = mmio->address & 0xfff;
>  	u16 bdf = mmio->address >> 12;
>  	struct pci_device *device;
> diff --git a/hypervisor/printk.c b/hypervisor/printk.c
> index a32ff8c4..6f149f0f 100644
> --- a/hypervisor/printk.c
> +++ b/hypervisor/printk.c
> @@ -46,7 +46,7 @@ static void console_write(const char *msg)
>  	console.busy = false;
>  }
>  
> -static void dbg_write_stub(const char *msg)
> +static void dbg_write_stub(const char *msg __attribute__((unused)))
>  {
>  }
>  
> 

First, the "solution" looks a bit inconsistent (unused vs. (void)arg).
Second, I'm not yet sure there is a lot of value in this. Can you come
up with relevant issues that this can reveal?

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/86268abe-a991-5720-2f3c-a5b883255ea7%40siemens.com.
