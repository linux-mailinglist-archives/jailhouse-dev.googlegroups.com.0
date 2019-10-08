Return-Path: <jailhouse-dev+bncBC5JB54K7IPBBDMV6LWAKGQEZU3RQAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 7064CCFAF3
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Oct 2019 15:09:34 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id o128sf1056409wmo.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Oct 2019 06:09:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570540174; cv=pass;
        d=google.com; s=arc-20160816;
        b=c9gz7OvKpu3VskMZJzE2qQofxNtN2Vp3+T6rbAMBPMUGLK4BwGYRoi0aH6XAlfBkPS
         5dEsjAV0sGm61olO5SMSTTpBpkkcMv+UWNQ6O69Qb3Zdzhiwh35VqAmi5sBzZSlU9a/+
         XEbSIjMcfgA0KwVu/WMAOMtIWMXNoDOyzRaUNhANymq9oYdg9BFaLEsWUDnmYMKggNY0
         pP5kbBTDOlf8KQttlONAdz+gQxHZFuQMlnEYuiytWTBRSB7a1l6zzTRdwgzizqcbfuhE
         l8Rxj9P20p6DySoNV+OsRg1ZcEfdEI896jaXuaWKH2UoJYpexA2NbXZNP+tLCuVqVtOf
         KoLA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature
         :dkim-signature;
        bh=j+2eM/qtMmQQg7cz0W6JHhUHsTrww2H2/55PwAmt+Xs=;
        b=fgglNrUDyWsDtJXgllG+wm6neAEBVKcCMkGwuZ48CvhaOG5eBIu2nHjEEhIwNc+Gcv
         srQZifiAwRCKa9uaoJ0EeIkXIbNwpyMdzXkiQICJTRU/RlCl/vBq/2l1Vx6fzjleHadg
         Y/HXxNb83b+nlV0IQD/kmQqrok5LnDDPSXtFQIkXU8F2ia34lBpKtCpChkrP163hriGL
         s5OnF5ngCgybUcDUcIzyfNsK++nFG/HVZWYxHKyNrf3vITqFKLJ0Vj0i2jmdhAPwMsCE
         cfydJ0UWbw1zr8Muu90zJzUoKIIn7QDLF4NY5SMNmXKZEiaTVx129GON8jmt84GfwA+d
         ZeYQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=aa58f+FV;
       spf=pass (google.com: domain of k.kahurani@gmail.com designates 2a00:1450:4864:20::443 as permitted sender) smtp.mailfrom=k.kahurani@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=j+2eM/qtMmQQg7cz0W6JHhUHsTrww2H2/55PwAmt+Xs=;
        b=fL1yp3S1NGDzRVfr5EzXO9coNMTsXLipNvlBsbVqZBC1jLvlX7+TnjqJh1MRe1cqUu
         GfbV8aVZtOF7YsaZJdqX/y3d0tEr+yHvM4dDBZvuu8LlZ2K3efg/+BhUMN0mgDqawkBn
         2X4nMw4+sCD0OmzFQj0P1GRR8Uwq+v6ycxr2qhZ2/TRChJ8BftIHb6s4s9SpQzNf7dfg
         8yLBTe6viK957vvd3oqfxnKMwcs1xk8Qrd7gu/QWbY6bA2ZD0Avu8DieLkpT6ZnBeKB1
         MIUkbg2poWBzuNupAKiBf//DCu/VVPZT/I0bSRXI11+DAvm2yQQ6sut6++TTWtV7G1b6
         xKFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=j+2eM/qtMmQQg7cz0W6JHhUHsTrww2H2/55PwAmt+Xs=;
        b=nr8h4X1c3mzbGK5/NBM9t/+Of4xfifKBMMyJiJQ6ap4nidgxc2jP7jVsaSJIoRUvdh
         H1h4xHZlMiMJMQsyidNf8r0t/eoSEwB86O52Wng+/SukiR3WJhcaAjhcXdVwjnLUNgmP
         nJF+i+Vfy2/YHW6cCuliSF1akbVuL4r6xJRabERiLLF/kH/p9v3P2k6vU4BU4JmTWs0m
         C8PzRvQj6yRAzwZR7votC3U/ktSiYqdh4mypxT6W8TFsdXlJfNmi12CYfZC5lp2xGoFW
         v8TnDpNaTGarhmRDHjU2jWNRLvhjub+OEk4UYcxZQU3stvnx9NeKSFyBNRYuYFPzGg2G
         Ne0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=j+2eM/qtMmQQg7cz0W6JHhUHsTrww2H2/55PwAmt+Xs=;
        b=oswnl1kCuG4ygPPdooLKUZO441wP72eYZFmb7/rVC0q0Iv+UOiWLVC9SQv8JoEpxsV
         o10BLd0qZqhv03AGSp9XIf/aYcfwIgR/NorBhVUdaz8C1PVONKSZXxO3JS2ZbRypxutG
         cMxqhjtyZfbHI61BILb3rh7GnDGTAFHULtY0i85thjBhNvlnPZWrU3/xTuUhzivCf7dx
         7aOEW6yQIaH35ccWqb0uitelbTWODk39xhGG6fC+jMw/LwfrUxk0qghKf4/OKcl2Jln0
         2XyENUeO7P/86eT3BVEmShhADoMOuoBZsAx95ATbYZXt6UOBd5BKq/syJArcEAN17sad
         AX3Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWUc//M/1mTUJqdDR4UZbXqvkqY6v60oHxGewhd0e0psOHPJefm
	NIyRhwiZ58tzjo9Ya0rhVxM=
