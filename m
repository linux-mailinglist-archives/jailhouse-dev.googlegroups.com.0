Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB6XFY7UAKGQEWQZFOAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 7063652913
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Jun 2019 12:10:03 +0200 (CEST)
Received: by mail-ed1-x53f.google.com with SMTP id n49sf24865165edd.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Jun 2019 03:10:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561457403; cv=pass;
        d=google.com; s=arc-20160816;
        b=FyRI5LmQV9BCfEa9kVqFdEOOu5sqojoMGVPEC7Oi1icIudI9npO6iWjJSPmYl2UcQR
         jeIev8kwOeCE69IMIpWCeUwQ7HBTfVsLMzIpxgs+AkLdHEN47zEJTNig+uCTUPGuXz2V
         /vrWG0/uGOGEogOJ7d4O8tZxDqonIzlHEqZGfocW61k/cujuVHj2KxjyNtORZjOn7Imk
         5iQSS04eRVXDYknp1Ocs1nSC4L9Jo/x1ii3prFVkEiXJQcBeYd+cMGJ1/Xivyyxumofi
         CNOLUbYxuT2WKi2Jq39mmA4Gev1N+mqwH6im0DGcWauIsbhVoRleT9OB/7KUI2NYWBhB
         0Ziw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:subject:autocrypt:openpgp
         :from:references:to:sender:dkim-signature;
        bh=ZyBYppWpdXxqhy2+PEdxtwmJMqqY2SM7GJXTBPzA5+w=;
        b=UeEGmbtrPWlrHNRUuTyawltKV8sGAJ9Alf51ydJw7dWQbb56TsOfzrpp+zu0rh2uCP
         JosReovNwe1zzPXZ+D57QMbcGf2r+vqVcF7/Kw10enL55WJtLCxdsnhX8szNXTLO3Wb1
         NNXS9dmpdijI8+53my0y/TNHTcfedZhdsDWzUqcQPQI6YolPNxY+NPwyuXeyQSet/wv3
         vqsWD6HMtrKG7bpUcuFcN1mCl570DR39CYtBv7QfuHw7F/7+Ql6w3zlwnoMaPyCPQFv0
         pw4STr2Hd+zWJ0dyfbJRo5l1J7QTpCOLbuu4V0BpBj+ZG2wRl9m9qLzpyYRgLdDitnPE
         tykA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=MfDiULAc;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:references:from:openpgp:autocrypt:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZyBYppWpdXxqhy2+PEdxtwmJMqqY2SM7GJXTBPzA5+w=;
        b=NqhWUrgrx5+j3O2+JNEyuCAOWaJCPATxeB5WCI8ABPP4sNNS96CLg+NM/LSZ1fQikI
         IdFwapGPzDoh6XRVYcBgs6G4ZL4ShAueEgW/YoDxqRtEyfne/RB+vFpXf4vkGwYAkuoV
         Z+mK2iJIvXZ0OVNqM1Ba/uqAbYebBFHSdtw4KtFCxDo22BaVH1xsf7PLZCCwZmKYgHk0
         JoNUiVq03/X40zpP7p+I1iHJW8hQh1tTpLvoQ0rDmhi3YpxMMskXIWWguRWPwzSFEzRq
         TyHQYRxS2RFBPcd3LBcx3cpJ1otv/enT0tsWDYRNgIAwp51fFoYR+hkUI19Ro9cS05Ln
         5F4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:references:from:openpgp:autocrypt
         :subject:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZyBYppWpdXxqhy2+PEdxtwmJMqqY2SM7GJXTBPzA5+w=;
        b=BX0Sd/dmmGaZEcdLIrw1Jt9g1RtjttdrOTYEW5HCBgB7SGTYMf3bpWYKL5NfcW2qDH
         1gcfdyecwWKf7dWCM9yZUiM8LjUaQTVol7N0fPIYAm0jp3lR0/3mRbjBDhxwMkTGtl1f
         v7QBqULRHi1Jr/7N2kZuXXabcmGXdaidvZHYRqAs+tuoGox5Y7u4ZnzYvN11Z0yADvbO
         J2mxNw1NCDJLg8RbdXcu7pndPL5IpXhkJPsUZBKJHnjxDJ27fsErBMtATLi4YE9F/wFT
         cU6bgdT+YVOrLJYnVj1zytiHc4a65so8B/HawvvqISaqmSF1kcHKsDNlp4nT54oqOkAm
         cK2A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX4jZsUyz2ABXXqwQPZ3k8hFIcABGLhBrSM5d3OuZNilzVCTyJK
	0aae/X+U4Qynk+XlAeGeoj0=
