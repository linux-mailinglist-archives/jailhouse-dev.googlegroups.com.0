Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBKHW3P5QKGQETPRVL3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 7671D281045
	for <lists+jailhouse-dev@lfdr.de>; Fri,  2 Oct 2020 12:04:25 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id b20sf433372wmj.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 02 Oct 2020 03:04:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601633065; cv=pass;
        d=google.com; s=arc-20160816;
        b=D7oElnccJ3L8r7ScBbBlOhJd7UfEMatbigHDvsz/Q3VTKmW219VakONaPvZE79N8QA
         vbDTvbgf9jWkRsuRn0vAMivycbn6Jh/sIUcEPjTgN/GopGxwu45If3mfom4VGBmphOEa
         BPiddUEEAkwWwG05INsw7pvPEZyxvYfJLMQakKw4KanBrSrzz7Hkzqoom0VNsUqL49Xw
         T5XFmX/CHNtjunDpL2buXizX+gAvzOEUKRNHBPUoNLa7fyt52RNp6QyQSqKRggwAavfi
         B/C4vC34pEKs4r6qbjalv/S+7uVf45OtItx4YuAytvQ0jJvgm3Ldax9gTrt0uQyR4Tgj
         UFRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:to:from:subject
         :sender:dkim-signature;
        bh=qWJJ3FnskD/aGvtIYJxMnuJbqCqeN0JqVnO7lcU6NoQ=;
        b=HJboqJofVq6eXuWiL+ZQOD5twF1vjs8AzecWYpYpLKjtG34sa2qgQQiKWq8qEL8tmC
         DtLw3BYQu5WP8nfoJqWcwNpBaaEagStuTdPE8/SfasLq9mr5Hy1L7m71pVBMxjvcT9Z/
         PFxNuMaM1nmzL+jjOEmBEKFj+waDcxh0cuetAh1ZK7gpt3ZRiYwxv7FB/7j2mqQa0gVr
         1FlF4LNpH8cCns5t6bj7fYoHg0UYF8TO2GxGXOwdSC2/7g6LV3uM81BKSKQwmTIKktXo
         c0kwBEbroSQYsnb61C7PkgFYT/hode9LudVhfGIaAbJLxs3aOtNigurg/Wj6WRUu1olX
         1wkQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=YMOzDIsM;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=qWJJ3FnskD/aGvtIYJxMnuJbqCqeN0JqVnO7lcU6NoQ=;
        b=rvJNe2cwAk9L8aFMXe3qpx3MwdZIlL8vJzrVk2/mwUUPyirPQXFqxqcSQ5sa9KiCJA
         KTFjAB8NIylaVI7rfoyV51TvU1r42bR00uTtZMaLNq4MULOuyjduQ6MUw186Z/4PCBNM
         ToElw9vP/bLz3gdvqsdJVnCeSbLJZiTvSTXg3DnOyEQlZXI7acLG8V+3zEjJosHN2zeU
         BgJdwc+4NJSZf4uFUUlsnD0L8jDU1fuhfJ1hCGMFTnhF2pZHprqoW9LLVs/wlqsAH7jH
         ddqVWiVrM5i0dach67hlOkLvvzSjjNjaYXYGi2xpyG1sfaclRZPpdbJDJDz/vJsfDgfZ
         /kDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=qWJJ3FnskD/aGvtIYJxMnuJbqCqeN0JqVnO7lcU6NoQ=;
        b=AN59QwK+WNr4w8Qt6gSlTyyDNSmVtGQYGPigTAnDc3sd9/qQ6fHu5JlHL8FEohm4BW
         dHpRzeaATDX5hXVEA0cVMTsbIVfxiGfzXgdPOvAdjC2s7dwqSlaHEUf/Du+O24UA/Arf
         OJCJVW/cPfVFL4R0DnbGCU+uxAAcn/Z7Q9bBatcq40t2iQLR7VZI4LHd1PxyatwTpQV3
         ZLqDuzb0BYqX57cFhGG0aQmMtP0phuMq48gXFu9kuEpILqiMV0h3GgKf1CooSa9QOPuP
         z6gQBFO7+Yh4RHiqqztn5GdhvWCj6cyqoOgy++x3hY+gOZc1pADYIvM+e6IfoOom+Cg4
         VJpQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5311zs2xtGI2BbP4zbLRhYj4mWAjgNQTSCW1m1HlIkUGo2xDbfdj
	LEwxpz4hCnpDZdHwWFSXFBQ=
X-Google-Smtp-Source: ABdhPJwiQ7KjfJj0YclWXAadNw+QRVyRVRH3H9txjl78Q5RPhWV5/uezLa5wcrTVCRqKcR4sB4S06Q==
X-Received: by 2002:adf:8342:: with SMTP id 60mr2320226wrd.158.1601633065113;
        Fri, 02 Oct 2020 03:04:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:428e:: with SMTP id k14ls258503wrq.0.gmail; Fri, 02 Oct
 2020 03:04:24 -0700 (PDT)