X-Google-Smtp-Source: APXvYqznn54VHouDpqmpqXJUV+z62E28col6+dB/EZi3GH5L7VjdhjktWEUrhGAOrhKJNNaMC5AH4w==
X-Received: by 2002:a1c:f417:: with SMTP id z23mr3858339wma.77.1570540174139;
        Tue, 08 Oct 2019 06:09:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c8d9:: with SMTP id f25ls1280065wml.5.gmail; Tue, 08 Oct
 2019 06:09:33 -0700 (PDT)
X-Received: by 2002:a1c:444:: with SMTP id 65mr3732164wme.73.1570540173073;
        Tue, 08 Oct 2019 06:09:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570540173; cv=none;
        d=google.com; s=arc-20160816;
        b=YlJUOXJum7xZu3gZgDFk6gZIpeY6TSc7xtrwqPhHz/jXzzZf506WGgmtstKgsLgOlB
         21nq2AtcqOKuepmtGS5p4iavzJngO2RwJccrlK93br8UmSzQraoddPWMaJT88JFKUnCq
         rpgRdrK7IqAiPKqezrpB1zsp8ZiwFNrAyOO2zu+odJucBsKKqGN3BihxlA11OpmqrNU2
         f3FzZg6IW4MqjiAwRYYObC508UE8XizKp4VlZnOj0eoqBZtNG+zESzSaOFn7z6RHbR4n
         DuW4zd3DWuh076UWk5+bUdkSYT/PWgflfX1m+d/eMHNdZRXfcyh4bA2ap089SsbJSLlH
         p35w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=ABJYTGeL8Mb/bSaB20a2heQ4xtBUtqQfEzoSDPdypCg=;
        b=pgADAzWVlY1M/vcQWT+Q3L/6MInT8AuB570gMHhccFZVwzzUxlDp6D4mEjYy1IIczK
         vPJnkUJ6ea+6kToTHjEAnznzTCfoOB0aBXsakduiDgClhaWZq2HIH87+dQK92CuAIIgW
         g9weo4G+CFt+IAncCmY7+n1voLsDMW6B90XaFYnWFjpM0Vwq20UoobCwmVZ2V0sSUz7c
         NJoMV6/Ozy5tWHbKseGNDTaEXB49RrIGzQ1Bx0rktBU+1pDEv6oZEZop4aqnzs5XrRwh
         /yy3sbnovZ4052bBJcAYsNnXKmo/77VEhsUldncbl46T0Fdw6HVJxjmGxBVSdquKwmkk
         3/wQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=aa58f+FV;
       spf=pass (google.com: domain of k.kahurani@gmail.com designates 2a00:1450:4864:20::443 as permitted sender) smtp.mailfrom=k.kahurani@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com. [2a00:1450:4864:20::443])
        by gmr-mx.google.com with ESMTPS id q185si168781wme.1.2019.10.08.06.09.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2019 06:09:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of k.kahurani@gmail.com designates 2a00:1450:4864:20::443 as permitted sender) client-ip=2a00:1450:4864:20::443;
