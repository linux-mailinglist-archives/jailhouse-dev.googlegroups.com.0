Return-Path: <jailhouse-dev+bncBCSPHTXQ2UMRB74X6KBQMGQE4KI3ZFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id D34B1363763
	for <lists+jailhouse-dev@lfdr.de>; Sun, 18 Apr 2021 21:43:59 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id 65-20020adf94c70000b0290106f90d4e1bsf3561768wrr.0
        for <lists+jailhouse-dev@lfdr.de>; Sun, 18 Apr 2021 12:43:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618775039; cv=pass;
        d=google.com; s=arc-20160816;
        b=EfFkincOHSvOPTqFXxUCMy5LQzvkJqtlsSVdjlCxG9KdkjrEE7HqeWgZwLTmMRyPR+
         zcN0QW/Rhha0QM6u6twShLVesmPivWwWxGjduYC5uz4y7LIIv3e42hO2PJi31Tk5TlNr
         VLD5u9nPlz35POdYP5qsZHSiLKS2WHa/GSeYMlDcjjJSJDrABluVSfF0OLjuOoEIDE0r
         T0Y6f3czNOQTkbQeuC9o0vs0z7/o8XzC/bThsqlT4iWeJ7GxYqD8TdP5QxPiXiaS9iJn
         Kb+gKciUR19wBfYUtc0IA0w6smzqMPolnINfHhPVMyTRKlyOxxu7KmLZIEnSllHlvmMz
         Du5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=74ZvzycRJGAJJjD9DkdUFSXcoHcPiGK4L6xfXch/HvY=;
        b=pyKlLhzwfAm0lrpdTYOXeJkj8nEb+iAbwE5hKpTI1yXtPOtfPJj2S6XLJjdTuWNzEg
         UypWi0+qyoViFay09dwf7OYpIMDg9O45aYW4kiE9aXB8Pq1P6sH6LEPUOjA4Mn1i+Bql
         caMpvpcmKDwiyco6Q9KDKT1klBamrlkFyrPsSS3xE6aa4hmj8xawd1V17aqrn+t08AnX
         NRuFtIPAsPqGwzUMJTaeX+vuom3QxtMHaLzbqNxzpQrGwV7tI15FB/y/9axK/NYUNAeD
         ABTDigJ/dykPwuZFIj0axd8WB6wbMJBZwIdY33lwSwouH66DmNXwfDE4UfPUIkRkVJ6q
         ei6g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=LOrf2fdo;
       spf=pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::632 as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:in-reply-to:references:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=74ZvzycRJGAJJjD9DkdUFSXcoHcPiGK4L6xfXch/HvY=;
        b=dOyI8XDb/4mg3MM/22c37LqO5/O0DPOiHO/K3cv6E/3MgMV17riGboONBb8S72sTwE
         RNOUiCeTR9Rsbcf+EHEJoNFoLjHC9v8ZHYpwShIYEmmJEXKSyr9vVyFi14PCq8N8Pr26
         EnHXoaOrRB/H+Z3gypnysrRZJ1V8xR0qG+B4vFeRtSL2qRckpzW0V9QeLUPNwrqEQBry
         P0wd3FSZmMMsRa3GeRXBSJEosJsJwBFXYi3XEXOyy2q2dBKCE9mnRD/z9CmDWUmXHYqL
         r8a3+QWCs6bXztPUwthzEWDxEmAy2IQYsVSN0wRMN0aoc3v0DGIo1qc+BFHhgQMedrII
         Kr5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=74ZvzycRJGAJJjD9DkdUFSXcoHcPiGK4L6xfXch/HvY=;
        b=FbX8Z/vQhTPXaxsalJLcTkgV1dJsxkWoR+3qWxkP/ky2hOWB9oFbA5p2Kq4N69KfiS
         7gOsIFzByDge2YSk3Ks7KqdmO6zGHnOUK994xCKJfmD+GaFJQwv50M1Buns2NNf34nq5
         HMlNdKYLWwNOH9aVsL/yJAPsKjgQRpS+bJstCHYcTWNnMQtXUk0MWO2mfX3id38ewYUP
         iAHbnjeGjZNV1NR7+tthuXqZUtGaeT8yJp9zx9Td9sBr+qEpEsCEEqJea3JpDuoDDZ+x
         9TOqNkvqxlSubMu5TzBLd+/FoqFf5fsiykbvVBU6L95LAZhWyhXi1rS4UYERQ7g7SuUe
         MYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:in-reply-to:references:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=74ZvzycRJGAJJjD9DkdUFSXcoHcPiGK4L6xfXch/HvY=;
        b=baO/IBr9fddrbaI4NmFulmGfUU4reu1z2OilZpeYNlYeZrecXan+bz+gEyTges47y7
         QEcaRKRCzVexA5WmPWnqEFDVV/h1SjwmC8nb3kXWDd0XfW9YQvv4XeArlmOnkwv+wf2U
         L/x6jzazqQ0FbmtoatqAHp1z4jIeYZOsjx/3KNb21ea5s09bCIlm/QYmYSmbFlEoJhin
         nDgrv/T4bSEqDd5uA5outvBw4w6MQvxX84blo2+a3cBhuAA5f7pCDsFG0zuA937syO3a
         cON+Lfv8PIB0CLziNjXX2dQQnHPr1h1gcYvLimsM4AHr48l1L5XV3LXFX19BHO93OCpA
         hhNw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531z0y8g777mdEiDpXsdHJ8Tc8Z2xwW0cNXt/pMXQ/U4P3SCGv4p
	prEAZ/z2ADnOBoWRdQAMuH0=
