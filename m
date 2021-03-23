Return-Path: <jailhouse-dev+bncBCSPHTXQ2UMRBCEW5CBAMGQEPJWCOUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 617EB346302
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 16:36:41 +0100 (CET)
Received: by mail-lj1-x240.google.com with SMTP id d16sf1603612lja.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 08:36:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616513801; cv=pass;
        d=google.com; s=arc-20160816;
        b=tLnXSFYQQpFmCTrFztXpQ++22Yt0xFWAOvcJap/rNcFCsQttnyilPygVV/JqyJmJUI
         bqnth0RgFcO7WadzUW9n4+CfGqlwHe6x5nrjQ0z5cibNUQJCrhUY6P55XKRdsP0amsWs
         bAdXTOmiP7Tgpu68k9OkbiW+rIvaXMX1jmEbOV8t6g95yAWmgx+Uz4IudwMXmng9UWm0
         ruAeCLqhpYdVAlob9kctIQpV3vrVJoR8XYZ0kZbb4qlOuS9DiJj2L7OHLIJwZRx4tpuh
         CRbmxUcphY16oEDcQz1UquXAC+SDgnWy/TtfmM4GUiE/DKTX0GQ9hdNP8v6qvzOZd5bb
         sbLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=T0wsmN4hK4LSwhxFkjytnLgERgZn8XDnDLn+wHyXEx8=;
        b=LOZ1axHIOkEKqZr8kIzKRTeHU3dTD2f9gTKNarhKW0iMFC9G+fF4ql1M+pjoGKT4OT
         EvV9pIz6fNxoRT8keorChTcWjMEhp/Q7HZPOaIQtYhzLHUjLCxnqoQTgRITX52pPsmzN
         3YALaPkWPzyg17KL4H23otke+0dKzQ/TAulkWmUWl5Bp5hhWQ77E9SnmsYPxQnbzL38Q
         fSwf95TfcAErWTEqjG6/kOsNRDvwxv4ecZVrmnfyxRSxVbDkwn0Q5vXET0zacrYa9ygf
         do2TDltM8am81wc3/2bPljZLN4i0vZ1fA8XZkEv2r9jvPz8yMX2+xfdO19HzP2MqFXg/
         ODlg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=TPxs3JwH;
       spf=pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::631 as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:in-reply-to:references:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=T0wsmN4hK4LSwhxFkjytnLgERgZn8XDnDLn+wHyXEx8=;
        b=G69Tb8rfWYQiotyH2MmA6jOA9cpMubjNpyZ+2iU/mCsSue4Bz3MSqVR2qAKcghThK4
         dFKxFW4UgojhQuwQJcHcKLUzA/wE51e7YcTY8U9d3ER/HmXx6qQwbLprcmKesg0r96jP
         e0VK3r517O/1rdAyCrs0sTaJ4ZfBkCxpykJk60UG5ENkC19pmrqUhR9zi2hay/9BfsRG
         AdT9R3GYoML3ewUAF9w5Efa7/xxm/AO3qFiZBsRvme+TbN5Ibu9TIe9PZxqpcMpVFIB0
         UjMOlMm1C4XbxwFFcYoqtMXsbIAG7BcF7n9sc5KrxUChnA2091NpxFDsI14M+BdYjXAd
         V3BA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=T0wsmN4hK4LSwhxFkjytnLgERgZn8XDnDLn+wHyXEx8=;
        b=Jvpw9d0O+4VxNcK1JaOKQ2ulG/UzA9VDdB8CGfx4jVW0ojYA+7nndKPH48hR0An5EE
         NYb3rth1mjBV0FZvk//Zzj6uePuLYYz4UYWoJNO6irc7TDMB8b52frKcIXmLQreKpVGi
         wsIm9wNltRZStLZhbUkAmhUntHPwvRhl5wBpLkRSdwzvnWYe5Y5Zm9W5suRzBw06+Upv
         sQiqGPrcssiuuBHXFGw8H3sJBaa7WZenvIcSBDwSWeoklYp9DSDniDVY/6PWgOOsaXGY
         2j3YCafZ7Qf1hxEza5bMmJw8FAMRPPUEaa0JBLRTAWJlf9AVPWnXsGT0Xi+Lwp7FJvIG
         NxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:in-reply-to:references:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=T0wsmN4hK4LSwhxFkjytnLgERgZn8XDnDLn+wHyXEx8=;
        b=GD8i17yQAw3Bwc6LZDJ3/+OP2ds/B6k89X87R79voIWoLGSk0NzP+VR6YRKPo4iRJ+
         0fDqemfgxfS5t6el/zXSz1aHamgamvBf6qKHPBhH4eR1IsRQk9X9IfWocG3zMLM++Qqr
         kyk8Wb/Ly9z52fx9qm0xv+i9QioMwbg8GmN0nKGZ8Zb5H5LvL7f7R+cSsh5jDJJr84HS
         dHqGkg3omfjatnPkhs+ghzpeAd5zvOsrZVSu6ORN1yBl4MtIya+mrOfvzi7bYiqBnJ90
         xsovapPcrcU8r3cdE+UAzbiRej8TL6pka7T8CKlv2J8dD23o1ZOb29tZ5ZZsQPpIxYDG
         5TKw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533MjNpgJHcuu4cG8VRuMNIMuVF7DcVsE6xDUq4HbwSSnMbaLaiG
	VX5V5ITJcad3MB2xKNjG6cc=