Received: by mail-wr1-x443.google.com with SMTP id o18so19299263wrv.13
        for <jailhouse-dev@googlegroups.com>; Tue, 08 Oct 2019 06:09:33 -0700 (PDT)
X-Received: by 2002:a05:6000:43:: with SMTP id k3mr29233336wrx.84.1570540172336;
        Tue, 08 Oct 2019 06:09:32 -0700 (PDT)
Received: from [192.168.0.51] ([102.167.87.70])
        by smtp.gmail.com with ESMTPSA id d193sm4791067wmd.0.2019.10.08.06.09.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 06:09:31 -0700 (PDT)
Subject: Re: [PATCH] driver: sysfs: fix parameter usage
To: Jan Kiszka <jan.kiszka@web.de>,
 Henning Schild <henning.schild@siemens.com>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190920145644.2169824-1-ralf.ramsauer@oth-regensburg.de>
 <3814a06c-155f-a3f0-9c54-bb2246e19e80@oth-regensburg.de>
 <20190920181658.64f710cf@md1za8fc.ad001.siemens.net>
 <54df428a-f4c7-fbc0-d641-cbd31c921405@web.de>
From: "K. Kahurani" <k.kahurani@gmail.com>
Message-ID: <217cafa7-e132-e17c-adb0-440d3df88135@gmail.com>
Date: Tue, 8 Oct 2019 16:09:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <54df428a-f4c7-fbc0-d641-cbd31c921405@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Original-Sender: k.kahurani@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=aa58f+FV;       spf=pass
 (google.com: domain of k.kahurani@gmail.com designates 2a00:1450:4864:20::443
 as permitted sender) smtp.mailfrom=k.kahurani@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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


On 22/09/2019 12:10, Jan Kiszka wrote:
> On 20.09.19 18:16, Henning Schild wrote:
>> Am Fri, 20 Sep 2019 16:59:14 +0200
>> schrieb Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>:
>>
>>> On 9/20/19 4:56 PM, Ralf Ramsauer wrote:
>>>> find_cell_cpu gets a cell as parameter, but ignores it. It only uses
>>>> root_cell.
>>>>
>>>> This bug never had any consequences, as this routine is only one
>>>> single caller, and always gets root_cell as parameter.
>>>> Nevertheless, fix this by using the correct parameter.
>>>>
>>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>> ---
>>>> =C2=A0 driver/sysfs.c | 2 +-
>>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/driver/sysfs.c b/driver/sysfs.c
>>>> index a272ef4c..a15a2787 100644
>>>> --- a/driver/sysfs.c
>>>> +++ b/driver/sysfs.c
>>>> @@ -353,7 +353,7 @@ static struct cell_cpu *find_cell_cpu(struct
>>>> cell *cell, unsigned int cpu) {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct cell_cpu *cell_cpu;
>>>>
>>>> -=C2=A0=C2=A0=C2=A0 list_for_each_entry(cell_cpu, &root_cell->cell_cpu=
s, entry)
>>>> +=C2=A0=C2=A0=C2=A0 list_for_each_entry(cell_cpu, &cell->cell_cpus, en=
try)
>>>
>>> Found this by accident.
>>>
>>> Now the question is, should we fix it in this way, or should we
>>> entirely remove the cell parameter, as this routine gets always
>>> called with root_cell.
>>
>> Without having looked at the details, just one caller with one arg
>> sounds like over-abtracted. If it was not factored out to make the code
>> more readable and less indented ... i guess it should just move where
>> it is needed.
>>
>
> The reason for this help function is make the code more readable and=20
> less deeply
> indented.

You might also want to talk of the huge design flaw where-by jailhouse=20
ended up written in C :/

> We could hard-code the root_cell, but then we would also have to
> rename the help. So for now I've applied the patch as-is.
>
> Thanks,
> Jan
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/217cafa7-e132-e17c-adb0-440d3df88135%40gmail.com.
