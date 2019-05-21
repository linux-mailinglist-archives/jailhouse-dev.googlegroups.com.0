Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3WSSDTQKGQEZVJWUIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BE1255C0
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 18:38:07 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id z15sf3246948ljj.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 09:38:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558456687; cv=pass;
        d=google.com; s=arc-20160816;
        b=n7zk6AUSwb7bDjGh520d+no3EpNKWZqe3Rfbo7ZhcW8geQEsjPuapyvMX3ikVbGCcP
         3WdoHPc+gjNe2NOz7FM7UCqeKWtyN256Lc6LGDK/u+wLkAzGPJu0qGCYiT+7k0PlDTe5
         2qrqyn1dHWK1U4gok8BFrO6bUp40JYxq4WOTiYaJp0vCeocyE6GGKTupg2LRqWS34FJM
         UGRoLoqcovtBrM2TUOXkh84J2vITORzDf2xuSbukMqmpXll7IMmpFbCD19XmGRkYfSkN
         iBR+bV1JL6CsUDs5rkpdciSVADHj/codRvXtASvfK9JebtEtfxOk6IBomIIiq2wC2JVD
         wroA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=j+x3jsdT2ZPcMyaT3yMUQqyydVaal0Zn+zxiiM43vlE=;
        b=KQGQaEZKlq0Jp/AfD0h3BTWYYRkOovnqO6xu21ZWqDtYhPei1mL5VFoRHgayChxgD5
         clhFGXLpqJYyhTWQj6Y+ljgzLW6K0mg+15qyQobmuiZRZSXdPK2g0u5wYmK9FEXy3XKd
         60xlMnl1idWsSqg4lPSIcx5OKe4H4BWc0AIycd0RH7hPqqRd6okfjb+58Z9DdtGQ5dCe
         H8Hqd5GTk7MJN6joU2U/JOB/j61Lo1vupbscrehKu7qjKNrMdjga6Jrx0KVdX/6cWcyG
         W4Ip+9/JD50tC/brecL/5vsV9OTRZQzNFz7EceiMx6VZuLY8jDcbZYiKcpMJ/3VxcHhn
         ufcQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=j+x3jsdT2ZPcMyaT3yMUQqyydVaal0Zn+zxiiM43vlE=;
        b=o1VfVFKiqTeI8nY8iL+rSuIEBVbBF/oo1nApbQVz90BlDFAb/8CTH8AKtImSDxxNeu
         khBEAHzC8m/3opc+//Wi3Mq5cETQaMIzvY6pfE4dpEGX9I0f3NNcz+tKzfhnGKRXXwGD
         poPUIJGYNHJG4pfago/VFQB2CsuYhUsBIWpfNwm6Mx/ZlYXKuzmHTHr8rUUnEp5flEiP
         11mFUUugR78tYF4PdsqC4EvEzPTwjFdVsGr2iB+ZLag8OqGt4dFfGEuiUu5gi3Ha78XZ
         ujZoZXBE5gTiwxkCEUzvA2DvCW0Tfiv8aAV98vbSBp0mwiEuYeGiP1vXyi2ujdcy7knZ
         mkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=j+x3jsdT2ZPcMyaT3yMUQqyydVaal0Zn+zxiiM43vlE=;
        b=QlgOrRSXEojL/yaFkRxIpbxwiIy9ByUSDEluk3aQNumgBWzH2PvvMSUcEWcokqbOz1
         yremfl7KqvSB8W7wMgyv9LBnYC6EnLjfYfeLWmrU5H2t3UXl0QRysuBbtqlYH9JFh/b5
         JKJP1LnkUAUo7FCxU4t/TuZLkV0RhKMUS4m12BR06weg9Uvij7wq9u7Nl4Z3qlDF/79D
         3l8ERYoF7YSIOYs2TysSX0RtmHjYm414xB2lQ5EpMcbclELqrZm5x1e01LThdxCDdtGk
         rXQWVKYaiNN9XyKskXGZ/wKIqbh4Ig+GqdGDu0eM06FkBhTp8GeO14BF1Ex2jtZQoFdm
         RFpA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVjm/VKSHXNuiAHQMX0YIJhXneF+q/gjT9BM2hy/OPa7VxxIZVq
	CewYObkAj9LakTj7KAZDCcg=
X-Google-Smtp-Source: APXvYqyOxudpKlGLd/dCJo0AQ2uWwqfbLtlORcdnxrWIbwInStSRz9KMIPf3DkxFah4UIzDWjFl2+w==
X-Received: by 2002:a2e:8143:: with SMTP id t3mr17072915ljg.131.1558456687282;
        Tue, 21 May 2019 09:38:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:909a:: with SMTP id l26ls2337384ljg.3.gmail; Tue, 21 May
 2019 09:38:06 -0700 (PDT)
