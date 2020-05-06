Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBV6XZP2QKGQEY4AFUHQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3C41C773A
	for <lists+jailhouse-dev@lfdr.de>; Wed,  6 May 2020 18:54:47 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id h17sf1045054lfc.12
        for <lists+jailhouse-dev@lfdr.de>; Wed, 06 May 2020 09:54:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588784087; cv=pass;
        d=google.com; s=arc-20160816;
        b=nFNDMet/QQIiPr8Z5oRBBXOYFh3Pzk7WD/naOqA8eOZBIFogof/+cjzawpk7vKmN02
         nPsjFViZSqJdpxJYpCebSCOsMuOBWYqEAlmvfyJXSOp35kg/sHygoqcgwlrQLJ056bxK
         XuEMngDI7/7WHLcNVdpFp0v8ZC5klpaSO6eMEzXWxliY3q0m+zMcTpd3FtiVON5GWoxe
         980rnhzHpp5xwnUddzzkISza7pnvFGoZp6OEztb+OA0GU7j+deYjQF5zIrWd8SlJEuxE
         xERcvJRn7aow7798N8ZVWP8z88On/KtdkRJsBzDVypz3B3iBl4jeBaCuqFHfFnC22TTQ
         7p4A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=gQyd6plFT1eCikJowx040Q5kmbQTWwnLuvOVouZWmKM=;
        b=mE4Wyx4wgMhKUxBJOX8V3EEwxtvLL47TXbmDl5RStkKS3yGsqBFUbJpJncAePyL4Am
         5qtg5+xjOruQmeAS4A1faRPCL77X+o3wbQ71ECy2pw3FXrCRFXjHCe8rfhs2AK2uJF8D
         BYuu50Dkx/ikpINNm3pM16bQinhaBAMqVdvgg8UoYupavlTu8HOmaoMA+nmactQ3arfp
         E55xrWKP1bpAjwwntBy+jqdMCBpS96BOJmElup81IBySUZcfqhMDYY5udxQVghYMMhGQ
         o4EJaVb0JX29JncoYdfVw9rvTFCz/FAn917ItaSGFVnt4qMWP5JYRKpFl0a8y1OKiZVn
         6Nug==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gQyd6plFT1eCikJowx040Q5kmbQTWwnLuvOVouZWmKM=;
        b=nQJGP2etmRZCQWO9ZVDmwJuK9mZ4QU6OeTpzsacnY2LAu126pjFz9WpvfkU59Ufqe9
         8hXV5OwO6ADtAbJm8zQCCL8RwOnT1LkfVHOkQBb3aO/FvQ8fy4i6RT2k4qCIlpokmB10
         x1BSfgbs+dketi7NTUvo1XqaAaLFa8/XPG6tg2jCecFHgtsa75aHmbwL9fUFQGve+gVe
         prlQD4Y+YM9havFmJU+WXoMrrh1RWyLfSFOAz3qTyXAdByjDjNS/yLt6TxGa6VnIwXeO
         67PAcERzoWgtbqNNQbNnrdWoeSXO6cQGmm4QU3MYqHDBLrTv6KWz0N5PGdjQMn3XRLze
         HpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=gQyd6plFT1eCikJowx040Q5kmbQTWwnLuvOVouZWmKM=;
        b=dhM/SG1Vt5aZjoa7Z2L+GU8bMD0PrmkF05ftJ5DwZvUcaSWPvoIRkbqWhdmuAmBOz7
         GUtxt2tUEKA8HgS9HyeJfL1IzOlYMeupLP8CazVzOUNsdY99C8AigoNkCKGc9iq/3Y/w
         twejetFAADWpRwWuF6FE/Y2DhHSIwu0IhdNqhZVjB7XXMQpAC0389w68RR/GPQQkusdJ
         xePE6yzoNm5zdQZk1Yfm649rRgxQvruMr6E8FbGAjcL2W9GEA4Zdr7G4d/v82TNuCE+H
         0Tbb3QAOf/cUxLpGImLEXWAogsrcJo1eB3BlmSOpdVWKP3QY3EhgOxiUDnatLwQsr92I
         KfVw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PubXLvJ/VNp5xBanZTuhp2AB0QrPc5n7E2B40xQ7p+hAydGwiQUe
	7d28pczhxeBc0hGqANPXJhg=
X-Google-Smtp-Source: APiQypKjkPNauxfmxoy6CQs5yGOdEJIQzwCTD5ndb+2aV/lvej4Dv6dswAD89c9j8cWsKGQV4NKpxQ==
X-Received: by 2002:a2e:2a82:: with SMTP id q124mr5875551ljq.155.1588784087499;
        Wed, 06 May 2020 09:54:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5c09:: with SMTP id r9ls482149lfp.5.gmail; Wed, 06 May
 2020 09:54:46 -0700 (PDT)