X-Google-Smtp-Source: ABdhPJzJXiWHoqsXglR4WR/sRxEWWJbnH+m5EB+lNZtBUbQmSwL98JzK6i2fmbBDcoSzc2THMxHVHw==
X-Received: by 2002:ac2:4c37:: with SMTP id u23mr3151730lfq.449.1616513800955;
        Tue, 23 Mar 2021 08:36:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:e86:: with SMTP id 128ls5485196lfo.0.gmail; Tue, 23 Mar
 2021 08:36:39 -0700 (PDT)
X-Received: by 2002:a05:6512:b93:: with SMTP id b19mr2800879lfv.432.1616513799774;
        Tue, 23 Mar 2021 08:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616513799; cv=none;
        d=google.com; s=arc-20160816;
        b=sKtJWNo6pMH70k2YUAJu7QHpijpNMCZ9xuCUE+ofqW4coVRxA+hsZhV0d5CDlwCSPH
         fgkPspJCRuhG5+iDw2cuVmrHELd+537xOoi17T+LE9YIW4l8dPm/DnxNVyPZwbDEhGyV
         YnJtB5U3uhepKNjbZaEghi6+CONLTR5VdlrKmap3chrTy78xJQe92pBfGrQ6EICABT2a
         u/nFxTYqfTp0vRCbAxTwGZwkQgGwnLA8uK2AleJmleRjNbQmhiytEGtCUHFVB/1rsw6c
         /OjV8dhnJfSTKV2Pjhy58a3R9Smro7DgFJgSWk2Ntw2kRtfRS2wJQVK99TtigsiC2AFF
         a+iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=y2QUc494n/cqh6shCUmscmM4ByY8Qvsd3eDKa9+/O54=;
        b=deTvnDmqWrMxULsHxSyZLEc8YkQ6rg2GqUUriDVG3bNDvUEjVfR9ZvfwFxd55n/Fiq
         oIdN+vFjqRotOcqMmDXu2cQqwMFr1c2g9gmIXBjBLOesSIbAiikJ2nSPuxehMHIijysX
         am0f71HvCb2Ob589vgsazpSxk8sV6C6TdimujItriWVZUOpHaa4Ns8iG8QCWzUSKrCEk
         /TOsYwIgKfhlTTfrCusfEeS5JEJfkD7JIIaRwHHFu1zoEkirVEKXZrh0DUI5qjIqxnYQ
         JyIoWmIMTmqoOaexrYWIY5d6B5Yq84sXjcAa9OezqD+YCbVWfFfg9RlhBDZw8T95oYoY
         x8Dg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=TPxs3JwH;
       spf=pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::631 as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com. [2a00:1450:4864:20::631])
        by gmr-mx.google.com with ESMTPS id q3si730595lji.2.2021.03.23.08.36.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 08:36:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::631 as permitted sender) client-ip=2a00:1450:4864:20::631;
