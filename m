Return-Path: <jailhouse-dev+bncBCW2V5WNZMERB77A4H6AKGQEZNJBJZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63d.google.com (mail-ej1-x63d.google.com [IPv6:2a00:1450:4864:20::63d])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD2E29C860
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 20:09:52 +0100 (CET)
Received: by mail-ej1-x63d.google.com with SMTP id d13sf1272539ejz.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 12:09:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603825792; cv=pass;
        d=google.com; s=arc-20160816;
        b=r3/1SpWCwoksiEp+rGcGxI3kPHAwAua94OZgqQG136M1UxWcTB89O05ZuWHWgNi4mo
         j/M604VoJ/7rcNHYRqZAQkiSwAjpi1P0FiDCv4TGZNXm4W+8Sd0m43kPKxuAFGA5DfGV
         RbzlFK7CYtItS2iqBXDeBxeCz7vMqFuGKs7IOha2E5GkcuLtW6xnuQ0DSeD1E07qEy2n
         /2Y5J5b1SSeEiiaZAeJ4yXUG5fyQPYiPA7izb7K2pcKb2o4lERXG4k/NOY6HA1qxGiFs
         QQnB58sZ6dfRtNEMFicPJX436+42GMjL8WLQRpcq2oYsnCBHZxdHk7dQjsAPzdc2CIik
         s6Qg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=KD/trB+RzGLYys4qtX695YywEt9UymvGk5EhrayG61w=;
        b=0dHPKODNaRtXdN6UX186nC+Bm2EcyO6Cpv6nPCaarujF7WFz4SGWHefqR0ngzqad4B
         JybtnRzAIGSaYpEm2S00ERZqwhXsoUGukMHobuhdM0kiuhlHHc+yh8BSSBu8XNELXOrJ
         lB8fgxhK2K1ea16YmyZOUKhXepvjs/hPQfTco4pCIV7/0170KRhipGa9+u0J8BJuhlR+
         lN4oNZsj1QZr+tNHlaB3qwbBLsiTDCXaQxiREJlzChDricWHrMK+0jeUxlw3X0kNAZO/
         q7xP1FFBzLm3jYJ0E3TKKly8+YAcMLbGIOAl/8ntY7MUjdzykNUSpmw7f3AYGrnsfWeq
         iOsg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=I5yw6owM;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KD/trB+RzGLYys4qtX695YywEt9UymvGk5EhrayG61w=;
        b=kB+kmobLcyxdMv5bcfHKS/d/+4RVo3+ooe9A29rGcOEis10isN7etVIYkuXuDJ1rgq
         2CXi3Eo0GNLCrqiDVoMfraXswQ8YfIaC3I7A6Ig36mg3sJVPVf3mucLTmjCL23DcI57W
         Ya6H/NJ5ZsaWluXmGzV/S+WcA8SCgIWxhZsozx37TP8gBsnh/OGa8rGliXwO6+dEi8gi
         svscFwQYa+P7ygSz+gUeKbtMvKemZBabtg6WQUGXLz0wDSxWsUGVlCl25sdb69PUCVIk
         LncHRLsSyrs0pGoy5+xVk2ze7hqiM1e+YEX+rYthUy8Ujyeok5wiCdRQp+xHe/EV/JKt
         Iy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KD/trB+RzGLYys4qtX695YywEt9UymvGk5EhrayG61w=;
        b=Qb8lgaI1EYZGv1sVW1Zegc428yUtsPsKgZbhORnCZF/3Jj11H0u6WO6jaSdWx4O2pk
         hYSYQRu1SfI7sMSBrEFOrbTsZ5ZIY9xfxSttZhOvoR785X1yvficnYYwE524BbYSj+vd
         jpJOVV6DoXM+EfbrYx5u4eIco4Tc15IwMUKV5fYQT2Owf5/EfqnlZ4j4IJxjENt1zXyS
         IgXoaQuPwRzLZPAsg4FgcYSlJI9OcbaGjdTq+Ty7i+BlijIRgk+tPhokCTWfJpWxUo5g
         F4xCu4wFPx7WWk/h/wjCPY3GBZ0apMOyOa9ZNn5j4VzvQCyuf7VL7VCVLBwz7yQCYXKy
         En3A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531+teUgyZ3PcOwyj9luCX/5xIV0x6OG7FWF9L5khjKxUyC2qjzh
	h6Eoxni5MybIRnOnW1IqgwA=
X-Google-Smtp-Source: ABdhPJy8as6eG2Ah1Mot+lGzQMyK20+Ux/AfCUez4zbgeXyJt3eU7YkQ4DB1N/+Hownt3UBiJADGjw==
X-Received: by 2002:aa7:d6da:: with SMTP id x26mr3755048edr.238.1603825791874;
        Tue, 27 Oct 2020 12:09:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:3189:: with SMTP id 9ls1275020ejy.10.gmail; Tue, 27
 Oct 2020 12:09:50 -0700 (PDT)
