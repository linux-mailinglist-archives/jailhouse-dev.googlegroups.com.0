Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBS5A476AKGQEGMNCHFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 9068029D203
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 21:10:52 +0100 (CET)
Received: by mail-wm1-x339.google.com with SMTP id 22sf247836wmo.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 13:10:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603915852; cv=pass;
        d=google.com; s=arc-20160816;
        b=IH2TijQJySF7CZNLqJwt9Zp6jMYvA6l0SSw9dxLQkvgBQbUWK6b+PdSiA7LRzFSTOR
         jGPaBzlzu2ExWjKsFLCYkT8AJALBbMGowYin7sgb5IfUJQWTApBUKtCtGRD6tQBjzG9Q
         63wudt5sSDd6S3b+fjbs3hh7sUvuEHEz/+SpK9fVErlJLXxCfpWHPA3wBPXj36nR80NT
         r7DJk7s97MUe501qWd3fNn0TzdcapkO6tuHwJxmiuxeQXsYfw8ec/KWbJmFc6Wj+KitP
         Z+hGUDS8oE2OPK2pmifVJs59HUxrn5gHksiez7l6h/SfybZKS9XKdUoAuyGBxChPdNeZ
         pjrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=GzNMKL1NGnX700pTACuxI8gJXphH5HdaFF1/3huQS9I=;
        b=u/yfMDO7Ez6IW+rM2xUsh0ZI1olx2JjKS86hYZWOdG5jjzEOqk2dKIAaOS82X7V6eD
         VtfdUxLM1gD3qytX6VpHzDkcEkm2olRZHK1pWPpmNC2qePMBFv4Vf6FCw9dHI9PWpJhY
         XFimER1OLev87Y9RsxoFDt1/P1pF4hqdsmrW8FVODtSitheE0Fj3W8duWK0CM31M70i9
         lxSYw/lHQLaJ7AGEgJgxT5KxN2NiXEnoS3GwsYabgaCDDqv7xoLHR8EP245v+ZSlJwi0
         pJ4J+PXj74Ma1EdeWrgP/omIc5eN3Uf8R+V3ngI9ny+sjlxr8Kwy+fWO728ggS/4IhVB
         finw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GzNMKL1NGnX700pTACuxI8gJXphH5HdaFF1/3huQS9I=;
        b=SgXMCsxGv0+d11TIAieTTLGbGICO/AgFgr4kaTd2O1rj7mXULZT18ah7ZR3CjirTMQ
         JmvDopO611o/Ib0fP/5vzgaELvyg0wapkOcbfpncjTOC3gWiEkPiSwXLkduRcSJVp3Cy
         WR5vn97yDuvrsv1Cn8YfxpOYa3cjt9Wsif5kcOPXwWIHsULyHMEURUc4Pb9TtYP79VQN
         1ECdL/4lx7Ra+hp8vChGr2iFrUi8rmVtiTaC4mr0qxq/i17bv1jNOeH4pOo3wZ43Y/wS
         wQUVgv6OQfl9mYMWpRgrfJejGKWcpk/oUSL8V8+e5E6wfUVouQ6zvsyptr66nTxe8OwA
         ykUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=GzNMKL1NGnX700pTACuxI8gJXphH5HdaFF1/3huQS9I=;
        b=IgkVjRUCaoWfkaXdV8ZoZgwDMBo1zDLtrdFLlivw/bDtNIw25KP9QQT+DDn4W5Qc7n
         a4iHYtVkRL141cVBX/IVqJrL1HG5RWKETTNfv/Gx7laO/eOY8acrLNRpTaRGztE7nr1b
         ocJfdaPwh7pyVAl2k3DdFYf3PedTLpxW6B3yOEVnHwOOt3PoQb6q5s1s8GZ7ldko1jFD
         1gZ3yjoL33GFq4Nxc6C7GDif3l2qhPjSY7VNpKsbuEbXct8wHJGwCL5nk3VcH7jF8ZEl
         4sdzPtiG38Cjeyf0uN7W8EVJ4qaoM2SGAAqh5b/cD8EzXkaIYsCzMnZCa+BY1Avf8glC
         udHg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533+up//RUOclCbQ731elGSMqkVLk+stcPPPG3BMyd1VGRFHgByU
	tKkic48TZ45Tn45iIFYNyn4=
X-Google-Smtp-Source: ABdhPJx2+anuynjIssXTBXy8R1mrP6jdwCU/2DX9Z6gEgJABfSz5HiLxmGSDuZA9/8RMPoDdheSK+Q==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr560543wmc.5.1603915852267;
        Wed, 28 Oct 2020 13:10:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:c794:: with SMTP id l20ls10287wrg.2.gmail; Wed, 28 Oct
 2020 13:10:51 -0700 (PDT)
