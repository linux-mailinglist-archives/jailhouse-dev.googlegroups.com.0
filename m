Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTXSQOAQMGQEPT2QFKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EB3312C0F
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Feb 2021 09:41:50 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id n15sf10778931ljg.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Feb 2021 00:41:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612773710; cv=pass;
        d=google.com; s=arc-20160816;
        b=AZYkg2iBVhni/6NQ55CseovdLnveYFuL2yaL4ot++H3CJxbpnroOLYVDpQqTEYnZCL
         tAJJH//HyR5KUkXC/Tp/Vzc6tanrZfStSDYQPEgySml5tM3aJqUnqAlREfvCbWLohhC2
         HWUthHMxtAnYYc5UFOhG2M3uz3a2wCZBQR04lmPB3udlROSjR+jlOe7fOi8U0FKtN7yv
         /8dN0nPdpjfOMqqSssHgsiCKBmmModF5dDPZ5FhjjKas2AT36xsmAk2ZctqWS3o7w4Q5
         nnxnjjWRh5F9d2NyCJM+eUMch6B3lVwW4LlSwbuBZf6NkAOWlzelGo+tUxvkwLXKCaGF
         773A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=ddvAYL4qQfZJ6CP+zk01+BkpsssgZ8AhdxQjb3fwds8=;
        b=IN5Sb+XdSx9NvKMjv5brHDe0IDTm5OEqiaSu/mKmHaiqZQ5qeRXO7GxJjsW2LvIwgV
         m40KQRS5mNYwzpzYgJxJgdqQ+ICbm3su+CHGluyTEczZezqIJcIpztk6TDzjrxvO10YW
         O6pAI8nwAT4WdmUVBuQg414XTUntWXkpi+NqqwffwbHwVO/xJdQgMCnyrBnyVDmLAY1S
         l610vzOUmynwgS2KcBsdEbjL0S2zT/3Nh134o9RTrMwV0wGctaWVqmI/Zf7bhrRdVpsc
         ClwkK6MLDJ2EO0/mA1Qi+zVA+9LYtGskaFyY4C31gXb1HNXK50mHIDfstW20YUGzeBNY
         Onqg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ddvAYL4qQfZJ6CP+zk01+BkpsssgZ8AhdxQjb3fwds8=;
        b=Rm0xC7+mxzS8xvWZ5wudmjyD4YAQ1scMDmTHWzCE2VkptGdPwK0tlfKtGnsMduR/Bu
         J8rd3x6JENpPQRo5Jhblk62is+dkC1sJZX3icmotfJB8EPMj//SIDLtdvehgRSUIEHFB
         /D/0ZB16pMszzr6S6uvAzn6PVAr7KjIaFSmG0G9LKj0qI3+AE96f6GcxTCoJdBRyUIlo
         sG/slDbfhADehkJHYeuMR7A3KkOGthi8/dSSHYyPQcpzDvN2tDZlcXXqWbqKmrFhMZIK
         K3ykkdLQP2fAnLMupa/jkCh62Jn72ZbACXdXB7ua+wCY97Uf7UqVMmlEgZ1D9FbcSvSx
         UK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ddvAYL4qQfZJ6CP+zk01+BkpsssgZ8AhdxQjb3fwds8=;
        b=tyaCeCvEdkDwTJ7Aie2LEkC7z9IXt0wKZuNPle1kt533lWR5dBbVumbSU1rzzFFDoE
         l20XT3jFlWMcQM+5uOKNo+/TpWeykftIdL0rzBhLgOJ0+1GWE8MbaQOd0eMx2hx83Jl2
         qRKRnDJXOudB6SgiMABsz7AMVSOI8hGroeqWAPMOi5UQ958w3JAXjICs3xfd0DFM2W01
         Sc7THrDqlUAoElH8ApzfHb20eFRnc9QyKYQqpUCaK0oTo4GdHVSjL8wJCVZ5DgqiERp5
         14yn9Oc3eHlYkdpt1XGI6ts0uO5C9lUNMMKOkLg/mkJOkn+hE85DZ2bR/RrekGfriIF3
         c+oQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531SMtpzVZq3EkAzE05Vmhl9QQ5zXD6Zrp4zQ9Dt1iGn0Zm/0EKd
	CF4E7UF5R7gi7KboH0trpn8=
X-Google-Smtp-Source: ABdhPJwRERPb8DEWyweq+1COpDqt8U06Ea6LvYPokR3O5ViNJkF/DBrAUM+biFsJ2MSnwCJi50hn/g==
X-Received: by 2002:a05:6512:34d0:: with SMTP id w16mr6040374lfr.416.1612773710433;
        Mon, 08 Feb 2021 00:41:50 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4adc:: with SMTP id m28ls3326031lfp.0.gmail; Mon, 08 Feb
 2021 00:41:49 -0800 (PST)
