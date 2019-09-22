Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB6PUTTWAKGQESLD6P6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 743E8BA197
	for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Sep 2019 11:10:18 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id m16sf338502wmg.8
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Sep 2019 02:10:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569143417; cv=pass;
        d=google.com; s=arc-20160816;
        b=wQxzXbBdR3n9ks3RslSjuxliMH1uy5Gg4l5xH4SxjBRSDMVBKldCX2JLQ+4zw+oAuY
         Z2eLwnEPYqlWE/azO+YZfKhpZcDo+QGcQYS8JttmPNJrZuSI1Tk0o+Ra6dwaLj5NmG/P
         1DNaXXJ40KU/VnnKvFDwQTl6XrSiWPFWWXL96jQjEp8+JpS/JmNXA71H1+QXILTO5Yup
         c+90JyofbiJCRt3KAowNjMiJaa5VLaKzBVXr3X5ivaXSWggM2OXf9bcI/SINRX7o1QQc
         sxlM6gY6zxyZMQSi4cvFsmH4TfSoOoh/cQPB/6icEV5cOVBVymFYkQd0dv62gNOcowS4
         42NQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=SPn1bYozBb1qhp+eZ2Zy0OeKQ+iB1Uk57JCgISledOw=;
        b=o2ID/OInphSiRWtQ/I1tk/tBhxRnLbBF6tJb0ZZaReTS1RIMEIxCWLSi+snc4pLHZm
         D5yNDKu4TFojZiijuDlu30VN5fYr81tKI7/RTek88ARghamueQ/ofepnMWow9oRc8bqQ
         G6lWhDRmhKO9rFozEGoH4AtbBxdHohz9IPXVuNwoiRYZ3tAXie185tEVGzLtmKWznOBY
         YlTm+D9RNF4Sy20dnePIXRax7XSTlAiL98ZM/K00UWJovdw/Rb/TGtH4+vMp4RHZp6Wk
         NQON7CuxRi5PQ9P/qWGe6yEI8kAydGbsCJqUQVoe2w2wDaym+Jc262R5eE2PgZSA4akm
         SxdQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=oB334AsE;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SPn1bYozBb1qhp+eZ2Zy0OeKQ+iB1Uk57JCgISledOw=;
        b=sw84sD0l4iSi4h7gZ9sGowNR0GPUr7boRlzIkPTn/B7eJxT0L1yWb59Gxqu43y6oTl
         oQhKE4f1Ym8xPxy15St9AVnwIut3yzS9UygD1We8sIAJVmjzYGocloPOrmY+0orFMde4
         yFgJ2AhS1aS647zLXHUin2ek6mI60jhfGP6IrIEzmB/qKxRhqmI38p9Lc2wGUidy21l8
         KCEs+QwDN+nttrhO2l/0SDnE+45N8LHimakP7p2OI8qviYcV5foPrG3UG31vwgUrfR5U
         YJlZG7k2beHeHf5nxNKJvp7atwEclWCSHObiZ9jDo8gbik+R7dlEN9TDxMIDNLtlVt8p
         V8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=SPn1bYozBb1qhp+eZ2Zy0OeKQ+iB1Uk57JCgISledOw=;
        b=GoKO07X59gdONL5xtwo2JJT1kuHRzMpVuLEfFHPaau8gSleA+ulZVivKPC270x6A7K
         neMNQiei+XVdK4wsI7sJdmu2a9vH4o/KVm4j9mfIElgB3z37Z4cLcKVFSx6C7OyNtR+x
         yLsP1Bis8+sb4PCIKZPjPxEtiGeWjazmGCRnRCvnxFqV5TgXl0gIXPTLEwSOqWVEn+pl
         MaZ3riianouMUHk/4SWJEnXmSu1hDunCjcwUvDl491mRGd6XU+W+5rTqLoFAzSnJC454
         00Yu21G5n2nKf3t+8pSywcywJje9FPGeNvSoHeGWoXFXTIKLZfRqQbF1zCCnuAmIhtgs
         IyUw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVH+L1qARVBhEdv6HyEAX2Pn4Sr/UoEUb/qC/u3LL1vVxqUS4Oy
	WcBpGKGg2ubbTduNLPEXEZ4=