X-Received: by 2002:a5d:6143:: with SMTP id y3mr1194031wrt.277.1603915851113;
        Wed, 28 Oct 2020 13:10:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603915851; cv=none;
        d=google.com; s=arc-20160816;
        b=fhvJlthAUkO52kyO/lynh4xs9Ub2ZBSckUr7NJ+pDOumgS9M+ko3Z6Dqx14bpJmluv
         6leDvw2YcBwevtV0kecxYJk+Gq8Rt83FHQJ4aZ1SJTo/SZr7bhSGwktHiVtP0I5bol5u
         lBwTqBtF2TrxIW2X9fw40FDfui6CA8CPUDYh/kWL69tMMDx0/vugoQiHbPYRHLfg2ien
         xQ5Kq9+9h9tRv3aNNWbdMgfSo8GgF4F83/acUzeOUxkvUrI7u3slW3lAjL1bixZxXJvM
         WGBKHAz9ZsD8siI6yTQ9MibvHI4tA6YFWZH8ExSrp+M0yBRwPBYhDv1ysJJJCEi1n0cu
         uVsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=zT3Ti+218CEN0YfRB1BLg3GEDBOcRvu2eMJP9pW5GXU=;
        b=z5MxT8ICaaCa+BE2Kl64Hn5SAc0pBkRZhePfzYlbzI+2u2wLTU8TSfMiKR+mythWPw
         V/uQkyVOEJ8IZMxvxA27mYX59Gt7F7aeUo23f1rmH2DXkLD/iHi/rhMQ6dkFqc6oiex9
         6Kvrqfhp3sSBW19E56WSSLN+6Wy+c5Z7xatNoUkwdXP7o07/wfIznA94b0xnz4c/wePY
         VGuyLIqP/LokYoQABnHwW/m4f11On+a/YmoxWLXYaI/gi56iass/Twx+Hn9YHnFKmJsB
         MlcR0/WL1R5Qeqk0duDbOdGEYQKV40YWhsr9rxW1yQ7tjuqyGZ9gAkvoUTeroLfXJMvJ
         8N2w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id e5si17996wrj.3.2020.10.28.13.10.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2020 13:10:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09SKAoNM008020
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Oct 2020 21:10:50 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09SKAoU6006809;
	Wed, 28 Oct 2020 21:10:50 +0100
Subject: Re: [PATCH v2 28/33] hypervisor: -Wunused-parameter: keep compiler
 happy
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
 <20201022175826.199614-29-andrea.bastoni@tum.de>
 <86268abe-a991-5720-2f3c-a5b883255ea7@siemens.com>
 <ad59f8d5-cafa-4aff-bb9b-4a7c3a906378@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <133be7d2-65d5-d90c-a4c0-418c31760c52@siemens.com>