X-Received: by 2002:a19:444:: with SMTP id 65mr5083553lfe.0.1612773709290;
        Mon, 08 Feb 2021 00:41:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612773709; cv=none;
        d=google.com; s=arc-20160816;
        b=fsTYGO9Xt/o363X6NZQxrV9wogX0PE1xJcaXcENZTGLN8U7hE6ZeJB6c0x7P9rI8yL
         iMctFXP93Xs4NuuLCIGyiKQYLd/s4rmgEsv1R0KLdQLAyu09o20Okai35vpiWNAmvzyG
         1k2W/pR1p339ELZtVqZnWbo3PJUr3im62Ho4g0/R2bqIfUJO6NQUX2VafkZK1UsrKztD
         HmbDkbXeveWYOZRy7OkJjask7pqHANZw+wQYppLaFr+a0gLdbEAPAG3AKGnI745Nz44n
         TrJ3ucqNEnxMbbQLSlpwSMwxjQ2ta0TB/g5f2MF6tT4kFS1o+ZXkV+9k7A54q2SMveL/
         v81Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=XAjGveSFBO0xmvoxdhEhDg4YB3FejJN9geSM4xlTGRA=;
        b=I3WTE8GFSzZPlkdy8wCUj6FOCQBLJhllFDqRMdrO8t6XroJJGTtupZYcewj0a8oAG6
         F7zTxVAUqqmRrF/QGfTPGdtU5lVEZMZPW3MscpdbWEA87w3GQ7OJQ6/IDokWP7IUnIOW
         BNIg/obrXtUAA3X9Yxt8zYUcuecUFZ+wybf51AunOMG4YmUrmbw9TOp5lfpvSmIjzBX9
         VVRLbMk4GgbWX85oSoIZYIEPSFKHwyWBPYK26U8BHzNjy+TnwiYKRMsQtM3/Bev729mS
         EkIJu6e3REuK1J6PINBqgRku3h7j3B2RUISoxnJcwbKIQrwuRWvX/18s9m/YzMyXfSph
         UB9A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id l24si185435lji.0.2021.02.08.00.41.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Feb 2021 00:41:49 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 1188fk1q021417
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Feb 2021 09:41:46 +0100
Received: from [139.22.33.193] ([139.22.33.193])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1188fjxO019663;
	Mon, 8 Feb 2021 09:41:45 +0100
Subject: Re: [PATCH v1 06/23] hypervisor: protect inclusion of control.h
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
Cc: marco.solieri@unimore.it, rmancuso@bu.edu, lucmiccio@gmail.com
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
 <20210125120044.56794-7-andrea.bastoni@tum.de>
 <30e9107a-8b99-c9c8-ae90-df39157a66e2@siemens.com>
 <f6917eee-2eb8-3846-bd85-c98303d5900c@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <37da2db9-cd0b-5729-c948-ab074f186b28@siemens.com>
Date: Mon, 8 Feb 2021 09:41:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <f6917eee-2eb8-3846-bd85-c98303d5900c@tum.de>
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

On 07.02.21 14:04, Andrea Bastoni wrote:
> 
> 
> On 07/02/2021 11:18, Jan Kiszka wrote:
>> On 25.01.21 13:00, Andrea Bastoni wrote:
>>> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
>>> ---
>>>  hypervisor/include/jailhouse/control.h | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/hypervisor/include/jailhouse/control.h b/hypervisor/include/jailhouse/control.h
>>> index 76eb0428..2ac7e2dd 100644
>>> --- a/hypervisor/include/jailhouse/control.h
>>> +++ b/hypervisor/include/jailhouse/control.h
>>> @@ -9,6 +9,8 @@
>>>   * This work is licensed under the terms of the GNU GPL, version 2.  See
>>>   * the COPYING file in the top-level directory.
>>>   */
>>> +#ifndef _JAILHOUSE_CONTROL_H
>>> +#define _JAILHOUSE_CONTROL_H
>>>  
>>>  #include <jailhouse/bitops.h>
>>>  #include <jailhouse/percpu.h>
>>> @@ -298,3 +300,5 @@ void __attribute__((noreturn)) arch_panic_stop(void);
>>>  void arch_panic_park(void);
>>>  
>>>  /** @} */
>>> +
>>> +#endif
>>>
>>
>> I think we could also consider #pragma once, with the same rationals as
>> in [1].
> 
> Yes, and no. It depends if you are aiming to some e.g., MISRA-compliancy and/or
> if you don't have to document the implementation-defined behavior of pragma.
> 

Might be a point (not MISRA but non-standard). Then defer this for now.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/37da2db9-cd0b-5729-c948-ab074f186b28%40siemens.com.