X-Google-Smtp-Source: APXvYqxN7lVGN1oWMIIea8ih1X63qSmGM9Dn/7i/JsAs0xpH735SlesytoAKA1O9LWVdJIOgCAZl/A==
X-Received: by 2002:a5d:424c:: with SMTP id s12mr5559806wrr.221.1569143417830;
        Sun, 22 Sep 2019 02:10:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:ce16:: with SMTP id m22ls3032795wmc.5.canary-gmail; Sun,
 22 Sep 2019 02:10:16 -0700 (PDT)
X-Received: by 2002:a05:600c:215:: with SMTP id 21mr10042020wmi.170.1569143416817;
        Sun, 22 Sep 2019 02:10:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569143416; cv=none;
        d=google.com; s=arc-20160816;
        b=stklW/04XabC9iycFCkXFQkHhzrWtc7xnPudQqu4m6/ckH9o2/gp2DG39t42/n4g3X
         EZOpQACmc2xk8p3hv+EO+pN3kZ+EvuVqM8uv6U3sSYjhrg11IArG97AKRPJxY8YFmepr
         XpS9ZKN4wB0nG2W34c/Rmw/6k5dz2nKgbuVN67+ZcqPdg6kCP0U14XQua/Lx1WgHApck
         LRnu7R4RHJX7M4Xmz54v02iIUaOsUQCWqXjYuTCLFb4G1XtSY4WqNqHFQYr7qkxpeH6i
         vxsPM2NbXfdgG1wnpqVRu6uW617hBdJBPE/AOYkJCv3ZL7q7NMKLdEtj8ODirR9YZsO/
         Sx6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=e4439fyeb8ydOOLSsRLFTj2/vhNAQCD/xeMrqoF5g/0=;
        b=OiG0Junath3VVlLuwAk+XFLChARCCGUu5312hzQkL07JxLXzVMl/1qk8m5Rgf0Z+hb
         wwLoMSpGumZ1s6KvhCvkYEJQeMWemLRBpDhvzW2X6ADriMNeWImWwjaj0DgEX69tm3pS
         IxGjTNaCmuWRgzxvrAmhoig7wlDJpPixfp8RUKy6DgqyPPaTEPp4gRgEpf5kaGoPjAJG
         wspaFl9gNOwxr26os832KimclqxBL49zJl9cM0HV+ntqk9x+FTT1MGo5z/rMqRbnu234
         r9NDH9HxgLxAh2K9a5g+Zc79MkbHKpOxEKtUGCNVa+p1heq1KCD+5zfbfDBmvtTuI9fT
         ArfA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=oB334AsE;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id t15si442832wrs.3.2019.09.22.02.10.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Sep 2019 02:10:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LrsGE-1i3sgA10ve-013ghe; Sun, 22
 Sep 2019 11:10:16 +0200
Subject: Re: [PATCH] driver: sysfs: fix parameter usage
To: Henning Schild <henning.schild@siemens.com>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190920145644.2169824-1-ralf.ramsauer@oth-regensburg.de>
 <3814a06c-155f-a3f0-9c54-bb2246e19e80@oth-regensburg.de>
 <20190920181658.64f710cf@md1za8fc.ad001.siemens.net>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <54df428a-f4c7-fbc0-d641-cbd31c921405@web.de>
