Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBKNJXPYQKGQEGF5GIXI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EA514A39E
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 13:16:41 +0100 (CET)
Received: by mail-wr1-x439.google.com with SMTP id z15sf6017793wrw.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 04:16:41 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580127401; cv=pass;
        d=google.com; s=arc-20160816;
        b=zo31GUoxgc3m+CFifbhW9pwCxGEnrATRqdsN+GeAbE9/G+mOfFVxrvHGTVyd4v9COd
         6H0KxLIU/SAQ3AHFlYndGQVaCUXPQWpqQhXj65ZAveBuHnK8PUid7VHuvdkmIvdEi2Zs
         /+GUxs0yofqVrR5epxA3GTQYfMMvBUbzpxQoXd5y1FU82/g34NnADMqXi4l8UlmFTK0n
         I2fLnJ76+e/HdF/JFKMhQMO3tVI0IBxpOq2qO4QASt6SB7AjB041KE6kevNXAUifvyuw
         KLqdVYmCqPBYiSDqnCAxM34vv10DSo3ilavxjgcY7m1efpFtZH3vq17/2do7puDwIJU4
         CGNw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=Oogajv8HwQsFNRUKbGHeAGeR3mgGCMRKXWQ4nm/ePqk=;
        b=np+5kNraDCOuSqAtDthVdWkGHCrVnymfYo2ESsmEcuf67aFQ3r9Ax21N8xh0bF8dWe
         pzW+m8wrqyzTL8rXBxVMShPImahQo0lZr859+bIkarlJyX0dLfA2IkwShx1LP0UrOFIx
         MBrywMoJuGeNOv6ZxBdgVV9ZrAOn9iiiMxGl4Kc0NVkVmlLMjdjsB7jNcdU6sWkrT8mH
         44jhPgq5LP5rnkkWBVvZxN89Gk9WPIOd9U3z06tSuPbWceWvG5LXXHuRqSZpGmltVCr1
         +LIYiypkMf2fMUBWROJ8oOF8/A6AULUEDvnko+d8se3bn6tEHUXcmT1YDrZIm1RBD0Sz
         QwoQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Xl3O6u8V;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Oogajv8HwQsFNRUKbGHeAGeR3mgGCMRKXWQ4nm/ePqk=;
        b=tY4nVcReHBPZyd/E1+bDE8qbrLvDMeol2+QghoCe25xnuqIatUnFmjbDeP2QwUlyNe
         uf87W5I9dyG63GemqaUySfEn7ydg33wd0oi3Zuv7HsLtXZ9fnieVMHRXb9RAtRULEvMR
         eiw3k2ssJ1DN9R8YyiHKcw1E+TT4H4CTscp832EXahE1xcjz7yCrsq67eiZtSRbAtrBo
         k2RZNP0i30g+5aowD+UwPurMoKQxz3B5daFy8MyoXQVwqcolf7+Ds017kgxv50yYG9sW
         hdCazrJ4dH+vdA7cCKJ1P134xUYcIfp1wbJMTNeAHDJP3MZ8X63JgWe3FMAUK61uz4hn
         6RKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Oogajv8HwQsFNRUKbGHeAGeR3mgGCMRKXWQ4nm/ePqk=;
        b=jo9d3mPzCj4dlocDO2Er/Yo6Sqa7HH43jAB5DoCqnodTPM+hN8xVOfRko89Zu6L/Rp
         ubnxTHUDYOwfi5IINW6qODtGnheJlB0S6FY3pXF+/BrG8wtCmZk4jqIlzOIyXLXiMwxo
         uzuqblfymRrPj34QB/elzR3xEv7rh5V5kijwka12xQb76rnaP+7aQIXWPKSjD1MJVWK9
         jNOqELGEHD3P1WP1pyAJVP5e0eifCYX2cWC5VNJ7IXUo1f9aDb/0k4dicDUXDJtwk++J
         SB22L2/rFxiwza8wcEzYqgDmw4lOE3jFbYypSUmQuJ0xnRPzWDoxlzrGGPqnM+0zsNPV
         ruyw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWzUYVQTul+s6SKs+1D69hObpwB7XZlp6Ss8burXO4b0TNkrq2/
	kemfe2lRhdHyemXxkIoLzog=