X-Received: by 2002:ac2:48a8:: with SMTP id u8mr3474738lfg.41.1588784086673;
        Wed, 06 May 2020 09:54:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588784086; cv=none;
        d=google.com; s=arc-20160816;
        b=Dl4Ry9bPs2du1sAspmMVOB19JEDud+aNLPIJA3W5rhiqC+0IvQqE8urtljLKZlxHmE
         m88pbPi5d/n0NbshSaar9DHDWs/bjORS3VPA2a5/9+pL0eCT0h1ELME++Bh8g/TNBDTO
         QDEtj5jgfGaLME3JEu7hR4vCXdK5HDkdqAd78PuNHoSalSGWgcl2Ev//68ZRT0ixobXb
         auTmLNlIMKWCHlsEvRboPqJsbxq6szWBi7GHBrQI27hAP6uX02SEg7oPwdJwNrMtxs/W
         NXjBwBt65s7DF6VC4nQ4DPpTQCewMgXlLypX6clJsv3ZWe6V0XUImOWCL9dAuaVc3g/K
         WIoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=KqJ8+Ao/jUoSrS8lvdgNb4OZk+PabCAIZButJOx8w3o=;
        b=GBNC8XPQRjEMAXM6T4AoT1BPIz0Qg9TtXJWJ+Jtvx8DAwzCqJPmRtSMSMg8F5mcmyr
         HoKmnhEm9K5Y7BdHQxvwf0AC4slgf8eLg8nZ85LmLjdWKrfwPCyz3Fz3Bqs9TULfzWo1
         keYSMx6NnNh0EYhAIT2kH6FWDtUeZw0jvFsi2Amph3XJ+Ahu45HP7d7q3lG8MlrdMIBL
         1JQ+HsmOad5IC6lUY8ncvviE7inhGdKdiYdOop3TeaZHyqJrPh63KpORuV2i+ifs5LWZ
         xCniPlnwhPMmiJ05PYXLdS8zJJZoB6GZYUbtI7xquHD0PEUmKSSgeH6DQcb0e5BydpxC
         /L2g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id b11si174629lji.0.2020.05.06.09.54.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 May 2020 09:54:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 046GsjvF004128
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 6 May 2020 18:54:45 +0200
Received: from [167.87.32.230] ([167.87.32.230])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 046Gshus029981;
	Wed, 6 May 2020 18:54:44 +0200
Subject: Re: [PATCH v2 3/9] driver: introduce col_load_address for colored
 binaries loading
To: Luca Miccio <lucmiccio@gmail.com>, Marco Solieri <ms@xt3.it>,
        jailhouse-dev@googlegroups.com
Cc: Angelo Ruocco <angelo.ruocco.90@gmail.com>
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it> <20200421100351.292395-4-ms@xt3.it>
 <c0710d88-a53b-c17e-8c1d-6615b9b8bf09@siemens.com>
 <0af1c1c8-52ee-f822-66e5-c7926fac8596@gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b58259a7-4aa0-7182-1ba9-b762be5cb82d@siemens.com>
Date: Wed, 6 May 2020 18:54:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <0af1c1c8-52ee-f822-66e5-c7926fac8596@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 06.05.20 18:42, Luca Miccio wrote:
> 
> 
> On 5/4/20 8:33 PM, Jan Kiszka wrote:
>> On 21.04.20 12:03, 'Marco Solieri' via Jailhouse wrote:
>>> From: Luca Miccio <lucmiccio@gmail.com>
>>>
>>> Currently Jailhouse loads inmate's binaries by mapping its memory region
>>> to the root cell. When coloring is enabled this operation becomes
>>> not trivial. To avoid logic duplication in the driver module,
>>> use a special memory space when loading to colored regions. This
>>> convenient memory space starts from a fixed address defined by
>>> `col_loads_address` and will be mapped by the hypervisor using the same
>>> size and coloring configuration as the inmate.
>>> Since there could be platforms with different memory space layouts, the
>>> choice of `col_loads_address` has to be done accordingly.
>>> Allow the user to set this value in the root-cell configuration and set
>>> the default to 16 GiB. The latter has been empirically choosen as default
>>> value.
>>
>> This is better than the hypercall in v1, but I still dislike the
>> approach for the complexity growth in the hypervisor.
>>
>> I see the point that some logic - namely the strip width calculation -
>> would have to be duplicated into the Linux driver, but it feels to me
>> that this would be a better alternative overall. Did you think through
>> or even try such an approach at all?
>>
> 
> Yes. Actually it was our first implementation, the v0 one. Our concern
> was (and still is) the duplication of coloring logic between hypervisor
> and Linux driver. We put so much time into this problem and we came up
> with this solution and we think it seems to be overall the best one. I
> also understand and I agree that this solution adds some complexity to
> the hypervisor but even if we move some logic to Linux, a part of the
> complexity will remain in the hypervisor.
> Moreover, moving coloring logic to the driver opens up the problem on
> how to copy in "strided" mode based on the coloring configuration. We
> did it by copying one page at a time, using the next_colored in the
> driver module (duplicating the code) but this approach was too expensive
> when loading larger images (e.g, Linux inmate).
> One solution that I see is the following:
> - during cell load, Jailhouse remaps the inmate memory to root cell as
> usual but in colored mode
> - the "special" memory region mentioned in the commit is created by
> Linux instead of Jailhouse
> - the copy is performed virtually sequential
> 
> The idea here is to exploit the jailhouse_ioremap function in the driver
> module.
> 
> With this solution the only complexity that remains in the hypervisor is
> the memory management for the root cell that is introduced in patch 5
> without the "special" region part.

I haven't fully thought this through, but I wonder if storing

  - maximum number of colors
  - color stride width

instead of llc way size in the platform data and using that also in the 
driver would obsolete a lot of logic in the driver and the hypervisor. 
Granted, that would push some of it to an offline calculation. That that 
would be a typical Jailhouse pattern.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b58259a7-4aa0-7182-1ba9-b762be5cb82d%40siemens.com.