X-Received: by 2002:a17:906:ca54:: with SMTP id jx20mr4097762ejb.541.1603825790800;
        Tue, 27 Oct 2020 12:09:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603825790; cv=none;
        d=google.com; s=arc-20160816;
        b=ERKqIwIoaXEGQoHMUUK/IPU//u4wl12uF0PjfX8gg4rYhoC3sd9fh8PJf7CpZc50jq
         sELEr88GcjSxamH3GzQegCpQAB00TaHP0cvuIfW7c7gZl/+2vUaMG2xKblMoDXW36j8E
         9s0wmpQkvl0oCdsrNuY4bfyLnX5Nl3XcghlD3ZimBlc7zcgiEaKGnE7g5fHo5+CImOV9
         efYD/mX2ykFQWQjIrxEsqsp1wWwbk+UiN2kHh39za+kXZrdDIh+rjZ0EiPSqY5tOJObZ
         IY5VWuVYUOS4+c40hWlaMr1U+fhVUqJY+IFLmQPuIvo29GRFFdoo01+3OCzneRiKjCBH
         KANQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=V2TF4jm2ATxtkDdbmLRh9twgVo6K4Dv5bLlTw0ZTCus=;
        b=ouoTj0r4QStOLoPOoI9Ny0lXO+bDywWKyho5nWd2vv03nZvMwnv5cjh0iM2em6qGl0
         onlLYsVRlKjyEF7GTooKfnfgA8BDyyQ1N+0d9LFBFSHDJ/42KOVcAidNGFvcoD30l9z/
         7MFd8hXZI2kvHCaANjuiGqPVKgR+5O9dcEoh4hEcN7QJWdaVgACB+YSBKuIJHvVL74yv
         ps+hTgPcufYFTYAHK5c8664vVPDYO5FLsBqGObTO9ktOwFXQffZUA6uIn4P5P04RE7OE
         D7HI5o0TFtYTMUTjU7C9oj7scRG99sLq+2EXWm851W75SJT8yHDnxxiz57/unQuR3QL0
         VEZA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=I5yw6owM;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [2001:4ca0:0:103::81bb:ff89])
        by gmr-mx.google.com with ESMTPS id n7si60766edy.3.2020.10.27.12.09.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Oct 2020 12:09:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff89;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CLLqf2gWHzyVP;
	Tue, 27 Oct 2020 20:09:50 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -5.04
X-Spam-Level: 
X-Spam-Status: No, score=-5.04 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_CT_PLAIN_UTF8=0.001, LRZ_DMARC_FAIL=0.001,
	LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001,
	LRZ_DMARC_TUM_FAIL=0.001, LRZ_DMARC_TUM_REJECT=3.5,
	LRZ_DMARC_TUM_REJECT_PO=-3.5, LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001,
	LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_ENVFROM_TUM_S=0.001,
	LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_AAAA=0.001,
	LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
	LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
	LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR=0.001,
	LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_FROM_TUM_S=0.001,
	LRZ_HAS_CLANG=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_MSGID_HL8_3HL4_HL12=0.001, LRZ_MSGID_MOZ=0.001, LRZ_UA_MOZ=0.001,
	NICE_REPLY_A=-2.167] autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id 1GwgtLWR6Qex; Tue, 27 Oct 2020 20:09:50 +0100 (CET)