X-Received: by 2002:a5d:60c6:: with SMTP id x6mr2301800wrt.157.1601633064149;
        Fri, 02 Oct 2020 03:04:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601633064; cv=none;
        d=google.com; s=arc-20160816;
        b=LzSZ7F1QPVT6LZA4NeD7piwcyR32HLfFuC2bkEOp80wWvaYf3XTHdl4moEcOhbwlI+
         r5P3iRUQfMCzCvGDrPphUCsp6KBeYYgP1wF1xzSmjvuhVNewv4RLJWIL8anN2j6nfF04
         oVoDTbzZZct4c5s/17dpv94rT+BRrzKL8FtKZNXs0rb+W//JOEyoPcm7wa2D1FY5nF4Z
         JOJcQpRMYO/Q5NjMAbyD2waCRg1EC8nQusKTvfXiHnMcDveI0vqyOeJxdoDWhfZ7h3Lo
         W1YtZhei2qcDvqQSGFRLH6baaFzRgFANI8xt1mh9WIbl8aPe/bKop8KWKH/9IenPafaQ
         MO4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject
         :dkim-signature;
        bh=uwpGs/nG58O3h0rfSf1BW1j3X4ZoFnFu/TQ2I5Ny+ow=;
        b=xv/1guXmdl/fmv0khwV0GoX+3AQKNN7Nou5lplQCu2ichm93N9E8VS+Qs1ot6S0yNV
         BqGqvjIlTPj3n1jxoz91tZoeXTdaLN67Pon75h/JLw7hhusgTGrdGzspBlA11+NLiQhY
         Hw95C+XkzZSMch/gBVJxxofs26nDnQaF6+/ys59z4BJMGvXNDf7Rf53nZnes7HfcIEem
         C4VVeRmamPz7WbB0EG31hHy7jugjyvqlf5MuU2uC5RzM33P5+zrXNL/TEFNT80Be3eGu
         LwfkDxnPm/dfMe0eK09W0PJX3CtmuGWvRCQdhkml9irUkTc7hDMHEJk/kefocORp78jK
         h9dA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=YMOzDIsM;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id y84si32629wmc.0.2020.10.02.03.04.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 03:04:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.53]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M8iei-1kGY9L2oQe-00CApe; Fri, 02
 Oct 2020 12:04:23 +0200
Subject: Re: [PATCH V5 5/5] configs: imx8qm: add configuration files
From: Jan Kiszka <jan.kiszka@web.de>
To: Peng Fan <peng.fan@nxp.com>, Alice Guo <alice.guo@nxp.com>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <20200922064542.26274-1-alice.guo@nxp.com>
 <20200922064542.26274-5-alice.guo@nxp.com>
 <2f0d667f-68ea-eacf-7b8b-61652bc0d2ce@siemens.com>
 <DB6PR0402MB2760ADEA2D5A37133E5A1D9388360@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <27f73d85-f64c-fa29-0524-1fa360c6385a@siemens.com>
 <88609d72-f571-ad84-78ed-28fcec0198e0@siemens.com>
 <DB6PR0402MB2760EF8A41AFC17F8571BB5B88340@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <143f5a37-9cdc-d2ef-581e-7f7144b6a709@web.de>
 <AM5PR0402MB2756949C49DAC709F669D7F388350@AM5PR0402MB2756.eurprd04.prod.outlook.com>
 <59ce287e-bcc8-16f4-ead3-ff4bf8211628@web.de>
 <a6a3bf58-20dc-3704-35c7-d97f7bcf9834@web.de>
