Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBM6AZOFAMGQED72EGDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DD441ABCD
	for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Sep 2021 11:28:20 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id j82-20020a1c2355000000b0030cec9c9a66sf1724534wmj.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Sep 2021 02:28:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1632821299; cv=pass;
        d=google.com; s=arc-20160816;
        b=O1355yCiiLOWNhC6wcilRvfwLLRLaccHvG72kTUCmM+relkrdk38pfKcd5eVxFGvdK
         U/7ZcaMO5d0kxWEyPwt0mhP2R2OaSeU7Upf1k7efk1AfhVEdJAix+CSopKiL1ED2tIdt
         /Se2pP0IQatvj7/Yt1QzUGzOPBcH848BGe8GNtUey5ftVKVqoT8heCp/U1fQw5N5Q6j0
         erXlJtX87Wj+AMxSP7DDk8mgMKEj9cd9fmudiGNuhOyNX7vrfjg0X6jz3meSUkMPNlJo
         OmRshz665uIO6SfHjKmBn1jFV+CsS0Y9ne9sFIDuBnFq7p0GGrKLC/B6tPFDnpkLL+Af
         vYDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=G2Y9CTH86r2YkkdlRDumsKmh9U1L9yxCGBTef6iHUPw=;
        b=IoLMz089gfdPziC/JcUphzf7rzzVWksnSoeBO3DD0yuUEDJSYEKBe3HNft2H/TQ9hk
         H1WhjPkJpoixto+GeeiTrbe/bDjIoRtTr4lPTwtVmiDt5RssUZbUEibp42gHIFlnnaCL
         mkRuyu4SbFVLXb3mVfW1S4jCaJFr1HPeA9ONXwKi69rOeFZvFsSph8rIhnaQW1KCVXu+
         hrWNzctyeQQTBGTpeWtdvPCnHaqHqYu6LS9aJ9jO9QNvEfIR9B7SDPY2bMlLqdV8qfWh
         sH4bum7a/oINQdZjOL9jmb2ypNeSznaBVPlnK6cw6HTZ/KykmgE1mo4yAj7w7Np1GZAU
         DaRg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=q9WYimwn;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=G2Y9CTH86r2YkkdlRDumsKmh9U1L9yxCGBTef6iHUPw=;
        b=K60TyAmGIUxP4e99hiue/S/ifPbdnln+QHMM3njaNNGYW2KQL5vxehQOmi0NLCg8iv
         WuTAY1r+ZGkcITuCCJdP+SXs8ckVFUHAWhQk3tzOngrHg6oAsbeWaKHsqfu8+mKTkc7k
         9eTJKhj3x9wu3k7FHFSkVMr4/y8DfHWmXpw3zecJEOeVBCZf9z8f5M76a87leT4svC2f
         9T4WglalrR2j9WMtWvaeh8iTrzjHuSBe6rbQ1Kp+fR5tbqNNC6rOH1xNCw05ZO+7V/CL
         uiM5feONgBro3FFTS5Li06VZBZKw8G8G6Y/fHo4jLrbPzDhUKZUpAEDOmQJJYrW7Aj+a
         VBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=G2Y9CTH86r2YkkdlRDumsKmh9U1L9yxCGBTef6iHUPw=;
        b=xt7HRYw/dl+AGL/JxqaORTl9WMdH/yvuPMJzN47sZoxBKTF0VRd4smctIXTPB5hZEJ
         5K/ywLgUsFKrUP9/iLsIjRBSzUV/foi6Si3dRXStv2mGBGn2V5TBoh6GYsQ1R9E2k9Hz
         ZyWBY7hPN9XSm/VUIaYR8QRpznjys1XyQPNrfNPjMaIwVSqaIWEnoKcBVNVxAZ3s0tGL
         qubl2DaLA0shJIi9bY4jU67XiuA8v75hNSOFrx6TiFSRqZoT8Aqa0LYyFyZrnsWv/Awa
         AK2B4zq/csUmLbT4UtgzrgQegDECPu0+KOlfTvYI8MkwhSx/YoMxvLT5lq5aTZhXmjWf
         ZKrQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531bTiEh/gBB2NqMmiaEFOfLXwYotjq1hosvjfvFWx2EODOs+9Bn
	Yk1aQXPRl3NlPIIJjqIbrUw=
