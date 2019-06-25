Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBJFRZDUAKGQEIWCOMGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id DE86A54F52
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Jun 2019 14:50:45 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id 12sf3076286ljj.17
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Jun 2019 05:50:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561467045; cv=pass;
        d=google.com; s=arc-20160816;
        b=kmv6Y9PqcCST+1M9ko8sIJyF3eIHp8uAQaculVy4RLC26o+u8KK52IO4yHKJ+8H1q8
         Z2Y7e7CLBkkwxQv/7/tSy/zsPjO/LtKhZF7QgvIJo1HPBr5cOUWhCP32aQ/hOWbS1zLp
         LsrkHcMrUcwGJ25pEZhgeHCHvatwvwK2C20xnui8O2OcisUixgfbAyEHvjd4Jx+J4uR9
         3GApSRHD3fX7Z/Mz1/kzXIwd4aoBRatkdBmH7LfGmQtOP6W2uZr1lkmeVHmeqEKH7iLw
         EwArZWzeBhhbCWpCnMLgQvACTTlW6QFNx0Hy/ZarFRiFF1ueNdHgPaKPkbHuXz9Gjnyq
         nVgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:subject:sender:dkim-signature;
        bh=AhBSbTTAxbFVjUIfbb7eYSYMww8lsUq3Swnt71VC1Pk=;
        b=QIArCO5bbS7jyHqFhnVvTl6DhVwhX+yNcaF9So/R6IKWdHiyth7BvQ/9G6UDbEzdN+
         4aVUWpvDZuXK5WXpMRCrOdIEy+d77QXOVUfiA6gF8n/pIJJYLEIP9JA3lnlpgAyrSwc9
         sagq/+JBB1wKw8FUZTVRjSpRcCbGOcHvfvSvshNwCQtrw0lsGmMwb0Y1HMz1f5z8VomH
         3w3+rCOUiPx/oRZHnrehFXh4y9vlCIUj1vMMfdxTgk+HANTqixKoL9irjYFZMTEf8/Nc
         D4mJEjBVkWXuB0GyMXrwwc0VMJtgKgwXx4Zj3SitT7eZzUJQRv7RjZeVVWU2yEnV5yTY
         nTHg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=IpmW3jfy;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AhBSbTTAxbFVjUIfbb7eYSYMww8lsUq3Swnt71VC1Pk=;
        b=Tc+pae5yRWFNiG7pGEPJd1OHDSYsZJ3GnT3f21sF4at4OUAeX+3m/LV4gg4v8/lbg2
         20/e7g2LCEZcbJ4fbkA/gaK5Lc8xhsrLn+1X7tRIIACBCwwYwFcM02BrbNG8aHXtw2Oy
         AMNbvWW8g9oc9DTryfyHnntyOW4mumVuHh1GvMPgryWnf3ZBaNvaVfcywy3DsUR8TAFT
         U4CGfvftvaOzxnahm7VRRG1Z/UuvImXA9FVmZ4BmicqQ3bfULBB6x5mBZQt0O8OjC08b
         1YXYAPzgYrxmd6VaDIKS0uJX5nvcTYdczApaQ79QHmUrmE6dj0klWkkJMqy9pxr+JTj2
         Ma/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AhBSbTTAxbFVjUIfbb7eYSYMww8lsUq3Swnt71VC1Pk=;
        b=AsuDtFjPMeykBON3Liu70g5WoTBk9ZRMU5OB6UI7yeMJQCt3N08oBPdMFrOLL2Jo5N
         1FpafyGBrH388wX0fh568pp+g/2x4i8fw3n/1GegrHCQuaaWvzDN+DRc2Zv6vt3TOfPy
         B05IG54c9eTF2rqA07Muo+r+duv9yHr1+/hWK/Lt8VuqdnFqVcktrX35jYiSw+ZOqlnA
         N/gEbrF6C3MjOEQpRRhz3WtgE9bVqqcuL0q4/SskD6EloNiJ+toXce8Ig1K5QMiDNzlY
         VZ8uqJ90+z3uXUR9IIrpYHCzZAq4ovwCs9VByOQmRXaGqZz9BAaX5ULYF7Trj7yi0L0j
         4AnQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXTSDgFQ+ZMaJr5tcnl90nYNnBEIT6uhNDXi0alp85mVFjDwqZy
	SkRrdSilBNTbjB8la3WB8N4=
X-Google-Smtp-Source: APXvYqzGTTCPjVFmKQ8mh3MYE2PHfiIl0lPmq7yV/u6XSD9eNKYOLtMthWcdjd8dkTXH9Wks3/Nqvw==
X-Received: by 2002:a2e:9e81:: with SMTP id f1mr10398ljk.29.1561467044446;
        Tue, 25 Jun 2019 05:50:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:281:: with SMTP id j1ls1718682lfp.12.gmail; Tue, 25
 Jun 2019 05:50:43 -0700 (PDT)