X-Received: by 2002:a2e:8816:: with SMTP id x22mr12686762ljh.169.1558456686206;
        Tue, 21 May 2019 09:38:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558456686; cv=none;
        d=google.com; s=arc-20160816;
        b=dKXF1siN1R91im1lf6D6R/+Z94bKVOOnoMLC0+zK39ncpNc6BQlBtM6IL6f/J/2GNa
         LQW8wPuCcIzp8aUbuZy3P6KzXk8fWwrEK5HMfvLEDjEbrgbS95R9jZm2quxL4SBADke9
         IanyCkKQD+bigohYfzEXQaz6DRzFPfEhxawHhKGYI9iJMANPicv6lhRSkWqdaSZlcLk1
         7XR7czJW3OwxJG64XZvXtwSfPQCvNrAQ+M0nZGe8O/KzpDT6bOb2OgH/pNvtwndun/nh
         1/jr40uOZPUxgdT1bRUL4HZznh2GKjkBrbFhBq5fbQlNiYxnft1V4B4kFouoS2Mu490l
         HI0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=DTwqTJ/xgawDj0kbydv3TtzbTgLasa31leRlaF/Mt20=;
        b=wajSCm8ADFPJEmC89Qfm4baEZaVEcGScgxezQxG6PNvI7hYmXDjX2+zu/AxuSUzBfU
         //HaqCaprabqomE0apCVIup8RB1UE+lLdFoS1JbW+6UnokCOp5oWsyuQIT1vrz3clu63
         TuQXWSC0uqSZUZ+IWKu0227wLs7sM4iwXom4fS4AY7V2Ddpjzm4cPs7LG+M05XoJB/cE
         FyMjFHNgsDn8JMe6stGYzS2vXh9msMvmZXjIiXbPVapNCunAWmCfjuhW84FyYUi5YEtT
         p37KrqybiUTDulWn0bEqGN/Eg+6/hqs4LuOwpw+gmr7QciX0yLiGerQSJ3Hg8/tbaMQv
         ceQw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id m17si2143653ljg.4.2019.05.21.09.38.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 09:38:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x4LGc510022509
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 May 2019 18:38:05 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x4LGc4cx012816;
	Tue, 21 May 2019 18:38:04 +0200
Subject: Re: VT-d: IOMMU exception with unknown fault reason
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Mario Mintel <mario.mintel@st.oth-regensburg.de>
References: <4eb2d565-fa3a-4742-435b-d4fa1469c60f@oth-regensburg.de>
 <fd82641f-4f35-3674-af69-68fb41624fd8@siemens.com>
 <db894a08-8c3a-cb64-2c84-ac595f02b6e0@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <339bf164-d7b1-f9ef-2023-b6fbb9d5c098@siemens.com>
Date: Tue, 21 May 2019 18:38:05 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <db894a08-8c3a-cb64-2c84-ac595f02b6e0@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 21.05.19 17:55, Ralf Ramsauer wrote:
> 
> 
> On 5/21/19 5:09 PM, Jan Kiszka wrote:
>> On 21.05.19 15:45, Ralf Ramsauer wrote:
>>> Hi,
>>>
>>> we have some issues enabling Jailhouse on a Intel with a pretty new CPU
>>> (Xeon Gold 5118).
>>>
>>> First, the CPU supports PKE and Linux will enable it (CR4, Bit 22).
>>> Jailhouse won't start, as this bit is marked in X86_CR4_RESERVED. Didn't
>>> have a deeper look into this on how it affects the hypervisor or
>>> allowing it needs some special treatment, so adding nopku to the
>>> commandline will keep the feature disabled and suffices for the moment.
>>>
>>
>> Known issue, see https://github.com/siemens/jailhouse/pull/23
> 
> Aah, I remember that discussion a month ago...
> 
> So I guess it is okay to allow this feature.
> 
> What would you say, is it better to use a configuration parameter that
> indicates the existence of PKE (as noted in the github discussion, we
> should only respect that bit if available), or online cpuid discovery?
> 
> I guess the latter one is a bit against the philosophy, but much simpler
> to implement.
> 

Checking the code again and the comment I wrote around it, my remark in github 
that we would need discovery was actually overkill: The whole purpose of 
X86_CR4_RESERVED is to filter out future unknown bits. But CR4.PKE is no longer 
unknown, and it is apparently safe to allow it to the root cell. IOW, that 
commit was fine (if it had been submitted with signed-off here).

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/339bf164-d7b1-f9ef-2023-b6fbb9d5c098%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