Date: Sun, 22 Sep 2019 11:10:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190920181658.64f710cf@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:RRGbo0h8+NHFWbluDBJQeYcllc+L67VcFB/nZeAjFIWE3Ynj12W
 3WIrSqmGYjRBcKBIVvFE+NuwVtpELPmuwRQTBTGk4KTXseIPm8hVOUXgzKHwRn3x6PF/71c
 0mx6ky6GNTClIYPUgPkPIBvoNIBGlnEf8JplqALHWoqJOr9gRCoq5b/pC+3EN8lmQyO+WLd
 ZTNOR6c6S4p4k5k/saOvA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Km3u18Eo/O8=:wSTsplcxASMlz8c8M2BkgR
 oI7KZGpmNojsVg/bQyzq5nF0M4tbG28PYw8uJwJaPhiczcYyAUj045lFLpGasKUcMvaNhjKbz
 OpVtsJOqt6IzEhYxSKWCHVvQyT8SerYTOhT+N5q6b8PpT24Z+uEIzHN5w7NhCXUmrAFW5zFPn
 Rex8bFZURXJD/6thqaPTYH4TTvA00JKLnsOno5XGptqlBN3CdNXTd/fEFdir0v1KJmwdt8q+/
 TWO216y73VrGqKuW6l+L5BvQcTl8O43bB2jrWjf+OEGZGjzse2S3WgKB/1Iq6h6rp10dXSZlE
 r3w/atNkD3atZVqZE/FS+MflE6V4xl7WrCQp5M4pkGnlHknE4tSnAEtNsnOvFe8J3DBxkL5rS
 qTW5XRTjEPepPc6Ah9ZE00hE1cptcj9PKYDYF4d8VFXhPBL446OR6KABvw8cEKaIiu9stoPyX
 AaJXa4canblWT7bYRbJsSmV6Yk7eqQht2QeZU8PDHGtDYFp3aAhNdjE5hXkMODwEkE+inunTK
 mECvTkUJBIreZALlnUJfe8BJO+XiT2FdOcJh2hlLae+cgQ/IiouF2Q/TfpkvJnZ+V/A05JygU
 4pMmsfE95xtdybntetFkQQG/Xo2cJ33CLftKzuX/2C0rwQ4AGVRjsdcZqZtBMTBLxQS4bDCTD
 MnmrL9kUGc/bBXlfKf4nRMmwNo3xNOlpxq3AKyo531UKxw3DBl49ehYPbwIEHLLS6bsTbXd7b
 Hr3NNUNYjFnjIbZpJGr1rYRNbI7Dh5hBp5InVG+fy9YCWlcghrY79fMR1nx0atgyzNL1ucKfO
 9c5383aKN54gzawvFhIY/h1KPJQiH1XLbhyn++Q/KoPwC9gsCHXJtasULaiRtINiY2ZtIcZGE
 jykVFbeOa5gFQv3csJIYNrLmVYSW9x9TBbcBw3benjfRy0wcnqxq3aG5KT59Iny9VX+XFVDjL
 G+oHNRVvNblgyDDLa6/okA5Q1AaH+WnnZcV+IeSpfPbDtVD/S/qTPwYv1AtsgIbrWbpiBhDxN
 7itIRD/Vpdh+UzBGhG4TJRtOK0PJTFqbofQ25WdFbJJgRuyQHznzYSf7a6CPgFLWftUjn9v3F
 JH2Pbr5uGpbN5lIsyB3tBmhMOXDrXsklbsz1F3mMcqhCBEbfFI2++mOL2IAUOfvScMaR+Xj6N
 Kz/Znc2MkchpZkppW+j7nPjs6buVmBoLJqHT2GM2pDhTxz01IvygNfsQPDEe8kUqfzf87r4m2
 H7mG9anF+is3HLlnj+c1l0LR84VeY+xB7hJCpazvmPWYr2nMOeNTuoDvC71E=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=oB334AsE;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 20.09.19 18:16, Henning Schild wrote:
> Am Fri, 20 Sep 2019 16:59:14 +0200
> schrieb Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>:
>
>> On 9/20/19 4:56 PM, Ralf Ramsauer wrote:
>>> find_cell_cpu gets a cell as parameter, but ignores it. It only uses
>>> root_cell.
>>>
>>> This bug never had any consequences, as this routine is only one
>>> single caller, and always gets root_cell as parameter.
>>> Nevertheless, fix this by using the correct parameter.
>>>
>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>> ---
>>>   driver/sysfs.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/driver/sysfs.c b/driver/sysfs.c
>>> index a272ef4c..a15a2787 100644
>>> --- a/driver/sysfs.c
>>> +++ b/driver/sysfs.c
>>> @@ -353,7 +353,7 @@ static struct cell_cpu *find_cell_cpu(struct
>>> cell *cell, unsigned int cpu) {
>>>   	struct cell_cpu *cell_cpu;
>>>
>>> -	list_for_each_entry(cell_cpu, &root_cell->cell_cpus, entry)
>>> +	list_for_each_entry(cell_cpu, &cell->cell_cpus, entry)
>>
>> Found this by accident.
>>
>> Now the question is, should we fix it in this way, or should we
>> entirely remove the cell parameter, as this routine gets always
>> called with root_cell.
>
> Without having looked at the details, just one caller with one arg
> sounds like over-abtracted. If it was not factored out to make the code
> more readable and less indented ... i guess it should just move where
> it is needed.
>

The reason for this help function is make the code more readable and less deeply
indented. We could hard-code the root_cell, but then we would also have to
rename the help. So for now I've applied the patch as-is.

Thanks,
Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/54df428a-f4c7-fbc0-d641-cbd31c921405%40web.de.