X-Google-Smtp-Source: APXvYqxXBmbPfoKyzWIcQu3LjbucU2yG/YKAkg5ZI4JpOPkEOWOhefLuF/dKApXWEmt2+hc+VTbHtg==
X-Received: by 2002:adf:ef92:: with SMTP id d18mr20626842wro.234.1580127401467;
        Mon, 27 Jan 2020 04:16:41 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ebc5:: with SMTP id v5ls6555071wrn.8.gmail; Mon, 27 Jan
 2020 04:16:40 -0800 (PST)
X-Received: by 2002:a5d:6708:: with SMTP id o8mr22391957wru.296.1580127400810;
        Mon, 27 Jan 2020 04:16:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580127400; cv=none;
        d=google.com; s=arc-20160816;
        b=Ykaac40dtMnF+Rn4nsRdhmEbd0TwcfqbPaKd9po9fm6Nv/CmxsuxjSLPvrjJZ/AZLd
         3rjJJVqNtuBBQWOmhRH2EzMqG2y2XGuLquYB46CK0CwNSEHYKSRdSq5b7y/XBKGofpxU
         QGG5rhRiCH0/HUAtgbLPYLXLeanHR5nPku/q7DL8nuB+7N1V2wJ1D8z1/4CRNjS2BSof
         U8Xd/7SmvwVd3iS28f5BpRbCQFjgq0/G6XmUXDiuZ6rXIFFBk0gKkQA8PRl3pG0nzg/q
         2KMmT38acCsWfaTcUsZmUBv1E2ZlGQSLIqpc2/T+OKC3kT8nLF7+J8QpiLO2dsvfTbUG
         J5ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=h3oipMiPGXta8BYPLDrrhtZQmlJQjhskMrTQubL09S4=;
        b=fYfzbOwU/YizOMKLMNQQmlLqtz7RmTS2fROW9oYSaVPtvF+6EH7hUH7Y++D9OVkcCa
         BaJ90voIhhx6/UMw/43kCG39ZHisLBhTj6Z+wW8stihZ6YfseSZLAIjkz3mbzw3S5VVJ
         0by4YnTVNgAzB7x/MZEn+rf4IFaZVW7RA09pvihc5THpuKBqroT5V1YNdOb2e+qaMUeS
         Fo8JDAqgugosRRY5L6VGA5lODNlRPUerrmCuo9RCChHZdQH3ccfZzUeCEx/FLicvTCO5
         EwAKKZGOnsjnj8gmFKltCLBIgFieb/m+PsOxSVWNEc8b+9wH3+qPuSEoEeC+OpBTVxIF
         Hm+w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Xl3O6u8V;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id p23si342415wma.1.2020.01.27.04.16.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 04:16:40 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M73WL-1jqCHV1EJB-00wiNF; Mon, 27
 Jan 2020 13:16:40 +0100
Subject: Re: [PATCH 3/3] Documentation: Update hypervisor interfaces
 specification
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <cover.1580107046.git.jan.kiszka@web.de>
 <5ea60323214f8cbd4c12c529acfe5223a289a10c.1580107046.git.jan.kiszka@web.de>
 <278d552b-7202-7463-f58d-b3a0d6e40114@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <249a0344-7209-8d42-42a2-0e996b5fd8f1@web.de>