X-Google-Smtp-Source: ABdhPJxhJ+5GdWRDykPJQ3tc3gPNE543pW5nD/BLrCaoUcrvZ4TYiwnSgCJldwjrwFYlJdWY4dcGjg==
X-Received: by 2002:adf:d1e9:: with SMTP id g9mr5238603wrd.200.1632821299791;
        Tue, 28 Sep 2021 02:28:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:4646:: with SMTP id n6ls1043762wmo.3.canary-gmail;
 Tue, 28 Sep 2021 02:28:18 -0700 (PDT)
X-Received: by 2002:a05:600c:1c9a:: with SMTP id k26mr3520960wms.169.1632821298930;
        Tue, 28 Sep 2021 02:28:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632821298; cv=none;
        d=google.com; s=arc-20160816;
        b=Jr342ETiSK6QY/BnJJHpwdu4CYBJZU2gJg5Zz1jin1PqqUbnRcdebQKO8lK3SL5xIE
         XanLxLaHDGj6rGYa3LylekLcCrdT5iHUcRBpLGuZKb8Zz/MmT8ZmqHPVlTnI9f/m1T7H
         I/HvLvNqceHZ1jTNY+NqbSuh8RDLMJkq0pjgdyf0vWzFznqlFi1AlVfFj61AwgHfLfLD
         /qg3PiaFwrJJzZKYGTEJ6PTRqOK1+UgpgAmm3gAXR/DJDz3oCEIQbBDSzrRNsrfkDtTI
         VT4zeEIST7dD1V2a02otMPzG2w1mPnewjR4Isu1sGIZdkfE1KuGI7NPQ13dqCNT2dsjZ
         r0iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=zTTNf3659ZoA0UX1Z7IZMB+xOzUnfdyb0IadPm1X1Og=;
        b=ZySgunX1pvqb11flvJX4RGwxXy7Lx/s8xXF9EbwjiVV28gNTunXnsk+2+x88+8tT/3
         3M6PFY9bP8ayAjY6zL3uZj0K9x6lS+EJ7UK7w5+Zsg46jyjNxoExkB2dylAfd0QVnaLT
         IakQvSNOA0tHDkAXVHJjHEZH5Iuuw5BDwwdwXUZSYFK4tsh2tnJhd65jK6NWyn6X0Jgj
         Z0a70rRUNv44KVf/3ChDia1uTCmrGUi40dShhqFngiqLTIrVgldsL4dvJv8/Gt6WlRDK
         wXs+veSODYpxgJSRckopeCxLL49NaLTQlMWzKPhJOVh7DVAL0DV1Oq3nB+xtqYNlKDay
         ckOw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=q9WYimwn;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id m12si452637wrb.5.2021.09.28.02.28.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 02:28:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.20] ([94.217.148.121]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MhFhe-1mzHUZ2va6-00eTwP; Tue, 28
 Sep 2021 11:28:18 +0200
Subject: Re: cell create gets stuck on zynqmp
To: Martin Kaistra <martin.kaistra@linutronix.de>,
 jailhouse-dev@googlegroups.com
References: <2ee07d25-ca98-8cc0-3299-3a393aa99fd8@linutronix.de>
 <8092b487-f19d-dc89-98e0-cb68077792f9@web.de>
 <5066f207-29e7-4576-5b06-c8f260c4d10a@linutronix.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <8ae7d02a-325c-1be6-fc2c-8654b5e8bd4b@web.de>
Date: Tue, 28 Sep 2021 11:28:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5066f207-29e7-4576-5b06-c8f260c4d10a@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:kkyTnawTR5XPeYCRrrNlF8s1QOPa5hT57i6/OdUgxygJqPvarhA
 ttzH6/fCHn4zU59KgrnAr2bgVN/eCuAAqRxeMZTt//b1MvWecht7dF2+Nalvj/VHTIS0nnZ
 IgrAeGz/mgiZEXKf8Bf3mIYqtclKy08N81JXT2XGQJ0dEAd5WqvzeWiInhtN5kBcSnetQK1
 Yk61xuSzBQf8z6n/fOJHQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JqeylwvjAPw=:NxFTLSkQK4d3LjxpKWKOlV
 gfwzgZudvXOoGThgmFPuhnGaD9hMsrkJdccjNjuZb8O0XNTDMwElCpQAbZ8ULJnTFKnd9h/GB
 oA+KC2k4cSuNgbqUUMFvv8oIi5tvaoWKbr+BElrLva/XJqanF1c39MrHyZcaasqDFa4rjzteu
 I9eyM9o7aW+2Zw8Watr5xbw+ESpKR6uQ3TkeIGGN+nQJI1la8jIB85DJm9ZfLxZe2pPYYfBKb
 vzU4Wf3Sy51E4Je1bJkgfiuVmeAGuYJr09XXCn6ssro4lvr6uggUMm5mcHQs/Et9/RvWSy5as
 zvchgRnwt1TQtC7FOBuqnIdGMxHK3F6/T81PRsyk2MFWmgbuGY2HO3uJUM3pJW2wNxmWfhHUN
 41xqd3/onNRDt2V6kmPvQEAQDvZkqTSiwY/Q2FZiI4pLDvK+KpcjkQCiJP9PEhWbrm3/jsv5p
 3P2sVISaDyg4iEQmjKOQFCuc0qkt1LqaWV5BJ92SKdj81H6QCL9tqVgFnKOq3Jzhq7tjjD5TP
 sEEZ64c52NKQKQxumoO7QELThcK+Ku/9KMOIQzy5jTUBfqH3n8bv91VzVqz0ewtzpw02g2aB3
 fyZ+57ISHygs9NClru5lLDhCD2LmKFxndNn4v7u9yuxTF5LJ/CBnVoYFsM1XNov1/zJQhiXcM
 l/jcxT1u9Obgic5yTP/w1RANxCQccrq1ob5rmwHjGZ3YyeQ6UblmR6L3JcCJ3Ulz1e5R2hujD
 8bE4OdGT4j9sw80naM/0cbZwCK4ZVclt/uPWRZi8AyO4WM/eqU+8ESsIwawWiS9YMXf3pjCsR
 oQ8FSmy2uZfWlk1bfRQbB5AZ99uj760a7sPAqc6sL0JJNwYTiBu+mgROk5y5qoiFCIrOgjaEI
 hL1jTHqSkFETFMfvO4zBQ/182nzqF23ZaBPeO9YvOCIa0kRgT8/5NivHg1/UoVzuJJFFktyX8
 V7MgXhhGAU2KWABO2+yq06U4nZzsD7sKMoandpj/P2lfULmAkKXf8kLyb5bUFRFm8479PxE4G
 BCJ6dj1wFwNZ9XHLsrgbWhh6XmbwUQfrTbV3Xjp+Pec+IcXEVEgjUvviGjxxk5wHpVcEBqgT6
 jeMx4CNrAbhAuY=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=q9WYimwn;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 27.09.21 10:30, Martin Kaistra wrote:
> Am 24.09.21 um 17:46 schrieb Jan Kiszka:
>>
>> If suspend_cpu() does not progress, the target CPU is not reacting
>> properly on the request to leave the guest and service the Jailhouse
>> commands. Could be that you interrupts are not handles properly. Run
>> "jailhouse config check" on your setup, maybe you are passing the
>> interrupt controller through.
>>
>> Or are you using SDEI-based management interrupts? Would require a
>> special TF-A version, so likely does not happen "by chance".
>>
>> Jan
>>
>
> Hi Jan,
>
> "jailhouse config check" finds no problems with the root cell and inmate
> configs.
> Also, SDEI is not active. gicv2_send_sgi() is being used.
>

Then it would be good to continue debugging, now trying to understand
what the target CPU is doing.

The CPU that requests the suspend sets suspend_cpu in the target data
structure, then sends an IPI to that CPU and wait for the other side to
confirm this via setting cpu_suspended. Check if the target CPU received
the IPI, left the guest mode or what else it does by instrumenting the
related code paths (check_events on arm64).

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8ae7d02a-325c-1be6-fc2c-8654b5e8bd4b%40web.de.
