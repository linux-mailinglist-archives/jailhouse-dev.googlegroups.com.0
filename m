Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBQHTXLTAKGQECTH7Y5Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A31913ED3
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 May 2019 12:24:01 +0200 (CEST)
Received: by mail-ed1-x538.google.com with SMTP id h7sf450479edb.14
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 May 2019 03:24:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557051841; cv=pass;
        d=google.com; s=arc-20160816;
        b=GExzPC16ziQ+QYEEdvOxTpFROlLVg/s/qGwKFGBudukP1ryh5nhdyXjkyq5gTKoQKR
         4OtgyDGuabyPvW0Aryp5+2spuPEJENXl50QOzQgkVntRrG2KruZdgavhBpauMdBiC4kb
         S+cjRQFPTzZsnZcOHlZt6/jGHq4zpKcXcv5Y+dGTPqA1lrkqa720uzuDyHweDSi73dlb
         46yY5pLlWXOI+AfWwrNP295a2f0uuYISVqb9JwwmuWleapcyklQ7Vwzqgbj8E7iAZS8H
         gY5g68A9ilAWFPt0jOOWqWaMpZYdWntFCWv43iGninRKnJbIaOF0gKM2vul5GyeWrcad
         r/xg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=m8+ntkex/a/iP51FN1Y3uMlHXF+XdqtZZdkhrH7J/s0=;
        b=IDGauud0oOyxD/c4tw+On8KYkDH5hKQf8F4PGMnxFhSkJEuW0cIpwR0Ir6WHh1P6mt
         C3EsnOSwWlK9STOmxXxxivT9bqejGqGjI6tZOZdu7cNMz3V2C8B2o/IHSGzkVtqt9Esm
         eB670+wp4sZvAM/M0IxLzTeK86NfHw3uUxStULa3j+BTxRBIsjnqE0zVbMahvnM7RaGU
         Whwm+Ec9jLVwTZ7Z6AP/Cp6orYF6aaAbUjbHiq0UNJAsZv4/FjvVREJoXiyLjnBie84S
         sQfiuQ6pvnriSDnIzd9ORwCW1er4X9KcQP6AnbNaNvBfqjYFuGX3wOtSfVlGEiCWhPLO
         F6Zg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=ByavvogP;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=m8+ntkex/a/iP51FN1Y3uMlHXF+XdqtZZdkhrH7J/s0=;
        b=VR5ZY2Wvn2HqCvdSPTmZypaHWSXvX1SYy9tt2JonugR9m/1ZdwS9mrpedfVNoAegrx
         sEAKzIau7lR2X/fdQcgnCJwr9nQA5CgLV5uio6lVjEVpY4quLyFbaSKyXgtSsk82hmrT
         x+SV8m3rprkrZM4wkNw1D0bPpMYqpzmrqlPbbhV0DZJMk+44BP+yi6rPo95IU4AKZimd
         EDNKG/zq1vYrJIiUQLn4SecNaf8HXjUxKVRGzzoNYsOTNB5l2DLwySTbAgxPrDSZkOfb
         3ChT+6iU+lEe6TaoKbLZSl/XTWOnd77Vg/Jg4h1vHuUuJF7qxFM4pz9YZVW64pNxZmAY
         mtkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=m8+ntkex/a/iP51FN1Y3uMlHXF+XdqtZZdkhrH7J/s0=;
        b=PtjM0uHNJreXlg8qI0eelJl0nh/KsG/HvpXe/y6uKdheB1dCeMHVPkG/72W10YWsPK
         iyBMVgRW6hEmkTvGK8DA+FSndOU58i1joSnsg+RJTV1WIXjLksOFauMvY08vTYVeda0h
         pgwSH/mlyJB4ee/X0gurYAnnPJpdxl5UWQ/6IuFIvL/JHfActMS8LM90Xq9IO6OlusFm
         kr7J2g94KrElbAEIxHrF7Ppl6wQK10vAb9X2n9rt6zGurAMy/ZZ95XKrFesgdpMRl6Kf
         VJ36oij/olCRwnveAb/T9x9y64cTZzZ4YYhIiHfIK04QYoWjJoK6QzFLgZR+AhUt3OPa
         tQbg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVARgN+DzoajujVJCrPwSb0+ElhNHcQHvwFoZ0pCJkbi7WznvzT
	K/U88sI6yxyNvSvq9t2TNAg=