Date: Mon, 27 Jan 2020 13:16:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <278d552b-7202-7463-f58d-b3a0d6e40114@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:xhJmrmS4kdqiAekkwIHlGFBxxf8BU6c8lNaAX9HP0Jr6duatwbn
 g7aZiqt8NE4qW3fsXqC2UTclB4imZgbQWTVZra1gLr1yhXOOjrpRW1IwaHzFLtYxRZiFrJ0
 7kGu3J2qsIPz0NKD0wZ1YwDxgCtTGLQqKAVK/1EarZoA+ZZGVo1kbE2DOPVVm4ascMu7TPr
 BenK9Z7RD/KieJ4Bw4APg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CLwXBrthmJ8=:aRbYtQ/VvDmiszenE9Pe/n
 hTlaPkjrxSFzoDcaJuq5Rslb6n9tS0jIRxwuk4eoUrVLdEb07D20h696ewsCxqjHv4PUco9DJ
 YWO82NyUUxnwa23N4HYOCiGWHYD8fpgwBUowN+hEIsG/hz0AvEcPnoxsoV6/4mgQMXx5ih21x
 m4dcBYt7Jpiih5XbWy2k74rF8cdGK9RW/i813TNdYU3ZsZFa8VmHi28qtBxVfKmp1Ri/ordL8
 Q1CX2cnOrXqWPWAfGH0HYznrjMR01ztx/HYwS6ytKH34NqSbNYZiH2vBaqR6AKzPfnZxcPdwd
 PzdqOCKwxwymgy2n/rwxDdN7k/64zUv0dNalG58HlueqLrMYAOtDkTYwIkWeqBmqrV0I0Zm8o
 IekcLrmTayP4JG3BQ02QDgsy2hl9qVlgYlAWzD+imxM7bocgEItX+GUE1LW3GWj9obON2wDrB
 46BTGGe+J3m5DOqJFa8xt1wbpxajylnP+VGAqdUon4HkVQohcrgH5b8TFsBp7TjNOMcbqU925
 GQkCevXXw34u35Mjb2yzbZ+YmxUq68C3KbR4CVv4xIxULi2AOC533o6prwAbWLKxzO9WXJBG3
 s4trH/T57XwYZeEwgtc5RUhJEW7pqD6+2zLtERzOODP2T8CvtCbtRQfOZa2ngsO/mO3aqCc/u
 JYE8fyb5D8EbQLNXQ9HmwYqu1IdIf6ZToonP6IhWDhwcuFLyeVXZ4DhPQMGYO5I3rRHR5YX9r
 O6LJpeDWEVVAZ4sEKgoRTAtYgNfwINwZYFqJ5gMfmZE92H1hnn3JbV9vbX/zIxthAg3gP/z9y
 wC3sJ1Sk8eTZyXMogwy66YNJ2DGncp6XsT/vz86y2xkFiyjEmTcosdovsCCLLSW4VrEIz6xBv
 lpdZQLObAgxHuC/mlkXt8l2sP2JIf+Ut8ls7Bz7pWcdSPqbD+qbQxMfE4Bc6qmDA0+KZZKy+2
 Y3XXvIuoLHn1wESEDdu5aV0ssII8hQsg/Bg6QV5CG6SQbAcMJSz+JDiZcUFiD9oqzmNBZCQkq
 GaGxCBN9ewLfn17yepqWHauwperdQHgsTW1jd6U3GWIhaz/KDOn5/chlpPIGEOi9ZAsSRvrYz
 BsxUijtD1HBQTy/SGFyiiU/nwZf1EPBQ2Qy7ZHJ8i+K0Sloke06o7rUVGWvGL9KlhSDAsCXoz
 9sy62HsuoKISv+PvVcXDwwA0mNSoW/XO+AnnlDwb1ssdTE0IHU/+HAdRjpekHACVMHF9+AIUi
 UG5ovmYPIfPf3rDSo
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=Xl3O6u8V;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
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