X-Received: by 2002:ac2:50c4:: with SMTP id h4mr25093482lfm.61.1561467043853;
        Tue, 25 Jun 2019 05:50:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561467043; cv=none;
        d=google.com; s=arc-20160816;
        b=RbT1XznkMs9DKlMzUsrPODlHxE0HJsfrQx15W7o0Vw4Qzn+DJECX8/p8mB1QVpCKzA
         8O9j6RDdDkyOHwSXC1e+H+BJT15+reAgiC1y4HA11whxln3Ik8TJ/NyHLmJzHv4lVI/i
         XZejnW1agaireRnxCbl1kn85k2tP32EPjWeYs+WnDQtPCebM8HCBcBeo6N9EoljbC7LJ
         DINs3wJTCdDVC6dWvDKLC2Lq91sMn+XH04NBc/gBDdRJATt0Utg6+k49e33puol7vtMQ
         Culmusqpt9VzRgl594Ms7SsXSTdx+4NsQRxb69RucMIdh3/H/pTm4NGvBpUbVH8e7H4X
         BKyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :subject:dkim-signature;
        bh=tUsiKZz3MioplL+O82/OfQN6N/tAAWtcSWcP2+c4XPc=;
        b=euQ5OegvuDQP+uzZsG0mr3UUTDP1lv2T3z8tm/5ptI1BMF9KeOwoVuDQInUcnRg0pf
         fNj+6ZPejqc9ptmoP+15LgszKRujsR01WbhYIiqETU5VV3rIzbdjd1+/f4zDFLEeprTm
         JZe56++vHgLk9YuGROzfWFuRhmDOrxpor0yedOpwaV1rl1/rV5plyp9UtoyJeBajJDZL
         0APcuKt64+kuIxV3F7R+rvtPDIa1ckZkp+KLuqLUiryXgceQryqp4XJrrZhInK90+VKl
         I7yp67PYmtSJiD1cLAWbOfvp0BOMBGmDKxq0Jo2nTztVoNEkLvLjnZxhA/VSdol6ufNK
         6Shw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=IpmW3jfy;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id h2si806593ljk.1.2019.06.25.05.50.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 05:50:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45Y5cL57g4zy18;
	Tue, 25 Jun 2019 14:50:42 +0200 (CEST)
Received: from [172.16.2.24] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 25 Jun
 2019 14:50:42 +0200
Subject: Re: Jailhouse enable hangs on AMD EPYC 7351P
To: Adam Przybylski <adamprz@gmx.de>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <d069200e-ba34-41bc-854c-8a95d62f2596@googlegroups.com>
 <ca059740-300b-f5df-3dda-65ef289599f6@gmail.com>
 <b22e6a12-a5df-c698-d4ce-652c5376ee4e@oth-regensburg.de>
 <20190621155406.18df2751@md1za8fc.ad001.siemens.net>
 <bc4047f6-c6c7-4b74-9084-51212c8bd4ad@googlegroups.com>
 <20190623183232.084b6744@md1za8fc.ad001.siemens.net>
 <98b65827-1a4c-48c7-8501-8103ee8e9284@googlegroups.com>
 <af790385-ad03-9fcc-33bb-60dfed20e169@oth-regensburg.de>
 <510bf146-8ec5-414d-8a22-33d61476ee1f@googlegroups.com>
 <e0d7a082-bb03-195a-d146-4ba627a93be4@oth-regensburg.de>
 <27b260ce-0dcd-4019-8dc5-c757500422c1@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <121ab35d-79ab-5b00-9b27-473809a02707@oth-regensburg.de>
Date: Tue, 25 Jun 2019 14:50:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <27b260ce-0dcd-4019-8dc5-c757500422c1@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=IpmW3jfy;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