Message-ID: <dc3c6437-f508-4632-46ab-6268b948b280@web.de>
Date: Fri, 2 Oct 2020 12:04:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a6a3bf58-20dc-3704-35c7-d97f7bcf9834@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:LKjDAsQxHjJDN43etPVoktv8zHmKvTaJXs22QGDxUWWVOIUBGzR
 gfSaK1N9dEaMoCw5F23bnFlq3z1qFnq3kQXwd6ZeMmmNt+VUe3vr74QSLZ9ACGNM8EAD+ID
 1t5dxCSQKW7ydYimO+9cP0dhK9a9xvtLEgcAn4DVfXB9FSOuknTS/X9lTDSkaQ2SYjtG9Vz
 yNr3E84v+kB+msB93glaw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:U0pkNUL0puE=:GwXzsPmVrMGGZAmKHB63ax
 FR82hBVImkL5yKnOTJSX55W0CUnzxE4r8c4OF0LIMhhWhHpYoNP2wX1ihYYL9L+fe9WFrvZI6
 +CoF/+hg/BH1FbUhDI4g2X4rMBo8ONABFbhHQjXAf0+LsmctzmoSp90FO6jEKN6+3VVBn7+mP
 IN1oqYQaeSArCvGkqbWDKZ6YQV0rc12Ig/csTJ7AZHNxM7OE4Y/yF4YcSLgAENbB60/DZKI74
 O9N6WDY3NZZ0Gc701vvvgLMfuU2l7O6Sbc9DClqbZINLW/Uk6u3VtoAyJdRLj99DpZy0Ps1bH
 ZaMM7RVe7ry0JcF+MiasDXH+l6+w3tYgg3AQVGjnrrb/GuqpBYVqiPt0fsVLMEo7OweGp27z9
 i9Kj04zbMgpYqYVEa4vn6g6/XKS4UzKTXdzXD1ajXjgi/vJ6eTnqLlx09I29YWomRJhN2TEvC
 bdN39wc/Kf1nKJTOfVBCNHlngLQpwHTyYtFVyp1yvXu2vY/ouQGsTDVELNA+TW84s3fjZXETr
 7bJg5PIxl6R/ipFWxIuNJEsiu0mFGWX2z+8s5+oNOQkQtJopXCf7MzvuZEkD4Jha7Uq2IChSs
 wjl6RvDRaLc98xZWZRh34IDvPepwiIYrLkClB7rj56WJAt3gofezArUWMAccvmReK2WZVkkCi
 xQxh6yoM7iD/xR5bpZkatLP+RaKaARSwa9ZD0NdaNMDOxtsXRSsdQkti8cunRexq4QgRpvxqA
 vvwzCN/0YyoXEp/qbD9HNfaWCbz/Ud/obF2A9cFXL2cOcdDmu4M86v214zbskymtoh7ET2heW
 yjdgmoTTY675u5GswNtBFwzUS7JwjkQNPXFdLd/+7BiIL/16DqZU3JsMSI+B68Nt2SJ3O+Hop
 9Gm1nS7XvF9PfcAQ8LxWryWkc61VjStvs4xJyE/o4BWuuIfD8kHOU/SDRivNdhthcm9a9dwqU
 xNaRYsTdHBPjWeD19yAdgzxSTfCxYWCDxgtoOLm+98S6utpj7UXPP1ddrHimgxd0R6jBX08cn
 WdxYR6BWIhfdZlhxsR6DQtMjpYH94FWLfallEwO22mNL7HDze/F7EQCHywWfKsVU84b54oJWl
 pfCnmHwbj0/tMcUkw44CZvB8odR1LrdZByiK89LvZXfFj/dUhrFWBqFjeqkOmkVPgjFFntIhp
 sAHE7+FkbtfKr7FlU1grP/OC4TJNAMaDJfGPELZ1yWpF5YjKolwTdd4gDUEGVujH79FokGLne
 hon3WmgSyAUNtXZdav52rp0TCtc6I521+fZYjdA==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=YMOzDIsM;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 28.09.20 08:20, Jan Kiszka wrote:
> On 28.09.20 07:57, Jan Kiszka wrote:
>>>>>
>>>>> You could try to not bypass SMMU transition in smmu driver, then the
>>>>> system might not work well.
>>>>
>>>> Where is this bypass controlled? In the SMMU settings? Or is that
>>>> platform-specific?
>>>
>>> S2CR_TYPE_BYPASS, smmu settings currently.
>>
>> Just flipping the type does not seem to be enough. Could you tell me
>> what is needed to switch to "block what is is not permitted"?
>
> Looking at the kernel, these two changes are apparently needed:
>
> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
> index 69374b28..ea58340d 100644
> --- a/hypervisor/arch/arm64/smmu.c
> +++ b/hypervisor/arch/arm64/smmu.c
> @@ -534,7 +534,7 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>
>  	/* Enable client access, handling unmatched streams as appropriate */
>  	reg &= ~sCR0_CLIENTPD;
> -	reg &= ~sCR0_USFCFG;
> +	reg |= sCR0_USFCFG;
>
>  	/* Disable forced broadcasting */
>  	reg &= ~sCR0_FB;
> @@ -637,9 +637,8 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
>
>  	smmu->cfgs = (struct arm_smmu_cfg *)(smmu->s2crs + size);
>
> -	/* Configure to Bypass mode */
>  	for (i = 0; i < size; i++)
> -		smmu->s2crs[i] = s2cr_init_val;
> +		smmu->s2crs[i].type = S2CR_TYPE_FAULT;
>
>  	smmu->num_mapping_groups = size;
>
>
> However, only if I remove all sids from the root cell config of the
> zynqmp (num_stream_ids = 0), blocking starts to work. As soon as I have
> /any/ sid listed, /all/ transfers pass. I'm using 0x3fff as sid_mask
> which covers all 14 bits that are used by that SOC.
>

Could you comment on this? Is this behavior different, more consistent
on the i.MX8?

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/dc3c6437-f508-4632-46ab-6268b948b280%40web.de.