X-Google-Smtp-Source: ABdhPJykl0jkjOibJIqZ/xWSJdGAMHbntUzfwdUommji8RNK8Iytx8DUokvQ5YP2WEV+j78QU9F4OQ==
X-Received: by 2002:a05:600c:4fce:: with SMTP id o14mr2249452wmq.121.1618775039542;
        Sun, 18 Apr 2021 12:43:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fb47:: with SMTP id c7ls4881064wrs.0.gmail; Sun, 18 Apr
 2021 12:43:58 -0700 (PDT)
X-Received: by 2002:a5d:508d:: with SMTP id a13mr10393421wrt.182.1618775038646;
        Sun, 18 Apr 2021 12:43:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618775038; cv=none;
        d=google.com; s=arc-20160816;
        b=XuAfZ3l9KOW6ea/nwilVaCLIbKGbyHXGF7HPc9/dr+5zSe4fT+cD66a/Zb3/cEpN9B
         ggO841gfRjd+n0t1PdB1fThE27HWWAYcZaWZMlMWrRgRBHwtqokViXtyYqNAS7dvv2zj
         CzPpg/TNUXsAk4BaCOjTdo/FC0BfkkkFBV6YZceJhNEZ+d/HqptXG3NaEf73OAf74uPD
         X4Aoy01CNShAHsdUWRSsusY9C6Gnxynb7Sp13wNL9gANRSi96hHCleXpI6BJEm8GNmHs
         AM+i3jg6Op8OCil1IMvmwe/ktqYViHhctkU5siaBe8cLy1LsT3X9T7joUGR0YTTomHqV
         Gknw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=24hbg3UaqOxvrv+28DdMSqLZq8tmoeFVcPhRHuvBlFw=;
        b=x6xO1ODZEZN+RwN0k/NJ8tCOmt6TBlyjZPc6PXx7kGJnJy6JLdE79sfxCLygAvOzOK
         uclIU/lp57FNgC1sFH7x4y8Qhl1nF1s6ZHoy61g28M0S7pVjEEkS8lO9I/bXljrqvU3Q
         o/6WbaNvTFO9I3rBdiRacpuO5p6eBHG8JeCEDv+iPzeztDh5u22xJt1LbcmxgXe+c2Pn
         umk2jOARK4mvtLrHWcyBMXL77IQHDIxNCUveeunxRksREDlRpuK3oYaKLEA0Y2UOBzQK
         w8yFGJYSU0vrcw546dHXmg4ATDS7tYK58J0kJOrg1qVPwwa1Ex9/PKzcbgSgsBpxS1Cx
         +CiQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=LOrf2fdo;
       spf=pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::632 as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com. [2a00:1450:4864:20::632])
        by gmr-mx.google.com with ESMTPS id s141si1033906wme.2.2021.04.18.12.43.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Apr 2021 12:43:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::632 as permitted sender) client-ip=2a00:1450:4864:20::632;
Received: by mail-ej1-x632.google.com with SMTP id w3so49698173ejc.4
        for <jailhouse-dev@googlegroups.com>; Sun, 18 Apr 2021 12:43:58 -0700 (PDT)
X-Received: by 2002:a17:906:c016:: with SMTP id e22mr18786824ejz.330.1618775038303;
 Sun, 18 Apr 2021 12:43:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:f48:0:0:0:0 with HTTP; Sun, 18 Apr 2021 12:43:57
 -0700 (PDT)
In-Reply-To: <2d9bf4f2-0c6f-525d-1da8-e5ccd276394f@web.de>
References: <CADiTV-03GyURVJ2De-Fe5reAcvveWQq7JxAUTh2kES2DSbwcWA@mail.gmail.com>
 <23971adf-097b-073d-b31a-9de1a333fbbf@siemens.com> <CADiTV-1tnpfVYjnmvuvG7Tz6q-+dMZ3PdKxjqBonyFatWh3irA@mail.gmail.com>
 <f88cc779-00a7-dbc5-19b7-c4ba9921d5a6@siemens.com> <CADiTV-1AsxjptpR4q4rbEhZnkpOjJiAxo_omnNX_QHZZRnyakw@mail.gmail.com>
 <90b4e3c5-4841-0699-7601-f455e569c84b@siemens.com> <CADiTV-2pfQ4SVayR2A_3+ogF7T743RjM+W7R0hQFNu=NG5c5wA@mail.gmail.com>
 <2d9bf4f2-0c6f-525d-1da8-e5ccd276394f@web.de>