X-Google-Smtp-Source: APXvYqwyvklfLjBciFr0ou7JlbA08zldy2IMTGzZiAPgnvO/KXQjFBcCoq9S+eanA35QpoCRFN8SAQ==
X-Received: by 2002:a17:906:4555:: with SMTP id s21mr26236752ejq.199.1561457403145;
        Tue, 25 Jun 2019 03:10:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:b4fd:: with SMTP id x58ls370120edd.4.gmail; Tue, 25 Jun
 2019 03:10:02 -0700 (PDT)
X-Received: by 2002:a50:b66f:: with SMTP id c44mr103550646ede.171.1561457402423;
        Tue, 25 Jun 2019 03:10:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561457402; cv=none;
        d=google.com; s=arc-20160816;
        b=rHP4kYgcNo0T90wWCrca+rjwuLo8ea7Ww6FWSfgagvJ7LJ37GGIOgiCqYMyQzY6Jwq
         wSWtM4oqJ38FT221Lu2lU/bniDK5cLXp32+X2dzYIko+Y0Yx2H7dyVfznDTtgj5aRrHN
         xLHavxvqYSHf27DSCsRU6yoV7Wzak1cqDUVzKPdHKDxmOvRBeZ1JVfPhOe22LCFX2Sgm
         JS+Mhi+AWZaGLMbVeWNzGj3BU+XlNStk/pMJyG0ROLcktGGePIlcDbhRCzhMbbZ/b1Wg
         VxSWL61+kKyhenQYYFUUGA7rG3WmgGxOBvX6qXsJPI1X1GHKg2bS6WB68UwWVeqJLPuv
         A3Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:autocrypt:openpgp:from
         :references:to:dkim-signature;
        bh=hnVsSyR1MH/2JNhfn+tfrS/ikK6rlq6xFdAfC4eoK5E=;
        b=RQeUQDyeP/6mPgt3CKMPcnsXKk0qyu/IlJH8DTmmHfGeXD7BBPAZuDXHb46lFbDc2a
         fsU4M5WifXuAjwHA11Y9n4zxJug78TyQHZ9hObXjyLES6EceS6RK2Wtcp8M3P+aHuEmS
         Zz5MXvFet06vfhgqaNfmHyyB+++2zGqZviQLUnvKBvf4r/6hkB5UghWF6d64a4VGoEzo
         2KDeEoQO0coKzrVYscL5YhmzMHSPTUuPGDRqUTmjVJprbo4/juJCQA1/OGW5tcO9v5CA
         iTSqt/rRFyhK+HqRXBrlr4q5YQb9jttUZUtpgal2fuxvQ7m9q5y5u3v/kjSf5CWorQ+X
         2Qdg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=MfDiULAc;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id w57si873039edc.4.2019.06.25.03.10.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 03:10:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45Y22x6K00zyBH;
	Tue, 25 Jun 2019 12:10:01 +0200 (CEST)
Received: from [172.16.2.24] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 25 Jun
 2019 12:10:01 +0200
To: Adam Przybylski <adamprz@gmx.de>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <d069200e-ba34-41bc-854c-8a95d62f2596@googlegroups.com>
 <ca059740-300b-f5df-3dda-65ef289599f6@gmail.com>
 <b22e6a12-a5df-c698-d4ce-652c5376ee4e@oth-regensburg.de>
 <20190621155406.18df2751@md1za8fc.ad001.siemens.net>
 <bc4047f6-c6c7-4b74-9084-51212c8bd4ad@googlegroups.com>
 <20190623183232.084b6744@md1za8fc.ad001.siemens.net>
 <98b65827-1a4c-48c7-8501-8103ee8e9284@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Subject: Re: Jailhouse enable hangs on AMD EPYC 7351P
