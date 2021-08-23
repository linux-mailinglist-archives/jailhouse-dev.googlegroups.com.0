Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBV4TR6EQMGQEZEFF43I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2203F4E22
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Aug 2021 18:16:29 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id v25-20020a2e2f190000b029019bb571862dsf6511087ljv.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Aug 2021 09:16:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629735384; cv=pass;
        d=google.com; s=arc-20160816;
        b=rw9GQvnczgnBjkSyqWQrZQ7B2bpBp3+rryz5K+WtxZW0CPpunoh6YfBPWe1vsCw01e
         Q3gtSXA90QhIFUGF0sY1xNTOO6f4TMUXXG8zT/97MCQiq0/Wlv/s/ptkUHZs8Op/rEWZ
         6gS1kaPiBdbsogn6c1SdprL+fR+Rso42rZUGQXheCRKBkQnbau6jdG0aXAxoflGL7YDM
         aawzRYddl5WWES2oINgHsZUJP3oXgv1Eg476pVtH4FawJy5jQOUW5Xm0K9JTWPh0NExS
         fcB8+50zus+lnb9tcBT/qYW73ftl78k1dbj1eqmUChNZZEAPsDWZRa02oOYs9fouyA+p
         Nl6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=fv0zND1Oe5U5Enc74myojkDItfF0UvRt1Xb/87A501k=;
        b=ESb7dVFNuLj1M/E/IRgJSjWIkzADzNWSO/NXsizE7ubNcxYZCfGlC+VdpZfXjtDlSn
         R9nH95IWKNjarCWVf+J0CizdB48XujQD74eRDWCg42B2jR1Z07fnRrzddR2fMXeCKNJ1
         mQPidEc7WMKzHwWodHkXSN7NJVolapARmDfN+MPKYFY2iUlfG0+mluPU9eTWJyNiYsqg
         Asj93gHwDloGnKPxUGOb3vNr7gxYLEiB8BLl8Kr+GVXIF+nrh3XnMaWKt3qr8VWud7Ru
         Li5rBqAruJa4F8Np6+fIHaP3iGFTZyCuhiHVf1hQNfV9QncfDfKNZxrkXmcpPQACTkL/
         XVcw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=fMWoxlY+;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=fv0zND1Oe5U5Enc74myojkDItfF0UvRt1Xb/87A501k=;
        b=bgTm2kr5ZhQL6jWak9mXy/Vlk05DGvS1jLDAc4Pe07MtPou6CJN9mLZlRKIgDNdR03
         H8itcMf3G+43C6IkCaJ53vLqld1a6QjnZ7wlOrtEjaVUleapboWJEgJkCyujdq9pzivu
         f1n3FZDITtPmCqjnyp59RBaPKHPss6JBbQwjdbQ3XoVH+M34uuHwQu+EcIZWdyodiNDw
         4dC72xmZOoOWIcjaUctlLJpYkqAb8NwA+IbOUHwWVD9oCmpxxMik4bpwK6fd9FlRMaKX
         3cEQ1Nx9nx+tsqhEkwMPQmeO2PV4ud67gZDXuWabZyInh9NwgxFIOvzP73+RvyyOZZU5
         X06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=fv0zND1Oe5U5Enc74myojkDItfF0UvRt1Xb/87A501k=;
        b=nZ/LPG7Qzar1ntc2TMMMN6MqIS47r/2x8qejW6knb4XuhDWAd0I4cUwSfLxU/YlnxN
         bzEOt50jD5UaSn6LMQWUknY4l6C2MZwZ9Ibf4dpflIeE9GGoOR1cELUZ74E//qrENuNO
         VL0g+SnMvfietsirEyoAbM8axpsFpuTeadkpSt4oYGnd4rJR1WZq2oUZUvO0VgWplCfV
         fFa2MYimr0H4DlS5rryxqadPZ0Rt5efSe9lfOgEKPp23aYlCWOiPBhhN6eUFmmmwrWmO
         +0Feq+ipPQlKPqq6Y47VuLsXU6vckt4gdjZz8fvuWBIva7tsgBqWrmG+BRg0hP11e+l0
         y7ow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533c+4dg5xk+bVoiIfAOA8oGYfc9hun/I0GDPqylN9XEyoHLFkTk
	BVLLca38Nmaq8x+BOzKvBYk=
X-Google-Smtp-Source: ABdhPJwitsAerFPih78l0I6vf/1jY4g6cxLARAuYG+ib679GgobaXbmfiX+cYBhYa3f9ikgxv0xc5w==
X-Received: by 2002:a05:6512:b8e:: with SMTP id b14mr26902101lfv.449.1629735384174;
        Mon, 23 Aug 2021 09:16:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:c13:: with SMTP id z19ls653262lfu.0.gmail; Mon, 23
 Aug 2021 09:16:23 -0700 (PDT)
