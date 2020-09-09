Return-Path: <jailhouse-dev+bncBC6PFNGHZIFBB5NY4L5AKGQEPWZQ6DI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D19262B71
	for <lists+jailhouse-dev@lfdr.de>; Wed,  9 Sep 2020 11:12:22 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id b17sf744266ljp.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 09 Sep 2020 02:12:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599642742; cv=pass;
        d=google.com; s=arc-20160816;
        b=l9b2ZDkP1FjxfT+YgP+3K+MIOghwSK6fdLfzrMIKwFILMmXWuthpoVimgVhVmugTRt
         BvLECsPoK6wx0PCwCSQ6NvY4rV98Ma95bfjCWtGT17S73Nh8tWKfCxe3AHkUPu+uG2Dl
         GhbyVvh0eEOtN456bJRZDJ3FofBfaT+GBBU98XwW2OjSskZPSn6v408r9xZszcU56qiB
         Cu6pOK1EcHYpyUaxADJGkOGF9Pa6QUuQfXVIiYl83n+o6h5lSlEzA1jBIa60GOJVZpFg
         DJqnxyzx9CSmQhW1Yxccigf82oI9eSSfedw2ZQRRYsIvqgi3S+bycstjD/UjwfU/YtuW
         nmPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=Ftfr8nrAZ3JyVEIbpJOZtxkQTO1U0lH+RjiiKGlO78k=;
        b=BlNQR26b4BjJBgh3DSxXhT3qoksQ7PaiVM4FdAq+/fHTmqGkLa+2xVyTFPX8BfLmFU
         MWldTng5Ew+VQmCfV8BEMPBN0pWqPLXgjKSJN7zK6MyAxzG6a5G3C5+IId6ctsu0FjqE
         9vU99D/VP2K34OPI9je/519F6ZxvLge5/KMmY4ygEDsafTjHmvzKpmYXNYMN5nYNa2Ll
         1awlo6KFFGLl9HMOEC3jRNho2sfWhM8c/WNKLxFIRTXN9aQr/ui/JoOH2k1GmDAEFfAO
         z2xWAtI3PGuz9pDE8XmTOqsqUnhRGa3BZ8Gy+bV4AQLM6WgqxYlfd2zJzaQHC1J9MvJs
         aOUw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=bkBM+R77;
       spf=pass (google.com: domain of dl9pf@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=dl9pf@gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ftfr8nrAZ3JyVEIbpJOZtxkQTO1U0lH+RjiiKGlO78k=;
        b=f6NJhcLD5x+5xJV2ujs4hAaDlRalOrinFPaJsm6P8lBKXW815iOII2MD1oUYx9KvDK
         Md6rUhUMK/4VJP9tws4AsoQQ2XjkwcRm13yf+C7N4fGuHi4sxIOyMsJ07L/YgGyqm940
         +HhgZx7NuaafDduS1XBSfVeTVvELrXCBg8VldRbRsm9IMGj42BmGcGHLijJ8NuqcImpn
         avGbD+MfKbBGzUJYqa9faJEovDT3lSLTZpHCkCgcN4nU3DWNKUM0J3wbKJevqcB4zgCb
         W5IkaamAaZ18PtL4w5VYh56ZhYSqnKNL7/IrD4nRV8NL9k6XC6EWL7TqkmGWgiaoiErT
         F4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ftfr8nrAZ3JyVEIbpJOZtxkQTO1U0lH+RjiiKGlO78k=;
        b=LrTbjg/vE60i6KBsRGKAqljLCKUxb6iMKlImqFrY3LujraKQwDbHl8Ky9ssvNDdhdX
         MPrBlqJhvtxn8HhkuBzwCYC2Mh6ZQozH8Rvd4H4bWT2LQshR8F6UYdDde4Mcgd4RaRg7
         fkY5nIUa3r7LT8hI5ozyC4gn70qOtemnLz+venyDF7vXhgq1rlH4IKQ2WzXn08yql3m3
         RCfXxRd3pI5XrTIXmhFlR+rscN9EBn31kK6M7urZvhsnlfng1v/WktbBSV+FYnz8hxqF
         AgrR2e3YgbAC8pArJee7tq0j///fAJ0OnSA/ZAiZx1eMBSfOr4IWeTgZhF5XJ5Ux2Rq0
         qK4g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533zCfpyyfNWirTMvjPxV+Oq5O1xth0HbP9mBT6bZSyxI5aWFNko
	6UjO30+ze36hYYVHaadD6Po=
X-Google-Smtp-Source: ABdhPJyXnkBFpf17fiHLgk8LBFMzmncwnMEBsZNwvplYVR7MW4UmxZODa9SLNiZx4cixyxdPo3tU/Q==
X-Received: by 2002:a2e:b4f7:: with SMTP id s23mr1548381ljm.80.1599642742043;
        Wed, 09 Sep 2020 02:12:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7e02:: with SMTP id z2ls463489ljc.2.gmail; Wed, 09 Sep
 2020 02:12:20 -0700 (PDT)
X-Received: by 2002:a2e:86d3:: with SMTP id n19mr1497614ljj.368.1599642740880;
        Wed, 09 Sep 2020 02:12:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599642740; cv=none;
        d=google.com; s=arc-20160816;
        b=JB4ZVtwCLozi2FlvuUyVbm6uMGXIg9X0+jZzRiBIsDIcR1rkI3I6Tdips8RkTh9oIl
         BuQjykFacF8MyddAgMMSeomKMdR+NiZQsqecReFrUJ1lUFZk4JBsDbXknwPNqshtUaAF
         vhZjvAKZBlEgVRtHpOiYtHZF0baKQDrC0WFpt5oJKP7u8mOHz/SeBOpRjUvW2JW3PXrT
         mQMej/mk7HBi1AoRcLAJbjh7p/GsB9mp7y+7gZlPLEn6ZniQRJHaTOvjqsoTpiGbImUN
         wnxbFVQ9Q+f1jZvr6eSbaOPU1jg9Q/IkXXqccNswHVDs5QI8wQV4qtZhCNk36j0p/4Ym
         l8xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=yFf9pwcx4GHWVIXLAFNlW8HwQIf49ZtavAahgKb9HII=;
        b=gCn7UZISvUwD1y5zeXHLizuLDHbNRL7HN/WNXqB6D9ysYQqtgcmw3th1zLFEikbUfr
         jw93OL7QV8vhfcS481WrfbO5uY9Uk4Vm2Eswr2FccmW1r4s66T+WsDLoGMdLfbRoa13G
         ePZZ/HGIQzro8DFQGzCKzKIfHPebWoaqHHszPlmZtKFHwmb2a73Wwp1wFCxbqeQoqwbK
         uYTgItS2gxyHkAzOL2YqnGZmUPW2ZEuwCSitko3aoFom7iJF8On90ut30O7Xcl2FGmhp
         OD8dzVMsFBoy0r5VuTi9u5aN84bqupJiZL80QqI6YSAIz/GsnjDN9FGXtZ2in9+9hXJh
         GPcw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=bkBM+R77;
       spf=pass (google.com: domain of dl9pf@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=dl9pf@gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.22])
        by gmr-mx.google.com with ESMTPS id k10si86675ljj.0.2020.09.09.02.12.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 02:12:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of dl9pf@gmx.de designates 212.227.17.22 as permitted sender) client-ip=212.227.17.22;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from monster.localnet ([95.88.58.204]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MOREc-1jtQeQ0SSc-00Pz1I for
 <jailhouse-dev@googlegroups.com>; Wed, 09 Sep 2020 11:12:20 +0200
From: Jan-Simon Moeller <dl9pf@gmx.de>
To: jailhouse-dev@googlegroups.com
Subject: Re: Build jailhouse on embedded target
Date: Wed, 09 Sep 2020 11:12:19 +0200
Message-ID: <1776338.qqhLftCfjJ@monster>
In-Reply-To: <c5f91e66-7742-4736-83fc-8565b08989d5n@googlegroups.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com> <992cd8fe-ef09-d0bc-119d-e488de158759@siemens.com> <c5f91e66-7742-4736-83fc-8565b08989d5n@googlegroups.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:L8QJ7Rf+5R2DGWxj1+AlR3+PzQpqPjfmSWXIF1JcsTkPVXv+O87
 gKOvrDyWEGqzOTFxJRRCMBmbZ0opzanMU/35qqbhVMxIm6OIhRWH29MkSe3cThdRKaMqvg8
 sPqgbVgY367Vkw+M4jQ4koFFfCoRYm7X5uqXxuygaGt7fbpSFivWEzqXkx2p2PsAoA2nhrs
 XnPGO86cv2yHPTPQxH0Vg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cvgiZ+mxwM8=:6v+8i622KYw7NXreiPtL1m
 vqOz8mS/E6dEKZlIoWedYvymzg70g2jhro2i3EOFA8xAiJfBVwDox4T+IAyZ74vIfX2X8M1tH
 +DhYry3j/qsx185YCS+wwGmDyyZUspcJT28+vd5E+yYl//SpoEi7yEqV0AWNBLvVtHStub8gp
 1bYHXZNapon5oR3v+sp6qygciOitGdXXe9UlRsvgm9s96bXJ31XNylQvMDSGacz5ahlb8bHGf
 suOwzwO4ihEjV7rJ6B+pMDN1ftHrUnu3eJJwXqnuCvDOq+I4GzsQGy14PZDl8zlfIFdG7Gwwm
 FqNWJmnIbZb9XCXRVHPMnFmsnMCpKMl7DrkC8Qd/vKP76fKtohkCpBuzda15AtRhkq/qTUXRJ
 lnrAJ+L0IdyurJaxnJCltrDPweVfh1x25aBTm39p3+eALGDn4OvLk6jFmx6hdFWXwWxEql2/1
 F/wZob6zoEw8lUv5hY79+q7v5wYZiIkrlOPfl1RwdpBbRtlEAeBmOfroUWls658Zb4McWKUTK
 g0+f0IHLeEpV4Qu1wUeruMG5y9Xnlbcs0IuMeFlz1L5N7bfxnQyPy+YLdf9zaW5YQVkt5XaID
 bmoPoGbzcMucY/WiWoHb/jzQNnvKTzVUr/Lrhn/+Q7a2ZH6ULIQ/k0kawG8Bp/M8ESFzvtpl1
 NiYvcZWY9TRgNbgev4gqTMrsKHZXmX60G1MGOVLtglNoWIqOlObBu12boiZZhZtlzi2GZTDIR
 XIY9J2TMTGWCQGkPa+4k5AjXkXOZjzoAI5DzQInP2hodb/ftTM2wZj1pr+QNwwRh65fQx1MTB
 0yOMDROCUBcUE8Oi0A52/Jhm6WARq7ai2MUvVHW5xS+vVq2iy5RldAfQb3LfddPhG1PdQw1uA
 F0HlAtLscocCi03whHVDy/SA+QZw5lRSeFtahy85DB7iU1IK1bS8XD4+qbJuNWxRaDD2CHIhN
 It33rXDHPG7v/VhThJGh7vEpgvQOsH/kUvIol8P1XdQ4C51EF8/1YVm4FXXwuIsMMNWzYgOSP
 1rEA1dWZz+twLiHn1Z5EcbitUkC+hBlECkMYhcRAw6keRG+AIDDsGhZarsICTw1qVqbYQsHlp
 rVCBRSDkNi+CWYkXLAUPBjhrY+3mqFDJPN++25Eh4NjOxq0gGglIATdXGWbR6BVrulpWVFGkl
 uaQad0YohxC3iJL8fLo9Ttg1RVsVgquWm6lpvMzaciVGBJIENqavXO0nmVYLLRRoO5WMJoV3V
 BjzP0sRxL73Yz4Fqh
X-Original-Sender: dl9pf@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b=bkBM+R77;       spf=pass
 (google.com: domain of dl9pf@gmx.de designates 212.227.17.22 as permitted
 sender) smtp.mailfrom=dl9pf@gmx.de
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

Hi Jan-Marc,

Am Mittwoch, 9. September 2020, 07:50:38 CEST schrieb Jan-Marc Stranz:
> So far we have successfully built all of our Linux BSPs with the help of
> Yocto.
> I assumed (wrongly) that if there is the Yocto layer "meta-agl-devel", you
> will be able to build a Linux system that is suitable for "jailhouse".
> Jakub has already told me that he has only tested the "meta-agl-devel"
> layer for RPi4 as a real target (and not for x86).

The layer is quite new and was tested against YP dunfell. Jakub did test on
pi4 and Parth did test X86 against qemux86-64 as (virtual) hardware.

Jakub has a refreshed version against YP master (gatesgarth) independent of
meta-agl-devel available here:
https://github.com/Limoto/meta-jailhouse
You can check this out against YP master (gatesgarth).

Wrt the hw check:
There seems to be a parsing issue in the HW check. Regions parsed in the loop
can show-up as NULL and thus the parser fails.

I think you need to alter your expectations.
All is Open Source, so if you need it for a particular case:
patches are welcome!



Best,
JS



-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1776338.qqhLftCfjJ%40monster.