X-Google-Smtp-Source: APXvYqxZkCI1Elb2v2kYDqBywH6WX4TTXJiPgMPgFCon5uub205225cRyS4w2jEmr6quWHNAZB5hsw==
X-Received: by 2002:a50:86a2:: with SMTP id r31mr19164164eda.259.1557051840948;
        Sun, 05 May 2019 03:24:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7d82:: with SMTP id v2ls1928368ejo.7.gmail; Sun, 05
 May 2019 03:24:00 -0700 (PDT)
X-Received: by 2002:a17:906:34c6:: with SMTP id h6mr14338445ejb.119.1557051840433;
        Sun, 05 May 2019 03:24:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557051840; cv=none;
        d=google.com; s=arc-20160816;
        b=NU1s+I9M0wrYnFnP2DtdWtHIu4xBaxWGbTHkZUAvQwuWRbSk7Yq2Ptc8t+6mdGQk4V
         TvwkBVm31Sl1j7SLIkZIvkUjd+hgm60d9QkosX7FO9JKNN+kGw8YbgcFToPlThWKyFSU
         ++euIaNDV92NAGSaxa4pBGBBIck9hGIMSY/H9KwV5A9RakbtHGM8UeOCh0pupuokDdRh
         9hyIzNo0T4HR31kfnU5Du+KHKD87iPWJRwFvuDEpWO6vyxXspGPo1/IPhC9vWZlmxw6L
         tHbaRn36usOcn4l4e/5tx2d+Ld/UQwTOT3wYyCxGkTbrtw8coFwmBYEd/dj8iiRWhc0J
         Bmyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=kTMu2ZbGpWfvps0fq1B0ACKeFmYJsWIuiog+hbJd75A=;
        b=lSnDIbh8fSMlADKOOYTiZ4kHqmIPqqJv6kAleOUrEswOkhomgNyReFLzG5vTBFesm1
         5IxGwaOKuPdIxq1PNz0M+Z0hhEIERSp5dtEV3KfNQsUT1kEM+GZe1UMGBLmDvwAJOPzj
         30M8y8W2YiXEHgIQoMkrX5a7R6EdkVssz9/ox/XhGWRVeEnALGGB4pHyrLm7tr0/yRJZ
         0INdNqhe+4lG7z8YPUFOAA/HTRKKDjZfrE2TZqCUviyfX/fc7yUzH9BbgS+vV4gPJVQk
         LJz/DPmgw46xGdQlWzQGLRZzfUYlq1QP58D0bHoTNQwj7TmbhpVgmmel3e7bfd0KF1po
         O8nA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=ByavvogP;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id l30si411695edd.4.2019.05.05.03.24.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 May 2019 03:24:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M6mgu-1gZeQN3doq-00wYNz; Sun, 05
 May 2019 12:23:59 +0200
Subject: Re: [PATCH 5/5] pyjailhouse: let the generator produce speaking names
 for PCI caps
To: Henning Schild <henning.schild@siemens.com>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: jailhouse-dev@googlegroups.com
References: <20190430214504.2153-1-ralf.ramsauer@oth-regensburg.de>
 <20190430214504.2153-6-ralf.ramsauer@oth-regensburg.de>
 <20190502103131.4dd5d0b0@md1za8fc.ad001.siemens.net>
 <ba561eef-b30f-c440-e301-55c073d49e46@oth-regensburg.de>
 <20190502161442.3e2db927@md1za8fc.ad001.siemens.net>
 <a4c5ec84-80f1-3da6-e049-e65e2b51b29b@oth-regensburg.de>
 <20190502164234.722bf585@md1za8fc.ad001.siemens.net>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <79c96857-5e19-d14e-d10e-111d04af1cd3@web.de>