X-Received: by 2002:a05:6512:754:: with SMTP id c20mr25434685lfs.396.1629735382990;
        Mon, 23 Aug 2021 09:16:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629735382; cv=none;
        d=google.com; s=arc-20160816;
        b=lxKDWcvBkgwFvhZLdzBKJdyIjh5f+jV44HWtGieBjd2yl4obz9zPhDF02Y+IdXg9OE
         0DMimcFmNwIKV9lhaINzahWQaFH1nd+xGVS6bYoGbm2N90gkkny1qZInA5h1/Tho6Gni
         3+5ju+a8nGWSti1WU9eM9txxgrKzVzGG3Bzlx5vXk4HKUojXMg03zQh9pH9C/RnkLoAx
         d4Mh+JAShoFJceIyUiCyNRRYwY2iawIcONPAtDz9bG0mz6nDL6te1zSe5gDB4F/ryYMC
         38Sf5JoHRkqglmNKbJvRu6wiDD9g1wVCumByH3wMAVjFlaPJ01jLYpG7YeQY9eJ2b26M
         Ja6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=TesprP8K8YptzMKs2jaZto500O5uSaSxSVm4b56GhG0=;
        b=Ec/M6CAjHDN0dik9UOG+uFoPxmZXLEu8610e85MgznBXcvVZGwY+/NcAKUg/mpZ+ny
         jT6aDx1H6cQhgu5Qz8Ldy5AvA9o+KeCLbItAZ48OM+Tn1sb+F+VDM0Ju8pljzMcAejnr
         rRtroJDxttutEHc/0rUK4ymG6WzOsnI7vKqnThhEir1COx1+By1c7kja3S5JXwWMyY46
         ZGwBqXN653K5fTW8HGCdTu2FIGES9dzpNrowXBBDBJDW+Pl3hQ4jExGZNuxcn4MRupSV
         9vvwBILxxqrlIbiL4C2BbzbDXC/xa7OPTD7a99PNx0nGd4CHrSMzlM1dVBudvbswQqEF
         g/2A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=fMWoxlY+;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id bp42si102054lfb.9.2021.08.23.09.16.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Aug 2021 09:16:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4Gtcn21mhGzxtJ;
	Mon, 23 Aug 2021 18:16:22 +0200 (CEST)
Received: from [172.16.2.139] (194.95.106.138) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 23 Aug
 2021 18:16:21 +0200
Subject: Re: [EXT] Re: Editing Inmate to add GPIO for Raspberry Pi4
To: Moustafa Nofal <mustafa13e09940@gmail.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
References: <cd1adc59-e867-4ce1-a6ea-371ae1754cdan@googlegroups.com>
 <434c3e0d-3f9d-cef4-faa8-e94248176db8@oth-regensburg.de>
 <560fff74-e071-4713-a1ec-e29b842f7564n@googlegroups.com>
 <a30c722d-4fc3-fd3a-f2c2-5dd80b2d8887@oth-regensburg.de>
 <12f6f39b-14fa-47c4-9fe6-6ca0897e14c0n@googlegroups.com>
 <66d9ac5b-8e2c-621d-d948-ff921aa0aa5e@oth-regensburg.de>
 <bf8c269c-0868-4296-b97a-edc841ac530cn@googlegroups.com>
 <6c3b1b62-84fc-fc39-1115-8f695897e712@oth-regensburg.de>
 <CAEKTTKzJQEj9Wp7H6vO92k1uDgqEiZv-JixK7Cur52j7m9=ipg@mail.gmail.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <a66b2c70-26f2-6ac4-4a0c-74f963ead91b@oth-regensburg.de>
Date: Mon, 23 Aug 2021 18:16:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAEKTTKzJQEj9Wp7H6vO92k1uDgqEiZv-JixK7Cur52j7m9=ipg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=fMWoxlY+;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 23/08/2021 18:12, Moustafa Nofal wrote:
>>Did you assign those two CPUs to the cell? It looks like someone
>>else would access those register (ie, the root cell?)
> No, I am using only one cpu, but maybe its just conflicting with another
> peripheral.
> 0xfe201000 is UART0_DATA_REG.

Ah, I see, Ack. In that case, the UART is taken away from the root cell.
You can overcome this with the JAILHOUSE_MEM_ROOTSHARED flag. But be
aware that the inmate is then allowed to the UART device as well. So if
latencies that are introduced by hypervisor intervention due to
subpaging are not an issue for you, then subpaging is probably what you
want.

  Ralf

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a66b2c70-26f2-6ac4-4a0c-74f963ead91b%40oth-regensburg.de.