From: Angelo Ruocco <angelo.ruocco.90@gmail.com>
Date: Sun, 18 Apr 2021 21:43:57 +0200
Message-ID: <CADiTV-2Sqqce9me0Myp1T9FP0KRg0cOoUDQXekrereqXiVpF1w@mail.gmail.com>
Subject: Re: Arm zero exits and zynqmp ATF SDEI-enabling patch upstreaming
To: Jan Kiszka <jan.kiszka@web.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>, 
	Marco Solieri <marco.solieri@unimore.it>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: angelo.ruocco.90@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=LOrf2fdo;       spf=pass
 (google.com: domain of angelo.ruocco.90@gmail.com designates
 2a00:1450:4864:20::632 as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

On 18/04/2021, Jan Kiszka <jan.kiszka@web.de> wrote:
> On 23.03.21 17:26, Angelo Ruocco wrote:
>> On 23/03/2021, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>> On 23.03.21 16:36, Angelo Ruocco wrote:
>>>> On 23/03/2021, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>> On 23.03.21 12:33, Angelo Ruocco wrote:
>>>>>> On 23/03/2021, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>>> On 23.03.21 11:17, Angelo Ruocco wrote:
>>>>>>>> Hi Jan, all,
>>>>>>>>
>>>>>>>> I have seen that arm-zero-exits has been merged into next.
>>>>>>>>
>>>>>>>> My understanding is that right now the only officially supported
>>>>>>>> boards, meaning supporting both jailhouse and SDEI, are NXP's ones,
>>>>>>>> with only a experimental patch for the xilinx zynqmp firmware to
>>>>>>>> enable SDEI.
>>>>>>>>
>>>>>>>> Regarding that patch, I have looked at it, tested it and added the
>>>>>>>> missing non-secure-boundary check.
>>>>>>>>
>>>>>>>> Are you thinking of submitting it upstream? If so, how do you want
>>>>>>>> to
>>>>>>>> proceed?
>>>>>>>
>>>>>>> If you have everything ready with the patch, I would not mind if you
>>>>>>> pushed that upstream. Just CC me.
>>>>>>
>>>>>> The only thing missing is a proper commit message, I could also write
>>>>>> that, but I don't really know whether it's appropriate for me to
>>>>>> submit a patch of which I don't have the authorship. What do you
>>>>>> think?
>>>>>
>>>>> But you added something to it as you wrote above, no?
>>>>
>>>> Yes, but that's hardly worth adding my signature to the patch, not to
>>>> mention authorship.
>>>>
>>>>> Otherwise, share what you have, and I will kick off the gerrit mess.
>>>>
>>>> That is ok by me. How do you want me to send the patch? Here in the
>>>> mailing list?
>>>>
>>>
>>> Yes, just drop it here, attached or inline.
>>>
>>> Jan
>>>
>>> --
>>> Siemens AG, T RDA IOT
>>> Corporate Competence Center Embedded Linux
>>>
>>
>>
>> You'll find the patch attached.
>>
>
> Thanks for that, I've finally found the time to finish it and create
>
> https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/9673
>
> I'm not getting you on CC there, likely because gerrit hates me (and
> vice versa).

Hi Jan,
Thank you for the update.

> BTW, how did you address
> https://lists.trustedfirmware.org/pipermail/tf-a/2021-April/001093.html
> in your setup? Took me a while to understand this, at least with 5.10
> (wasn't happening with 5.4? didn't try).

With DEBUG/SPDs enabled I am not having any issue on booting Linux
(5.4), I had some random errors using psci calls (cores weren't waking
up/suspending) under jailhouse, probably jailhouse or Linux at some
point were overriding those ATF functions, (as you found out, in DEBUG
mode that region isn't protected in any way). I Just removed the
region from the root-cell configuration, and the problem went away.
You're right though, even though I never experienced issues, with
jailhouse a reservation in the dtb is the better way of handling this.

I don't know if it's possible to do it "dinamically", i.e. to have a
universal dtb and let Linux decide whether it can or cannot use that
region. To be honest, sizing less than a megabyte, I never really
cared much and just reserved it for ATF even when not in DEBUG mode or
with SPDs enabled...

-- 
Angelo

> Jan
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CADiTV-2Sqqce9me0Myp1T9FP0KRg0cOoUDQXekrereqXiVpF1w%40mail.gmail.com.