On 6/25/19 2:46 PM, Adam Przybylski wrote:
> Am Dienstag, 25. Juni 2019 14:14:41 UTC+2 schrieb Ralf Ramsauer:
>> On 6/25/19 1:31 PM, Adam Przybylski wrote:
>>> Am Dienstag, 25. Juni 2019 12:10:03 UTC+2 schrieb Ralf Ramsauer:
>>>> Hi,
>>>>
>>>> On 6/25/19 9:38 AM, Adam Przybylski wrote:
>>>>> Am Sonntag, 23. Juni 2019 18:32:37 UTC+2 schrieb Henning Schild:
>>>>>> Am Fri, 21 Jun 2019 07:18:14 -0700
>>>>>> schrieb Adam Przybylski:
>>>>>>
>>>>>>> Am Freitag, 21. Juni 2019 15:54:15 UTC+2 schrieb Henning Schild:
>>>>>>>> Am Fri, 21 Jun 2019 14:51:30 +0200
>>>>>>>> schrieb Ralf Ramsauer:
>>>>>>>>   
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> On 6/21/19 2:22 PM, Valentine Sinitsyn wrote:  
>>>>>>>>>> Hi Adam,
>>>>>>>>>>
>>>>>>>>>> On 21.06.2019 17:16, Adam Przybylski wrote:    
>>>>>>>>>>> Dear Jailhouse Community,
>>>>>>>>>>>
>>>>>>>>>>> I am trying to enabled Jailhouse on the AMD EPYC 7351P 16-Core
>>>>>>>>>>> Processor. Unfortunately the system hangs after I execute
>>>>>>>>>>> "jailhouse enable sysconfig.cell".
>>>>>>>>>>>
>>>>>>>>>>> Do you have any hint how to debug and instrument this issue?
>>>>>>>>>>>
>>>>>>>>>>> Any kind of help is appreciated.
>>>>>>>>>>>
>>>>>>>>>>> Attached you can find the jailhouse logs, processor info, and
>>>>>>>>>>> sysconfig.c.
>>>>>>>>>>>
>>>>>>>>>>> Looking forward to hear from you.    
>>>>>>>>>> I'd say the following line is the culprit:
>>>>>>>>>>     
>>>>>>>>>>> FATAL: Invalid PIO read, port: 814 size: 1    
>>>>>>>>>
>>>>>>>>> Could you please attach /proc/ioports? This will tell us the
>>>>>>>>> secret behind Port 814.  
>>>>>>>>
>>>>>>>> Not always, the driver doing that has to be so friendly to register
>>>>>>>> the region.
>>>>>>>>   
>>>>>>>>>>
>>>>>>>>>> As a quick fix, you may grant your root cell access to all I/O
>>>>>>>>>> ports and see if it helps.    
>>>>>>>>>
>>>>>>>>> Allowing access will suppress the symptoms, yet we should
>>>>>>>>> investigate its cause. Depending on the semantics of Port 819, to
>>>>>>>>> allow access might have unintended side effects.
>>>>>>>>>
>>>>>>>>> You could also try to disassemble your kernel (objdump -d
>>>>>>>>> vmlinux) and check what function hides behind the instruction
>>>>>>>>> pointer at the moment of the crash 0xffffffffa4ac3114.  
>>>>>>>>
>>>>>>>> A look in the System.map can also answer that question. On a distro
>>>>>>>> that will be ready to read somewhere in /boot/.
>>>>>>>>
>>>>>>>> Henning
>>>>>>>>   
>>>>>>>>>   Ralf
>>>>>>>>>   
>>>>>>>>>>
>>>>>>>>>> Best,
>>>>>>>>>> Valentine
>>>>>>>>>>     
>>>>>>>>>>>
>>>>>>>>>>> Kind regards,
>>>>>>>>>>> Adam Przybylski
>>>>>>>>>>>    
>>>>>>>>>>     
>>>>>>>>>  
>>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>> I looked up the function which gets executed in the Kernel. It's
>>>>>>> "acpi_idle_do_entry".
>>>>>>
>>>>>> Well now you are back to what Valentine said. Open up those ports one
>>>>>> by one, until the problem goes away. The alternative is to disable the
>>>>>> drivers in the root-linux. In the case of ACPI i.e. acpi=off as kernel
>>>>>> parameter, but you probably do not want that.
>>>>>>
>>>>>> Note that whatever you allow might cause weaker isolation, in this case
>>>>>> maybe real-time related.
>>>>>>
>>>>>> Henning
>>>>>>
>>>>>>> Adam
>>>>>>>
>>>>>
>>>>> Hi,
>>>>>
>>>>> after allowing the access to 0x800-0x89f IO ports the issue with PIO read is solved.
>>>>>
>>>>> Now I am facing issues with IOMMU/RAM, NMI IPI, MSR. Please see attached log.
>>>>
>>>> You can again look at the system.map to find the code behind the MSR access.
>>>>
>>>> The rest can probably solved by consolidating some non-page aligned
>>>> spreaded memory regions in your config -- could you please attach the
>>>> output of jailhouse config collect? It should contain all data that is
>>>> relevant for debugging.
>>>>
>>>> Thanks
>>>>   Ralf
>>>>
>>>>>
>>>>> Any idea how to debug this?
>>>>>
>>>>> Adam
>>>>>
>>>
>>> Hi,
>>>
>>> attached the jailhouse config collect output.
>>
>> Please try the attached config on next.
>>
>> You can use diff to see what I changed: I consolidated some memory
>> regions to one large, contiguous region. Should at least solve the MMIO
>> traps and the unknown instruction error.
>>
>> Remains the MSR access. What code is behind the instruction pointer?
>>
>> Thanks
>>   Ralf
>>
>>>
>>> Adam
>>>
> 
> Hi,
> 
> the attached config works fine regarding the IOMMU/RAM accesses. Thank you!

Great, good to hear.

> 
> The function behind the RIP is native_read_msr_safe.

Well... That doesn't help. :-)

could you please
$ echo #define CRASH_CELL_ON_PANIC 1 >> include/jailhouse/config.h

and then recompile and reinstall jailhouse. This should give you a
stacktrace of the kernel when the crash happens. Then we can go on
debugging.

  Ralf

> 
> Adam
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/121ab35d-79ab-5b00-9b27-473809a02707%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