Received: from [10.162.12.242] (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CLLqd4ffFzyVK;
	Tue, 27 Oct 2020 20:09:49 +0100 (CET)
Subject: Re: [PATCH v2 28/33] hypervisor: -Wunused-parameter: keep compiler
 happy
To: Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
 <20201022175826.199614-29-andrea.bastoni@tum.de>
 <86268abe-a991-5720-2f3c-a5b883255ea7@siemens.com>
From: Andrea Bastoni <andrea.bastoni@tum.de>
Autocrypt: addr=andrea.bastoni@tum.de; keydata=
 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
Message-ID: <ad59f8d5-cafa-4aff-bb9b-4a7c3a906378@tum.de>
Date: Tue, 27 Oct 2020 20:09:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <86268abe-a991-5720-2f3c-a5b883255ea7@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=I5yw6owM;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

On 27/10/2020 14:36, Jan Kiszka wrote:
> On 22.10.20 19:58, Andrea Bastoni wrote:
>> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
>> ---
>>  hypervisor/control.c                | 2 ++
>>  hypervisor/include/jailhouse/unit.h | 2 +-
>>  hypervisor/paging.c                 | 4 ++++
>>  hypervisor/pci.c                    | 6 ++++++
>>  hypervisor/printk.c                 | 2 +-
>>  5 files changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/hypervisor/control.c b/hypervisor/control.c
>> index 0078ef19..81b7614f 100644
>> --- a/hypervisor/control.c
>> +++ b/hypervisor/control.c
>> @@ -884,6 +884,8 @@ static int hypervisor_disable(struct per_cpu *cpu_data)
>>  
>>  static long hypervisor_get_info(struct per_cpu *cpu_data, unsigned long type)
>>  {
>> +	(void)cpu_data;
>> +
>>  	switch (type) {
>>  	case JAILHOUSE_INFO_MEM_POOL_SIZE:
>>  		return mem_pool.pages;
>> diff --git a/hypervisor/include/jailhouse/unit.h b/hypervisor/include/jailhouse/unit.h
>> index 40e1cbfe..39dfc056 100644
>> --- a/hypervisor/include/jailhouse/unit.h
>> +++ b/hypervisor/include/jailhouse/unit.h
>> @@ -38,7 +38,7 @@ struct unit {
>>  	static void __name##_shutdown(void) { }
>>  
>>  #define DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB(__name)			\
>> -	static unsigned int __name##_mmio_count_regions(struct cell *cell) \
>> +	static unsigned int __name##_mmio_count_regions(struct cell *cell __attribute__((unused))) \
> 
> Overlong.
> 
>>  	{ return 0; }
>>  
>>  extern struct unit __unit_array_start[0], __unit_array_end[0];
>> diff --git a/hypervisor/paging.c b/hypervisor/paging.c
>> index 75d5da59..0573cfd2 100644
>> --- a/hypervisor/paging.c
>> +++ b/hypervisor/paging.c
>> @@ -55,6 +55,8 @@ struct paging_structures parking_pt;
>>   */
>>  unsigned long paging_get_phys_invalid(pt_entry_t pte, unsigned long virt)
>>  {
>> +	(void)pte;
>> +	(void)virt;
>>  	return INVALID_PHYS_ADDR;
>>  }
>>  
>> @@ -507,6 +509,8 @@ void *paging_map_device(unsigned long phys, unsigned long size)
>>   */
>>  void paging_unmap_device(unsigned long phys, void *virt, unsigned long size)
>>  {
>> +	(void)phys;
>> +
>>  	/* Cannot fail if paired with paging_map_device. */
>>  	paging_destroy(&hv_paging_structs, (unsigned long)virt, size,
>>  		       PAGING_NON_COHERENT);
>> diff --git a/hypervisor/pci.c b/hypervisor/pci.c
>> index fe85ae2f..79b6f920 100644
>> --- a/hypervisor/pci.c
>> +++ b/hypervisor/pci.c
>> @@ -205,6 +205,8 @@ pci_find_capability(struct pci_device *device, u16 address)
>>  enum pci_access pci_cfg_read_moderate(struct pci_device *device, u16 address,
>>  				      unsigned int size, u32 *value)
>>  {
>> +	(void)size;
>> +
>>  	const struct jailhouse_pci_capability *cap;
>>  	unsigned int bar_no, cap_offs;
>>  
>> @@ -253,6 +255,8 @@ enum pci_access pci_cfg_read_moderate(struct pci_device *device, u16 address,
>>  static int pci_update_msix(struct pci_device *device,
>>  			   const struct jailhouse_pci_capability *cap)
>>  {
>> +	(void)cap;
>> +
>>  	unsigned int n;
>>  	int result;
>>  
>> @@ -404,6 +408,8 @@ invalid_access:
>>  static enum mmio_result pci_mmconfig_access_handler(void *arg,
>>  						    struct mmio_access *mmio)
>>  {
>> +	(void)arg;
>> +
>>  	u32 reg_addr = mmio->address & 0xfff;
>>  	u16 bdf = mmio->address >> 12;
>>  	struct pci_device *device;
>> diff --git a/hypervisor/printk.c b/hypervisor/printk.c
>> index a32ff8c4..6f149f0f 100644
>> --- a/hypervisor/printk.c
>> +++ b/hypervisor/printk.c
>> @@ -46,7 +46,7 @@ static void console_write(const char *msg)
>>  	console.busy = false;
>>  }
>>  
>> -static void dbg_write_stub(const char *msg)
>> +static void dbg_write_stub(const char *msg __attribute__((unused)))
>>  {
>>  }
>>  
>>
> 
> First, the "solution" looks a bit inconsistent (unused vs. (void)arg).
> Second, I'm not yet sure there is a lot of value in this. Can you come
> up with relevant issues that this can reveal?

I've thought as well if adding Wno-unused-parameter would be better here.

During development it can help refactoring and to avoid leaving unneeded
functions around.

It probably helps the compiler to avoid spilling for extern functions, but I
have not checked.

Since it's included in Wextra I simply didn't want to suppress it by default.

-- 
Thanks,
Andrea Bastoni

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ad59f8d5-cafa-4aff-bb9b-4a7c3a906378%40tum.de.