Date: Wed, 28 Oct 2020 21:10:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ad59f8d5-cafa-4aff-bb9b-4a7c3a906378@tum.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 27.10.20 20:09, Andrea Bastoni wrote:
> On 27/10/2020 14:36, Jan Kiszka wrote:
>> On 22.10.20 19:58, Andrea Bastoni wrote:
>>> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
>>> ---
>>>  hypervisor/control.c                | 2 ++
>>>  hypervisor/include/jailhouse/unit.h | 2 +-
>>>  hypervisor/paging.c                 | 4 ++++
>>>  hypervisor/pci.c                    | 6 ++++++
>>>  hypervisor/printk.c                 | 2 +-
>>>  5 files changed, 14 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hypervisor/control.c b/hypervisor/control.c
>>> index 0078ef19..81b7614f 100644
>>> --- a/hypervisor/control.c
>>> +++ b/hypervisor/control.c
>>> @@ -884,6 +884,8 @@ static int hypervisor_disable(struct per_cpu *cpu_data)
>>>  
>>>  static long hypervisor_get_info(struct per_cpu *cpu_data, unsigned long type)
>>>  {
>>> +	(void)cpu_data;
>>> +
>>>  	switch (type) {
>>>  	case JAILHOUSE_INFO_MEM_POOL_SIZE:
>>>  		return mem_pool.pages;
>>> diff --git a/hypervisor/include/jailhouse/unit.h b/hypervisor/include/jailhouse/unit.h
>>> index 40e1cbfe..39dfc056 100644
>>> --- a/hypervisor/include/jailhouse/unit.h
>>> +++ b/hypervisor/include/jailhouse/unit.h
>>> @@ -38,7 +38,7 @@ struct unit {
>>>  	static void __name##_shutdown(void) { }
>>>  
>>>  #define DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB(__name)			\
>>> -	static unsigned int __name##_mmio_count_regions(struct cell *cell) \
>>> +	static unsigned int __name##_mmio_count_regions(struct cell *cell __attribute__((unused))) \
>>
>> Overlong.
>>
>>>  	{ return 0; }
>>>  
>>>  extern struct unit __unit_array_start[0], __unit_array_end[0];
>>> diff --git a/hypervisor/paging.c b/hypervisor/paging.c
>>> index 75d5da59..0573cfd2 100644
>>> --- a/hypervisor/paging.c
>>> +++ b/hypervisor/paging.c
>>> @@ -55,6 +55,8 @@ struct paging_structures parking_pt;
>>>   */
>>>  unsigned long paging_get_phys_invalid(pt_entry_t pte, unsigned long virt)
>>>  {
>>> +	(void)pte;
>>> +	(void)virt;
>>>  	return INVALID_PHYS_ADDR;
>>>  }
>>>  
>>> @@ -507,6 +509,8 @@ void *paging_map_device(unsigned long phys, unsigned long size)
>>>   */
>>>  void paging_unmap_device(unsigned long phys, void *virt, unsigned long size)
>>>  {
>>> +	(void)phys;
>>> +
>>>  	/* Cannot fail if paired with paging_map_device. */
>>>  	paging_destroy(&hv_paging_structs, (unsigned long)virt, size,
>>>  		       PAGING_NON_COHERENT);
>>> diff --git a/hypervisor/pci.c b/hypervisor/pci.c
>>> index fe85ae2f..79b6f920 100644
>>> --- a/hypervisor/pci.c
>>> +++ b/hypervisor/pci.c
>>> @@ -205,6 +205,8 @@ pci_find_capability(struct pci_device *device, u16 address)
>>>  enum pci_access pci_cfg_read_moderate(struct pci_device *device, u16 address,
>>>  				      unsigned int size, u32 *value)
>>>  {
>>> +	(void)size;
>>> +
>>>  	const struct jailhouse_pci_capability *cap;
>>>  	unsigned int bar_no, cap_offs;
>>>  
>>> @@ -253,6 +255,8 @@ enum pci_access pci_cfg_read_moderate(struct pci_device *device, u16 address,
>>>  static int pci_update_msix(struct pci_device *device,
>>>  			   const struct jailhouse_pci_capability *cap)
>>>  {
>>> +	(void)cap;
>>> +
>>>  	unsigned int n;
>>>  	int result;
>>>  
>>> @@ -404,6 +408,8 @@ invalid_access:
>>>  static enum mmio_result pci_mmconfig_access_handler(void *arg,
>>>  						    struct mmio_access *mmio)
>>>  {
>>> +	(void)arg;
>>> +
>>>  	u32 reg_addr = mmio->address & 0xfff;
>>>  	u16 bdf = mmio->address >> 12;
>>>  	struct pci_device *device;
>>> diff --git a/hypervisor/printk.c b/hypervisor/printk.c
>>> index a32ff8c4..6f149f0f 100644
>>> --- a/hypervisor/printk.c
>>> +++ b/hypervisor/printk.c
>>> @@ -46,7 +46,7 @@ static void console_write(const char *msg)
>>>  	console.busy = false;
>>>  }
>>>  
>>> -static void dbg_write_stub(const char *msg)
>>> +static void dbg_write_stub(const char *msg __attribute__((unused)))
>>>  {
>>>  }
>>>  
>>>
>>
>> First, the "solution" looks a bit inconsistent (unused vs. (void)arg).
>> Second, I'm not yet sure there is a lot of value in this. Can you come
>> up with relevant issues that this can reveal?
> 
> I've thought as well if adding Wno-unused-parameter would be better here.
> 
> During development it can help refactoring and to avoid leaving unneeded
> functions around.

How does that help with unneeded functions?

> 
> It probably helps the compiler to avoid spilling for extern functions, but I
> have not checked.
> 
> Since it's included in Wextra I simply didn't want to suppress it by default.
> 

The kernel does that as well, so it seems a reasonable choice.
Specifically when you have implementations of the same interface by
different archs or units, there can easily be valid cases of unused
parameters. Annotating them all will become very verbose with no clear
value IMHO.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/133be7d2-65d5-d90c-a4c0-418c31760c52%40siemens.com.