Message-ID: <af790385-ad03-9fcc-33bb-60dfed20e169@oth-regensburg.de>
Date: Tue, 25 Jun 2019 12:10:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <98b65827-1a4c-48c7-8501-8103ee8e9284@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=MfDiULAc;
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

Hi,

On 6/25/19 9:38 AM, Adam Przybylski wrote:
> Am Sonntag, 23. Juni 2019 18:32:37 UTC+2 schrieb Henning Schild:
>> Am Fri, 21 Jun 2019 07:18:14 -0700
>> schrieb Adam Przybylski:
>>
>>> Am Freitag, 21. Juni 2019 15:54:15 UTC+2 schrieb Henning Schild:
>>>> Am Fri, 21 Jun 2019 14:51:30 +0200
>>>> schrieb Ralf Ramsauer:
>>>>   
>>>>> Hi,
>>>>>
>>>>> On 6/21/19 2:22 PM, Valentine Sinitsyn wrote:  
>>>>>> Hi Adam,
>>>>>>
>>>>>> On 21.06.2019 17:16, Adam Przybylski wrote:    
>>>>>>> Dear Jailhouse Community,
>>>>>>>
>>>>>>> I am trying to enabled Jailhouse on the AMD EPYC 7351P 16-Core
>>>>>>> Processor. Unfortunately the system hangs after I execute
>>>>>>> "jailhouse enable sysconfig.cell".
>>>>>>>
>>>>>>> Do you have any hint how to debug and instrument this issue?
>>>>>>>
>>>>>>> Any kind of help is appreciated.
>>>>>>>
>>>>>>> Attached you can find the jailhouse logs, processor info, and
>>>>>>> sysconfig.c.
>>>>>>>
>>>>>>> Looking forward to hear from you.    
>>>>>> I'd say the following line is the culprit:
>>>>>>     
>>>>>>> FATAL: Invalid PIO read, port: 814 size: 1    
>>>>>
>>>>> Could you please attach /proc/ioports? This will tell us the
>>>>> secret behind Port 814.  
>>>>
>>>> Not always, the driver doing that has to be so friendly to register
>>>> the region.
>>>>   
>>>>>>
>>>>>> As a quick fix, you may grant your root cell access to all I/O
>>>>>> ports and see if it helps.    
>>>>>
>>>>> Allowing access will suppress the symptoms, yet we should
>>>>> investigate its cause. Depending on the semantics of Port 819, to
>>>>> allow access might have unintended side effects.
>>>>>
>>>>> You could also try to disassemble your kernel (objdump -d
>>>>> vmlinux) and check what function hides behind the instruction
>>>>> pointer at the moment of the crash 0xffffffffa4ac3114.  
>>>>
>>>> A look in the System.map can also answer that question. On a distro
>>>> that will be ready to read somewhere in /boot/.
>>>>
>>>> Henning
>>>>   
>>>>>   Ralf
>>>>>   
>>>>>>
>>>>>> Best,
>>>>>> Valentine
>>>>>>     
>>>>>>>
>>>>>>> Kind regards,
>>>>>>> Adam Przybylski
>>>>>>>    
>>>>>>     
>>>>>  
>>>
>>> Hi,
>>>
>>> I looked up the function which gets executed in the Kernel. It's
>>> "acpi_idle_do_entry".
>>
>> Well now you are back to what Valentine said. Open up those ports one
>> by one, until the problem goes away. The alternative is to disable the
>> drivers in the root-linux. In the case of ACPI i.e. acpi=off as kernel
>> parameter, but you probably do not want that.
>>
>> Note that whatever you allow might cause weaker isolation, in this case
>> maybe real-time related.
>>
>> Henning
>>
>>> Adam
>>>
> 
> Hi,
> 
> after allowing the access to 0x800-0x89f IO ports the issue with PIO read is solved.
> 
> Now I am facing issues with IOMMU/RAM, NMI IPI, MSR. Please see attached log.

You can again look at the system.map to find the code behind the MSR access.

The rest can probably solved by consolidating some non-page aligned
spreaded memory regions in your config -- could you please attach the
output of jailhouse config collect? It should contain all data that is
relevant for debugging.

Thanks
  Ralf

> 
> Any idea how to debug this?
> 
> Adam
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/af790385-ad03-9fcc-33bb-60dfed20e169%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