Received: by mail-ej1-x631.google.com with SMTP id ce10so27819687ejb.6
        for <jailhouse-dev@googlegroups.com>; Tue, 23 Mar 2021 08:36:39 -0700 (PDT)
X-Received: by 2002:a17:906:7d7:: with SMTP id m23mr5597513ejc.205.1616513799552;
 Tue, 23 Mar 2021 08:36:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:2d8b:0:0:0:0 with HTTP; Tue, 23 Mar 2021 08:36:38
 -0700 (PDT)
In-Reply-To: <f88cc779-00a7-dbc5-19b7-c4ba9921d5a6@siemens.com>
References: <CADiTV-03GyURVJ2De-Fe5reAcvveWQq7JxAUTh2kES2DSbwcWA@mail.gmail.com>
 <23971adf-097b-073d-b31a-9de1a333fbbf@siemens.com> <CADiTV-1tnpfVYjnmvuvG7Tz6q-+dMZ3PdKxjqBonyFatWh3irA@mail.gmail.com>
 <f88cc779-00a7-dbc5-19b7-c4ba9921d5a6@siemens.com>
From: Angelo Ruocco <angelo.ruocco.90@gmail.com>
Date: Tue, 23 Mar 2021 16:36:38 +0100
Message-ID: <CADiTV-1AsxjptpR4q4rbEhZnkpOjJiAxo_omnNX_QHZZRnyakw@mail.gmail.com>
Subject: Re: Arm zero exits and zynqmp ATF SDEI-enabling patch upstreaming
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>, 
	Marco Solieri <marco.solieri@unimore.it>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: angelo.ruocco.90@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=TPxs3JwH;       spf=pass
 (google.com: domain of angelo.ruocco.90@gmail.com designates
 2a00:1450:4864:20::631 as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
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

On 23/03/2021, Jan Kiszka <jan.kiszka@siemens.com> wrote:
> On 23.03.21 12:33, Angelo Ruocco wrote:
>> On 23/03/2021, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>> On 23.03.21 11:17, Angelo Ruocco wrote:
>>>> Hi Jan, all,
>>>>
>>>> I have seen that arm-zero-exits has been merged into next.
>>>>
>>>> My understanding is that right now the only officially supported
>>>> boards, meaning supporting both jailhouse and SDEI, are NXP's ones,
>>>> with only a experimental patch for the xilinx zynqmp firmware to
>>>> enable SDEI.
>>>>
>>>> Regarding that patch, I have looked at it, tested it and added the
>>>> missing non-secure-boundary check.
>>>>
>>>> Are you thinking of submitting it upstream? If so, how do you want to
>>>> proceed?
>>>
>>> If you have everything ready with the patch, I would not mind if you
>>> pushed that upstream. Just CC me.
>>
>> The only thing missing is a proper commit message, I could also write
>> that, but I don't really know whether it's appropriate for me to
>> submit a patch of which I don't have the authorship. What do you
>> think?
>
> But you added something to it as you wrote above, no?

Yes, but that's hardly worth adding my signature to the patch, not to
mention authorship.

> Otherwise, share what you have, and I will kick off the gerrit mess.

That is ok by me. How do you want me to send the patch? Here in the
mailing list?

--
Angelo

> Jan
>
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CADiTV-1AsxjptpR4q4rbEhZnkpOjJiAxo_omnNX_QHZZRnyakw%40mail.gmail.com.