Date: Sun, 5 May 2019 12:23:59 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190502164234.722bf585@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:c46F0c2fHBpJcnPwBSM7JeV78agOfDl57xntTKfWyAkeK3chzFA
 fyIYIE59pFYjjdk230FM9UM2efJN1gWv8PQHKXD+EfF3QFQZ3ywiscKdoaOK/KJ+AwUqn+k
 PV0ZMFWDizULHDlS488EvzKwyHCaThewjrpKdy3WRDMF2883U+efpP8hMbq2lwOGi+NdARA
 u2UEj6UNNuOOJ1R5x1dqg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:td3LcAxAZuk=:5kuRoq47mhYg95GRWB9P0J
 IyJgjlbcD3bRYrSt5ZFboYtR3ATROh3PVQWPJBe32FEeznEHLSbdbpE3x/7Ufx0aFFYeFkw2h
 AV1hcKlTblMm3gEFD8uM1g4Jn8apUDfm3+SyD9lOEOFashLqoOmfb/YjpIFheNEv0N2Kb9Fdf
 pDWB4+XwkAgp+CvCn7pertxUoGZiXBS5oOYKVc9UV66wrSxu/2BoHIEKYP7Am6T1I/Qv3fg29
 PDShWUhL/WjbKwXIzcIbsv9qhO3IlV4HwAs3tgZKU7hbf1f8hNEXmg2eoAXWUL/mYyiQ3p06P
 n9NAQBy4ZEOZIvy9WUlvs3CR48oONqGyg0Am9CqBdClRpi6xxnAkHVJIxKgzWswjTOgGT5rmL
 ajBZHd+ig9JXH9fReOXXctrcvGWF0+F+L70VaAKGA++ysQjvL1fXI2+LatsTHwTZ8Y5EjS3XL
 kCH2fJKz0FWZxNC4ArWrfuCh+BNQwuh8wmQsRQU0b5i+SgX3yrjAO4CGqFrSSyjVohLLJ52by
 gIClM98TRNM79YSyMIlC2R3hcnznrYPN2SIdU1OzBli1UkL1bP7dDI5t/XFHykYurYcpvbSUv
 KK+OkxOcA9EgXCaypIAVyYEnwgKZx+jgXaFEVsu2LjW7Dc6U4SvHde5pYFO0m6Sv7xb5VBiSC
 ckGOllUdjUP3SjjwLFFPCH9TTYjsJlcPMlg0DeMWv6A6nEdgtNgPveVrJoYetitOQb/tIs/fY
 0jCjmD2fWvldPvs0e/t5zTtQBlrkJjOWvKi5FTsdyNHBLHLxAnJrwPdN9u7rZ8ljQd3Ys+b24
 P/jpR8zkB8tioZsidHfNAaAdGbCwBa5WBydcabeCBHKFaUTrd3idTvuep3OA08210fDO+EG8v
 Trp006AcgoNBXJhPM7sk2CbeMmnIcIkTbrVbMM6P0CQhlk11khPncArab8AhuXCP5wVdgooPv
 uWFuKLfq0JQ==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=ByavvogP;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
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

On 02.05.19 16:42, Henning Schild wrote:
> Am Thu, 2 May 2019 16:34:35 +0200
> schrieb Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>:
>
>> On 5/2/19 4:14 PM, Henning Schild wrote:
>>> Am Thu, 2 May 2019 12:19:10 +0200
>>> schrieb Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>:
>>>
>>>> Hi,
>>>>
>>>> On 5/2/19 10:31 AM, Henning Schild wrote:
>>>>> Hi Ralf,
>>>>>
>>>>> redefining the "Enum" seems not too elegant. Did you look into
>>>>> ways to use the header from python?
>>>>
>>>> Duplicating things is in deed not the most elegant way, but it's
>>>> the way how we handle other magic constants as well.
>>>>
>>>> Didn't yet look at any alternatives.
>>>>
>>>>>
>>>>> The "defines" should be really easy to parse without even using a
>>>>> special python library. The only real problem might be locating
>>>>> the header, it would need to be installed when running
>>>>> "installed" or relative when running "local".
>>>>
>>>> We could create a pyjailhouse/pcicaps.py during compilation phase.
>>>> Make/sed magic could create the python file from a stub. This is
>>>> basically the same how we create generated C headers.
>>>>
>>>> This would a) autocreate the "Enum" and make it easy to maintain
>>>> and b) solve the problem when being installed.
>>>>
>>>> What do you think about this?
>>>
>>> Not sure the extra make before the first use would be nice or
>>> acceptable. The python code could be generated inside pip, in which
>>> case you want to have a solution for non-pip users.
>>
>> Maybe we're not talking about the same thing.
>>
>> I'd simply use a small template for the skeleton of the python file,
>> use sed and friends to fill its content based on C headers and copy
>> it over to its final destination (e.g., pyjailhouse/pci_caps.py).
>
> I see, have a generated copy in the tree instead of just shipping the
> generator. Reminds me of autotools and make ;).
>

No, not, please. Do something like asm-defines for python consumption. There is
no issue with pip. Its execution can just depend on that output.

The benefit would be that this may also be used for structures, though the logic
for translating field elements into format strings might be more complex. If
automatic translation does not work, we could at least create a finger print
that the implementations in pyjailhouse need to reproduce in order to confirm
they accounted for an update. And that could be build-time checked.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