On 27.01.20 12:40, Ralf Ramsauer wrote:
>
>
> On 27/01/2020 07:37, Jan Kiszka wrote:
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> Lots of things changed since the file was last touched. Add the
>> hypercall ABIs for non-Intel-x86, update the "CPU Get Info" hypercall
>> with new statistic types, and extend the Comm Region description with
>> the console and non-x86 extensions added meanwhile.
>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>> ---
>>   Documentation/hypervisor-interfaces.txt | 152 ++++++++++++++++++++++++++------
>>   1 file changed, 125 insertions(+), 27 deletions(-)
>>
>> diff --git a/Documentation/hypervisor-interfaces.txt b/Documentation/hypervisor-interfaces.txt
>> index f29bac43..74982e9d 100644
>> --- a/Documentation/hypervisor-interfaces.txt
>> +++ b/Documentation/hypervisor-interfaces.txt
>> @@ -13,7 +13,8 @@ Detection
>>   ---------
>>
>>   This interface is useful for cell code that should work not only inside a
>> -Jailhouse cell. The ABI is architecture specific.
>> +Jailhouse cell. The ABI is architecture specific. So far, it is only available
>> +for x86.
>>
>>
>>   x86 ABI
>> @@ -63,16 +64,36 @@ a similar channel. Details of the hypercall ABI are architecture specific and
>>   will be defined in the following.
>>
>>
>> -Intel x86 (IA-32/32e) ABI
>> -- - - - - - - - - - - - -
>> +x86 ABI
>> +- - - -
>>
>> -Instruction:    vmcall
>> +Instruction:    vmcall (IA-32/32e) / vmmcall (AMD64)
>>   Hypercall code: EAX
>> -1. argument:    RDI (IA-32e) / EDI (IA-32)
>> -2. argument:    RSI (IA-32e) / ESI (IA-32)
>> +1. argument:    RDI (64-bit mode) / EDI (32-bit mode)
>> +2. argument:    RSI (64-bit mode) / ESI (32-bit mode)
>>   Return code:    EAX
>>
>>
>> +ARMv7 ABI
>> +- - - - -
>> +
>> +Instruction:    hvc #0x4a48
>> +Hypercall code: r0
>> +1. argument:    r1
>> +2. argument:    r2
>> +Return code:    r0
>> +
>> +
>> +ARMv8 ABI
>> +- - - - -
>> +
>> +Instruction:    hvc #0x4a48
>> +Hypercall code: x0
>> +1. argument:    x1
>> +2. argument:    x2
>> +Return code:    x0
>> +
>> +
>>   Hypercall "Disable" (code 0)
>>   - - - - - - - - - - - - - - -
>>
>> @@ -230,14 +251,31 @@ Hypercall "CPU Get Info" (code 7)
>>   Obtain information about a specific CPU.
>>
>>   Arguments: 1. Logical ID of CPU to be queried
>> -           2. Information type:
>> +           2. Generic information type:
>>                     0 - CPU state
>>                  1000 - Total number of VM exits
>> -               1001 - VM exits due to MMIO access
>> -               1002 - VM exits due to PIO access
>> -               1003 - VM exits due to IPI submissions
>> -               1004 - VM exits due to management events
>> -               1005 - VM exits due to hypercalls
>> +               1001 - VM exits due to MMIO accesses
>> +               1002 - VM exits due to management events
>> +               1003 - VM exits due to hypercalls
>> +
>> +               x86-specific type:
>> +
>> +               1004 - VM exits due to PIO accesses
>> +               1005 - VM exits due to xAPIC accesses
>> +               1006 - VM exits due to CR accesses
>> +               1007 - VM exits due to CPUID instructions
>> +               1008 - VM exits due to XSETBV instructions
>> +               1009 - VM exits due to exceptions
>> +               1010 - VM exits due to unspecified MSR accesses
>> +               1011 - VM exits due to x2APIC ICR MSR accesses
>> +
>> +               ARMv7/ARMv8-specific type:
>> +
>> +               1004 - VM exits due to IRQ injections
>
> 1004 is maintainance. Off by one.
>

Indeed... v2 will follow.

> Besides that:
>
> Reviewed-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>
>    Ralf
>

Thanks,
Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/249a0344-7209-8d42-42a2-0e996b5fd8f1%40web.de.
